//======================================================
//        The information contained herein is the exclusive property of
//      Sunplus Technology Co. And shall not be distributed, reproduced,
//      or disclosed in whole in part without prior written permission.
//            (C) COPYRIGHT 2001   SUNPLUS TECHNOLOGY CO.
//                           ALL RIGHTS RESERVED
//    The entire notice above must be reproduced on all authorized copies.
//======================================================

//======================================================
//  Filename:    	Serial_Flash.c
//  Author:      	guangyuan wei    (email: guangyuan/sunnorth)    
//  Date:        	2003,5,4
//  Description:	This program is a Serial Flash read and write example for chapter 10 of <Programming Sunplus-16bit-MCU in C>  
//				 
//  Reference:
//  Revision:
//  -----------------------------------------------------------------------------------
//  Version   Year-Month-Day-Index   Modified By    Description
//					2003-05-4:  First Version
//  -----------------------------------------------------------------------------------
//
//======================================================

#define		C_SIOCLOCK    0x0010; 									// CPUCLOCK/8
volatile unsigned int *P_SIO_Data=(unsigned int*)(0x701A); 			// Data port for serial IO
volatile unsigned int *P_SIO_Addr_Low=(unsigned int*)(0x701B); 		// Address Port low
volatile unsigned int *P_SIO_Addr_Mid=(unsigned int*)(0x701C); 		// Address Port middle
volatile unsigned int *P_SIO_Addr_High=(unsigned int*)(0x701D); 	// Address Port high
volatile unsigned int *P_SIO_Ctrl=(unsigned int*)(0x701E); 			// Control Port
volatile unsigned int *P_SIO_Start=(unsigned int*)(0x701F); 		// Start port for serial interface
volatile unsigned int *P_SIO_Stop=(unsigned int*)(0x7020); 			// Stop port for serial interface


//============================================================= 
// Function:     	Wait_FreeFlag()
// Syntax:      	void Wait_FreeFlag(void);
// Description: 	Wait, until SIO is not busy
// Notes:       
// parameters:   	none
// returns:      	none
//=============================================================
void Wait_FreeFlag(void)
{
	unsigned int a;
    a=*P_SIO_Start;
	a&=0x0080;
	while(a)
	{
	    a=*P_SIO_Start;
		a&=0x0080;
	}
} 


//============================================================= 
// Function:     	SIOSendAByte()
// Syntax:      	void SIOSendAByte(unsigned long int addr,unsigned int data);
// Description: 	Send A Byte to Serial Flash
// Notes:       
// parameters:   	addr,data
// returns:      	none
//=============================================================
void SIOSendAByte(unsigned long int addr,unsigned int data)
{
	int a;
    *P_SIO_Addr_Low=addr; 			// input SFLASH low address
    addr>>=8;  						// right shift 8
    *P_SIO_Addr_Mid=addr; 			// input SFLASH mid address
    addr>>=8;  						// right shift 8
    addr&=0x0007;  					// input SFLASH hi address
    *P_SIO_Addr_High=addr;
    *P_SIO_Ctrl=0x00C3+C_SIOCLOCK;  // clk=CPUclk/8, 24 bit address  ;write
    *P_SIO_Start=1;       			// enable write mode
 	a=0x2ff;						// delay
	while(a--);
    *P_SIO_Data=data; 				// state to transmit data
	Wait_FreeFlag();				// Wait, until SIO is not busy
	*P_SIO_Stop=1;     				// disable write mode
}


//============================================================= 
// Function:     	SIOReadAByte()
// Syntax:      	unsigned int SIOReadAByte(unsigned long int addr);
// Description: 	Read A Byte to Serial Flash
// Notes:       
// parameters:   	addr
// returns:      	data
//=============================================================
unsigned int SIOReadAByte(unsigned long int addr)
{
	unsigned int a,data;
    *P_SIO_Addr_Low=addr; 			// input SFLASH low address
    addr>>=8;  						// right shift 8
    *P_SIO_Addr_Mid=addr; 			// input SFLASH mid address
    addr>>=8;  						// right shift 8
    addr&=0x0007;  					// input SFLASH hi address
    *P_SIO_Addr_High=addr;
 	*P_SIO_Ctrl=0x0083+C_SIOCLOCK;  // clk=CPUclk/16, 24 bit address  ;read
 	*P_SIO_Start=1;    				// enable read mode
 	a=*P_SIO_Data;     				// Clear SFLASH buffer
	Wait_FreeFlag();				// Wait, until SIO is not busy
 	data=*P_SIO_Data;   			// Read exact Data
	Wait_FreeFlag();				// Wait, until SIO is not busy
 	*P_SIO_Stop=1;     				// disable read mode
	return(data);
}


//============================================================= 
// Function:     	SIOMassErase()
// Syntax:      	void SIOMassErase(void);
// Description: 	Mass Erase for S_Flash
// Notes:       
// parameters:   	none
// returns:      	none
//=============================================================
void SIOMassErase(void)
{
	long int a;	
	*P_SIO_Ctrl=0x00C0+C_SIOCLOCK;  // clk=CPUclk/8, 16 bit address  ;write
	*P_SIO_Addr_Low=0x0000; 		// input SFLASH low address
	*P_SIO_Addr_Mid=0x00C0; 		// input SFLASH mid address
	*P_SIO_Addr_High=0x00C0; 		// input SFLASH hi address
	*P_SIO_Start=1;           		// enable write mode
	*P_SIO_Data=0;            		// A7~A0 = 0,state to transmit data
	Wait_FreeFlag();				// Wait, until SIO is not busy
 	*P_SIO_Stop=1;     				// disable read mode
 	a=0x7ff;						// delay
	while(a--);
}	