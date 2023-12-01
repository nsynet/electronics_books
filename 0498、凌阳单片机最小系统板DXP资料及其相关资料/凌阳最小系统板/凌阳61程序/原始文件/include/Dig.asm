//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//             (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                          ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
// 文件名称：Dig.asm
// 实现功能：共阴数码管显示驱动程序，使用IRQ4_4KHz中断
// 日期：    2005/12/2
//============================================================

//================================================
//	LED段控制端口设定
//================================================

.DEFINE SEG_IO_Port			0		// 若LED段选使用IOA口则采用该行定义
//.DEFINE SEG_IO_Port			1		// 若LED段选使用IOB口则采用该行定义

.DEFINE SEG_IO_HighByte		0		// 若LED段选使用IO口低8位则采用该行定义
//.DEFINE SEG_IO_HighByte		1		// 若LED段选使用IO口高8位则采用该行定义

//================================================
//	LED位控制端口设定
//================================================
//.DEFINE DIG_IO_Port			0		// 若LED位选使用IOA口则采用该行定义
.DEFINE DIG_IO_Port			1		// 若LED位选使用IOB口则采用该行定义

/////-----   数码管的位数   -----/////
.DEFINE DIG_Count			6

/////-----   数码管每一位的控制脚设定   -----/////
.DATA
PIN_DIG:
	.DW 0x8000,0x4000,0x2000,0x1000,0x0004,0x0002,0x0001

/////-----   数码管所有位的控制脚设定，应等于PIN_DIG所有数之和   -----/////
.DEFINE PIN_DIG_ALL			0xf007					

//================================================
//	不必修改下面的定义
//================================================

.IF	SEG_IO_Port==0
	.DEFINE P_SEG_Data		0x7000
	.DEFINE P_SEG_Buf		0x7001
	.DEFINE P_SEG_Dir		0x7002
	.DEFINE P_SEG_Attrib	0x7003
.ELSE
	.DEFINE P_SEG_Data		0x7005
	.DEFINE P_SEG_Buf		0x7006
	.DEFINE P_SEG_Dir		0x7007
	.DEFINE P_SEG_Attrib	0x7008
.ENDIF

.IF SEG_IO_HighByte==0
	.DEFINE PIN_SEG_ALL		0x00ff
.ELSE
	.DEFINE PIN_SEG_ALL		0xff00
.ENDIF

.IF	DIG_IO_Port==0
	.DEFINE P_DIG_Data		0x7000
	.DEFINE P_DIG_Buf		0x7001
	.DEFINE P_DIG_Dir		0x7002
	.DEFINE P_DIG_Attrib	0x7003
.ELSE
	.DEFINE P_DIG_Data		0x7005
	.DEFINE P_DIG_Buf		0x7006
	.DEFINE P_DIG_Dir		0x7007
	.DEFINE P_DIG_Attrib	0x7008
.ENDIF

//================================================
//	中断常量定义
//================================================

.DEFINE P_INT_Mask			0x702d
.DEFINE C_IRQ4_4KHz			0x0040


//================================================
//	变量定义
//================================================
.RAM
R_DIG_Buf:		.DW 		DIG_Count DUP (?)	// 数码管显示缓冲区
.IRAM
R_CurDIG:		.DW 		0xffff				// 当前显示的数码管位，0xffff表示不显示

//================================================
//	公有函数声明
//================================================
.PUBLIC F_DIG_Init
.PUBLIC _DIG_Init
.PUBLIC F_DIG_Set
.PUBLIC _DIG_Set
.PUBLIC F_DIG_SetAll
.PUBLIC _DIG_SetAll
.PUBLIC F_DIG_Get
.PUBLIC _DIG_Get
.PUBLIC F_DIG_GetAll
.PUBLIC _DIG_GetAll
.PUBLIC	F_DIG_Clear
.PUBLIC _DIG_Clear
.PUBLIC F_DIG_Drive
.PUBLIC _DIG_Drive
.PUBLIC F_DIG_Off
.PUBLIC _DIG_Off
.PUBLIC F_DIG_On
.PUBLIC _DIG_On

.code

//======================================================
// 函数名称：	DIG_Init
// C调用：		void DIG_Init(void)
// 汇编调用：	F_DIG_Init
// 实现功能：   数码管显示初始化，该函数将开启IRQ4_4KHz中断
// 入口参数：	无
// 出口参数：	无
// 破坏寄存器：	无
//======================================================
_DIG_Init:
F_DIG_Init:
	push r1,bp to [sp]
	INT Off

	r1 = DIG_Count
	r2 = 0x0000
	bp = R_DIG_Buf
?DIG_InitBuf:						// 清除显示缓冲区
	[bp++] = r2
	r1 -= 1
	jnz ?DIG_InitBuf
	[R_CurDIG] = r2					// 当前显示的位设置为0
	
	r1 = [P_SEG_Attrib]				// 初始化段选IO
	r1 |= PIN_SEG_ALL
	[P_SEG_Attrib] = r1
	r1 = [P_SEG_Buf]
	r1 &= ~PIN_SEG_ALL
	[P_SEG_Data] = r1
	r1 = [P_SEG_Dir]
	r1 |= PIN_SEG_ALL
	[P_SEG_Dir] = r1
	
	r1 = [P_DIG_Attrib]				// 初始化位选IO
	r1 |= PIN_DIG_ALL
	[P_DIG_Attrib] = r1
	r1 = [P_DIG_Buf]
	r1 &= ~PIN_DIG_ALL
	[P_DIG_Buf] = r1
	r1 = [P_DIG_Dir]
	r1 |= PIN_DIG_ALL
	[P_DIG_Dir] = r1
	
	r1 = [P_INT_Mask]				// 开启IRQ4_4KHz中断
	r1 |= C_IRQ4_4KHz
	[P_INT_Mask] = r1
	INT FIQ,IRQ

	pop r1,bp from [sp]
retf

//======================================================
// 函数名称：	DIG_Set
// C调用：		void DIG_Set(unsigned DigPos, unsigned DigBuffer)
// 汇编调用：	F_DIG_Set
// 实现功能：   设置数码管某一位的显示内容
// 入口参数：	DigPos(r1) - 设置的数码管位（1~DIG_Count）
//				DigBuffer(r2) - 数码管的显示内容
// 出口参数：	无
// 破坏寄存器：	无
//======================================================
_DIG_Set:
	push r1,r2 to [sp]
	r1 = sp + 5
	r1 = [r1]
	r2 = sp+6
	r2 = [r2]
	call F_DIG_Set
	pop r1,r2 from [sp]
retf

F_DIG_Set:
	push bp to [sp]
.IF SEG_IO_HighByte==1
	r2 = r2 lsl 4
	r2 = r2 lsl 4
.ENDIF
	r1 -= 1
	cmp r1,DIG_Count				// 如果"位"值超出范围则退出
	ja ?Exit
	bp = R_DIG_Buf					// 将R_DIG_Buf的相应元素修改为设定值
	bp += r1
	[bp] = r2
?Exit:
	pop bp from [sp]
retf

//======================================================
// 函数名称：	DIG_SetAll
// C调用：		void DIG_SetAll(unsigned *DigBuffer)
// 汇编调用：	F_DIG_SetAll
// 实现功能：   设置所有数码管的显示内容
// 入口参数：	DigBuffer(r1) - 数码管显示内容的起始地址
// 出口参数：	无
// 破坏寄存器：	无
//======================================================
_DIG_SetAll:
	push bp to [sp]
	bp = sp
	r1 = [bp+4]
	call F_DIG_SetAll
	pop bp from [sp]
retf

F_DIG_SetAll:
	push r2,bp to [sp]
	bp = r1
	r2 = DIG_Count
	r3 = R_DIG_Buf
?DIG_Set_Loop:
	r1 = [bp++]						// 将R_DIG_Buf修改为设定值
.IF SEG_IO_HighByte==1
	r1 = r1 lsl 4
	r1 = r1 lsl 4
.ENDIF
	[r3++] = r1
	r2 -= 1
	jnz ?DIG_Set_Loop
	pop r2,bp from [sp]
retf

//======================================================
// 函数名称：	DIG_Get
// C调用：		unsigned DIG_Get(unsigned DigPos)
// 汇编调用：	F_DIG_Get
// 实现功能：   获取所有数码管的显示内容
// 入口参数：	DigPos(r1) - 要获取显示内容的位
// 出口参数：	该位数码管的显示内容
// 破坏寄存器：	无
//======================================================
_DIG_Get:
	push bp to [sp]
	bp = sp
	r1 = [bp+4]
	call F_DIG_Get
	pop bp from [sp]
retf

F_DIG_Get:
	push r2 to [sp]
	r2 = R_DIG_Buf
	r2 += r1
	r1 = [r2]
.IF SEG_IO_HighByte==1
	r1 = r1 lsr 4
	r1 = r1 lsr 4
.ENDIF
	pop r2 from [sp]
retf

//======================================================
// 函数名称：	DIG_GetAll
// C调用：		unsigned *DIG_GetAll(unsigned *DigBuffer)
// 汇编调用：	F_DIG_GetAll
// 实现功能：   获取所有数码管的显示内容
// 入口参数：	DigBuffer(r1) - 保存数码管显示内容的起始地址
// 出口参数：	保存数码管显示内容的起始地址
// 破坏寄存器：	无
//======================================================
_DIG_GetAll:
	push bp to [sp]
	bp = sp
	r1 = [bp+4]
	call F_DIG_GetAll
	pop bp from [sp]
retf

F_DIG_GetAll:
	push r2,bp to [sp]
	bp = r1
	r2 = DIG_Count
	r3 = R_DIG_Buf
?DIG_Get_Loop:
	r4 = [r3++]
.IF SEG_IO_HighByte==1
	r4 = r4 lsr 4
	r4 = r4 lsr 4
.ENDIF
	[bp++] = r4
	r2 -= 1
	jnz ?DIG_Get_Loop
	pop r2,bp from [sp]
retf

//======================================================
// 函数名称：	DIG_Clear
// C调用：		void DIG_Clear(void)
// 汇编调用：	F_DIG_Clear
// 实现功能： 清空所有数码管显示内容
// 入口参数：	无
// 出口参数：	无
// 破坏寄存器：	无
//======================================================
_DIG_Clear:
F_DIG_Clear:
	push r1, r2 to [sp]
	r1 = R_DIG_Buf
	r2 = 0x00
?L:
	[r1] = r2
	r1 += 1
	cmp r1, R_DIG_Buf+DIG_Count
	jb ?L
	pop r1, r2 from [sp]
retf


//======================================================
// 函数名称：	DIG_Drive
// C调用：		void DIG_Drive(void)
// 汇编调用：	F_DIG_Drive
// 实现功能：   数码管显示函数，由IRQ4_4KHz中断服务程序调用
// 入口参数：	无
// 出口参数：	无
// 破坏寄存器：	无
//======================================================
_DIG_Drive:
F_DIG_Drive:
	push r1,r4 to [sp]
	r1 = [R_CurDIG]					// 如果不显示则直接退出
	cmp r1,0xffff
	je	?DIG_Exit
	r2 = r1 + R_DIG_Buf
	r2 = [r2]
	r2 &= PIN_SEG_ALL

	r3 = [P_DIG_Buf]				// 清除当前位显示
	r3 &= ~PIN_DIG_ALL
	[P_DIG_Data] = r3
	
	r4 = [P_SEG_Buf]				// 段数据设置
	r4 &= ~PIN_SEG_ALL
	r4 |= r2
	[P_SEG_Data] = r4
	
	r3 = [P_DIG_Buf]				// 位数据设置
	r4 = r1 + PIN_DIG
	r3 |= [r4]
	[P_DIG_Data] = r3
	
	r1 += 1							
	cmp r1,DIG_Count
	jb ?DIG_Next					// R_CurDIG指向下一位
?DIG_Reverse:
	r1 = 0							// 若已显示到最后一位则R_CurDIG指向第一位
?DIG_Next:
	[R_CurDIG] = r1
?DIG_Exit:
	pop r1,r4 from [sp]
retf

//======================================================
// 函数名称：	DIG_Off
// C调用：		void DIG_Off(void)
// 汇编调用：	F_DIG_Off
// 实现功能：   停止数码管显示
// 入口参数：	无
// 出口参数：	无
// 破坏寄存器：	无
//======================================================
_DIG_Off:
F_DIG_Off:
	push r1 to [sp]
	r1 = [P_DIG_Buf]
	r1 &= ~PIN_DIG_ALL
	[P_DIG_Buf] = r1
	r1 = 0xffff
	[R_CurDIG] = r1
	pop r1 from [sp]
retf

//======================================================
// 函数名称：	DIG_On
// C调用：		void DIG_On(void)
// 汇编调用：	F_DIG_On
// 实现功能：   恢复数码管显示
// 入口参数：	无
// 出口参数：	无
// 破坏寄存器：	无
//======================================================
_DIG_On:
F_DIG_On:
	push r1 to [sp]
	r1 = 0
	[R_CurDIG] = r1
	pop r1 from [sp]
retf