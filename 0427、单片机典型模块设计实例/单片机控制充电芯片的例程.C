#include <reg52.h>
#include <absacc.h>
#include <stdio.h>
#include <math.h>
#define uchar unsigned char
#define uint unsigned int

uint count;
sbit P1_6=P1^6;
sbit P1_7=P1^7;
sbit GATE=P2^1;
sbit BEEP=P2^3;
bit gate0;

void main(void)
{
EA=1; PT0=1;					// 开外中断，并设置定时器；
ET0=1;
IT0=1;IT1=1;
EX0=1;EX1=1;ET2=1;
T2CON=0x08;
TMOD=0x21;
GATE=1;
BEEP=1;
TH0=0xB9;					// 设置定时器的初值；
TL0=0xB0;
TR0=1;
TI=1;
	
P1_6=0;						// 设置控制端口的初值；
P1_7=0;
while(1){}					// 等待外部的控制信号；
}

void intsvr1(void) interrupt 1			// 定时器1模拟外部控制信号的进入
{
if (gate0==1)
{
TH0=-5000/256;				// 定时器T0的高四位赋值
TL0=-5000%256;
TR0=1;
count=count+1;
	}
} 

void intsvr0(void)  interrupt 0 using 1
{
	gate0=!gate0;
if ((count>300)&&(count<500))
	{	
GATE=0;
BEEP=0;
}
else
	{	
GATE=1;
BEEP=1;
}
} 

