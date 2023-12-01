//==========================================================
//�ļ�����:Key.c
//��������:��ʼ�����̺�����ɨ����̺���
//ά����¼ 2006.4.20 by hongyan.Feng
//==========================================================
#define	P_IOA_Data 				(volatile unsigned int *)0x7000
#define P_IOA_Buffer 			(volatile unsigned int *)0x7001
#define P_IOA_Dir 				(volatile unsigned int *)0x7002
#define P_IOA_Attrib 			(volatile unsigned int *)0x7003

#define	P_IOB_Data 				(volatile unsigned int *)0x7005
#define P_IOB_Buffer 			(volatile unsigned int *)0x7006
#define P_IOB_Dir 				(volatile unsigned int *)0x7007
#define P_IOB_Attrib 			(volatile unsigned int *)0x7008
#define P_Watchdog_Clear		(volatile unsigned int *)0x7012 
//========================================================
//	�﷨��ʽ��	void Key_Init(void)
//	ʵ�ֹ��ܣ�	���̳�ʼ��
//	������		��
//	����ֵ��	��
//========================================================
void Key_Init(void)
{
	*P_IOA_Dir &= 0xff00;				//��ʼ��IOA�ڵͰ�λΪ���������������
	*P_IOA_Attrib &= 0xff00;
	*P_IOA_Data &= 0xff00;	
}
//========================================================
//	�﷨��ʽ��	void Delay(void)
//	ʵ�ֹ��ܣ�	��ʱ
//	������		��
//	����ֵ��	��
//========================================================
void delay(void)
{
	unsigned int uiCount;
	for(uiCount = 0;uiCount <= 3000;uiCount++)
	{
		*P_Watchdog_Clear = 0x0001;    //�忴�Ź�
	}
}
//========================================================
//	�﷨��ʽ��	unsigned int KeyScan(void)
//	ʵ�ֹ��ܣ�	��ü���ֵ������
//	������		��
//	����ֵ��	����ֵ
//========================================================

unsigned int KeyScan(void)
{
	unsigned int uiData;
	unsigned int uiTemp;
	uiData = *P_IOA_Data;				//��ȡIOA�˿�����
	uiData = uiData&0x00ff;				//��ȡ�Ͱ�λ��Чֵ
	if(uiData!=0)						//�������ʾ�м�����
	{
		delay();						//��ʱ����
		uiTemp = *P_IOA_Data;
		uiTemp = uiTemp&0x00ff;		    //��ȡ�Ͱ�λ��Чֵ
		if(uiData != uiTemp)
			uiData = 0;					//���ζ�������ȣ����÷���ֵΪ0
	}
	return uiData;	                    //���ؼ�ֵ	
}

