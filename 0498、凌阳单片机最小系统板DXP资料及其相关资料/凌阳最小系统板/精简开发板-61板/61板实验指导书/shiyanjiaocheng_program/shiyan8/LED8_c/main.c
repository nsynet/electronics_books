//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//             (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                          ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  �������ƣ� LED8_c
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
//    	main.c
//  ����:          2004-8-19
//===============================================

//============================================================
// �ļ����ƣ�main.c
// ʵ�ֹ���: 
//			�����������ʾ������ֵ��
//			����һ��������ʾ"1"�����ڶ�������ʾ"2"��...������8������ʾ"8"
// ���ڣ� 2004/8/19
//============================================================

#define P_IOA_Data			(volatile unsigned int *)0x7000
#define P_IOA_Buffer		(volatile unsigned int *)0x7001
#define P_IOA_Dir			(volatile unsigned int *)0x7002
#define P_IOA_Attrib		(volatile unsigned int *)0x7003
#define P_IOB_Data			(volatile unsigned int *)0x7005
#define P_IOB_Buffer		(volatile unsigned int *)0x7006
#define P_IOB_Dir			(volatile unsigned int *)0x7007
#define P_IOB_Attrib		(volatile unsigned int *)0x7008
#define P_Watchdog_Clear 	(volatile unsigned int *)0x7012

#define LED_SEG 0x00ff		//IOB0~IOB7��������ܻ�Ƶ�״̬
#define LED_DIG 0x3f00		//IOB8~IOB13�ֱ����6�������
#define LED_LIGHTS 0x4000	//IOB14����LED��
#define KEY_ALL 0xff00		//ʹ��IOA8~IOA15��Ϊ���������


const unsigned char DigCode[10]={0x3F,0x06,0x5B,
	0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};			//0~9ʮ�����ֵ�LED����

//============================================================= 
//	��������:   GetKey
//	��������:	�ȴ�ֱ���м����²�̧�𣬷��ؼ�ֵ��û��ȥ������
//	�﷨��		unsigned GetKey(void)
//	���룺		��
//	�����		16λ��ֵ
//=============================================================
unsigned GetKey(void)
{
	unsigned KeyValue;

	//��ʼ��IOA����Ӧ�˿�Ϊ��������
	*P_IOA_Dir&=~KEY_ALL;
	*P_IOA_Attrib&=~KEY_ALL;
	*P_IOA_Buffer|=KEY_ALL;
	
	//�ȴ��м����£����ж˿ڱ�Ϊ0
	while(!((*P_IOA_Data&KEY_ALL)^KEY_ALL))
	{	
		*P_Watchdog_Clear=1;		
	}
	KeyValue=(*P_IOA_Data&KEY_ALL)^KEY_ALL;
	//�ȴ�����̧��
	while((*P_IOA_Data&KEY_ALL)^KEY_ALL)
	{
		*P_Watchdog_Clear=1;
	}
	return KeyValue;
}

//============================================================= 
//	��������:   LedDispDig
//	��������:	��ָ�������������ʾ����
//	�﷨��		void LedDispDig(int Pos,int Dig)
//	���룺		Pos:	Ҫ��ʾ���ֵ������λ�ã�ȡֵ��Χ1~6
//				Dig:	Ҫ��ʾ�����֣�ȡֵ��Χ0~9
//	�����		��
//=============================================================
void LedDispDig(int Pos,int Dig)
{
	*P_Watchdog_Clear=1;				
	//��ʼ��IOBΪͬ�����
	*P_IOB_Dir|=LED_SEG+LED_DIG;
	*P_IOB_Attrib|=LED_SEG+LED_DIG;

	*P_IOB_Data=(unsigned)0x0100<<(Pos-1);		//�����ֵ�λ��ת��ΪIOB��8λֵ��ѡ����Ӧ�������
	*P_IOB_Data|=DigCode[Dig];					//������ת��Ϊ���룬��ΪIOB��8λ���
}


//============================================================= 
//	������
//=============================================================
int main()
{
	unsigned KeyValue,KeyNum,KeyMask;
	while(1)		
	{
		KeyValue=GetKey();			//�õ�16λ��ֵ

		//��16λ��ֵת��Ϊ1~8��ֵ
		KeyNum=1;
		KeyMask=0x0100;
		while (KeyMask)
		{
			//�ӵ͵������μ��IOB8~IOB15��ÿһλ
			if(KeyValue==KeyMask)
			{
				break;
			}
			else
			{
				KeyMask<<=1;		
				KeyNum++;
			}
		}
		if(!KeyMask)KeyNum=0;	//���û�õ���ȷ�ļ�ֵ����ʾ"0"
		LedDispDig(6,KeyNum);	//�ڵ��������������ʾ�������������ֵ��1~8��
	}
}