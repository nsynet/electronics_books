#include <reg52.h>
#include <absacc.h>
#include <stdio.h>
#include <math.h>
#define uchar unsigned char
#define uint unsigned int
#define adch0 XBYTE[0x0000]

sbit P1_6=P1^6;
sbit P1_7=P1^7;
uint ch0datal,ch0datah,i,light;

void main(void)
{
	EA=1; PT0=1;					// 开外中断，并设置定时器；
	ET0=1;
	IT0=1;IT1=1;
	EX0=1;EX1=1;ET2=1;
	T2CON=0x08;
	TMOD=0x21;
	
	TH0=0xB9;					// 设置定时器的初值；
	TL0=0xB0;
	TR0=1;
	TI=1;
	
	ch0datah=0;
	ch0datal=0;
	P1_6=0;						// 设置控制端口的初值；
	P1_7=0;
	while(1){}						// 等待外部的控制信号；
}

void intsvr1(void) interrupt 1			// 定时器1模拟外部控制信号的进入
{
	TH0=0xB9;
	TL0=0xB0;
	TR0=1;
	light=light+1;
	if (light>1000)
{
	    P1_6=!P1_6;				// 控制信号取反，工作方式变化；
	    P1_7=!P1_7;	
	    light=0;					// 标志位显示当前的工作状态；
}
} 

