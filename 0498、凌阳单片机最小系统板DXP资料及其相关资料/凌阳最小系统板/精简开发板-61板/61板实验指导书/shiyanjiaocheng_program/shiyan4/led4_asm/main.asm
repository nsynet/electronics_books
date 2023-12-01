//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//           (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                     ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//=======================================================

//============================================================
//  �������ƣ� led4_asm.scs
//  ��������:  �û��ʵ�ּ��ط��������ѭ������
//  �ļ���Դ����61��ʵ��̡̳�"ʵ���� ���ط��������ѭ��������
//  Ӳ�����ӣ� IOA��8λ����SEG�ӿڿ���LED�ĵ�ͨ
//             IOA��8λ���ӵ�LED����ģ���1*8KEY�ӿڹܽ��ϣ���ȡ��Ӧ����ֵ
//             1*8key��ROW1��DGND������IOB6����DIG7ͨ��ULN2003A����8��LED�Ĺ�������ƽ״̬
//  IDE������   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  �漰�Ŀ⣺
//  ����ļ�:
//    	main.asm
//
//  ����:  2004/8/16
//===============================================

//*****************************************************************************/
// �ļ����ƣ� main.asm
// ʵ�ֹ��ܣ� �û��ʵ�ּ��ط��������ѭ������
// ���ڣ� 2004/8/16
//*****************************************************************************/
		.include  hardware.inc				//���� hardware.inc
		.external  F_GetKey	
		.ram
		.var R_key			    			//�������	
		.var R_LedControl
		.code
		.public _main
//============================================================= 
// ��������:    _main  
// ���ڣ�		20040816 	
// ��������:    ���ط��������ѭ������
// �﷨��ʽ:    _main 
// ��ڲ���:    ��
// ���ڲ���:    ��
// ע������:    ��Ϊ�û�ģ��
//=============================================================
_main:
		r1 = 0x00FF						//����A0~A7��Ϊͬ��͵�ƽ���
		[P_IOA_Dir] = r1						  
		[P_IOA_Attrib] = r1
		r1 = 0xff00						
		[P_IOA_Data] = r1	
		r1=0x0040
		[P_IOB_Dir]=r1
		[P_IOB_Attrib]=r1
		[P_IOB_Data]=r1					//B6����ߵ�ƽ����֤LED�����ӵ�
		r1 = 0
		[R_LedControl]	= r1
L_MainLoop:		
        call F_GetKey                   //ȡ��ֵ
        [R_key] = r1
        cmp r1, 0x0000
        je L_LedLoop
        r1 = r1 lsr 4                   //ȡ�µ���ʾ����
        r1 = r1 lsr 4                 
        [R_LedControl]	= r1
L_LedLoop: 
        r1 = [R_LedControl]
        [P_IOA_Data] = r1				//�����ݵ�A��
		r1 = r1 LSL 1					//�޸�LED�������Ʋ���
		cmp r1,0x0100					//ֻ��8��LED����֤���������8λ����
		jne L_LedValue                 
		r1 = 0x0001                     //Led��ʾ��ʼֵ
L_LedValue:                             //Led��һ����ʾֵ
		[R_LedControl] = r1
		jmp	L_MainLoop					//��ת��L_MainLoopѭ��
   
//============================================================= 
//main.asm ����
//=============================================================












