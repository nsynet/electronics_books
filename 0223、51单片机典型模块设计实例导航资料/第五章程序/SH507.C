#include <reg52.h>
#include <absacc.h>
#include <stdio.h>
#define uchar unsigned char
#define uint unsigned int
// 定义8253的寄存器地址
#define 	COM XBYTE[0x6000] 	// 定义8253的控制字寄存器地址
#define 	C0 XBYTE[0x0000] 	// 定义8253的计数器0寄存器地址
#define 	C0I XBYTE[0x1000]
sbit P1_7=P1^7;
uint BUF810;
uchar h,l,a,b,c,sendflag,FREQ;

//主函数，初始化定时器和片外寄存器
void main(void)
{
	EA=1; PT0=1;
	ET0=1;
	IT0=1;IT1=1;
	EX0=1;EX1=1;ET2=1;
	T2CON=0x08;
	TMOD=0x21;  //用定时器0产生2s的中断信号，为8253计数提供门控。
	TH0=-1000/256;  
	TL0=-1000%256;
	
	
// 向8253R中的控制字寄存器中选择计数器0，并对其幅初值0；
COM=0x30;
	C0=0;C0=0;
TR0=1;
	sendflag=1;
	while(1){}
}

/* 定时计数器0的中断服务子程序 */
void timer0(void)  interrupt 1 using 1
{
TH0=-1000/256;							// 定时器T0的高四位赋值
TL0=-1000%256;
FREQ=FREQ+1; 						// 定时器T0的低四位赋值
if (FREQ==1000)					 	// 1秒判断
	{
FREQ=0;
P1_7=!P1_7;						// 信号输出端口取反
COM=0x00; 						//计数器0闩锁操作
l=C0; 							//分别读取高、低8位的数据
h=C0;
BUF810=-(h*256+l);
COM=0x30;
C0=0;C0I=0;
	}
} 

