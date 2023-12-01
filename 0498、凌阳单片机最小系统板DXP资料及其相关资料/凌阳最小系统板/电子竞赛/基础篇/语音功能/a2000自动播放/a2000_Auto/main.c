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
//  文件来源：电子竞赛专集---A2000自动语音播放
//     
//  IDE环境：   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  涉及的库：
//         SACMV25.lib
//  组成文件:
//          hardware.asm//          
//    	    isr.asm       
//          A2000.inc
//          A2000.h       
//          
//  日期:          2003-7-7
//===============================================
//============================================================
// 文件名称：main.c
// 实现功能：利用A2000格式自动语音循环播放
// 日期：    2003/7/7
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
    int iSpeech_index = 0;
    int   iMode;
    iMode = Auto;
    if(iMode == Auto)								        //采用自动方式播放
    {							
	    SACM_A2000_Initial(iMode);	                        //自动方式播放初始化
	   	SACM_A2000_Play(iSpeech_index,DAC1,Ramp_UpDn_On);   //定义语音索引号、播放通道、允许音量增/减调节
        while(1){
            while(SACM_A2000_Status()&0x01) 
	    	      SACM_A2000_ServiceLoop();                   //获取语音数据并将其填入解码队列
	      	SACM_A2000_Play(iSpeech_index,DAC1,Ramp_UpDn_On);//定义语音索引号、播放通道、允许音量增/减调节

        } 
    } 
 }   