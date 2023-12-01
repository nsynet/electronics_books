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
//	����������	��������������¶Ⱥ�Ŀ���¶�,������ͨ���۲�HJTemp��MBTemp���۲�������
//  IDE������   SUNPLUS u'nSPTM  IDE 2.0.0��or later��
//	�漰�Ŀ⣺	CMacro1016.lib
//              sacmv26e.lib
//	����ļ���	main.c/TNDriverUser.c
//              isr.asm/TNRFDriver.asm
//              SPCE061A.inc
//	Ӳ�����ӣ�	
//              IOA13�Ӻ������ģ��A
//              IOA14�Ӻ������ģ��CLK
//              IOA15�Ӻ������ģ��D(Data)
//              V��VCC��G��GND 
//	ά����¼��	2006-5-16	v1.0    by hongyan.Feng
//======================================================================
//======================================================================
//	�ļ����ƣ�	main.c
//	����������	��������������¶Ⱥ�Ŀ���¶�,������ͨ���۲�HJTemp��MBTemp���۲�������
//	ά����¼��	2006-5-16	v1.0
//======================================================================
#define P_Watchdog_Clear (volatile unsigned int*)0x7012
extern	unsigned int TN_IR_GetData(unsigned int Item);
extern  void TN_InitalIO(void);
float iTemp;
//========================================================
//	�﷨��ʽ��	int main(void)
//	ʵ�ֹ��ܣ�	���������¶Ⱥ�Ŀ���¶�
//	������		��
//	����ֵ��	��
//========================================================
int main(void)
{
	float HJTemp,MBTemp;
	TN_InitalIO();
	while(TN_IR_GetData(0x66))                 //���������¶�
	{
		*P_Watchdog_Clear = 0x0001;
	}
	HJTemp = iTemp;                            //���滷���¶�ֵ
	while(TN_IR_GetData(0x4c))                 //����Ŀ���¶�     
	{
		*P_Watchdog_Clear = 0x0001;
	}
	MBTemp = iTemp;                            //����Ŀ���¶�ֵ
	while(1)
	{   
		
		*P_Watchdog_Clear = 0x0001;
	}
}