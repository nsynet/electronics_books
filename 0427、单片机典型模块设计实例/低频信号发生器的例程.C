#include<reg51.h>
#include <absacc.h>
#define uchar unsigned char
#define uint unsigned int
uint FREQ; 								/*定时器计数变量*/
uint FREQ_out; 								/*输出频率变量*/
uint delay;

sbit SEL0=P3^0;
sbit SEL1=P3^1;
sbit FSGN=P3^5;							//设置P3.5，作为信号输出引脚；

/* 定时计数器0的中断服务子程序 */
void timer0(void)  interrupt 1 using 1
{
TH0=-1000/256;							// 定时器T0的高四位赋值
TL0=-1000%256;
FREQ=FREQ+1; 						// 定时器T0的低四位赋值
if (FREQ==FREQ_out)					// 周期时间长短的判断
	{
FREQ=0;
FSGN=!FSGN;						// 信号输出端口取反
	}
}

/* 外中断0的中断服务子程序 */
void intsvr0(void)  interrupt 0 using 1
{
TR0=1;								// 开始输出方波
}
/* 外中断0的中断服务子程序 */
void intsvr1(void)  interrupt 2 using 1
{
FREQ_out = FREQ_out +5000;				// 输出的方波频率减1；
} 

main()
{
EA=1; ET0=1;
IT0=1; IT1=1; EX0=1;EX1=1;				// 开外中断和定时中断

TMOD=0x01;  							/* T0方式1计时5秒 */
TH0=-1000/256;							// 1ms的初值
TL0=-1000%256;
TR0=0;						 		/* 开中断，启动定时器 */
FREQ=0;
FREQ_out=5000;
FSGN=1;
while(1)
{
for (delay=0;delay<=200;delay++); 				// 延时程序
//disp( );									// 显示程序
} 
}


