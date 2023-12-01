//========================================================
//	文件名称：	SACM_DVR1600_User_ASM.asm
//	功能描述：	DVR1600用户函数（汇编语言版），用于保存或获取语音资源数据
//				包括：
//					_USER_DVR1600_GetResource_Init
//					_USER_DVR1600_GetResource
//					_USER_DVR1600_SaveResource_Init
//					_USER_DVR1600_SaveResource
//					_USER_DVR1600_SaveResource_End
//				这些函数被语音库自动调用，可根据需要自行修改这些函数的内容
//	维护记录：	2006-10-16	v1.0, by Qwerty
//========================================================
.INCLUDE SPCE061A.inc
.INCLUDE Flash.inc

//======================================================
//	全局函数和变量声明
//======================================================
.PUBLIC _USER_DVR1600_GetResource_Init
.PUBLIC _USER_DVR1600_GetResource
.PUBLIC _USER_DVR1600_SaveResource_Init
.PUBLIC _USER_DVR1600_SaveResource
.PUBLIC _USER_DVR1600_SaveResource_End

//======================================================
//	外部函数和变量声明
//======================================================
.EXTERNAL F_SACM_DVR1600_Stop

//======================================================
//	常量和助记符定义
//======================================================
.DEFINE	RECORD_SA	0xC000			// 录音资源起始地址
.DEFINE	RECORD_EA	0xEFFF			// 录音资源结束地址

//======================================================
//	变量定义
//======================================================
.RAM
R_Resource_Addr: .DW	0

//**************************************************************************
// 	代码段定义
//**************************************************************************
.CODE
//======================================================
// 函数名称：	_USER_DVR1600_GetResource_Init
// 实现功能：   (被DVR1600函数库自动调用)获取语音资源数据，初始化操作
// 入口参数：	R1:	语音资源序号
// 出口参数：	无
// 破坏寄存器：	无
//======================================================
_USER_DVR1600_GetResource_Init:
	push r1 to [sp]
	r1 = RECORD_SA						// 初始化语音资源的起始地址
	[R_Resource_Addr] = r1
	pop r1 from [sp]
retf

//======================================================
// 函数名称：	_USER_DVR1600_GetResource
// 实现功能：   (被DVR1600函数库自动调用)获取语音资源数据，并填充到解码队列中
// 入口参数：	R1:	待填充解码队列的起始地址(该参数由函数库自动产生)
//				R2:	待填充数据的数量，单位为Word(该参数由函数库自动产生)
// 出口参数：	无
// 破坏寄存器：	无
//======================================================
_USER_DVR1600_GetResource:
	push r1, r4 to [sp]
	r3 = [R_Resource_Addr]
?Loop:
	r4 = [r3++]
	[r1++] = r4
	r2 -= 1
	jnz ?Loop
	[R_Resource_Addr] = r3
	pop r1, r4 from [sp]
retf

//======================================================
// 函数名称：	_USER_DVR1600_SaveResource_Init
// 实现功能：   (被DVR1600函数库自动调用)保存录制的语音资源编码，初始化操作
// 入口参数：	R1: 由SACM_DVR1600_Play函数传递的用户自定义参数
// 出口参数：	无
// 破坏寄存器：	无
//======================================================
_USER_DVR1600_SaveResource_Init:
	push r1, r2 to [sp]
	r1 = RECORD_SA
?Loop:	
	r2 = 0x01
	[P_Watchdog_Clear] = r2
	call F_Flash_Erase					// 擦除录音所需的Flash
	r1 += 0x0100
	cmp r1, RECORD_EA
	jna ?Loop
	r1 = RECORD_SA + 2					// 跳过前两个Word（用于录音结束时保存资源长度）
	[R_Resource_Addr] = r1
	pop r1, r2 from [sp]
retf

//======================================================
// 函数名称：	_USER_DVR1600_SaveResource
// 实现功能：   (被DVR1600函数库自动调用)获取已编码数据，并保存
// 入口参数：	R1:	待获取的已编码数据的起始地址(该参数由函数库自动产生)
//				R2:	已编码数据的数量，单位为Word(该参数由函数库自动产生)
// 出口参数：	无
// 破坏寄存器：	无
//======================================================
_USER_DVR1600_SaveResource:
	push r1, r4 to [sp]
	r3 = r1
	r4 = r2
	r1 = [R_Resource_Addr]
?Loop:	
	r2 = [r3++]
	call F_Flash_WriteWord
	r1 += 1
	cmp r1, RECORD_EA					// 达到结束地址则停止录音
	ja ?StopRecord
	r4 -= 1
	jnz ?Loop
	[R_Resource_Addr] = r1				// 更新R_Resource_Addr
	jmp ?Exit
?StopRecord:
	[R_Resource_Addr] = r1
	call F_SACM_DVR1600_Stop
?Exit:	
	pop r1, r4 from [sp]
retf	

//======================================================
// 函数名称：	_USER_DVR1600_SaveResource_End
// 实现功能：	(被DVR1600函数库自动调用)录音结束后，将录制资源的长度(单位为Byte)保存到该资源的前两个word
// 入口参数：	无	
// 出口参数：	无
// 破坏寄存器：	无
//======================================================
_USER_DVR1600_SaveResource_End:
	push r1, r2 to [sp]
	r2 = [R_Resource_Addr]
	r2 -= RECORD_SA						// 计算录音资源的长度
	r2 = r2 lsl 1						// 转换为字节
	r1 = RECORD_SA
	call F_Flash_WriteWord				// 资源长度的低16位写入RECORD_SA中

	r1 = RECORD_SA + 1
	r2 = 0x0000
	call F_Flash_WriteWord				// 资源长度的高16位填充0
	pop r1, r2 from [sp]
retf
