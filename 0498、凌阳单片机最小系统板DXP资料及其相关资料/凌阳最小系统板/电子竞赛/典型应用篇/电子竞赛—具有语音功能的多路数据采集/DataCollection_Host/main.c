//===============================================================================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//          (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                       ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//==============================================================================================================

//==============================================================================================================
//  工程名称：DataCollection_Host.scs
//  功能描述: 实现双CPU的host功能,即扫描按键、根据按键的值执行相应的操作。
//  IDE 环境：SUNPLUS u'nSPTM  IDE 1.8.0
//
//  涉及的库：sacmv25.lib
//        
//  组成文件: main.c
//			  UART_DataSample.c
//			  SpeechPlay.c
//			  LedShow.c
//			  KeyHandle.c
//			  key.asm
//			  ISR.asm
//			  hardware.asm	
//            system.asm
//    	      uart.asm       
//              
//          
//  完成日期: 2003-7-7
//============================================================================================================
//============================================================================================================
// 文件名称：main.c
// 实现功能：扫描按键、根据按键的值执行相应的操作，语音跟踪各种操作
// 日    期：2003/7/7
//============================================================================================================
#include "main.h"

#define C_Select_SampleKey 0x0009;
#define C_Circle_SampleKey 0x000a;
#define C_EnterKey 0x000b;
#define C_CancelKey 0x000c;

extern void F_SPCE061A_Initial(void);
extern void F_UART_Initial(void);
extern void F_Key_Scan(void);
extern unsigned int F_Get_KeyValue(void);

extern void F_KeyHandle(void);
extern void F_PlayRespond(unsigned int Result);
extern void  F_UART_DataSample(void);
extern void F_Led_Show_Handle(void);
extern void F_Led_Show_NotReady(void);
extern void F_SpeechPlayChannelData(void);

void F_SystemFlag_Initial(void);

unsigned int g_uiKeyValue=0;
unsigned int uiTwoSecondTimeFlag=0;
unsigned int ui2HzIntCounter=0;
unsigned int uiStartSampleFlag=0;
SYSFLAGS sSysFlags;
main()
{
	unsigned int i=0,j=0;
	F_SPCE061A_Initial();
	F_UART_Initial();
	F_SystemFlag_Initial();
	F_PlayRespond(0);					//开机语音提示
	for(i=0;i<0xFFFF;i++);
	F_PlayRespond(1);					//语音提示“请选择采集模式”
	while(1)
	{
		F_Key_Scan();
		g_uiKeyValue=F_Get_KeyValue();	//获取键值
		if(g_uiKeyValue !=0)
		{
			F_KeyHandle();				//按键处理,设置标志位。
		}//end if
		if(sSysFlags.uiEnterKey==1)		//开始采集数据
		{
			if((sSysFlags.uiSelectSample==0)&&(sSysFlags.uiCircleSample==0))
			{
				sSysFlags.uiEnterKey=0;
				F_PlayRespond(7);		//请重新设置数据采集模式
			}
			else						//如果循环采集和选择采集都被按下，则进行循环采集
			{
				if(uiStartSampleFlag==0)
				{
					uiStartSampleFlag=1;
					if(	sSysFlags.uiCircleSample==1)
						F_PlayRespond(5);//语音提示”开始循环采集数据“
					else
						F_PlayRespond(6);//语音提示“开始选择采集数据”
				}			
				sSysFlags.uiEnterKey=0;
				if(sSysFlags.uiCircleSample==1)
				{
					sSysFlags.uiEnterKey=1;
				}
				if(uiTwoSecondTimeFlag==1)
				{
					uiTwoSecondTimeFlag=0;
					F_UART_DataSample();//通过UART进行数据采集
				}

			}
		}
		if(sSysFlags.uiSysFaultNumber==1)//如果出现故障，则初始化系统标志，同时语音报警
		{
			F_SystemFlag_Initial();
			F_PlayRespond(10);			//语音报警
		}
		if(sSysFlags.uiCancelKey==1)
		{
			F_SystemFlag_Initial();
			F_PlayRespond(7);			//请重新设置数据采集模式
		}
		if(sSysFlags.uiSampleOk==1)
		{
			F_Led_Show_Handle();		//显示通道号、以及该通道号所对应的电压值。
		}
		if(sSysFlags.uiSampleOk==0)
		{
			F_Led_Show_NotReady();		//如果还没有进行数据，或者数据采集失败则只显示通道号。
		}
		
		if(sSysFlags.uiPlaySpeechKey==1)
		{
			F_Led_Show_NotReady();		//同时显示通道号
			F_SpeechPlayChannelData();	//语音播放通道号所对应的电压值
			
		}
	}//end while
}
void F_SystemFlag_Initial(void)
{
	uiTwoSecondTimeFlag=1;
	uiStartSampleFlag=0;
	sSysFlags.uiSelectSample=0;
	sSysFlags.uiCircleSample=0;
	sSysFlags.uiEnterKey=0;
 	sSysFlags.uiCancelKey=0;
	sSysFlags.uiChannelNumber=0;
	sSysFlags.uiSysFaultNumber=0;
	sSysFlags.uiChannelVoltageValue=0;
	sSysFlags.uiDisplayVoltageValue=0;
	sSysFlags.uiPlaySpeechKey=0;
	sSysFlags.uiSampleOk=0;
}