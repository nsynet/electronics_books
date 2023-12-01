//==========================================================
//文件名称:TNRFDriver.asm
//功能描述:驱动函数
//维护记录 2005.12.2 v1.0
//==========================================================
.define	P_IOA_Data 				0x7000   
.define P_IOA_Buffer 			0x7001
.define P_IOA_Dir 				0x7002
.define P_IOA_Attrib 			0x7003
.define P_IOA_Latch 			0x7004
//............................................
.define P_IOB_Data				0x7005  
.define P_IOB_Buffer			0x7006   
.define P_IOB_Dir				0x7007   
.define P_IOB_Attrib			0x7008   
//............................................
.define P_Watchdog_Clear		0x7012   

//=====================定义红外模块的控制口======================
.define TN_ACK		0x2000             
.define TN_Data		0x8000
.define TN_Clk		0x4000
.define TN_ACK_N	0xdfff
.define TN_Data_N	0x7fff
.define TN_Clk_N	0xbfff

//=====================//define the port========================
//如果使用IOA口，用下面程序-------------------------------------
.define IO_Port			P_IOA_Data				
.define IO_Port_Dir		P_IOA_Dir
.define IO_Port_Attrib	P_IOA_Attrib
.define IO_Port_Buffer	P_IOA_Buffer
//如果使用IOB口，用下面程序-------------------------------------
//.define IO_Port			P_IOB_Data				
//.define IO_Port_Dir		P_IOB_Dir
//.define IO_Port_Attrib	P_IOB_Attrib
//.define IO_Port_Buffer	P_IOB_Buffer

.public _TN_Data_Buff
.ram
_TN_Data_Buff:.dw 3 dup(?)
.var Data_Counter

.code
//==========================================================================
//	汇编格式：	_TN_InitalIO
//	C格式：		void TN_InitalIO(void);
//	实现功能：	红外模块初始化
//	入口参数：	无
//	出口参数：	无
//	破坏寄存器：r1
//==========================================================================
.public _TN_InitalIO
_TN_InitalIO:
	push bp to [sp]
	r1 = [IO_Port_Dir]
	r1 &= TN_ACK_N
	r1 &= TN_Data_N
	r1 &= TN_Clk_N
	[IO_Port_Dir] = r1            
	r1 = [IO_Port_Attrib]
	r1 |= TN_ACK
	r1 &= TN_Data_N
	r1 &= TN_Clk_N
	[IO_Port_Attrib] = r1
	r1 = [IO_Port_Buffer]
	r1 &= TN_ACK_N
	r1 &= TN_Data_N
	r1 &= TN_Clk_N
	[IO_Port] = r1
	pop bp from [sp]
	retf
//==========================================================================
//	汇编格式：	_TN_IRACK_EN
//	C格式：		void TN_IRACK_EN(void);
//	实现功能：	红外模块启动函数
//	入口参数：	无
//	出口参数：	无
//	破坏寄存器：r1
//==========================================================================
.public _TN_IRACK_EN
_TN_IRACK_EN:
	push bp to [sp]
	r1 = [IO_Port_Dir]		        //启动TN
	r1 |= TN_ACK
	[IO_Port_Dir] = r1				//...end
	pop bp from [sp]
	retf
//==========================================================================
//	汇编格式：	_TN_IRACK_UN
//	C格式：		void TN_IRACK_UN(void);
//	实现功能：	红外模块启动函数
//	入口参数：	无
//	出口参数：	无
//	破坏寄存器：r1
//==========================================================================	
.public _TN_IRACK_UN
_TN_IRACK_UN:
	push bp to [sp]
	r1 = [IO_Port_Dir]		        //启动TN
	r1 &= TN_ACK_N
	[IO_Port_Dir] = r1				//...end
	pop bp from [sp]
	retf
//==========================================================================
//	汇编格式：	_TN_ReadData
//	C格式：		int TN_ReadData(void);
//	实现功能：	读测得数据
//	入口参数：	无
//	出口参数：	读到的三个字数据
//	破坏寄存器：r1
//==========================================================================	
.public _TN_ReadData
_TN_ReadData:
	push bp to [sp]
	r2 = 40                  //读5个字节的数据
	r5 = _TN_Data_Buff       //取缓冲区数据
TN_Read_loop:
	r1 = 0x0001
	[P_Watchdog_Clear] = r1
	r1 = [IO_Port]            
	r1 &= TN_Clk             //检测时钟数据 
	jnz TN_Read_loop         //不为零时继续检测 
	r1 = [IO_Port]           //为0时读一个bit数据，即检测到下跳沿
	r1 &= TN_Data            
	jnz TN_Read_Data_H       //不为0时转到TN_Read_Data_H
	r1 = 0                   //返回数据0
	jmp TN_Read_Data_NN
TN_Read_Data_H:
	r1 = 1                    //返回数据1
TN_Read_Data_NN:
//	[r5++] = r1
	r3 = [r5+2]               //第一个字数据处理
	r3 = r3 lsl 1             //   
	r3 = r3|r1                //
	[r5+2] = r3    
	r4 = r4 lsl 3
	r3 = [r5+1]              //第二个字数据处理
	r3 = r3 rol 1
	r4 = r4 lsl 3
	[r5+1] = r3
	r3 = [r5]               //第三个字数据处理
	r3 = r3 rol 1
	r4 = r4 lsl 3
	[r5] = r3
	r2-=1
	jnz TN_Read_Wait       //40个bit数据没有读完转向TN_Read_Wait
	jmp TN_Read_Exit       //读完转向TN_Read_Exit
TN_Read_Wait:
	r1 = 0x0001
	[P_Watchdog_Clear] = r1
	r1 = [IO_Port]        //检测时钟 
	r1 &= TN_Clk      
	jnz TN_Read_loop       //时钟不为0时转向TN_Read_loop
	jmp TN_Read_Wait
TN_Read_Exit:
	nop
	nop
	pop bp from [sp]
	retf