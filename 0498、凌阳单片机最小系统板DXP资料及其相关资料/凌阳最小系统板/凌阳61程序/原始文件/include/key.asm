//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//             (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                          ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
// 文件名称：Key.asm
// 实现功能：4*4按键扫描程序，使用IRQ6_TMB2中断(128Hz)
// 日期：    2005/6/18
//============================================================

//================================================
//	按键去抖动时间设定，单位为1/128秒
//================================================
.DEFINE Key_Debounce	4			//(4/128)秒=31ms
//================================================
//	持续按键时间间隔设定，单位1/128秒
//================================================
.DEFINE Key_TimeOut		64			//(64/128)秒=0.5s

//================================================
//	按键使用端口设定
//================================================
.DEFINE Key_IO_Port			0		// 若按键使用IOA口则采用该行定义
//.DEFINE Key_IO_Port			1		// 若按键使用IOB口则采用该行定义

.DEFINE Key_IO_HighByte		0		// 若按键使用IO口低8位则采用该行定义
//.DEFINE Key_IO_HighByte		1		// 若按键使用IO口高8位则采用该行定义

/////-----       不必修改下面的定义	    -----/////
.IF Key_IO_HighByte==0
	.DEFINE Key_ALL			0x00ff		
	.DEFINE Key_NibbleL		0x000f
	.DEFINE Key_NibbleH		0x00f0
.ELSE
	.DEFINE Key_ALL			0xff00
	.DEFINE Key_NibbleL		0x0f00
	.DEFINE Key_NibbleH		0xf000
.ENDIF
/////-----       不必修改下面的定义	    -----/////
.IF Key_IO_Port==0
	.DEFINE P_Key_Data		0x7000
	.DEFINE P_Key_Buf		0x7001
	.DEFINE P_Key_Dir		0x7002
	.DEFINE P_Key_Attrib	0x7003
.ELSE
	.DEFINE P_Key_Data		0x7005
	.DEFINE P_Key_Buf		0x7006
	.DEFINE P_Key_Dir		0x7007
	.DEFINE P_Key_Attrib	0x7008
.ENDIF


.DEFINE P_INT_Mask			0x702d
.DEFINE P_TimeBase_Setup	0x700e
.DEFINE	P_Watchdog_Clear	0x7012
.DEFINE C_IRQ6_TMB2			0x0001
.DEFINE C_TMB2_128Hz		0x0000

.PUBLIC F_Key_Init
.PUBLIC _Key_Init
.PUBLIC F_Key_Scan
.PUBLIC _Key_Scan
.PUBLIC F_Key_Get
.PUBLIC _Key_Get

.RAM
.VAR KeyCode						// 存储获得的键值
.VAR ScanCnt						// 该变量用来表示按键持续时间
.VAR KeyUp							// 按键是否处于抬起状态

.CODE
//======================================================
// 函数名称：	Key_Init
// C调用：		void Key_Init(void)
// 汇编调用：	F_Key_Init
// 实现功能：   初始化按键扫描程序，该函数将开启IRQ6_TMB2中断
// 入口参数：	无
// 出口参数：	无
// 破坏寄存器：	无
//======================================================
F_Key_Init:
_Key_Init:
	push r1 to [sp]
	INT Off
	r1 = [P_Key_Dir]				// 初始化IO, 低4位下拉输入，高4位输出高
	r1 |= Key_NibbleH
	r1 &= ~Key_NibbleL
	[P_Key_Dir] = r1
	r1 = [P_Key_Attrib]
	r1 |= Key_NibbleH
	r1 &= ~Key_NibbleL
	[P_Key_Attrib] = r1
	r1 = [P_Key_Buf]
	r1 |= Key_NibbleH
	r1 &= ~Key_NibbleL
	[P_Key_Buf] = r1
	
	r1 = 0
	[ScanCnt] = r1					// 初始化变量
	[KeyCode] = r1
	[KeyUp] = r1
	r1 = C_TMB2_128Hz				// 开启IRQ6_TMB2(128Hz)中断
	[P_TimeBase_Setup] = r1
	r1 = [P_INT_Mask]
	r1 |= C_IRQ6_TMB2
	[P_INT_Mask] = r1
	INT FIQ,IRQ
	pop r1 from [sp]
retf

//======================================================
// 函数名称：	Key_Scan
// C调用：		void Key_Scan(void)
// 汇编调用：	F_Key_Scan
// 实现功能：   按键扫描，该函数被IRQ6_TMB2中断服务程序调用
// 入口参数：	无
// 出口参数：	无
// 破坏寄存器：	无
//======================================================
F_Key_Scan:
_Key_Scan:
	push r1,r4 to [sp]

//	r1 = [P_Key_Dir]				// 初始化IO, 低4位下拉输入，高4位输出高
//	r1 |= Key_NibbleH
//	r1 &= ~Key_NibbleL
//	[P_Key_Dir] = r1
//	r1 = [P_Key_Attrib]
//	r1 |= Key_NibbleH
//	r1 &= ~Key_NibbleL
//	[P_Key_Attrib] = r1
//	r1 = [P_Key_Buf]
//	r1 |= Key_NibbleH
//	r1 &= ~Key_NibbleL
//	[P_Key_Buf] = r1

	r2 = [P_Key_Data]				// 获取IO端口状态
	r2 &= Key_NibbleL
	jnz ?L_ScanKey_Down				// 判断当前是否有键按下
?L_ScanKey_Up:
	r1 = 1							// 如果按键处于抬起状态则KeyUp置1
	[KeyUp] = r1
	goto ?L_ScanKey_Exit
?L_ScanKey_Down:
	r1 = 0							// KeyUp置0
	[KeyUp] = r1
	r4 = [P_Key_Buf]

	r3 = Key_NibbleH & 0x1010
	r1 = r4 & ~Key_NibbleH			// 扫描第1列(仅第1列IO输出置高，检测输入口状态是否变化)
	r1 |= r3
	[P_Key_Buf] = r1
	r1 = [P_Key_Data]
	r1 &= Key_NibbleL
	jnz ?L_GetCode
	
	r3 = Key_NibbleH & 0x2020		// 扫描第2列
	r1 = r4 & ~Key_NibbleH
	r1 |= r3
	[P_Key_Buf] = r1
	r1 = [P_Key_Data]
	r1 &= Key_NibbleL
	jnz ?L_GetCode

	r3 = Key_NibbleH & 0x4040		// 扫描第3列
	r1 = r4 & ~Key_NibbleH
	r1 |= r3
	[P_Key_Buf] = r1
	r1 = [P_Key_Data]
	r1 &= Key_NibbleL
	jnz ?L_GetCode

	r3 = Key_NibbleH & 0x8080		// 扫描第4列
	r1 = r4 & ~Key_NibbleH
	r1 |= r3
	[P_Key_Buf] = r1
	r1 = [P_Key_Data]
	r1 &= Key_NibbleL
	jnz ?L_GetCode
	jmp ?L_ScanKey_Up				// 如果未扫描到按键
?L_GetCode:
	r1 = [P_Key_Buf]				// 重新初始化IO
	r1 |= Key_NibbleH
	[P_Key_Data] = r1
	
	r2 |= r3
.IF Key_IO_HighByte
	r2 = r2 lsr 4
	r2 = r2 lsr 4
.ENDIF
	cmp r2,[KeyCode]				// 本次得到的键值与上次得到的键值比较
	je	?L_ScanKey_Cont
?L_ScanKey_New:						// 如果与上次键值不同则重置键值
	[KeyCode] = r2
	r1 = 1							// 重新记录键持续按下的时间
	[ScanCnt] = r1
	jmp ?L_ScanKey_Exit
?L_ScanKey_Cont:					// 如果此次键值与上次键值相同
	r1 = [ScanCnt]					// 更新按键持续时间(ScanCnt加1)
	r1 += 1
	[ScanCnt] = r1
?L_ScanKey_Exit:
	pop r1,r4 from [sp]
retf

//======================================================
// 函数名称：	Key_Get
// C调用：		unsigned Key_Get(void)
// 汇编调用：	F_Key_Get
// 实现功能：   获取键值
// 入口参数：	无
// 出口参数：	r1 - 获得的键值
// 破坏寄存器：	r1
//======================================================
F_Key_Get:
_Key_Get:
	INT OFF
	push r2 to [sp]
	r2 = 0x01
	[P_Watchdog_Clear] = r2
	r2 = [ScanCnt]
	cmp r2,Key_Debounce				// 如果按键持续时间小于Key_Debounce
	jb	?L_GetKey_NoKey				// 则认为当前没有键按下
	cmp r2,Key_TimeOut				// 如果按键持续时间大于Key_TimeOut
	jnb ?L_GetKey					// 则认为发生了一次按键
	r2 = [KeyUp]					// 如果按键持续时间在Key_Debounce与Key_TimeOut之间
	jnz ?L_GetKey					// 如果按键处于抬起状态则认为发生了一次按键
?L_GetKey_NoKey:
	r1 = 0							// 没有按键则返回0
	jmp ?L_GetKey_Exit
?L_GetKey:
	r1 = [KeyCode]					// 有按键则返回键值
	r2 = 0
	[KeyCode] = r2					// 重新初始化变量
	[ScanCnt] = r2
	[KeyUp] = r2
?L_GetKey_Exit:
	INT FIQ,IRQ
	pop r2 from [sp]
retf
