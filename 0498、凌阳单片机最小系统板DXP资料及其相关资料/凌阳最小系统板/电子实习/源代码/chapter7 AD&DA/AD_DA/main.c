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
//  ��������:	AD_DA.spj
//
//  ��������:	���������Զ���ʽ����ʱ��A���ִ��ADCת����ͨ��A/D
//				��MIC_IN����������ź�ת��Ϊ�����źţ���ͨ��D/A��
//				����ͨ��AUD1��AUD2���š�
//
//  �ļ���Դ:	��������Ƭ��C����Ӧ�ó�����ơ������� 
//
//  IDE����:	SUNPLUS u'nSP  IDE 1.8.0
//
//  �漰�Ŀ�:	
//
//  ����ļ�:	main.c/SPCE061V004.H
//
//  ��������:	2003-5-28
//=========================================================================

#include	"SPCE061V004.H"
#define	 TIMER_DATA_FOR_8KHZ (0xffff - 1500)	// ʱ��Ƶ��ΪFosc/2,������Ϊ8kHz
main()
{
	__asm("int off");
	*P_TimerA_Ctrl = 0x0030; 				  	// ʱ��Ƶ��ΪCLKA��Fosc/2
	*P_TimerA_Data = TIMER_DATA_FOR_8KHZ; 		// ���������ֵ,���ݲ�����Ϊ 8kHz
		
	*P_ADC_Ctrl = 0x0015;					  	// ���þ���AGC ���ƹ���
												// �����Զ���ʽ����ͨ��MIC_INͨ������

	*P_DAC_Ctrl = 0x00A8;						//ͨ����ʱ��A������������ݣ�ADCΪͨ��TimerA
												//�������ADC�Զ���ʽת��		  

	*P_INT_Ctrl = 0x1000;			  			// ����IRQ1_TM�ж�
	__asm("int irq");
	
	while(1)
		*P_Watchdog_Clear=C_WDTCLR;	
}

