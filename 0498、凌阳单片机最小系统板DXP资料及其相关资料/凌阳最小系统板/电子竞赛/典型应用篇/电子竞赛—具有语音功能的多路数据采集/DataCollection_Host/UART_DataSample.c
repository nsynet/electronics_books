//========================================================================================================//
// �������ƣ�UART_DataSample.asm
// ����������ʵ����������������ӻ�����ȡ�ӻ��������ͨ������
// ��    �ڣ�2003/7/7
//========================================================================================================//
#include "main.h"
extern SYSFLAGS sSysFlags;
extern void F_UART_SendCommand(unsigned int);
extern unsigned int F_UART_ReadByte();
//========================================================================================================
//����: F_UART_DataSample
//�﷨��void F_UART_DataSample()
//����������������ӻ�����ȡ�ӻ��������ͨ������
//��������
//���أ���
//========================================================================================================
void  F_UART_DataSample(void)
{
	unsigned int uiChannelVoltageValueLow=0;
	unsigned int uiChannelVoltageValueHigh=0;
	unsigned int uiChannelVoltageValueTest=0;
	unsigned int uiSampleChannelComman=0;
	if(sSysFlags.uiCircleSample==1)								//ѭ�������ж�
	{
		sSysFlags.uiChannelNumber+=1;
		if(sSysFlags.uiChannelNumber==8)
			sSysFlags.uiChannelNumber=1;
	}
	uiSampleChannelComman=sSysFlags.uiChannelNumber;
	uiSampleChannelComman=uiSampleChannelComman<<4;
	uiSampleChannelComman+=sSysFlags.uiChannelNumber;			//��������Ϊ0x00AA,����AΪͨ���š�
	F_UART_SendCommand(uiSampleChannelComman);		 			//���Ͳ�������
	uiChannelVoltageValueLow=F_UART_ReadByte();					//��ͨ������
	uiChannelVoltageValueHigh=F_UART_ReadByte();				//��ͨ������
	uiChannelVoltageValueTest=uiChannelVoltageValueLow+(uiChannelVoltageValueHigh<<8);
	F_UART_SendCommand(uiSampleChannelComman);					//���Ͳ�������
	uiChannelVoltageValueLow=F_UART_ReadByte();					//��ͨ������
	uiChannelVoltageValueHigh=F_UART_ReadByte();				//��ͨ������
	uiChannelVoltageValueLow+=(uiChannelVoltageValueHigh<<8);	
	if(uiChannelVoltageValueLow==uiChannelVoltageValueTest)     //�Ƚ����β�����ͨ�������Ƿ�һ�¡�
	{
		sSysFlags.uiChannelVoltageValue=uiChannelVoltageValueTest;
		sSysFlags.uiSampleOk=1;	     //������־��1
	}
	else
	{
		sSysFlags.uiSysFaultNumber=1;//���ϱ�־������1
		sSysFlags.uiSampleOk=0;      //������־����
	}
}