//===============================================================================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//          (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                       ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//==============================================================================================================

//==============================================================================================================
//  �������ƣ�DataCollection_Host.scs
//  ��������: ʵ��˫CPU��host����,��ɨ�谴�������ݰ�����ִֵ����Ӧ�Ĳ�����
//  IDE ������SUNPLUS u'nSPTM  IDE 1.8.0
//
//  �漰�Ŀ⣺sacmv25.lib
//        
//  ����ļ�: main.c
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
//  �������: 2003-7-7
//============================================================================================================
//============================================================================================================
// �ļ����ƣ�main.c
// ʵ�ֹ��ܣ�ɨ�谴�������ݰ�����ִֵ����Ӧ�Ĳ������������ٸ��ֲ���
// ��    �ڣ�2003/7/7
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
	F_PlayRespond(0);					//����������ʾ
	for(i=0;i<0xFFFF;i++);
	F_PlayRespond(1);					//������ʾ����ѡ��ɼ�ģʽ��
	while(1)
	{
		F_Key_Scan();
		g_uiKeyValue=F_Get_KeyValue();	//��ȡ��ֵ
		if(g_uiKeyValue !=0)
		{
			F_KeyHandle();				//��������,���ñ�־λ��
		}//end if
		if(sSysFlags.uiEnterKey==1)		//��ʼ�ɼ�����
		{
			if((sSysFlags.uiSelectSample==0)&&(sSysFlags.uiCircleSample==0))
			{
				sSysFlags.uiEnterKey=0;
				F_PlayRespond(7);		//�������������ݲɼ�ģʽ
			}
			else						//���ѭ���ɼ���ѡ��ɼ��������£������ѭ���ɼ�
			{
				if(uiStartSampleFlag==0)
				{
					uiStartSampleFlag=1;
					if(	sSysFlags.uiCircleSample==1)
						F_PlayRespond(5);//������ʾ����ʼѭ���ɼ����ݡ�
					else
						F_PlayRespond(6);//������ʾ����ʼѡ��ɼ����ݡ�
				}			
				sSysFlags.uiEnterKey=0;
				if(sSysFlags.uiCircleSample==1)
				{
					sSysFlags.uiEnterKey=1;
				}
				if(uiTwoSecondTimeFlag==1)
				{
					uiTwoSecondTimeFlag=0;
					F_UART_DataSample();//ͨ��UART�������ݲɼ�
				}

			}
		}
		if(sSysFlags.uiSysFaultNumber==1)//������ֹ��ϣ����ʼ��ϵͳ��־��ͬʱ��������
		{
			F_SystemFlag_Initial();
			F_PlayRespond(10);			//��������
		}
		if(sSysFlags.uiCancelKey==1)
		{
			F_SystemFlag_Initial();
			F_PlayRespond(7);			//�������������ݲɼ�ģʽ
		}
		if(sSysFlags.uiSampleOk==1)
		{
			F_Led_Show_Handle();		//��ʾͨ���š��Լ���ͨ��������Ӧ�ĵ�ѹֵ��
		}
		if(sSysFlags.uiSampleOk==0)
		{
			F_Led_Show_NotReady();		//�����û�н������ݣ��������ݲɼ�ʧ����ֻ��ʾͨ���š�
		}
		
		if(sSysFlags.uiPlaySpeechKey==1)
		{
			F_Led_Show_NotReady();		//ͬʱ��ʾͨ����
			F_SpeechPlayChannelData();	//��������ͨ��������Ӧ�ĵ�ѹֵ
			
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