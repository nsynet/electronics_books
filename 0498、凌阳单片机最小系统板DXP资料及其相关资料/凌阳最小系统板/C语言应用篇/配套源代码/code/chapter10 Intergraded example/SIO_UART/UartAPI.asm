//=============================================================================
// Program: UartAPI.asm V1.1
// Description:  This program send 0x0100 sample data(0x0000~0x00FF) to EchoServer 
//               ,get the response data, count the discrepencies and 
//               display the error count report to IOA on LED.
// By  Arthur Shieh
// Platform: SPCE 061, IDE 1.631, Windows 2000
// Date: 2002/09/10
// Mainteinence history:
//       2002/09/10:  First Version
//       2002/09/29: V1.1  Split hardware.asm into the spcexxx.inc and SP_Lib.asm 
//                        rearrange and comment the program   
//
// Note:
//   UART Setting:Rx :IOB7
//              Tx :IOB10 
//              Baud rate: 115200 bps
//              Parity   : Even
//              Stop bit : 1
//              IRQ      : 7
//                 
//   Input : None
//   Output: LED on IOA0~IOA7 
//=============================================================================
.INCLUDE spce.inc;	
.INCLUDE UART.inc;	
.external _SP_SIOSendAByte,_SP_SIOReadAByte
.external _Addr,_Ret


.CODE	


//----------------------------------------------
// Macro: UART Internal reset
// Argument : N/A
// Register : R1
//----------------------------------------------
M_UartInternalReset: .macro 
	R1 = 0x20;
	[P_UART_Command1] = R1;		//internal RESET
	R1 = 0x00;
	[P_UART_Command1] = R1;		//internal RESET	
.ENDM
//----------------------------------------------
// Macro: Set UART baud rate
// Argument : baud rate high, baud rate low
// Register : R1
//----------------------------------------------
M_SetUartBaudRate: .macro C_UARTBaudRate_H,C_UARTBaudRate_L
    R1 = C_UARTBaudRate_H;
	[P_UART_BaudScalarHigh] = R1;
    R1 = C_UARTBaudRate_L;
	[P_UART_BaudScalarLow] = R1;
.ENDM
//----------------------------------------------
// Macro: UART setting 
// Argument : command 1 setting, command 2 setting
// Register : R1
//----------------------------------------------
M_UartCmdSet: .macro C_Cmd1Setting,C_Cmd2Setting
    R1 = C_Cmd1Setting;
	[P_UART_Command1] = R1;    
    R1 = C_Cmd2Setting;  
	[P_UART_Command2] = R1;  
.ENDM
//============================================================== 
// Description: Initialize UART setting 
// Syntax: SP_Uart_Init()
// Parameter: None
// Return:  Data
// Parameter:N/A
// Return None
//=============================================================
.public _SP_UART_Init
_SP_UART_Init: .PROC
F_UART_INIT: 
	PUSH R1,R2 to [SP];
      
    // wait for IO stable
    R2 = 0xFFFF //0x0AFF;    
    ?L_WaitForIOStable00: 
    R2-=1;
    jnz ?L_WaitForIOStable00;	
 	 	
	// Internal reset
    M_UartInternalReset; 
    // baudrate
	M_SetUartBaudRate C_UARTBaudRate_115200_H,C_UARTBaudRate_115200_L;
	//
    // cmd setting
    //
//    M_UartCmdSet C_EvenParity|C_ParityEnable,C_EnableTx|C_EnableRx
    M_UartCmdSet C_EvenParity|C_ParityEnable,C_EnableTx|C_EnableRx
  
    // wait for IO stable

    R2 = 0xFFFF //0x0AFF;    
    ?L_WaitForIOStable01: 
    R2-=1;
    jnz ?L_WaitForIOStable01;
	
	// clear receiving buffer
	R1=[P_UART_Data];
	POP R1,R2 from[SP];
retf;
.ENDP

//=========================================
// Description: Sent a byte to UART 
// Syntax: SP_UartSentByte()
// Parameter: Data
// Return:  None
//=========================================
.public _SP_UartSentByte
_SP_UartSentByte: .PROC
 PUSH BP,BP to[SP];
 BP = SP+1;
 R1 = [BP+3];
 call F_UartSendByte;
 
 POP BP,BP from[SP];
 retf;
.ENDP
//-----------------------------
// Function : Set a byte
// parameter: R1=data to send
// return: N/A
// register: R1;
//-----------------------------
F_UartSendByte:
    PUSH R1,R1 to [SP];
    ?L_Check_TxRDY:
	R1 = 0x0040;		       //Check bit 6 to see if TxRDY = 1;
	TEST R1,[P_UART_Command2]; //Read received data byte if RxRDY=1
	JZ ?L_Check_TxRDY;
    // send data
    POP R1,R1 from [SP];
    [P_UART_Data]=R1; 
    retf;
//=========================================
// Description: Read a byte from UART 
// Syntax: SP_UartReadByte()
// Parameter: None
// Return:  Data
//=========================================
.public _SP_UartReadByte
_SP_UartReadByte: .PROC
//----------------------------
// Function : Read a byte
// parameter: N/A
// return: R1=Data read
// register: R1;
//----------------------------
F_SendByte:   
?L_ResendData:
	r2=0xffff;
   // receive data
  ?L_Check_RxRDY:
	R2-=1;
	cmp R2,1
	jbe ReadByte_Return
	R1 = 0x0080;		       //Check bit 7 to see if RxRDY = 1;
	TEST R1,[P_UART_Command2]; //Read received data byte if RxRDY=1
	JZ ?L_Check_RxRDY;
    // read data
    // Compare the data sent and received
    R1 = [P_UART_Data]; 
ReadByte_Return:
	retf;
.ENDP

//=========================================
// by guangyuan wei
// Description: down load 
// Syntax: UART_Download()
// Parameter: None
// Return:  none
//=========================================
.public _UART_Download;
_UART_Download:   .proc

	R1 = 0x0000;
	R4 = 0x00C0;		    //enable Rx and Tx 
	[P_UART_Command1] = R1;
	[P_UART_Command2] = R4;

Download_Check:
	R2 = [P_UART_Command2]; //check if it has data received 
	R2 &= 0x0080;
	JZ Download_Check;	
	
Download_Check_RxRDY:
	R1-=1;
	cmp R1,1
	jbe Download_Return
	R2 = [P_UART_Command2]; //check if it has data received
	R2 &= 0x0080;
	JZ Download_Check_RxRDY;	
	R1 = [P_UART_Data];		//receive data
	push r1 to [sp]
	bp=_Addr+1
	r1=[bp];
	push r1 to [sp]
	bp-=1
	r1=[bp];
	push r1 to [sp]
	call _SP_SIOSendAByte;
	sp+=3;
	r1=[_Addr];
	r2=[_Addr+1];
	r1+=1;
	r2+=0,Carry;
	[_Addr]=r1;
	[_Addr+1]=r2;
	
	R1=0xffff;
 	GOTO Download_Check_RxRDY;
 	
Download_Return:
	retf;  
.endp

