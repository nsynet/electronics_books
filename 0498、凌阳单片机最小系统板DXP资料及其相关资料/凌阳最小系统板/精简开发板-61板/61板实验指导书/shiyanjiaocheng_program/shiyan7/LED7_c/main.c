//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//             (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                          ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  �������ƣ� LED7_c
//  ��������:  
//			���������ȫ��������
//			���������ȫ��Ϩ�������ȫ����ʾ����8��
//			�����ȫ��Ϩ�𣬷��������ȫ����������˷�����
//  Ӳ�����ӣ�
//			��61���IOB0��7���������ӵ�LED����ģ���SEG�����ϣ�
//			IOB8~IOB15���ӵ�LED����ģ���DIG�����ϡ�
//  �ļ���Դ����61��ʵ��̡̳�,"ʵ����	��������ܺ�����ܽ�����ʾ"
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
//			�������������ѭ����ʾ0��9ʮ������
// ���ڣ� 2004/8/19
//============================================================

#define P_IOB_Data			(volatile unsigned int *)0x7005
#define P_IOB_Buffer		(volatile unsigned int *)0x7006
#define P_IOB_Dir			(volatile unsigned int *)0x7007
#define P_IOB_Attrib		(volatile unsigned int *)0x7008
#define P_Watchdog_Clear 	(volatile unsigned int *)0x7012

#define LED_SEG 0x00ff		//IOB0~IOB7��������ܻ�Ƶ�״̬
#define LED_DIG 0x3f00		//IOB8~IOB13�ֱ����6�������
#define LED_LIGHTS 0x4000	//IOB14����LED��


const unsigned char DigCode[10]={0x3F,0x06,0x5B,
	0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};			//0~9ʮ�����ֵ�LED����

//============================================================= 
//	��������:   LedDispDig
//	�﷨��		void LedDispDig(int Pos,int Dig)
//	��������:	��ָ�������������ʾ����
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
//	��������:   LedLights
//	�﷨��		void LedLights(int BitValue)
//	��������:	����LED��
//	���룺		BitValue:	8��LED�Ƶ�����״̬
//	�����		��
//=============================================================
void LedLights(int BitValue)
{
	*P_Watchdog_Clear=1;				
	//��ʼ��IOBΪͬ�����
	*P_IOB_Dir|=LED_LIGHTS+LED_SEG;
	*P_IOB_Attrib|=LED_LIGHTS+LED_SEG;
	
	*P_IOB_Data=LED_LIGHTS;	//ѡ��LED��
	*P_IOB_Data|=BitValue;	//��ʾBitValueָ����ֵ
}

//============================================================= 
//	������
//=============================================================
int main()
{
	unsigned Pos,TimerCnt;
	
	while(1)		//ѭ��1����ѭ��
	{
		LedLights(0xff);		//����ȫ��LED��
		for(TimerCnt=60000;TimerCnt>0;TimerCnt--)	//����һ��ʱ��
		{
			*P_Watchdog_Clear=1;
		}
		for(TimerCnt=1000;TimerCnt>0;TimerCnt--)	//��һ��ʱ����ʹ�����������ʾ���֡�8��
		{
			for(Pos=1;Pos<=6;Pos++)
				LedDispDig(Pos,8);	//��j���������ʾ���֡�8��
		}
	}
}