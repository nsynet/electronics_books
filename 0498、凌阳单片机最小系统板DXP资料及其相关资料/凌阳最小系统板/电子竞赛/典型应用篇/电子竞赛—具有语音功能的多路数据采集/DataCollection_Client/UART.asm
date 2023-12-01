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
	INT OFF;
	r1 = 0x0000;			//未使能任何中断
	[P_INT_Ctrl] = r1;
	r1 = 0x0480;	        //设置IOB7为输入IOB10为输出
	[P_IOB_Attrib] = r1;
	R1 = 0x0400;
	[P_IOB_Dir] = R1;
	R1 = 0x0000;	
	[P_IOB_Data] = R1;

   	R1 = 0x006b;	     	//设置波特率为115.2Kbps
    [P_UART_BaudScalarLow] = R1;
	R1 = 0x0000;
    [P_UART_BaudScalarHigh] = R1;
	
	
	R1 = 0x0080;
	[P_UART_Command1] = R1;
	R4 = 0x00C0;		    //使能输入和输出
	[P_UART_Command2] = R4;
	IRQ ON	
	RETF
	
//========================================================================================================
//函数: F_UART_Write
//语法：void F_UART_Write(unsigned int)
//描述：写UART
//参数：为要写入串口的值，其低8bit为有效值。
//返回：无
//========================================================================================================
.PUBLIC _F_UART_WriteByteData
_F_UART_WriteByteData:
	PUSH r1,r5 TO [sp]
	bp=sp+1;
	r1=[bp+7];//command value
	r4=0xFFFF;
L_Check_TxRDY:
	r3=0x0001;
	[P_Watchdog_Clear]=r3;
	r4-=1;
	JZ L_UART_Write_Timeout;
	r2 = [P_UART_Command2];
	r2 &= 0x0040;			//检测输出是否READY
	JZ L_Check_TxRDY;
	[P_UART_Data] = r1;//send data
L_UART_Write_Timeout:	
	POP r1,r5 FROM [SP]
	RETF;


