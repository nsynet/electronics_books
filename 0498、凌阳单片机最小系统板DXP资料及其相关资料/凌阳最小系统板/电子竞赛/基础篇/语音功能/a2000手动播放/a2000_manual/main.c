//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//          (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                       ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  �������ƣ�A2000_manual.scs
//  ��������:����A2000�������ŷ�ʽ���Զ��������źͲ������֣��˷���Ϊ�ֶ��������š�
//       
//  �ļ���Դ�����Ӿ���ר��---A2000�ֶ���������
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
// ʵ�ֹ��ܣ�����A2000��ʽ�ֶ�����ѭ������
// ���ڣ� 2003/7/7
//============================================================
#include "a2000.h"

#define		SPEECH_1		1
#define		DAC1			1
#define		DAC2			2
#define		Ramp_UpDn_Off	0
#define		Ramp_UpDn_On	3
#define		Manual			0
#define		Auto			1
#define		Full			1
#define		Empty			2
extern   RES_A32_16K_A20_SA;
extern   RES_A32_16K_A20_EA;
int main(){
	int iMode;
	int iAddr;
	int iRet;
	iMode =  Manual;
	iAddr = RES_A32_16K_A20_SA;             //�����������е���ַ
	if(iMode == 	Manual)					//���÷��Զ���ʽ����
    {	
	   		    
	   SACM_A2000_Initial(iMode);			//���Զ���ʽ���ŵĳ�ʼ��,����sacmv25.lib
       SACM_A2000_InitDecoder(DAC1);		//��ʼ��A2000�����������Է��Զ���ʽ���� ,����sacmv25.lib	  
      while(1)
	  {
	  if(SACM_A2000_TestQueue()!=Full)      //���Բ���ȡ�������е�״̬,����sacmv25.lib
		{
		iRet =SP_GetResource(iAddr);        //����Դ�ļ����ȡһ��������������,����sacmv25.lib
	    SACM_A2000_FillQueue(iRet);         //��ȡ�����������ݲ������������еȺ����,����sacmv25.lib
	    iAddr++;
    	}
        if(iAddr< RES_A32_16K_A20_EA )	    //����ö�����δ���꣬��δ����ĩ��ַʱ
            SACM_A2000_Decoder();			//��ȡ��Դ�����н��룬��ͨ���жϷ����ӳ�������DACͨ������,����sacmv25.lib
        else{
           SACM_A2000_InitDecoder(DAC1);	//���򣬿�ʼ��A2000�����������Է��Զ���ʽ���� ,  ����sacmv25.lib
           iAddr = RES_A32_16K_A20_SA;      //�����������е���ַ
        }
     }  
   }
}