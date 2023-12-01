//=========================================================================
//
//        The information contained herein is the exclusive property of
//      Sunplus Technology Co. And shall not be distributed, reproduced,
//      or disclosed in whole in part without prior written permission.
//
//            (C) COPYRIGHT 2001   SUNPLUS TECHNOLOGY CO.
//                           ALL RIGHTS RESERVED
//
//    The entire notice above must be reproduced on all authorized copies.
//
//=========================================================================


//=========================================================================
//  工程名称:	AD_DA.spj
//
//  功能描述:	本例采用自动方式即定时器A溢出执行ADC转换，通过A/D
//				将MIC_IN输入的语音信号转换为数字信号，再通过D/A的
//				两个通道AUD1和AUD2播放。
//
//  文件来源:	《凌阳单片机C语言应用程序设计》第七章 
//
//  IDE环境:	SUNPLUS u'nSP  IDE 1.8.0
//
//  涉及的库:	
//
//  组成文件:	main.c/SPCE061V004.H
//
//  更新日期:	2003-5-28
//=========================================================================

#include	"SPCE061V004.H"
#define	 TIMER_DATA_FOR_8KHZ (0xffff - 1500)	// 时钟频率为Fosc/2,采样率为8kHz
main()
{
	__asm("int off");
	*P_TimerA_Ctrl = 0x0030; 				  	// 时钟频率为CLKA的Fosc/2
	*P_TimerA_Data = TIMER_DATA_FOR_8KHZ; 		// 置入计数初值,数据采样率为 8kHz
		
	*P_ADC_Ctrl = 0x0015;					  	// 设置具有AGC 控制功能
												// 采用自动方式、且通过MIC_IN通道输入

	*P_DAC_Ctrl = 0x00A8;						//通过定时器A的溢出锁存数据，ADC为通过TimerA
												//溢出触发ADC自动方式转换		  

	*P_INT_Ctrl = 0x1000;			  			// 设置IRQ1_TM中断
	__asm("int irq");
	
	while(1)
		*P_Watchdog_Clear=C_WDTCLR;	
}

