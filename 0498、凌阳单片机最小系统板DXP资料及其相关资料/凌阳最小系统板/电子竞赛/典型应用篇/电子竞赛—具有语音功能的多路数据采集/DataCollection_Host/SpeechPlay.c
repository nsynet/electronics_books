//========================================================================================================
// �ļ����ƣ�SpeechPlay.c
// ʵ�ֹ��ܣ�ʵ����Ӳ����صĵײ����
// ��    �ڣ�2003/7/7
//========================================================================================================
#include "s480.h"
#include "main.h"

#define  C_RSP_NUM_BASE    11  
#define  C_RSP_Dot    	   21  //��
#define  C_RSP_Voltage      9  //��
extern SYSFLAGS sSysFlags;
void F_PlayRespond(unsigned int);
//========================================================================================================
//����: F_SpeechPlayChannelData
//�﷨��void F_SpeechPlayChannelData()
//��������������ͨ���ĵ�ѹֵ
//��������
//���أ���
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
//����: F_PlayRespond
//�﷨��void F_PlayRespond()
//������������������
//��������
//���أ���
//========================================================================================================
void F_PlayRespond(unsigned int Result)      //��������
{  
   SACM_S480_Initial(1);
   SACM_S480_Play(Result,3,3);
   while((SACM_S480_Status()&0x0001) != 0)
   {
    	SACM_S480_ServiceLoop(); 
    	
   }
   SACM_S480_Stop();
}