#include <reg52.h>
#include <absacc.h>
#define unit unsigned int
#define uchar unsigned char

sbit L0=P2^0;
sbit L1=P2^1;
sbit L2=P2^2;
sbit L3=P2^3;
uchar data BUFFER[1]={0}; 					/*定时器计数变量*/

void main(void)
{
P2=0x0f;								// 初始化端口
EA=1; IT1=1; ET0=1;
TMOD=0x01;  							/* T0方式1计时0.01秒 */
TH0=-5000/256;
TL0=-5000%256;
TR0=1;						 		/* 开中断,启动定时器 */
for (;;);
}
/* 定时计数器0的中断服务子程序 */
void intserv1(void)  interrupt 1 using 1
{
TH0=-5000/256;							// 定时器T0的高四位赋值
TL0=-5000%256;
BUFFER[0]=BUFFER[0]+1; 				// 定时器T0的低四位赋值
if (BUFFER[0]==100)					 	// 百分秒进位
	{
L3=!L3;
L2=!L2;
L1=!L1;
L0=!L0;
	}
} 

