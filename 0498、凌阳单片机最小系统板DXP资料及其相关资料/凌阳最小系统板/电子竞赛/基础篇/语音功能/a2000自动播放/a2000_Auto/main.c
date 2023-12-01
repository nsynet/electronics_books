  //======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//          (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                       ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  �������ƣ�A2000_key.scs
//  ��������:����A2000�������ŷ�ʽ���Զ��������ź��ֶ��������֣��˷���Ϊ�Զ������������š�
//       
//  �ļ���Դ�����Ӿ���ר��---A2000�Զ���������
//     
//  IDE������   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  �漰�Ŀ⣺
//         SACMV25.lib
//  ����ļ�:
//          hardware.asm//          
//    	    isr.asm       
//          A2000.inc
//          A2000.h       
//          
//  ����:          2003-7-7
//===============================================
//============================================================
// �ļ����ƣ�main.c
// ʵ�ֹ��ܣ�����A2000��ʽ�Զ�����ѭ������
// ���ڣ�    2003/7/7
//============================================================
#include "a2000.h"

#define		DAC1			1
#define		DAC2			2
#define		Ramp_UpDn_Off	0
#define		Ramp_UpDn_On	3
#define		Manual			0
#define		Auto			1
#define		Full			1
#define		Empty			2

int main(){
    int iSpeech_index = 0;
    int   iMode;
    iMode = Auto;
    if(iMode == Auto)								        //�����Զ���ʽ����
    {							
	    SACM_A2000_Initial(iMode);	                        //�Զ���ʽ���ų�ʼ��
	   	SACM_A2000_Play(iSpeech_index,DAC1,Ramp_UpDn_On);   //�������������š�����ͨ��������������/������
        while(1){
            while(SACM_A2000_Status()&0x01) 
	    	      SACM_A2000_ServiceLoop();                   //��ȡ�������ݲ���������������
	      	SACM_A2000_Play(iSpeech_index,DAC1,Ramp_UpDn_On);//�������������š�����ͨ��������������/������

        } 
    } 
 }   