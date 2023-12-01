//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//             (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                          ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  �������ƣ� LED8_asm
//  ��������:  
//			�����������ʾ������ֵ��
//			����һ��������ʾ"1"�����ڶ�������ʾ"2"��...������8������ʾ"8"
//  Ӳ�����ӣ�
//			��LED����ģ���"KEYTYPE"��������"1*8KEY"״̬
//			��61���IOA8~IOA15���������ӵ�LED����ģ���1*8KEY�����ϣ�
//			IOB0��7���ӵ�LED����ģ���SEG�����ϣ�
//			IOB8~IOB15���ӵ�LED����ģ���DIG�����ϡ�
//  �ļ���Դ����61��ʵ��̡̳�,"ʵ���	������ʾ����"
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
//			�����������ʾ������ֵ��
//			����һ��������ʾ"1"�����ڶ�������ʾ"2"��...������8������ʾ"8"
// ���ڣ� 2004/8/19
//============================================================
.include hardware.inc

.define LED_SEG 0x00ff		//IOB0~IOB7��������ܻ�Ƶ�״̬
.define LED_DIG 0x3f00		//IOB8~IOB13�ֱ����6�������
.define LED_LIGHTS 0x4000	//IOB14����LED��
.define KEY_ALL 0xff00		//ʹ��IOA8~IOA15��Ϊ���������

.ram
	.var Pos,Dig

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
//	��������:   GetKey
//	��������:	�ȴ�ֱ���м����²�̧�𣬷��ؼ�ֵ��û��ȥ������
//	�﷨��		unsigned GetKey(void)
//	���룺		��
//	�����		��r1����16λ��ֵ
//=============================================================
.public GetKey;
.code
GetKey:
	push r2 to [sp]
	r1=[P_IOA_Dir]			//��ʼ��IOA����Ӧ�˿�Ϊ��������
	r1&=~KEY_ALL
	[P_IOA_Dir]=r1
	r1=[P_IOA_Attrib]		
	r1&=~KEY_ALL
	[P_IOA_Attrib]=r1
	r1=[P_IOA_Buffer]
	r1|=KEY_ALL
	[P_IOA_Buffer]=r1
L_WaitKeyDown:				//�ȴ��м����£����ж˿ڱ�Ϊ0
	r1=1
	[P_Watchdog_Clear]=r1	//ι��
	r1=[P_IOA_Data]
	r1&=KEY_ALL
	r1^=KEY_ALL				//ȡ��
	jz	L_WaitKeyDown		//���r1Ϊ0˵��û�м����£������ȴ�
L_WaitKeyUp:				//����м�������ȴ��ü�̧��
	r2=1
	[P_Watchdog_Clear]=r2
	r2=[P_IOA_Data]
	r2&=KEY_ALL
	r2^=KEY_ALL
	jnz L_WaitKeyUp
	pop r2 from [sp]
	retf

//============================================================= 
//	������
//=============================================================
.public _main
_main:
L_MainLoop:			//ѭ��1����ѭ��
	call GetKey		//�õ�16λ��ֵ��������r1

	//��16λ��ֵת��Ϊ1~8��ֵ
	r2=1
	[Dig]=r2
	r3=0x0100
L_KeyLoop:			//ѭ��2���ӵ͵������μ��IOB8~IOB15��ÿһλ
	cmp r3,r1
	je L_KeyNum
	r2+=1
	[Dig]=r2
	r3=r3 lsl 1
	jz L_KeyError	//8λȫ���ж��꣬û�еõ���ֵ������ʾ"0"��ʾ����
	jmp L_KeyLoop
L_KeyError:
	r2=0
	[Dig]=r2
L_KeyNum:
	r2=6			//�ڵ��������������ʾ���������ֵ��1~8��
	[Pos]=r2
	call LedDispDig	//����ʾ
	jmp L_MainLoop	//������ѭ��
	retf

