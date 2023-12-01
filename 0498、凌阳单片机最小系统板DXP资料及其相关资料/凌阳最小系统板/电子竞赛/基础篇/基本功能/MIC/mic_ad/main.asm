//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//                (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                                ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  工程名称：LINE_MIC.scs
//  功能描述:    采用自动方式即定时器A溢出执行ADC转换，通过A/D将MIC_IN输入的语音信
//        号转换为数字信号，再通过D/A 的两个通道AUD1和AUD2播放。
//  文件来源：《SPCE061A单片机实验指导书》,,"实验十九	一路输入的录音" 第68页
//  IDE环境：   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  涉及的库：
//  组成文件:
//    	      LINE_MIC.asm         
//  日期:          2003-6-9
//============================================================

//============================================================
// 文件名称：LINE_MIC.asm     
// 实现功能: 采用自动方式即定时器A溢出执行ADC转换，通过A/D将MIC_IN输入的语音信
//        号转换为数字信号，再通过D/A 的两个通道AUD1和AUD2播放。
// 日期： 2003/6/9
//============================================================


.DEFINE     TIMER_DATA_FOR_8KHZ (0xffff - 1500)	 // 时钟频率为Fosc/2,采样率为8kHz
.DEFINE		P_TimerA_Ctrl	     0x700b 
.DEFINE		P_TimerA_Data	     0x700a 
.DEFINE		P_ADC			     0x7014 
.DEFINE		P_ADC_Ctrl		     0x7015 
.DEFINE		P_DAC1			     0x7017
.DEFINE		P_DAC2			     0x7016
.DEFINE		P_DAC_Ctrl		     0x702A 
.DEFINE		P_INT_Ctrl		     0x7010 
.DEFINE		P_INT_Clear		     0x7011 
.DEFINE     P_WatchDog_Clear     0x7012
.CODE
//============================================================= 
// 函数名称:  _main
// 功能描述:  采用自动方式即定时器A溢出执行ADC转换，通过A/D将MIC_IN输入的语音信
//        号转换为数字信号，再通过D/A 的两个通道AUD1和AUD2播放。
// 语法格式:  _main
//入口参数:     无
// 出口参数:    无
// 注意事项:    仅为用户模型
//=================================================================
.PUBLIC _main	
_main: 
    int off;	
	r1 = 0x0030; 				 // 时钟频率为CLKA的Fosc/2
	[P_TimerA_Ctrl] = r1;	
	r1 = TIMER_DATA_FOR_8KHZ; 	 // 采样率为 8kHz
	[P_TimerA_Data] = r1;		 
	r1 = 0x003d;				 // 设置AGC 
	[P_ADC_Ctrl] = r1;			 // 采用自动方式、且通过MIC_IN通道输入,
	r1 = 0x00A8;				 //通过定时器A的溢出锁存数据，ADC为自动方式
	[P_DAC_Ctrl] = r1;			
	r1 = 0x1000;				
	[P_INT_Ctrl] = r1;			 // 开中断IRQ1_TM
	int irq;
l:  jmp l;	
	retf;
//============================================================= 
// 函数名称:  _IRQ1
// 功能描述:  通过D/A 的两个通道AUD1和AUD2播放。
// 语法格式:  _IRQ1
//入口参数:     无
// 出口参数:    无
// 注意事项:    仅为用户模型
//=================================================================


.TEXT
.PUBLIC _IRQ1 
_IRQ1:       
	push r1 to [sp]
	r1 = [P_ADC] 
	[P_DAC1] = r1 
	[P_DAC2] = r1 
	r1 = 0x1000 
	[P_INT_Clear] = r1 
	r1 = 0x0001
	[P_WatchDog_Clear] = r1
	pop r1 from [sp] 
	reti
	
//*****************************************************************************/
//  main.asm 结束
//*****************************************************************************/	