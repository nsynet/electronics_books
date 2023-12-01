#include<reg51.h>
#include <absacc.h>
#include <stdio.h>
#define uchar unsigned char
#define uint unsigned int
uchar data BUFFER[1]={0}; 					/*定时器计数变量*/

//设置P2.1，作为控制场效应管的控制电平；
sbit P2_1=P2^1;
main()
{
EA=1; IT1=1; ET0=1;
TMOD=0x01;  							/* T0方式1计时1秒 */
TH0=-5000/256;
TL0=-5000%256;
TR0=1;						 		/* 开中断，启动定时器 */
for (;;); 
}

/* 定时计数器0的中断服务子程序 */
void timer0(void)  interrupt 1 using 1
{
TH0=-5000/256;							// 定时器T0的高四位赋值
TL0=-5000%256;
BUFFER[0]=BUFFER[0]+1; 				// 定时器T0的低四位赋值
if (BUFFER[0]==100)					 	// 百分秒进位
	{
P2_1=!P2_1;
	}
} 

