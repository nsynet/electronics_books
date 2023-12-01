//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//             (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                          ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  �������ƣ� LED6_asm
//  ��������:  
//		������LED�������λѭ����ʾ0~9������
//		"012345"��"123456"��"234567"��������"890123"��"901234"����
//  Ӳ�����ӣ�
//			��61���IOB0��7���������ӵ�LED����ģ���SEG�����ϣ�
//			IOB8~IOB15���ӵ�LED����ģ���DIG�����ϡ�
//  �ļ���Դ����61��ʵ��̡̳�,"ʵ����	�������λѭ����ʾ0��9"
//  IDE������   SUNPLUS u'nSPTM  IDE 1.8.4
//
//  �漰�Ŀ⣺
//  ����ļ�:
//    	main.asm
//  ����:          2004-8-19
//===============================================

//============================================================
// �ļ����ƣ�main.asm
// ʵ�ֹ���: 
//		������LED�������λѭ����ʾ0~9������
//		"012345"��"123456"��"234567"��������"890123"��"901234"����
// ���ڣ� 2004/8/19
//============================================================

.include hardware.inc

.define LED_SEG 0x00ff	//IOB0~IOB7
.define LED_DIG 0x3f00	//IOB8~IOB13

.ram
	.var Pos,Dig,TimerCnt

.data
DigCode:
	.dw 0x3F,0x06,0x5B,0x4F,0x66
	.dw 0x6D,0x7D,0x07,0x7F,0x6F		//0~9ʮ�����ֵ�LED����

.code
//============================================================= 
//	��������:   LedDispDig
//	��������:	��ָ�������������ʾ����
//	�﷨��		void LedDispDig(int Pos,int Dig)
//	���룺		Pos:	Ҫ��ʾ���ֵ������λ�ã�ȡֵ��Χ1~6
//				Dig:	Ҫ��ʾ�����֣�ȡֵ��Χ0~9
//	�����		��
//=============================================================
.public LedDispDig
LedDispDig:
	push r1,r2 to [sp]

	r1=1
	[P_Watchdog_Clear]=r1
	//��ʼ��IOBΪͬ�����
	r1=[P_IOB_Dir]
	r1|=LED_DIG+LED_SEG
	[P_IOB_Dir]=r1
	r1=[P_IOB_Attrib]
	r1|=LED_DIG+LED_SEG
	[P_IOB_Attrib]=r1
	
	//�����ֵ�λ��ת��ΪIOB��8λֵ��ѡ����Ӧ�����
	r1=0x0080
	r2=[Pos]			//��0x0080����(Pos)λ
L_SetIOBHigh:
	r1=r1 LSL 1
	r2-=1
	jnz	L_SetIOBHigh
	[P_IOB_Data]=r1
	
	//������ת��Ϊ���룬��ΪIOB��8λ���
	r1=[Dig]
	r2=DigCode
	r2+=r1
	r1=[r2]
	r2=[P_IOB_Buffer]
	r2|=r1
	[P_IOB_Data]=r2
		
	pop r1,r2 from [sp]
	retf

//============================================================= 
//	������
//=============================================================
.public _main
_main:

	r1=0				//����ѭ������ʼ����
L_MainLoop:				//ѭ��1����ѭ��

	r2=1000		//ѭ��2��ÿ�����ֱ���һ��ʱ��
L_TimerLoop:
	[Dig]=r1	
	r3=1
	[Pos]=r3
L_DigLoop:			//ѭ��3��ʹ��������ֱܷ���ʾ����
	call LedDispDig		//�ڵ�[Pos]�����������ʾ����[Dig]
	r3=[Dig]
	r3+=1
	cmp r3,9		//ʹ������0~9֮��ѭ��
	jna L_DigNext
	r3=0
L_DigNext:		
	[Dig]=r3
	
	r3=[Pos]		//�ж�ѭ��3�Ƿ����
	r3+=1
	[Pos]=r3
	cmp r3,6
	jna L_DigLoop
	
	r2-=1
	jnz L_TimerLoop	//�ж�ѭ��2�Ƿ����
	
	r1+=1		//�õ���һ�����ֵ���ʼ����
	cmp r1,9		//�������9����0
	jna L_MainLoop
	r1=0
	jmp L_MainLoop
	
	retf