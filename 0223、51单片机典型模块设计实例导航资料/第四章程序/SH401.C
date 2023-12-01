#include <reg52.h>
#include <absacc.h>
#define uchar unsigned char
#define uint unsigned int

bit gate; 									// 定时标志位
bit direct; 									/*设置电机正反转标志，0-正转；1-反转*/
sbit motor1=P1^2;
sbit motor2=P1^3;							/*10-正转；01-反转*/
uchar data BUFFER[1]={0}; 					/*定时器计数变量*/

// 主程序，定义中断源和串口工作方式。
void main (void)
{	
P2=0x0f;								// 初始化端口
EA=1; IT1=1; ET0=1;
TMOD=0x01;  							/* T0方式1计时1秒 */
TH0=-5000/256;
TL0=-5000%256;
TR0=1;						 		/* 开中断,启动定时器 */
gate=1; 								// 依据转向状态决定电机的动作
	
for (;;)
	{	
		if (gate) 
{
motor1=1;
motor2=0;
		}
else
{
motor1=0;
motor2=1;
}
}		
}

/* 定时计数器0的中断服务子程序 */
void timer0(void)  interrupt 1 using 1
{
TH0=-5000/256;							// 定时器T0的高四位赋值
TL0=-5000%256;
BUFFER[0]=BUFFER[0]+1; 				// 定时器T0的低四位赋值
if (BUFFER[0]==100)					 	// 百分秒进位
	{
gate=! gate;						// 转向标志取反
	}
} 

