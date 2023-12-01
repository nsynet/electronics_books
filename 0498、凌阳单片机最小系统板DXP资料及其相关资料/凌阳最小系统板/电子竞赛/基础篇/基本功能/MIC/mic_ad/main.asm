//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//                (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                                ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  �������ƣ�LINE_MIC.scs
//  ��������:    �����Զ���ʽ����ʱ��A���ִ��ADCת����ͨ��A/D��MIC_IN�����������
//        ��ת��Ϊ�����źţ���ͨ��D/A ������ͨ��AUD1��AUD2���š�
//  �ļ���Դ����SPCE061A��Ƭ��ʵ��ָ���顷,,"ʵ��ʮ��	һ·�����¼��" ��68ҳ
//  IDE������   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  �漰�Ŀ⣺
//  ����ļ�:
//    	      LINE_MIC.asm         
//  ����:          2003-6-9
//============================================================

//============================================================
// �ļ����ƣ�LINE_MIC.asm     
// ʵ�ֹ���: �����Զ���ʽ����ʱ��A���ִ��ADCת����ͨ��A/D��MIC_IN�����������
//        ��ת��Ϊ�����źţ���ͨ��D/A ������ͨ��AUD1��AUD2���š�
// ���ڣ� 2003/6/9
//============================================================


.DEFINE     TIMER_DATA_FOR_8KHZ (0xffff - 1500)	 // ʱ��Ƶ��ΪFosc/2,������Ϊ8kHz
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
// ��������:  _main
// ��������:  �����Զ���ʽ����ʱ��A���ִ��ADCת����ͨ��A/D��MIC_IN�����������
//        ��ת��Ϊ�����źţ���ͨ��D/A ������ͨ��AUD1��AUD2���š�
// �﷨��ʽ:  _main
//��ڲ���:     ��
// ���ڲ���:    ��
// ע������:    ��Ϊ�û�ģ��
//=================================================================
.PUBLIC _main	
_main: 
    int off;	
	r1 = 0x0030; 				 // ʱ��Ƶ��ΪCLKA��Fosc/2
	[P_TimerA_Ctrl] = r1;	
	r1 = TIMER_DATA_FOR_8KHZ; 	 // ������Ϊ 8kHz
	[P_TimerA_Data] = r1;		 
	r1 = 0x003d;				 // ����AGC 
	[P_ADC_Ctrl] = r1;			 // �����Զ���ʽ����ͨ��MIC_INͨ������,
	r1 = 0x00A8;				 //ͨ����ʱ��A������������ݣ�ADCΪ�Զ���ʽ
	[P_DAC_Ctrl] = r1;			
	r1 = 0x1000;				
	[P_INT_Ctrl] = r1;			 // ���ж�IRQ1_TM
	int irq;
l:  jmp l;	
	retf;
//============================================================= 
// ��������:  _IRQ1
// ��������:  ͨ��D/A ������ͨ��AUD1��AUD2���š�
// �﷨��ʽ:  _IRQ1
//��ڲ���:     ��
// ���ڲ���:    ��
// ע������:    ��Ϊ�û�ģ��
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
//  main.asm ����
//*****************************************************************************/	