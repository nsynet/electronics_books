//=========== ��������=============================//
//
//=================================================//
#include "main.h"
extern void F_PlayRespond(unsigned int);
extern g_uiKeyValue;
extern SYSFLAGS sSysFlags;
void F_KeyHandle(void)
{
	unsigned int i=0;
	switch(g_uiKeyValue)
	{
		case 1:
		case 2:
		case 3:
		case 4:
		case 5:
		case 6:
		case 7://���ּ�
			if(sSysFlags.uiSelectSample==1)
			{			
				sSysFlags.uiChannelNumber=g_uiKeyValue;
				F_PlayRespond(4);//������ʾ"ͨ����ѡ�����"
			}
			break;
		case 8://�������ż�
			sSysFlags.uiPlaySpeechKey=1;
			break;
		case 9://ѡ�������
			sSysFlags.uiSelectSample=1;
			F_PlayRespond(2);//������ʾ��ģʽѡ����ϡ�
			for(i=0;i<0xFFFF;i++);
			F_PlayRespond(3);//������ʾ"������ͨ����"
			break;
		case 10://ѭ��������
			sSysFlags.uiCircleSample=1;
			F_PlayRespond(2);//������ʾ��ģʽѡ����ϡ�
			break;
		case 11://ȷ����
			sSysFlags.uiEnterKey=1;
			break;
		case 12://ȡ����
			sSysFlags.uiCancelKey=1;
			break;
		default:
			break;
	}
}