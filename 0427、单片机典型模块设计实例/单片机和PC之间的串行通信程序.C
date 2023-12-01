#include<reg52.h>
#include <absacc.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#define uchar unsigned char
#define uint unsigned int
uchar FREQ; 								/*定时器计数变量*/

void main(void)
{	
// 以下是设置中断和定时器
	EA=1; PT0=1; 
	ET0=1;
	IT0=1;IT1=1;
	EX0=1;EX1=1;ET2=1;
	T2CON=0x08;
	TMOD=0x21;
	
// 定时器0为产生1ms的中断，定时器1为9600bit/s 的波特率发生器
	TH0=-1000/256;
	TL0=-1000%256;
	TL1=0xfd;
	TH1=0xfd;
	SCON=0x50;
	PCON=0x80;
	
// 开定时器
	TR1=1;
	TR0=1;
	TI=1;
	while(1){}
}

// 定时器0的中断服务程序，向串口发送姿态数据。
void intsvr1(void) interrupt 1
{

// 重新装入定时器0的初值；
	TH0=-10000/256;
	TL0=-10000%256;
FREQ=FREQ+1; 						// 定时器T0的低四位赋值
if (FREQ==1000)					 	// 1秒判断
	{
FREQ=0;
printf("*");							// 发送字符
	}
}  

