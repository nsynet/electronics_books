//===============================================================================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//          (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                       ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//==============================================================================================================

//==============================================================================================================
//  �������ƣ�DataCollection_Client.scs
//  ��������: ʵ��˫CPU��Client����,��ѭ������7·AD��������Ӧ��������������
//  IDE ������SUNPLUS u'nSPTM  IDE 1.8.0
//
//  �漰�Ŀ⣺NONE
//        
//  ����ļ�: main.C
//            system.asm
//    	      uart.asm       
//            isr.asm
//			  Ad.asm       
//          
//  �������: 2003-7-7
//============================================================================================================
//============================================================================================================
// �ļ����ƣ�main.c
// ʵ�ֹ��ܣ�ѭ���ɼ���ADͨ�������ݣ������յ��������͵�����󣬷�����Ӧ��ͨ����ѹֵ������
// ��    �ڣ�2003/7/7
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
		g_aChannelsVoltageValueBuf[uiCircleChannelNumber]=F_ReadAD(uiCircleChannelNumber);//�ɼ�ͨ������
		uiCircleChannelNumber+=1;
		if(uiCircleChannelNumber==8)
		{
			uiCircleChannelNumber=1;
		}
		if(g_uiUARTCommand!=0)//��UART�ж��б���ֵ
		{
			g_uiChannelNumber=g_uiUARTCommand&0x000F;
			if(g_uiChannelNumber==((g_uiUARTCommand&0x00F0)>>4))
			{
				if((g_uiChannelNumber>0)&&(g_uiChannelNumber<8))//����ͨ����g_uiChannelNumber����������
				{
					//�����η���һ��ͨ���ĵ�ѹֵ��
					F_UART_WriteByteData(g_aChannelsVoltageValueBuf[g_uiChannelNumber]);//���͵�8bit
					for (i=0;i<0x00ff;i++);
					F_UART_WriteByteData(g_aChannelsVoltageValueBuf[g_uiChannelNumber]>>8);//���͸�2bit
				}
			
			}
			g_uiUARTCommand=0;
			g_uiChannelNumber=0;
		}

	}
	
}