//======================================================
//        The information contained herein is the exclusive property of
//      Sunplus Technology Co. And shall not be distributed, reproduced,
//      or disclosed in whole in part without prior written permission.
//            (C) COPYRIGHT 2001   SUNPLUS TECHNOLOGY CO.
//                           ALL RIGHTS RESERVED
//    The entire notice above must be reproduced on all authorized copies.
//======================================================

//======================================================
//  Filename:    	UART.c
//  Author:      	guangyuan wei    (email: guangyuan/sunnorth)    
//  Date:        	2003,5,4
//  Description:	This program is a UART example for chapter 10 of <Programming Sunplus-16bit-MCU in C>  
//				 
//  Reference:
//  Revision:
//  -----------------------------------------------------------------------------------
//  Version   Year-Month-Day-Index   Modified By    Description
//					2003-05-4:  First Version
//  -----------------------------------------------------------------------------------
// Note:
//   UART Setting:Rx :IOB7
//              Tx :IOB10 
//              Baud rate: 115200 bps
//              Parity   : Even
//              Stop bit : 1
//                 
//======================================================
volatile unsigned int *P_UART_Command1=(unsigned int*)(0x7021); 		// Command1 Port for UART
volatile unsigned int *P_UART_Command2=(unsigned int*)(0x7022); 		// Command2 Port for UART
volatile unsigned int *P_UART_Data=(unsigned int*)(0x7023);  			// Data Port for UART
volatile unsigned int *P_UART_BaudScalarLow=(unsigned int*)(0x7024); 	// Set Baud Rate scalar low
volatile unsigned int *P_UART_BaudScalarHigh=(unsigned int*)(0x7025); 	// Set Baud Rate scalar high

//============================================================= 
// Function:     	UART_Init()
// Syntax:      	void UART_Init(void);
// Description: 	UART Init
// Notes:       
// parameters:   	none
// returns:      	none
//=============================================================
void UART_Init(void)
{
	int a;
	*P_UART_Command1=0x20;			//Uart internal RESET
	*P_UART_Command1=0x00;
	
	*P_UART_BaudScalarHigh=0x00;	//Set UART baud rate to 115200
	*P_UART_BaudScalarLow=0x6B;

	*P_UART_Command1=0x000C;		//Uart setting
	*P_UART_Command2=0x00C0;
		
	a=*P_UART_Data;					// clear receiving buffer
}


//============================================================= 
// Function:     	UartSendByte()
// Syntax:      	void UartSendByte(void);
// Description: 	Uart Send A Byte
// Notes:       
// parameters:   	none
// returns:      	none
//=============================================================
void UartSendByte(unsigned int data)
{
	int a;
	a=*P_UART_Command2;
	a=a&0x0040;
	while(!a)						//Check bit 6 to see if TxRDY = 1
	{
		a=*P_UART_Command2;
		a=a&0x0040;
	}
	*P_UART_Data=data;				// send data

//	a=0x4f;
//	while(a--);
}


//============================================================= 
// Function:     	UartReadByte()
// Syntax:      	void UartReadByte(void);
// Description: 	Uart Read A Byte
// Notes:       
// parameters:   	none
// returns:      	none
//=============================================================
unsigned int UartReadByte(void)
{
	unsigned int data,a;
	a=*P_UART_Command2;
	a=a&0x0080;
	while(!a)						//Check bit 7 to see if RxRDY = 1
	{
		a=*P_UART_Command2;
		a=a&0x0080;
	}
	data=*P_UART_Data;				// read data
	return(data);
}

