//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//          (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                       ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  工程名称：DVR_FLASH.scs
//  功能描述:凌阳A2000语音播放方式实现语音录放，语音存储空间使用SPCE061A内置的32K的FLASH空间。
//    KEY1：语音录制按键，按下该键，开始录音。
//    KEY2：录音停止按键，按下该键，录音停止。
//    KEY3：录音播放按键，按下该键，播放录音。
  
//  文件来源：电子竞赛专集---语音录放模块
//     
//  IDE环境：   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  涉及的库：
//         SACMV25.lib
//  组成文件:
//          hardware.asm
//          key.asm
//    	    isr.asm       
//          hardware.h
//          dvr.h       
//          
//  日期:          2003-7-7
//===============================================
//============================================================
// 文件名称：main.c
// 实现功能：利用s480格式键控语音播放
// 日期： 2003/7/7
//============================================================
#include "hardware.h"
#include "dvr.h"
#define C_flashSize    	0xf000
#define sector 			0xa000				//定义FLASH写的起始地址

#define	Stop			0
#define	Record			1
#define Play			2	

#define	Full			1			
#define	Empty			2

#define	DAC1			1		
#define DAC2			2

#define	RceMonitorOff	0
#define	RceMonitorOn	1

#define Manual			0
#define	Auto			1

unsigned int Status;
unsigned int Ret;
unsigned int Key;
unsigned int Addr;//, Save_Addr
//*********************************************************//
//函数：main()
//描述：主函数
//*********************************************************//
int main()
{	
	System_Initial();
	SACM_DVR_Initial(Manual);
	Status = Stop;
	while(1)
		{				
			Key = SP_GetCh();					//获取键值
			switch(Key)
			{
				case 0x0001:					//KEY1
//**********************录音(record)***********************//
//*********************************************************//					
			    	for(Addr=sector;Addr<0xf000;Addr+=256)							
			      { 
				    Clear_WatchDog();
					F_FlashErase(Addr); 				
		          }	
					Status = Record;
					Addr=sector;	            	
		            // DVR初始化
					SACM_DVR_InitQueue();
					SACM_DVR_InitEncoder(RceMonitorOn);
					break;

				case 0x0002:					//	KEY2 
//**********************停止(stop)*************************//
//*********************************************************//
					switch(Status)
					{
						case Record:    		// 仍在录音
							SACM_DVR_Stop();
							while(SACM_DVR_TestQueue() != Empty )
								{  
									Ret = SACM_DVR_FetchQueue();// 从队列中取数
									F_FlashWrite1Word(Addr,Ret);									
									Addr += 1;
								}			    	
							break;
						case Play:
							SACM_DVR_Stop();
							break;
						default:			
							break;
					}									
						Status = Stop;
						break;		
			
			case 0x0004:						//KEY3 
//************************回放(playback)*******************//
//*********************************************************//
				SACM_DVR_Stop();			
				if(Status == Record)
					{
						while(SACM_DVR_TestQueue() != Empty)
							{	
								Ret = SACM_DVR_FetchQueue();// Put remain dat to Queue
								F_FlashWrite1Word(Addr,Ret);// save to User Storage								 
								Addr+= 1;
							}
		    		 }				
			//	Save_Addr=Addr;
				Status = Play;				
				Addr = sector; 								//播放的首地址
				SACM_DVR_InitQueue();
				while(SACM_DVR_TestQueue() != Full)			//如果队列不满则继续填
					{	
                   		Ret=F_FlashRead(Addr);	     		//从flash中读出数据						
						SACM_DVR_FillQueue(Ret);			//填队列
						Addr+= 1;							 
					}
				SACM_DVR_InitDecoder(DAC1+DAC2);
				break;
					default:
					break;		
		   }
//************************状态判断处理*********************//
//*********************************************************//		
	  switch(Status)
		{	
			case Record:
//**********************停止(stop)*************************//
//*********************************************************//
				if(Addr< C_flashSize)
					{					
						SACM_DVR_Encode();				    // 取数据并编码						
						if(SACM_DVR_TestQueue() != Empty)	//如果队列没空则将数据保存
							{	
								Ret = SACM_DVR_FetchQueue();//从队列中取数								
								F_FlashWrite1Word(Addr,Ret);//将数据写入flash 
											
								Addr+= 1;
							}	
					}			
				else
					{
			    		SACM_DVR_Stop();
						while(SACM_DVR_TestQueue() != Empty )
							{
								Ret = SACM_DVR_FetchQueue();
	   							F_FlashWrite1Word(Addr,Ret);							
								Addr+= 1;
							}
	   					Status = Stop;					
				    }
				break;
				
			case Play:
//************************回放(playback)*******************//
//*********************************************************//		    
				if(SACM_DVR_Status()&0x01)              	//是否正在播放
					{
						if(SACM_DVR_TestQueue() != Full)
							{                          			
	                    	   Ret=F_FlashRead(Addr);		//读出flash中的数据                       
							   SACM_DVR_FillQueue(Ret);		// 填队列
							   Addr += 1;
							}						
					}
				else
					{
						SACM_DVR_Stop();
						Status = Stop;						}	
	    		SACM_DVR_Decode();							//解码
				break;
						
			case Stop:
				break;
			default:
				break;	
		}		   	
		 	System_ServiceLoop();							//键盘扫描		 
	}			 
}
