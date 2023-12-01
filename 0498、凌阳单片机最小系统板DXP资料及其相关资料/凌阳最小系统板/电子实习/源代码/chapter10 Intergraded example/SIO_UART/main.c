//======================================================
//        The information contained herein is the exclusive property of
//      Sunplus Technology Co. And shall not be distributed, reproduced,
//      or disclosed in whole in part without prior written permission.
//            (C) COPYRIGHT 2001   SUNPLUS TECHNOLOGY CO.
//                           ALL RIGHTS RESERVED
//    The entire notice above must be reproduced on all authorized copies.
//======================================================

//======================================================
//  Filename:    	SIO_UART.c
//  Author:      	guangyuan wei    (email: guangyuan/sunnorth)    
//  Date:        	2003,5,4
//  Description:	This program is a DVR example for chapter 10 of <Programming Sunplus-16bit-MCU in C>  
//					SPCE061A connects SPR4096 by SIO,and connects PC by UART.  
//				 
//  Reference:
//  Revision:
//  -----------------------------------------------------------------------------------
//  Version   Year-Month-Day-Index   Modified By    Description
//					2003-05-1:  First Version
//  -----------------------------------------------------------------------------------
// Note:
//   UART Setting:Rx :IOB7
//              Tx :IOB10 
//              Baud rate: 115200 bps
//              Parity   : Even
//              Stop bit : 1
//                 
//   Input :	Key in IOA0~IOA7
//   Output: 	LED on IOA8~IOA15 
//======================================================

#include "spce.h"
#include "dvr.h"
#include "SIO_UART.h"
int  main(void)
{
	BaseType = UartClose;				//variable intitial
	SubStatus = Stop;					
  	Segment = 1;						
  	Addr = 0;							
	Keycode = 0xff;						//no key
	for(i=0,internal_addr=0xf000;i<21;i++,internal_addr++)
		Buffer[i] = SP_ReadWord(internal_addr);//read information from index

	System_Initial();					//System Initial£¨setup IO and interrupt£©

	SACM_DVR_Initial(Manual);			//DVR Initial as manual mode
	while(1)
	{
    	Keycode = F_Key_Scan();         //Key scan
		According_to_Keycode();			//do something according to Keycode
		According_to_SubStatus();		//do something according to SubStatus
	}
	return 0;
}


//============================================================= 
// Function:     	Modify_Index()
// Syntax:      	void Modify_Index(void);
// Description: 	Modify Index,including Segment number,stop address
//					of current segment and start address of next segment
// Notes:       
// parameters:   	none
// returns:      	none
//=============================================================
void Modify_Index(void)			 
{								
	for(i=0,internal_addr=0xf000;i<21;i++,internal_addr++)
		Buffer[i]=SP_ReadWord(internal_addr);
	Buffer[0]+=1;				//Segment number
	Ret=Buffer[0]*2;
	Buffer[Ret]=Addr;			//StopAddress of current segment
	Tem=0;
	for(i=1;(i<256)&&((Tem<Addr)||(Tem==Addr));i++)
		Tem=2048*i;
	Buffer[Ret+1]=Tem;			//StartAddress of next segment
	SP_PageErase(0xf000);
	for(i=0,internal_addr=0xf000;i<21;i++,internal_addr++)
		SP_WriteWord(internal_addr,Buffer[i]);//store index in internal flash rom
}


//============================================================= 
// Function:     	DVR_Stop()
// Syntax:      	void DVR_Stop(void);
// Description: 	stop record and ramp up/dowm to avoid speaker "pow" noice
// Notes:       
// parameters:   	none
// returns:      	none
//=============================================================
void DVR_Stop(void)
{
	SACM_DVR_Stop();
	SP_RampUpDAC1();					//Ramp Up/Down to avoid speaker "pow" noise
	SP_RampUpDAC2();
}


//============================================================= 
// Function:     	Send_QueueData_to_Sflash()
// Syntax:      	void Send_QueueData_to_Sflash(void);
// Description: 	send remained data in queue to sflash
// Notes:       
// parameters:   	none
// returns:      	none
//=============================================================
void Send_QueueData_to_Sflash(void)
{
	while(SACM_DVR_TestQueue() != Empty)
	{	
		Ret = SACM_DVR_FetchQueue();	// Put remain data to Queue
		SP_SIOSendAWord(Addr,Ret);		// save to SPR4096 
		Addr += 2;
	}
}


//============================================================= 
// Function:     	Play_Initial()
// Syntax:      	void Play_Initial(void);
// Description: 	Play initial ,including queue initial,fill out queue and decoder initial
// Notes:       
// parameters:   	none
// returns:      	none
//=============================================================
void Play_Initial(void)
{
	SACM_DVR_InitQueue();
	while(SACM_DVR_TestQueue() != Full)		// Fill Queue if not full
	{	
		Ret=SP_SIOReadAWord(Addr);			// Get data from SPR4096	     	
		SACM_DVR_FillQueue(Ret);			// Fill Queue			
		Addr += 2;							 
	}
	SACM_DVR_InitDecoder(DAC1+DAC2);
}


//============================================================= 
// Function:     	Fill_A_Word_To_Queue()
// Syntax:      	void Fill_A_Word_To_Queue(void);
// Description: 	Fill A Word To Queue if the queue is not full
// Notes:       
// parameters:   	none
// returns:      	none
//=============================================================
void Fill_A_Word_To_Queue(void)
{
	if(SACM_DVR_TestQueue() != Full)
	{
	    Ret = SP_SIOReadAWord(Addr);	// Read User Storage 
		SACM_DVR_FillQueue(Ret);		// Fill Queue
		Addr += 2;
	}				
}


//============================================================= 
// Function:     	According_to_Keycode()
// Syntax:      	void According_to_Keycode(void);
// Description: 	set some flag according to keycode
// Notes:       
// parameters:   	none
// returns:      	none
//=============================================================
void According_to_Keycode(void)
{
	if(BaseType == UartClose)					//BaseType = UartClose
	{
		if(Keycode!=0xff)						//if it has key pressed
		{
			DVR_Stop();
			if(SubStatus == Record)
			{
				Send_QueueData_to_Sflash();
				Modify_Index();
			}	

			switch(Keycode)
			{		
				case 0:							//Play current segment
					Addr=Buffer[Segment*2-1];
					Play_Initial();
					SubStatus = Play;
			    break;
				case 1:							//Play previous segment
					if((Segment>1)&&(Segment<=Buffer[0]))
					{	
						Segment--;
						Addr=Buffer[Segment*2-1];
					}
					else
					{
						Segment=Buffer[0];
						Addr=Buffer[Buffer[0]*2-1];
					}
					Play_Initial();
					SubStatus = Play;
				break;
				case 2:							//Play next segment
					if(Segment<Buffer[0])
					{	
						Segment++;
						Addr=Buffer[Segment*2-1];
					}
					else
					{
						Segment=1;
						Addr=Buffer[1];
					}
					Play_Initial();
					SubStatus = Play;
				break;
				case 3:							//Stop 
					SubStatus = Stop;
				break;
				case 4:							//Replay all segments
					Addr=Buffer[Segment*2-1];
					Play_Initial();
					SubStatus = RePlay_All;
				break;
				case 5:							//Replay the current segment only
					Addr=Buffer[Segment*2-1];
					Play_Initial();
					SubStatus = RePlay;
				break;
				case 7:							//Record to serial flash
					Addr = Buffer[Buffer[0]*2+1];
					SACM_DVR_InitQueue();
					SACM_DVR_InitEncoder(RceMonitorOff);
					SubStatus = Record;
				break;
				case 15:						//Open UART
					Close_Interrupt();
					SP_UART_Init();
			       	BaseType=UartOpen;
					SubStatus=Stop;
				break;
				default:
				break;	
			}
		}	   	
	}

	else 										//BaseType = UartCpen
	{
		switch(Keycode)
		{
			case 1:								//Upload
				SubStatus=Upload;
			break;										
			case 2:								//Download
				SubStatus=Download;
			break;	
			case 3:								//Format serial flash
				SP_SIOMassErase();
				SP_PageErase(0xf000);
				for(i=0;i<21;i++)
				{
					Buffer[i]=0;
					SP_WriteWord(0xf000+i,0);
				}
  				Segment = 1;					//variable intitial
  				Addr = 0;
				BaseType = UartClose;
				SubStatus = Stop;
			break;
			case 15:							//Close UART
				Open_Interrupt();
				BaseType=UartClose;
	    	   	SubStatus = Stop;
			break;       	
			default:
			break;		   	
		}
	}
}


//============================================================= 
// Function:     	According_to_SubStatus()
// Syntax:      	void According_to_SubStatus(void);
// Description: 	work according to SubStatus
// Notes:       
// parameters:   	none
// returns:      	none
//=============================================================
void According_to_SubStatus(void)
{
	switch(SubStatus)
	{	
		case Record:
			if(Addr < C_SflashSize)					// SPR4096 is not full
			{					
				SACM_DVR_Encode();				    // Get data and Encode
				if(SACM_DVR_TestQueue() != Empty)	// Save data if queue not empty
				{	
					Ret = SACM_DVR_FetchQueue();	// Get data from Queue
					SP_SIOSendAWord(Addr,Ret);		// save to User SPR4096 
					Addr += 2;
				}
			}
			else									// SPR4096 is full
			{
		 		DVR_Stop();
				Send_QueueData_to_Sflash();
				Modify_Index();
         		SubStatus = Stop;
			}
		break;
		case Play:
			if(SACM_DVR_Status()&0x01)              // Check if it is "Playing"
			{
				Fill_A_Word_To_Queue();				
    			SACM_DVR_Decode();
    		}				
			else
			{
				DVR_Stop();
				SubStatus = Stop;	
			}	
		break;

		case RePlay_All:
			if(SACM_DVR_Status()&0x01)              // Check if it is "Playing"
			{
				Fill_A_Word_To_Queue();				
    			SACM_DVR_Decode();
    		}				
			else
			{
				DVR_Stop();
				if(Segment<Buffer[0])
				{	
					Segment++;
					Addr=Buffer[Segment*2-1];
				}
				else
				{
					Segment=1;
					Addr=Buffer[1];
				}
				Play_Initial();
			}	
		break;
		case RePlay:
			if(SACM_DVR_Status()&0x01)              // Check if it is "Playing"
			{
				Fill_A_Word_To_Queue();				
    			SACM_DVR_Decode();
    		}				
			else
			{
				DVR_Stop();
				Addr=Buffer[Segment*2-1];
				Play_Initial();
			}	
		break;
		case Download:								//Download
			Addr=Buffer[Buffer[0]*2+1];
			UART_Download();					
			Modify_Index();
			BaseType = UartClose;
			SubStatus = Stop;
			Open_Interrupt();
		break;
		case Upload:								//Upload
			Addr0=Buffer[Segment*2-1];
			Addr1=Buffer[Segment*2];
			for(Addr=Addr0;Addr<=Addr1;Addr++)
			{
				Ret=SP_SIOReadAByte(Addr);
				SP_UartSentByte(Ret);
			}
			BaseType = UartClose;
			SubStatus = Stop;
			Open_Interrupt();
		break;
		case Stop:
		default:
			i=50;
			while(i--)
			{
				if(BaseType)
					SP_Export(P_IOA_Data,0x3f00);//UART open , light L6L7
				else
					SP_Export(P_IOA_Data,0xfc00);//UART close , light L0L1
			}		
		break;	
	}
}