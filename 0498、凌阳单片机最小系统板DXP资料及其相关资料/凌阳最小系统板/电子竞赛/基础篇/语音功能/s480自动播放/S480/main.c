//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//          (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                       ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  �������ƣ�S480.scs
//  ��������:����A2000�������ŷ�ʽ���Զ��������ţ��˷���Ϊ�������š�
//       
//  �ļ���Դ�����Ӿ���ר��---s480�Զ���������
//     
//  IDE������   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  �漰�Ŀ⣺
//         SACMV25.lib
//  ����ļ�:
//          hardware.asm
//          key.asm
//    	    isr.asm       
//          s480.inc
//          s480.h       
//          
//  ����:          2003-7-7
//===============================================
//============================================================
// �ļ����ƣ�main.c
// ʵ�ֹ��ܣ�����s480��ʽ������������
// ���ڣ� 2003/7/7
//============================================================
#include "s480.h"

#define		SPEECH_1		0
#define		DAC1			1
#define		DAC2			2
#define		Ramp_UpDn_Off	0
#define		Ramp_UpDn_On	3
#define		Manual			0
#define		Auto			1
#define		Full			1
#define		Empty			2

//============================================================= 
// ��������: int main()
// ��������:  �������š���ͣ��ֹͣ
// �﷨��ʽ:  int main()
// ע������:   ��Ϊ�û�ģ��
//=================================================================
int main(){
	int iSpeechIndex;  
	                               
    iSpeechIndex = 0;      	                             
	SACM_S480_Initial(Auto);	                         //�Զ���ʽ���ų�ʼ��
	SACM_S480_Play(iSpeechIndex,DAC1+DAC2,Ramp_UpDn_On); //�������������š�����ͨ��������������/������			
    while(1){
       while(SACM_S480_Status()&0x01)           
	   	   SACM_S480_ServiceLoop();                      //��ȡ�������ݲ���������������
	   SACM_S480_Play(iSpeechIndex,DAC1,Ramp_UpDn_On);   //�������������š�����ͨ��������������/������

    } 
    
 }   