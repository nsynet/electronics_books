//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//           (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                     ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//=======================================================

//============================================================
//  �������ƣ� led10_asm.scs
//  ��������:  �û��ʵ��A/D���������ڷ���������ϵ���
//  �ļ���Դ����61��ʵ��̡̳�"ʵ��ʮ A/D���������ڷ���������ϵ�����
//  Ӳ�����ӣ� 61��SPY0029�ӿ�ѡ��3.3V��IOB��8λ����SEG�ӿڿ���LED�ĵ�ͨ
//             IOB6����DIG7ͨ��ULN2003A����8��LED�Ĺ�������ƽ״̬
//  IDE������  SUNPLUS u'nSPTM  IDE 1.8.0
//
//  �漰�Ŀ⣺
//  ����ļ�:
//  main.asm
//
//  ����:  2004/8/17
//===============================================

//*****************************************************************************/
// �ļ����ƣ� main.asm
// ʵ�ֹ��ܣ� �û��ʵ��A/D���������ڷ���������ϵ���
//            ͨ���ı�LINE_IN�˿ڵ�ģ���ѹ���ı�IOB����������ݣ�
//            �����Զ���ʽִ��ADCת��������ͨ������
//            �����ܵĵ����˽�ת��������ֵ��
// ���ڣ� 2004/8/17
//*****************************************************************************/

		.define		P_IOB_DATA  	   	0x7005 
		.define		P_IOB_DIR   	    0x7007 
		.define		P_IOB_ATTRI			0x7008 
		.define		P_INT_Ctrl			0x7010 
		.define		P_INT_CLEAR			0x7011 
		.define		P_ADC_Ctrl		    0x7015 
		.define		P_ADC_MUX_Ctrl		0x702b 
		.define		P_ADC_MUX_DATA		0x702C
		.define		P_DAC_Ctrl		    0x702A 
        .define		P_Watchdog_Clear    0x7012
        
        .ram 
        .var   R_DelayCounter = 0
            
		.code
		.public _main
//============================================================= 
// ��������:  _main
// ��������: ͨ���ı�LINE_IN�˿ڵ�ģ���ѹ���ı�IOB����������ݣ�
//           �����Զ���ʽ����ʱ��A���ִ��ADCת��������ͨ��IOB��8λ���Ʒ���
//           �����ܵĵ����˽�ת��������ֵ��
// �﷨��ʽ:  _main
//��ڲ���:     ��
// ���ڲ���:    ��
// ע������:    ��Ϊ�û�ģ��
//=================================================================
_main:         
		r1 = 0xff40 
		[P_IOB_ATTRI] = r1             //IOB8-IOB15,IOB6������Ϊͬ�������
		[P_IOB_DIR] = r1 
		r1 = 0x0040
		[P_IOB_DATA] = r1
		r1 = 0x0001                   //ѡ��ͨ��LINE_INΪIOA0
		[P_ADC_MUX_Ctrl] = r1		 	
		r1 = 0x0001	                  //����A/Dת��
		[P_ADC_Ctrl] = r1 		 
 Loop_AD:    
		r1 = [P_ADC_MUX_Ctrl]         //���Ĵ���[P_ADC_MUX_Ctrl]��B15  
		test r1,0x8000				  //�ж��Ƿ�ת�����
		jz Loop_AD                 	  //�񣬼���ת��
		r1 = [P_ADC_MUX_DATA]    	  //�ǣ������[P_ADC_MUX_DATA]ת�����
                                      //ͬʱ����A/D����ת��
		r1 = r1 lsl 2				  //����A/Dֵ�����8λ
		r1 |= 0x0040				  //��֤IOB6Ϊ��,LED��������
		[P_IOB_DATA] = r1
		r1 = 0x0000                   //��ʱ��ֵ�趨
        [R_DelayCounter] = r1
L_DelayLoop:	                      //��ʱ���忴�Ź�
		r1 = 0x0001                   //�忴�Ź�
		[P_Watchdog_Clear] = r1
		r1 = [R_DelayCounter]	  
		r1 += 1		 				  //��ʱ������1
		[R_DelayCounter] = r1
		cmp r1,0x100                  //��ʱʱ�䵽����
		jne  L_DelayLoop 				
		jmp Loop_AD;
		
//============================================================= 
//main.asm ����
//=============================================================