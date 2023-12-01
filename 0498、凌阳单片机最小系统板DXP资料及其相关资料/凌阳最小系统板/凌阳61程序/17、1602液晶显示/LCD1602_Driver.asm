//============================================================
//	文件名称：	LCD1602_Driver.asm
//	功能描述：	LCD1602底层驱动程序
//	维护记录：	2005-11-2	v1.0		Edit by 小丑 
//	Mz出品  时序经典
//============================================================
	.DEFINE		P_IOA_Data				0x7000
	.DEFINE		P_IOA_Buffer			0x7001
	.DEFINE		P_IOA_Dir				0x7002
	.DEFINE		P_IOA_Attrib			0x7003
	.DEFINE		P_IOA_Latch				0x7004

	.DEFINE		P_IOB_Data				0x7005
	.DEFINE		P_IOB_Buffer			0x7006
	.DEFINE		P_IOB_Dir				0x7007
	.DEFINE		P_IOB_Attrib			0x7008
	
	.DEFINE		P_Watchdog_Clear		0x7012
//**********************************************************************************//
//========================用户需要修改端口时，在下列定义项当中修改即可==============//
//定义数据端口
.DEFINE Port_Data_D		P_IOA_Data
.DEFINE Port_Buffer_D	P_IOA_Buffer
.DEFINE Port_Dir_D		P_IOA_Dir
.DEFINE Port_Attrib_D	P_IOA_Attrib
//定义控制端口
.DEFINE Port_Data_C		P_IOB_Data
.DEFINE Port_Buffer_C	P_IOB_Buffer
.DEFINE	Port_Dir_C		P_IOB_Dir
.DEFINE	Port_Attrib_C	P_IOB_Attrib
//定义控制端口当中，每个控制线所对应的端口号
.DEFINE	M_1602_EP	0x1000
.DEFINE M_1602_RW	0x4000
.DEFINE M_1602_RS	0x2000
//数据端口高低位定义，如使用低八位则定义为0x00ff，高八位则为0xff00
.DEFINE M_Mask			0xff00
//如数据端口采用低八位时，屏蔽下面的M_HIGHT定义，如使用高八位端口作为数据口，则不屏蔽
.DEFINE M_HIGHT			1
//**********************************************************************************//
.DEFINE M_Delay_Timers		0x00ff			//延时时程定义，当默认时为0x00ff，大概会延时6ms左右
											//用户可根据自己的程序适当修改

.RAM
.VAR R_Port_Dir,R_Port_Data,R_Port_Attrib

.CODE
//========================================================
//	汇编格式：	InitIO_LCD1602
//	C格式：		无
//	实现功能：	初始化端口
//	入口参数：	无
//	出口参数：	无
//	破坏寄存器：无
//========================================================
.PUBLIC F_InitIO_LCD1602
F_InitIO_LCD1602:
	push r1 to [sp]
	r1 = [Port_Dir_D]
	r1 = r1&(~M_Mask)
	[Port_Dir_D] = r1
	r1 = [Port_Attrib_D]
	r1 = r1&(~M_Mask)
	[Port_Attrib_D] = r1
	r1 = [Port_Buffer_D]
	r1 = r1&(~M_Mask)
	[Port_Data_D] = r1
	
	r1 = [Port_Dir_C]
	r1 = r1|(M_1602_EP+M_1602_RS+M_1602_RW)
	[Port_Dir_C] = r1
	r1 = [Port_Attrib_C]
	r1 = r1|(M_1602_EP+M_1602_RS+M_1602_RW)
	[Port_Attrib_C] = r1
	r1 = [Port_Buffer_C]
	r1 = r1|(M_1602_EP+M_1602_RS+M_1602_RW)
	[Port_Data_C] = r1
	pop r1 from [sp]
	retf
//========================================================
//	汇编格式：	F_DataPort_Input
//	C格式：		NULL
//	实现功能：	把数据端口设置为输入口
//	入口参数：	无
//	出口参数：	无
//	破坏寄存器：无
//========================================================
F_DataPort_Input:
	r4 = [Port_Dir_D]
	[R_Port_Dir] = r4
	r4 = r4&(~M_Mask)
	[Port_Dir_D] = r4
	r4 = [Port_Attrib_D]
	[R_Port_Attrib] = r4
	r4 = r4&(~M_Mask)
	[Port_Attrib_D] = r4
	r4 = [Port_Buffer_D]
	[R_Port_Data] = r4
	r4 = r4&(~M_Mask)
	[Port_Data_D] = r4
	retf
//========================================================
//	汇编格式：	F_DataPort_Output
//	C格式：		NULL
//	实现功能：	把数据端口设置为输入口
//	入口参数：	无
//	出口参数：	无
//	破坏寄存器：无
//========================================================
F_DataPort_Output:
	r3 = [Port_Dir_D]
	r3 = r3|M_Mask
	[Port_Dir_D] = r3
	r3 = [Port_Attrib_D]
	r3 = r3|M_Mask
	[Port_Attrib_D] = r3
	r3 = [Port_Buffer_D]
	r3 = r3|M_Mask
	[Port_Data_D] = r3
	retf
//========================================================
//	汇编格式：	F_DataPort_Resum
//	C格式：		NULL
//	实现功能：	恢复端口设置
//	入口参数：	无
//	出口参数：	无
//	破坏寄存器：无
//========================================================
F_DataPort_Resum:
	r2 = [R_Port_Dir]
	[Port_Dir_D] = r2
	r2 = [R_Port_Attrib]
	[Port_Attrib_D] = r2
	r2 = [R_Port_Data]
	[Port_Data_D] = r2
	retf
	
//========================================================
//	汇编格式：	_LCD1602_Initial
//	C格式：		void LCD1602_Initial(void)
//	实现功能：	LCD1602初始化程序
//	入口参数：	无
//	出口参数：	无
//	破坏寄存器：无
//========================================================
.PUBLIC _LCD1602_Initial
_LCD1602_Initial:
	push r1,r2 to [sp]
	call F_InitIO_LCD1602
	call F_DataPort_Output
	r2 = [Port_Buffer_D]				//获取当前端口输出值
	r2 = r2&(~M_Mask)
.IFDEF M_HIGHT
	r2 = r2|0x3000
.ELSE
	r2 = r2|0x0030
.ENDIF
	[Port_Data_D] = r2
	r2 = [Port_Buffer_C]				//获取当前端口输出值
	r2 = r2&(~(M_1602_RW+M_1602_RS))
	[Port_Data_C] = r2
	r1 = 3
?LCD1602_Initial_1:
	r2 = r2|M_1602_EP
	[Port_Data_C] = r2					//ep hight
	nop
	r2 = r2&(~M_1602_EP)				
	[Port_Data_C] = r2					//EP to low
	call F_Delay
	r1 = r1-1
	jnz ?LCD1602_Initial_1
	r2 = [Port_Buffer_D]
	r2 = r2&(~M_Mask)
.IFDEF M_HIGHT
	r2 = r2|0x3800
.ELSE
	r2 = r2|0x0038
.ENDIF
	[Port_Data_D] = r2
	r2 = [Port_Buffer_C]
	r2 = r2|M_1602_EP
	[Port_Buffer_C] = r2
	nop
	r2 = r2&(~M_1602_EP)
	[Port_Buffer_C] = r2				//EP to low
	call F_Delay
	r1 = 0x0001
	call F_Write_Command
	r1 = 0x0006
	call F_Write_Command
	r1 = 0x000c
	call F_Write_Command
	pop r1,r2 from [sp]
	retf
//========================================================
//	汇编格式：	F_Write_Command
//	C格式：		void Write_Command(unsigned int Com)
//	实现功能：	写指令子函数
//	入口参数：	Com（利用R1传递）  要写入LCD的指令
//	出口参数：	无
//	破坏寄存器：无
//========================================================
.PUBLIC _Write_Command,F_Write_Command
_Write_Command:
F_Write_Command:
	push r1,r4 to [sp]
	call F_DataPort_Input
	r2 = [Port_Buffer_C]				//获取当前端口输出值
	r2 = r2|M_1602_RW
	r2 = r2&(~(M_1602_EP+M_1602_RS))	//RW=1  RS=0  EP=0
	[Port_Data_C] = r2
	nop
?Write_Command_BZ:
	r2 = r2|M_1602_EP
	[Port_Data_C] = r2					//EP hight!
	r3 = [Port_Data_D]
	r2 = r2&(~M_1602_EP)
	[Port_Data_C] = r2					//EP low!
.IFDEF M_HIGHT
	test r3,0x8000
.ELSE
	test r3,0x0080
.ENDIF
	jnz ?Write_Command_BZ				//Busy? yes---Loop
	call F_DataPort_Output
	r2 = r2&(~M_1602_RW)
	[Port_Data_C] = r2					//RW low
	r2 = [Port_Buffer_D]
	r2 = r2&(~M_Mask)
.IFDEF M_HIGHT
	r1 = r1 lsl 4
	r1 = r1 lsl 4
.ENDIF
	r2 = r2|r1							//or the command
	[Port_Data_D] = r2
	r2 = [Port_Buffer_C]
	r2 = r2|M_1602_EP					//EP hight
	[Port_Data_C] = r2
	nop
	nop
	r2 = r2&(~M_1602_EP)
	[Port_Data_C] = r2					//EP low
	call F_DataPort_Resum				//resum the IO Port
	pop r1,r4 from [sp]
	retf
//========================================================
//	汇编格式：	F_Write_Data
//	C格式：		void Write_Data(unsigned int Data)
//	实现功能：	写显示数据函数
//	入口参数：	Data（利用R1传递）  要写入LCD的数据
//	出口参数：	无
//	破坏寄存器：无
//========================================================
.PUBLIC _Write_Data,F_Write_Data
_Write_Data:
F_Write_Data:
//	push r1,r4 to [sp]
	push bp to [sp]
	bp = sp + 1
	r1 = [bp + 3]
	call F_DataPort_Input
	r2 = [Port_Buffer_C]				//获取当前端口输出值
	r2 = r2|M_1602_RW
	r2 = r2&(~(M_1602_EP+M_1602_RS))	//RW=1  RS=0  EP=0
	[Port_Data_C] = r2
	nop
?Write_Data_BZ:
	r2 = r2|M_1602_EP
	[Port_Data_C] = r2					//EP hight!
	r3 = [Port_Data_D]
	r2 = r2&(~M_1602_EP)
	[Port_Data_C] = r2					//EP low!
.IFDEF M_HIGHT
	test r3,0x8000
.ELSE
	test r3,0x0080
.ENDIF
	jnz ?Write_Data_BZ					//Busy? yes---Loop
	call F_DataPort_Output
	r2 = r2&(~M_1602_RW)
	r2 = r2|M_1602_RS					//RS hight
	[Port_Data_C] = r2					//RW low
	r2 = [Port_Buffer_D]
	r2 = r2&(~M_Mask)
.IFDEF M_HIGHT
	r1 = r1 lsl 4
	r1 = r1 lsl 4
.ENDIF
	r2 = r2|r1							//or the command
	[Port_Data_D] = r2
	r2 = [Port_Buffer_C]
	r2 = r2|M_1602_EP					//EP hight
	[Port_Data_C] = r2
	nop
	nop
	r2 = r2&(~M_1602_EP)
	[Port_Data_C] = r2					//EP low
	call F_DataPort_Resum				//resum the IO Port
	pop bp from [sp]
//	pop r1,r4 from [sp]
	retf
//========================================================
//	汇编格式：	F_Read_Data
//	C格式：		unsigned int Read_Data(void)
//	实现功能：	读显示数据函数
//	入口参数：	无
//	出口参数：	读回的数据 r1返回
//	破坏寄存器：无
//========================================================
.PUBLIC _Read_Data,F_Read_Data
_Read_Data:
F_Read_Data:
	push r2,r4 to [sp]
	call F_DataPort_Input
	r2 = [Port_Buffer_C]				//获取当前端口输出值
	r2 = r2|M_1602_RW
	r2 = r2&(~(M_1602_EP+M_1602_RS))	//RW=1  RS=0  EP=0
	[Port_Data_C] = r2
?Read_Data_BZ:
	r2 = r2|M_1602_EP
	[Port_Data_C] = r2					//EP hight!
	r3 = [Port_Data_D]
	r2 = r2&(~M_1602_EP)
	[Port_Data_C] = r2					//EP low!
.IFDEF M_HIGHT
	test r3,0x8000
.ELSE
	test r3,0x0080
.ENDIF
	jnz ?Read_Data_BZ					//Busy? yes---Loop
	r2 = r2|M_1602_RS					//RS hight
	[Port_Data_C] = r2					//
	nop
	r2 = r2|M_1602_EP					//EP hight
	[Port_Data_C] = r2
	nop
	nop
	r1 = [Port_Data_D]
	r1 = r1&M_Mask
.IFDEF M_HIGHT
	r1 = r1 lsr 4
	r1 = r1 lsr 4
.ENDIF
	r2 = r2&(~M_1602_EP)
	[Port_Data_C] = r2					//EP low
	call F_DataPort_Resum				//resum the IO Port
	pop r2,r4 from [sp]
	retf
//========================================================
//	汇编格式：	F_Read_BZAC
//	C格式：		unsigned int Read_BZAC(void)
//	实现功能：	读显示数据函数
//	入口参数：	无
//	出口参数：	读回的数据  r1返回
//	破坏寄存器：无
//========================================================
.PUBLIC _Read_BZAC,F_Read_BZAC
_Read_BZAC:
F_Read_BZAC:
	push r2,r4 to [sp]
	call F_DataPort_Input
	r2 = [Port_Buffer_C]				//获取当前端口输出值
	r2 = r2|M_1602_RW
	r2 = r2&(~(M_1602_EP+M_1602_RS))	//RW=1  RS=0  EP=0
	[Port_Data_C] = r2
?Read_BZAC_BZ:
	r2 = r2|M_1602_EP
	[Port_Data_C] = r2					//EP hight!
	r3 = [Port_Data_D]
	r2 = r2&(~M_1602_EP)
	[Port_Data_C] = r2					//EP low!
.IFDEF M_HIGHT
	test r3,0x8000
.ELSE
	test r3,0x0080
.ENDIF
	jnz ?Read_BZAC_BZ					//Busy? yes---Loop
	r2 = r2|M_1602_EP					//EP hight
	[Port_Data_C] = r2
	nop
	r1 = [Port_Data_D]
	r1 = r1&M_Mask
.IFDEF M_HIGHT
	r1 = r1 lsr 4
	r1 = r1 lsr 4
.ENDIF
	r2 = r2&(~M_1602_EP)
	[Port_Data_C] = r2					//EP low
	call F_DataPort_Resum				//resum the IO Port
	pop r2,r4 from [sp]
	retf
//========================================================
//	汇编格式：	F_Delay
//	C格式：		无
//	实现功能：	延时程序
//	入口参数：	无
//	出口参数：	无
//	破坏寄存器：无
//========================================================
F_Delay:
	push r1,r3 to [sp]
	r1 = 5
F_Delay_1:
	r2 = M_Delay_Timers
F_Delay_2:
	r3 = 0x0001
	[P_Watchdog_Clear] = r3
	r2 = r2-1
	jnz F_Delay_2
	r1 = r1-1
	jnz F_Delay_1
	pop r1,r3 from [sp]
	retf