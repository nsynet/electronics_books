#include <reg52.h>
#include <absacc.h>
#define unit unsigned int
#define uchar unsigned char

sbit L0=P2^0;
sbit L1=P2^1;
sbit L2=P2^2;
sbit L3=P2^3;

void delays(void)
{
uchar i;
for(i=300;i>0;i--);
}


void main(void)
{
P2=0x0f;								// 初始化端口
EA=1; IT0=1; EX0=1;						// 初始化外中断标志位
while(1)
{ 
         delays(); 							// 键的消抖延时函数
}
}


/* 外中断0的中断服务子程序 */
void intersvr0(void)  interrupt 0 using 1
{
L3=!L3;							// 灯L3状态取反
L2=!L2;							// 灯L2状态取反
L1=!L1;							// 灯L1状态取反
L0=!L0;							// 灯L0状态取反
} 



