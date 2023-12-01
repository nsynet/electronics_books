//========================================================================================================
// �ļ����ƣ�LedShow.c
// ʵ�ֹ��ܣ�LED��ʾ����
// ��    �ڣ�2003/7/7
//========================================================================================================

#include "main.h"
extern F_Led_Show(unsigned int ,unsigned int);
extern SYSFLAGS sSysFlags;

//========================================================================================================
//����: F_Led_Show_Handle
//�﷨��void F_Led_Show_Handle()
//��������ʾͨ�����͵�ѹֵ
//��������
//���أ���
//========================================================================================================
void F_Led_Show_Handle(void)
{
	unsigned int i=0;
	//float fDisplayVoltageValue=0.0;
	unsigned int uiShowVoltageValue=0;
	F_Led_Show(0,sSysFlags.uiChannelNumber);//��ʾͨ����
	uiShowVoltageValue=sSysFlags.uiChannelVoltageValue;
	uiShowVoltageValue=(unsigned int)((uiShowVoltageValue*50)/0x03FF);
	sSysFlags.uiDisplayVoltageValue=uiShowVoltageValue;
	//for(i=0;i<0x500;i++);
	F_Led_Show(1,uiShowVoltageValue/10);//��ʾͨ����
	//for(i=0;i<0x550;i++);
	F_Led_Show(2,uiShowVoltageValue%10);//��ʾͨ����

}
//========================================================================================================
//����: F_Led_Show_Handle
//�﷨��void F_Led_Show_Handle()
//��������ʾͨ����
//��������
//���أ���
//========================================================================================================
void F_Led_Show_NotReady(void)
{
	F_Led_Show(0,sSysFlags.uiChannelNumber);//��ʾͨ����
}