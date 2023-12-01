//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//          (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                       ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  �������ƣ�S480_key.scs
//  ��������:����S480�������ŷ�ʽֻ���Զ��������ţ��˷���Ϊ�Զ��������š�
//       
//  �ļ���Դ�����Ӿ���ר��---s480�Զ�������������
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
	int iKey = 0;						         // ��ʼ����ֵ
	int iSpeechIndex = 0;				         // ��ʼ�������������
	int iMode;                                    //��������ģʽ��1���Զ�ģʽ��0���ֶ�ģʽ
                    
	
	iMode = Auto;							
	System_Initial();
	SACM_S480_Initial(iMode);	
	SACM_S480_Play(iSpeechIndex,DAC1+DAC2,Ramp_UpDn_On);			
			
	while(1){		
		iKey = SP_GetCh();                                       //ȡ��ֵ  ����key.asm
		switch(iKey){	 
			case 0x00:
				break;
			case 0x01:
				SACM_S480_Play(iSpeechIndex,DAC1+DAC2,Ramp_UpDn_On);//�������ţ�����sacmv25.lib	
				break;
			case 0x02:
				SACM_S480_Stop();				                    //ֹͣ�������ţ�����sacmv25.lib	
				break;
			case 0x04:
				SACM_S480_Pause();				                    //��ͣ�������ţ�����sacmv25.lib 
				break;			
			default:
				break;
		}
		System_ServiceLoop();									// ����ɨ�裬����key.asm
		SACM_S480_ServiceLoop();								//��ȡ�������ݲ��������������У�����sacmv25.lib
			
	}		
	
}