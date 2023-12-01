//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//           (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                     ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//=======================================================

//============================================================
//  �������ƣ� led1_asm.scs
//  ��������:  �û��ʵ�ַ�������ܵ���ѭ������
//  �ļ���Դ����61��ʵ��̡̳�"ʵ��һ ��������ܵ���ѭ��������
//  Ӳ�����ӣ� IOA��8λ����SEG�ӿڿ���LED�ĵ�ͨ
//             IOB6����DIG7ͨ��ULN2003A����8��LED�Ĺ�������ƽ״̬��
//  IDE������   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  �漰�Ŀ⣺
//  ����ļ�:
//    	main.asm
//
//  ����:  2004/8/16
//===============================================

//*****************************************************************************/
// �ļ����ƣ� main_asm
// ʵ�ֹ��ܣ� �û��ʵ�ַ�������ܵ���ѭ������
// ���ڣ� 2004/8/16
//*****************************************************************************/
		.include  hardware.inc						//���� hardware.inc
		
		.ram
		.var R_LedControl			    			//�������
		.var R_DelayCounter		

		.code
		.public _main
//============================================================= 
// ��������:   _main
// ��������:   ��������ܵ���ѭ������
// �﷨��ʽ:    void main(void);
// ��ڲ���:    ��
// ���ڲ���:    ��
// ע������:    ��Ϊ�û�ģ��
//=============================================================
//============================================================================
_main:
		r1 = 0x00FF						//����A0~A7��Ϊͬ��͵�ƽ���
		[P_IOA_Dir] = r1						  
		[P_IOA_Attrib] = r1
		r1 = 0x0000						
		[P_IOA_Data] = r1	
		r1=0x0040
		[P_IOB_Dir]=r1
		[P_IOB_Attrib]=r1
		[P_IOB_Data]=r1					//B6����ߵ�ƽ����֤LED�����ӵ�
		r1=0x0001		
		[R_LedControl] = r1				//LED�������Ƴ�ֵ
L_MainLoop:
		r1 = [R_LedControl]	  
		[P_IOA_Data] = r1				//�����ݵ�A��
		r1=r1 LSL 1						//�޸�LED�������Ʋ���
		cmp r1,0x0100					//ֻ��8��LED����֤���������8λ����
		jne NoOver
		r1 = 0x0001
NoOver:
		[R_LedControl] = r1	  
		r1 = 0x0000 					//��ʱ����������
		[R_DelayCounter] = r1
		call F_Delay 					//��ʱ	
		jmp	L_MainLoop					//��ת��L_MainLoopѭ��������LED


//============================================================= 
// ��������:   F_Delay
// ��������:   ʵ����ʱ	
//=============================================================
F_Delay:
L_DelayLoop:	
		r1=0x0001                    	//�忴�Ź�
		[P_Watchdog_Clear] = r1
		r1 = [R_DelayCounter]	  
		r1 += 1		 					//��ʱ������1
		[R_DelayCounter] = r1
		jnz  L_DelayLoop 				//�ӵ�65536��
		retf			

//*****************************************************************************/
//  main.asm ����
//*****************************************************************************/