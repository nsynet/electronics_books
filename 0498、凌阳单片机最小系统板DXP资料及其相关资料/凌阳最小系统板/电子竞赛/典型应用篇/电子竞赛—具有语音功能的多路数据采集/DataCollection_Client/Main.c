//===============================================================================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//          (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                       ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//==============================================================================================================

//==============================================================================================================
//  工程名称：DataCollection_Client.scs
//  功能描述: 实现双CPU的Client功能,即循环进行7路AD采样，响应主机的命令请求
//  IDE 环境：SUNPLUS u'nSPTM  IDE 1.8.0
//
//  涉及的库：NONE
//        
//  组成文件: main.C
//            system.asm
//    	      uart.asm       
//            isr.asm
//			  Ad.asm       
//          
//  完成日期: 2003-7-7
//============================================================================================================
//============================================================================================================
// 文件名称：main.c
// 实现功能：循环采集各AD通道的数据，当接收到主机发送的命令后，发送相应的通道电压值给主机
// 日    期：2003/7/7
//============================================================================================================
extern void F_System_Initial(void);
extern void F_UART_Initial(void);
extern void F_AD_Initial(void);
extern void F_UART_WriteByteData(unsigned int uiVoltageValue);
unsigned int uiCircleChannelNumber=0;
unsigned int g_uiUARTCommand=0;
unsigned int g_uiChannelNumber=0;
unsigned int g_aChannelsVoltageValueBuf[8];
main()
{
	
	unsigned int i=0;
	F_System_Initial();
	F_UART_Initial();
	F_AD_Initial();
	uiCircleChannelNumber=1;
	for(i=0;i<8;i++)
	{
		g_aChannelsVoltageValueBuf[i]=0;
	}
	while(1)
	{
		g_aChannelsVoltageValueBuf[uiCircleChannelNumber]=F_ReadAD(uiCircleChannelNumber);//采集通道数据
		uiCircleChannelNumber+=1;
		if(uiCircleChannelNumber==8)
		{
			uiCircleChannelNumber=1;
		}
		if(g_uiUARTCommand!=0)//在UART中断中被赋值
		{
			g_uiChannelNumber=g_uiUARTCommand&0x000F;
			if(g_uiChannelNumber==((g_uiUARTCommand&0x00F0)>>4))
			{
				if((g_uiChannelNumber>0)&&(g_uiChannelNumber<8))//根据通道号g_uiChannelNumber，发送数据
				{
					//分两次发送一个通道的电压值。
					F_UART_WriteByteData(g_aChannelsVoltageValueBuf[g_uiChannelNumber]);//发送低8bit
					for (i=0;i<0x00ff;i++);
					F_UART_WriteByteData(g_aChannelsVoltageValueBuf[g_uiChannelNumber]>>8);//发送高2bit
				}
			
			}
			g_uiUARTCommand=0;
			g_uiChannelNumber=0;
		}

	}
	
}