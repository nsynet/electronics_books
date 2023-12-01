//======================================================================
//	The information contained herein is the exclusive property of
//	Sunnnorth Technology Co. And shall not be distributed, reproduced,
//	or disclosed in whole in part without prior written permission.
//	(C) COPYRIGHT 2003 SUNNORTH TECHNOLOGY CO.
//	ALL RIGHTS RESERVED
//	The entire notice above must be reproduced on all authorized copies.
//======================================================================

//======================================================================
//	�������ƣ�	TNRFDriver.spj
//	����������	���������¶Ⱥ�Ŀ���¶�,���ü��̿��Ʋ����¶�ֵ������61�����Դ������������Ʋ���
//              ��K1,��������Ŀ���¶Ⱥͻ����¶�
//              ��K2,������Ŀ���¶�
//              ��K3,�����Ż����¶�
//  IDE������   SUNPLUS u'nSPTM  IDE 2.0.0��or later��
//	�漰�Ŀ⣺	CMacro1016.lib
//              sacmv26e.lib
//	����ļ���	main.c/PlayData.c/Key.c/TNDriverUser.c
//              hardware.asm/isr.asm/TNRFDriver.asm
//              s480.h/hardware.h/
//              SPCE061A.inc/s480.inc
//	Ӳ�����ӣ�	
//              IOA13�Ӻ������ģ��A
//              IOA14�Ӻ������ģ��CLK
//              IOA15�Ӻ������ģ��D(Data)
//              V��VCC,G��GND
//	ά����¼��	2006-4-20	v1.0    by hongyan.Feng
//======================================================================

//======================================================================
//	�ļ����ƣ�	main.c
//	����������	ȡ��������,�����ݼ�ֵ���в���
//              ��K1,��������Ŀ���¶Ⱥͻ����¶�
//              ��K2,������Ŀ���¶�
//              ��K3,�����Ż����¶�
//	ά����¼��	2006-4-20	v1.0
//======================================================================
#define P_Watchdog_Clear		(volatile unsigned int *)0x7012  

extern unsigned int TN_Data_Buff[5];		      //����������������
extern void TN_InitalIO(void);
extern void Key_Init(void);
extern unsigned int TN_IR_GetData(unsigned int Item);
extern unsigned int KeyScan(void);
extern void PlaySnd_Auto(unsigned int uiSndIndex);
extern void F_TempplayAndShow(float temp);
float iTemp;                                       //�����¶�ֵ
//========================================================
//	�﷨��ʽ��	int main(void)
//	ʵ�ֹ��ܣ�	���̿��Ʋ��������¶Ⱥ�Ŀ���¶�
//	������		��
//	����ֵ��	��
//========================================================
int main(void)
{
	unsigned int Key,iFlag = 1;	
	Key_Init();                                     //��ʼ������
	TN_InitalIO();                                  //��ʼ���������ģ��
	while(1)
	{
		Key = KeyScan();                             //ɨ�����

		switch(Key)
		{
			case 0:                                  //û�м�����				       
				break;
			case 0x0001:                             //��һ����K1����
				while(iFlag)                         //�ж��Ƿ��������ȷ����
				{
					iFlag = TN_IR_GetData(0x004c);   //����Ŀ���¶ȣ�ȡ�¶�ֵ��iFlag
					*P_Watchdog_Clear = 0x0001; 
				}
				PlaySnd_Auto(16);                    //����"OK"
				PlaySnd_Auto(15);                    //����"Ŀ���¶�"
				F_TempplayAndShow(iTemp);            //����"���Ŀ���¶�ֵ"
				iFlag = 1;                           //iFlag��1
				while(iFlag)                         //�ж��Ƿ��������ȷ����
				{
					iFlag = TN_IR_GetData(0x0066);   //���������¶ȣ�ȡ�¶�ֵ��iFlag
					*P_Watchdog_Clear = 0x0001; 
				}
				PlaySnd_Auto(14);                    //����"�����¶�" 
				F_TempplayAndShow(iTemp);            //����"��û����¶�ֵ"
				iFlag = 1;                           //iFlag��1 
				break;
			case 0x0002:                             //�ڶ���������
				while(iFlag)                         //�ж��Ƿ��������ȷ����
				{
					iFlag = TN_IR_GetData(0x004c);   //����Ŀ���¶ȣ�ȡ�¶�ֵ��iFlag
					*P_Watchdog_Clear = 0x0001; 
				}
				PlaySnd_Auto(16);                    //����"OK"
				PlaySnd_Auto(15);                    //����"Ŀ���¶�"
				F_TempplayAndShow(iTemp);            //����"���Ŀ���¶�ֵ"
				iFlag = 1;
				break;
			case 0x0004:                             //���������̰���
				while(iFlag)                         //�ж��Ƿ��������ȷ����
				{
					iFlag = TN_IR_GetData(0x0066);   //���������¶ȣ�ȡ�¶�ֵ��iFlag
					*P_Watchdog_Clear = 0x0001; 
				}
				PlaySnd_Auto(16);                    //����"OK"
				PlaySnd_Auto(14);                    //����"�����¶�"
				F_TempplayAndShow(iTemp);            //����"��û����¶�ֵ"
				break;
			default:
				break;
		}
	}	
}
//====================================================================================
//main.c end
//====================================================================================