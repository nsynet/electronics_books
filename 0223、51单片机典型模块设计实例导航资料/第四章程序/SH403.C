#include <reg52.h>
#include <absacc.h>
#include <stdio.h>
#define uchar unsigned char
#define uint unsigned int

// 定义8253的寄存器地址，发出PWM信号
#define 	COMI XBYTE[0x3100] 	// 定义8253R的控制字寄存器地址
#define 	C0I XBYTE[0x0100]		// 定义8253R的计数器0寄存器地址
#define 	C1I XBYTE[0x1100] 		// 定义8253R的计数器1寄存器地址
#define 	C2I XBYTE[0x2100] 		// 定义8253R的计数器2寄存器地址

sbit P1_2=P1^2;
//sbit EXF2=T2CON^6;
uint i,sendflag;
uint BUF810,BUF811,BUF812;
uint BUF810H,BUF810L;
uint BUF811H,BUF811L;
uint BUF812H,BUF812L;

uchar h,l,a,b,c;

//主函数，初始化定时器和片外寄存器
void main(void)
{
EA=1; PT0=1;
ET0=1;
IT0=1;IT1=1;
EX0=1;EX1=1;ET2=1;
T2CON=0x08;
//用定时器0产生18ms的中断信号，为8253输出PWM信号提供时钟周期基准。
TMOD=0x21;  
TH0=0xB9;  
TL0=0xB0;
		
// 向8253R中的控制字寄存器中选择计数器0，并对其幅初值0；
COMI=0x30;
C0I=0;C0I=0;
// 向8253R中的控制字寄存器中选择计数器1，并对其幅初值0；
COMI=0x70;
C1I=0;C1I=0;
// 向8253R中的控制字寄存器中选择计数器2，并对其幅初值0；
COMI=0xB0;
C2I=0;C2I=0;
	
TR0=1;
sendflag=1;
while(1){}
}

// 定时器中断1，向8253发送控制数据
void intsvr1(void) interrupt 1
{
	TH0=0xB9; 	//用定时器1产生18ms的中断信号，为8253T输出PWM信号提供时钟周期基准。
	TL0=0xB0;
     
// 用8253计数器发送PWM信号
	COMI=0x30;
	C0I=BUF810L;
	C0I=BUF810H;
	COMI=0x70;
	C1I=BUF811L;
	C1I=BUF811H;
	COMI=0xB0;
	C2I=BUF812L;
	C2I=BUF812H;
}  

