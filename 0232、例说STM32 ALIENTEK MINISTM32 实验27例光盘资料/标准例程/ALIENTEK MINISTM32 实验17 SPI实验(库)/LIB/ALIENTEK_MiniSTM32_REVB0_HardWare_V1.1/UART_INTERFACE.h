/***************************************************************************************
*说明:用于STM32F10XXX串口UART1通讯,可以将printf scanf等重定向到串口
*环境:KEIL FOR ARM MDK3.11
*硬件:对应PA9-UART1TX PA10-UART1RX，使用USART1
*版本:V0.1
*作者:alien2006
*备注:对应的PA9/PA10以及USART1已由UART_Init函数自身初始化，无需在程序中完成
***************************************************************************************/
#ifndef __UART_INTERFACE_H
#define __UART_INTEFFACE_H

#include "stm32f10x.h"
#include "stdio.h"
#include "eval.h"


/*私有变量----------------------------------------------------------------------------*/
#define USED_COM_NUMBER COM1  	//设置当前使用的串口

/*函数声明----------------------------------------------------------------------------*/
void USART_Configuration(unsigned long UART_baud); //波特率，如115200
int fputc(int ch, FILE *f);    //fputc重定向
int fgetc(FILE *f); //fgetc重定向


#endif

