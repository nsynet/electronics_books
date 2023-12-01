//========================================================================================================//
// 程序名称：UART_DataSample.asm
// 功能描述：实现主机发送命令给从机，读取从机采样后的通道数据
// 日    期：2003/7/7
//========================================================================================================//
#include "main.h"
extern SYSFLAGS sSysFlags;
extern void F_UART_SendCommand(unsigned int);
extern unsigned int F_UART_ReadByte();
//========================================================================================================
//函数: F_UART_DataSample
//语法：void F_UART_DataSample()
//描述：发送命令给从机，读取从机采样后的通道数据
//参数：无
//返回：无
//========================================================================================================
void  F_UART_DataSample(void)
{
	unsigned int uiChannelVoltageValueLow=0;
	unsigned int uiChannelVoltageValueHigh=0;
	unsigned int uiChannelVoltageValueTest=0;
	unsigned int uiSampleChannelComman=0;
	if(sSysFlags.uiCircleSample==1)								//循环采样判断
	{
		sSysFlags.uiChannelNumber+=1;
		if(sSysFlags.uiChannelNumber==8)
			sSysFlags.uiChannelNumber=1;
	}
	uiSampleChannelComman=sSysFlags.uiChannelNumber;
	uiSampleChannelComman=uiSampleChannelComman<<4;
	uiSampleChannelComman+=sSysFlags.uiChannelNumber;			//设置命令为0x00AA,其中A为通道号。
	F_UART_SendCommand(uiSampleChannelComman);		 			//发送采样命令
	uiChannelVoltageValueLow=F_UART_ReadByte();					//读通道数据
	uiChannelVoltageValueHigh=F_UART_ReadByte();				//读通道数据
	uiChannelVoltageValueTest=uiChannelVoltageValueLow+(uiChannelVoltageValueHigh<<8);
	F_UART_SendCommand(uiSampleChannelComman);					//发送采样命令
	uiChannelVoltageValueLow=F_UART_ReadByte();					//读通道数据
	uiChannelVoltageValueHigh=F_UART_ReadByte();				//读通道数据
	uiChannelVoltageValueLow+=(uiChannelVoltageValueHigh<<8);	
	if(uiChannelVoltageValueLow==uiChannelVoltageValueTest)     //比较两次采样的通道数据是否一致。
	{
		sSysFlags.uiChannelVoltageValue=uiChannelVoltageValueTest;
		sSysFlags.uiSampleOk=1;	     //采样标志置1
	}
	else
	{
		sSysFlags.uiSysFaultNumber=1;//故障标志变量置1
		sSysFlags.uiSampleOk=0;      //采样标志置零
	}
}