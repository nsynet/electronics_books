/***************************************************************************************
*˵��:����STM32F10XXX����UART1ͨѶ,���Խ�printf scanf���ض��򵽴���
*����:KEIL FOR ARM MDK3.11
*Ӳ��:��ӦPA9-UART1TX PA10-UART1RX��ʹ��USART1
*�汾:V0.1
*����:alien2006
*��ע:��Ӧ��PA9/PA10�Լ�USART1����UART_Init���������ʼ���������ڳ��������
***************************************************************************************/
#ifndef __UART_INTERFACE_H
#define __UART_INTEFFACE_H

#include "stm32f10x.h"
#include "stdio.h"
#include "eval.h"


/*˽�б���----------------------------------------------------------------------------*/
#define USED_COM_NUMBER COM1  	//���õ�ǰʹ�õĴ���

/*��������----------------------------------------------------------------------------*/
void USART_Configuration(unsigned long UART_baud); //�����ʣ���115200
int fputc(int ch, FILE *f);    //fputc�ض���
int fgetc(FILE *f); //fgetc�ض���


#endif

