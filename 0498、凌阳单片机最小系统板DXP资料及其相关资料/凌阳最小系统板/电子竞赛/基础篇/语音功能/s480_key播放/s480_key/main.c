//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//          (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                       ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  工程名称：S480_key.scs
//  功能描述:凌阳S480语音播放方式只有自动语音播放，此范例为自动语音播放。
//       
//  文件来源：电子竞赛专集---s480自动键控语音播放
//     
//  IDE环境：   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  涉及的库：
//         SACMV25.lib
//  组成文件:
//          hardware.asm
//          key.asm
//    	    isr.asm       
//          s480.inc
//          s480.h       
//          
//  日期:          2003-7-7
//===============================================
//============================================================
// 文件名称：main.c
// 实现功能：利用s480格式键控语音播放
// 日期： 2003/7/7
//============================================================
#include "s480.h"

#define		DAC1			1
#define		DAC2			2
#define		Ramp_UpDn_Off	0
#define		Ramp_UpDn_On	3
#define		Manual			0
#define		Auto			1
#define		Full			1
#define		Empty			2

//============================================================= 
// 函数名称: int main()
// 功能描述:  语音播放、暂停、停止
// 语法格式:  int main()
// 注意事项:   仅为用户模型
//=================================================================
	   
int main(){
	int iKey = 0;						         // 初始化键值
	int iSpeechIndex = 0;				         // 初始化语音播放序号
	int iMode;                                    //语音播放模式，1，自动模式，0，手动模式
                    
	
	iMode = Auto;							
	System_Initial();
	SACM_S480_Initial(iMode);	
	SACM_S480_Play(iSpeechIndex,DAC1+DAC2,Ramp_UpDn_On);			
			
	while(1){		
		iKey = SP_GetCh();                                       //取键值  来自key.asm
		switch(iKey){	 
			case 0x00:
				break;
			case 0x01:
				SACM_S480_Play(iSpeechIndex,DAC1+DAC2,Ramp_UpDn_On);//语音播放，来自sacmv25.lib	
				break;
			case 0x02:
				SACM_S480_Stop();				                    //停止语音播放，来自sacmv25.lib	
				break;
			case 0x04:
				SACM_S480_Pause();				                    //暂停语音播放，来自sacmv25.lib 
				break;			
			default:
				break;
		}
		System_ServiceLoop();									// 键盘扫描，来自key.asm
		SACM_S480_ServiceLoop();								//获取语音数据并将其填入解码队列，来自sacmv25.lib
			
	}		
	
}