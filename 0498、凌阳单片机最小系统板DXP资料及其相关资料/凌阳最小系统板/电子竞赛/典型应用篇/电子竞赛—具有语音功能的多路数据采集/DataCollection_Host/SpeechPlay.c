//========================================================================================================
// 文件名称：SpeechPlay.c
// 实现功能：实现与硬件相关的底层操作
// 日    期：2003/7/7
//========================================================================================================
#include "s480.h"
#include "main.h"

#define  C_RSP_NUM_BASE    11  
#define  C_RSP_Dot    	   21  //点
#define  C_RSP_Voltage      9  //伏
extern SYSFLAGS sSysFlags;
void F_PlayRespond(unsigned int);
//========================================================================================================
//函数: F_SpeechPlayChannelData
//语法：void F_SpeechPlayChannelData()
//描述：语音播放通道的电压值
//参数：无
//返回：无
//========================================================================================================
void F_SpeechPlayChannelData(void)
{
	unsigned int uiVolvageValue=0;
	F_PlayRespond((unsigned int)(C_RSP_NUM_BASE+sSysFlags.uiChannelNumber));
	F_PlayRespond(8);
	uiVolvageValue=sSysFlags.uiDisplayVoltageValue;
	F_PlayRespond((unsigned int)(C_RSP_NUM_BASE+uiVolvageValue/10));
	F_PlayRespond(C_RSP_Dot);
	F_PlayRespond((unsigned int)(C_RSP_NUM_BASE+uiVolvageValue%10));
	F_PlayRespond(C_RSP_Voltage);
	sSysFlags.uiPlaySpeechKey=0;
}
//========================================================================================================
//函数: F_PlayRespond
//语法：void F_PlayRespond()
//描述：播放语音数据
//参数：无
//返回：无
//========================================================================================================
void F_PlayRespond(unsigned int Result)      //播放语音
{  
   SACM_S480_Initial(1);
   SACM_S480_Play(Result,3,3);
   while((SACM_S480_Status()&0x0001) != 0)
   {
    	SACM_S480_ServiceLoop(); 
    	
   }
   SACM_S480_Stop();
}