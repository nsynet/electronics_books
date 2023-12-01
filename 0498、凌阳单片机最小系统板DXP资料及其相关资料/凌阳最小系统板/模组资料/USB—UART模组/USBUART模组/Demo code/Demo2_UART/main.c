#include "spce061v004.h"

unsigned int uiRecBuffer[100];
unsigned int uiBuffer,uiArr,uiFlag;

int main(void)
{
	unsigned int i,uiTemp;
	i = 0;
	uiTemp = 0;
	uiArr = 0;
	uiFlag = 0;	
	
	for(i=0;i<100;i++)
		uiRecBuffer[i] = 0;
		 
	__asm("INT OFF");
	
	*P_IOB_Attrib = 0x0480;				//初始化IOB7、IOB10端口
	*P_IOB_Dir = 0x0400;
	*P_IOB_Data = 0x0000;
	
	*P_UART_BaudScalarLow = 0x0080;		//设置波特率
	*P_UART_BaudScalarHigh = 0x0002;
	
	*P_UART_Command1 = 0x0080;			//使能接收中断
	*P_UART_Command2 = 0x00c0;			//使能发送、接收通道
	
	uiTemp = *P_UART_Data;
	
	__asm("INT IRQ");
	
	while(uiBuffer != 0x0035)
	{
		*P_Watchdog_Clear = 0x0001;
	}
	
	uiFlag = 1;
	while(uiBuffer != 0x0030)
	{
		*P_Watchdog_Clear = 0x0001;
		uiRecBuffer[uiArr] = uiBuffer;
	}
	
	*P_UART_Command1 = 0x00c0;
	*P_UART_Command2 = 0x00c0;
	while(1)
	{
		*P_Watchdog_Clear = 0x0001;		
	}
}

void IRQ7(void)__attribute__((ISR));
void IRQ7(void)
{	
	unsigned int uiTemp1;
	
	uiTemp1 = *P_UART_Command2;
	uiTemp1 &= 0x0080;
	if(uiTemp1 == 0x0080)
	{
		uiBuffer = *P_UART_Data;
		if(uiFlag == 1)
			uiArr++;
	}
	else
	{
		if(uiArr != 0)
		{
			*P_UART_Data = uiRecBuffer[uiArr];
			uiArr--;
		}
		else
		{
			*P_UART_Command1 = 0x0000;
			*P_UART_Command2 = 0x0000;
		}
	} 
}
