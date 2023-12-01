//========================================================================================================//
// 程序名称：uart.asm
// 功能描述：实现RS232通讯的UART初始化和UART的读写
// 日    期：2003/7/7
//========================================================================================================//
.include hardware.inc
.CODE

//========================================================================================================
//函数: F_UART_Initial
//语法：void F_UART_Initial()
//描述：初始化UART
//参数：无
//返回：无
//========================================================================================================

.PUBLIC _F_UART_Initial;
_F_UART_Initial:		
	PUSH r1 TO [sp];	
 	r1=[P_IOB_Dir]					//设置IOB7为悬浮输入，IOB10为同相低电平输出
	r1|=0x0400;
	r1&=0xFF7F;
	[P_IOB_Dir] = r1;
    r1=[P_IOB_Attrib]
    r1|=0x0480  					
	[P_IOB_Attrib] = r1;
	r1=	[P_IOB_Buffer]
	r1&=0xFB7F;
	[P_IOB_Buffer] = r1;

   	r1 = 0x006b;	     			//设置波特率为115.2Kbps
    [P_UART_BaudScalarLow] = r1;
	r1 = 0x0000;
    [P_UART_BaudScalarHigh] = r1;
	
	r1 = 0x0000;
	[P_UART_Command1] = r1;
	r1 = 0x00C0;		    		//使能输入和输出
	[P_UART_Command2] = r1;
	POP r1 FROM [sp];	
	RETF;

//========================================================================================================
//函数: F_UART_Read
//语法：unsigned int F_UART_Read(void)
//描述：读UART
//参数：无
//返回：r1,返回值低8bit为有效值
//========================================================================================================

.public _F_UART_Read
_F_UART_Read:
	PUSH r2,r5 TO [sp];
	r4=0x00F;
	r3=0x00FF;
L_Check_RxRDY:
	r3-=1;
	r2=0x0001;
	[P_Watchdog_Clear]=r2;
	JNZ L_TestUART;
	r4-=1;
	JZ L_UART_Read_Timeout;
L_TestUART:
	r2 = [P_UART_Command2]; //检测是否有数据接收
	r2 &= 0x0080;
	JZ L_Check_RxRDY;	
	r1 = [P_UART_Data];		//接收数据
	POP r2,r5 FROM [sp];
	retf;
L_UART_Read_Timeout:
	r1=0x0000;
	POP r2,r5 FROM [sp];
	RETF;
	
//========================================================================================================
//函数: F_UART_Write
//语法：void F_UART_Write(unsigned int)
//描述：写UART
//参数：为要写入串口的值，其低8bit为有效值。
//返回：无
//========================================================================================================
.PUBLIC _F_UART_Write
_F_UART_Write:
	PUSH r1,r5 TO [sp]
	bp=sp+1;
	r1=[bp+7];				//参数
L_Check_TxRDY:
	r2=0x0001;
	[P_Watchdog_Clear]=r2;
	r2 = [P_UART_Command2];
	r2 &= 0x0040;			//检测输出是否READY
	JZ L_Check_TxRDY;
	[P_UART_Data] = r1;
	POP r1,r5 FROM [sp]
	RETF;

