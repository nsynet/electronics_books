//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//          (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                       ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  工程名称：A2000_manual.scs
//  功能描述:凌阳A2000语音播放方式有自动语音播放和播放两种，此范例为手动语音播放。
//       
//  文件来源：电子竞赛专集---A2000手动语音播放
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
// 实现功能：利用A2000格式手动语音循环播放
// 日期： 2003/7/7
//============================================================
#include "a2000.h"

#define		SPEECH_1		1
#define		DAC1			1
#define		DAC2			2
#define		Ramp_UpDn_Off	0
#define		Ramp_UpDn_On	3
#define		Manual			0
#define		Auto			1
#define		Full			1
#define		Empty			2
extern   RES_A32_16K_A20_SA;
extern   RES_A32_16K_A20_EA;
int main(){
	int iMode;
	int iAddr;
	int iRet;
	iMode =  Manual;
	iAddr = RES_A32_16K_A20_SA;             //送入语音队列的首址
	if(iMode == 	Manual)					//采用非自动方式播放
    {	
	   		    
	   SACM_A2000_Initial(iMode);			//非自动方式播放的初始化,来自sacmv25.lib
       SACM_A2000_InitDecoder(DAC1);		//开始对A2000的语音数据以非自动方式解码 ,来自sacmv25.lib	  
      while(1)
	  {
	  if(SACM_A2000_TestQueue()!=Full)      //测试并获取语音队列的状态,来自sacmv25.lib
		{
		iRet =SP_GetResource(iAddr);        //从资源文件里获取一个字型语音数据,来自sacmv25.lib
	    SACM_A2000_FillQueue(iRet);         //获取语音编码数据并填入语音队列等候解码,来自sacmv25.lib
	    iAddr++;
    	}
        if(iAddr< RES_A32_16K_A20_EA )	    //如果该段语音未播完，即未到达末地址时
            SACM_A2000_Decoder();			//获取资源并进行解码，再通过中断服务子程序送入DAC通道播放,来自sacmv25.lib
        else{
           SACM_A2000_InitDecoder(DAC1);	//否则，开始对A2000的语音数据以非自动方式解码 ,  来自sacmv25.lib
           iAddr = RES_A32_16K_A20_SA;      //送入语音队列的首址
        }
     }  
   }
}