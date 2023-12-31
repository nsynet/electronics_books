//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//          (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                       ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  工程名称：A2000_key.scs
//  功能描述:凌阳A2000语音播放方式有自动语音播放和手动播放两种，此范例为自动键控语音播放。
//       
//  文件来源：电子竞赛专集---A2000自动键控语音播放
//     
//  IDE环境：   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  涉及的库：
//         SACMV25.lib
//  组成文件:
//          hardware.asm
//          key.asm
//    	    isr.asm       
//          A2000.inc
//          A2000.h       
//          
//  日期:          2003-7-7
//===============================================
//============================================================
// 文件名称：main.c
// 实现功能：利用A2000格式键控语音播放
// 日期： 2003/7/7
//============================================================


#include "a2000.h"

#define		DAC1			1
#define		DAC2			2
#define		Ramp_UpDn_Off	0
#define		Ramp_UpDn_On	3
#define		Manual			0
#define		Auto			1
#define		Full			1
#define		Empty			2

	   
int main(){
	int iKey = 0;						         // 初始化键值
	int iSpeechIndex = 0;				         // 初始化语音播放序号
	int iMode;                                    //语音播放模式，1，自动模式，0，手动模式
                    
	
	iMode = Auto;							
	if(iMode == Auto){					
		System_Initial();
	    SACM_A2000_Initial(iMode);	
		SACM_A2000_Play(iSpeechIndex,DAC1+DAC2,Ramp_UpDn_On);			
			
		while(1){		
			iKey = SP_GetCh();                                       //取键值  来自key.asm
			switch(iKey){	 
			case 0x00:
				break;
			case 0x01:
				SACM_A2000_Play(iSpeechIndex,DAC1+DAC2,Ramp_UpDn_On);//语音播放，来自sacmv25.lib	
				break;
			case 0x02:
				SACM_A2000_Stop();				                    //停止语音播放，来自sacmv25.lib	
				break;
			case 0x04:
				SACM_A2000_Pause();				                    //暂停语音播放，来自sacmv25.lib 
				break;			
			default:
				break;
			}
			System_ServiceLoop();									// 键盘扫描，来自key.asm
			SACM_A2000_ServiceLoop();								//获取语音数据并将其填入解码队列，来自sacmv25.lib
		}	
	}		
	
}