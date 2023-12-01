//======================================================
//        The information contained herein is the exclusive property of
//      Sunplus Technology Co. And shall not be distributed, reproduced,
//      or disclosed in whole in part without prior written permission.
//            (C) COPYRIGHT 2001   SUNPLUS TECHNOLOGY CO.
//                           ALL RIGHTS RESERVED
//    The entire notice above must be reproduced on all authorized copies.
//======================================================

//======================================================
//  Filename:    	EmbedFlashROM.c
//  Author:      	guangyuan wei    (email: guangyuan/sunnorth)    
//  Date:        	2003,5,4
//  Description:	This program is a Serial Flash read and write example for chapter 10 of <Programming Sunplus-16bit-MCU in C>  
//	Notes:			Watchdog disable			 
//  Reference:
//  Revision:
//  -----------------------------------------------------------------------------------
//  Version   Year-Month-Day-Index   Modified By    Description
//					2003-05-4:  First Version
//  -----------------------------------------------------------------------------------
//
//======================================================
volatile unsigned int *P_Flash_Ctrl=(unsigned int*)(0x7555);//Internal flash access
															// enable/disable register

//============================================================= 
// Function:     	EmbedFlashROM_PageErase()
// Syntax:      	void EmbedFlashROM_PageErase(unsigned int addr);
// Description: 	EmbedFlashROM PageErase
// Notes:       
// parameters:   	addr
// returns:      	none
//=============================================================
void EmbedFlashROM_PageErase(unsigned int addr)
{
	unsigned int *ADDR;
	ADDR=(unsigned int*)addr;
	*P_Flash_Ctrl = 0xAAAA;	
	*P_Flash_Ctrl = 0x5511;
	*ADDR=1;
}


//============================================================= 
// Function:     	EmbedFlashROM_WriteWord()
// Syntax:      	void EmbedFlashROM_WriteWord(unsigned int addr,unsigned int data);
// Description: 	Write A Word to EmbedFlashROM 
// Notes:       
// parameters:   	addr,data
// returns:      	none
//=============================================================
void EmbedFlashROM_WriteWord(unsigned int addr,unsigned int data)
{
	unsigned int *ADDR;
	ADDR=(unsigned int*)addr;
	*P_Flash_Ctrl = 0xAAAA;	
	*P_Flash_Ctrl = 0x5533;
	*ADDR=data;
}


//============================================================= 
// Function:     	EmbedFlashROM_ReadWord()
// Syntax:      	unsigned int EmbedFlashROM_ReadWord(unsigned int addr);
// Description: 	Read A Word from EmbedFlashROM 
// Notes:       
// parameters:   	addr
// returns:      	data
//=============================================================
unsigned int EmbedFlashROM_ReadWord(unsigned int addr)
{
	unsigned int *ADDR,data;
	ADDR=(unsigned int*)addr;
	data = *ADDR;
	return data;
}