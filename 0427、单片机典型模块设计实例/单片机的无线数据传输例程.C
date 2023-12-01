#include <reg52.h>
#include <absacc.h>
#include <stdio.h>
#define uchar unsigned char
#define uint unsigned int
//sbit EXF2=T2CON^6;
#define 	COMI XBYTE[0x3100] 	// 定义8253R的控制字寄存器地址
#define 	C0I XBYTE[0x0100]		// 定义8253R的计数器0寄存器地址
#define 	C1I XBYTE[0x1100] 		// 定义8253R的计数器1寄存器地址
#define 	C2I XBYTE[0x2100] 		// 定义8253R的计数器2寄存器地址
uint i,sendflag;
uint BUF810,BUF811,BUF812;
uint BUF810H,BUF810L;
uint BUF811H,BUF811L;
uint BUF812H,BUF812L;
uchar h,l,a,b,c,yawh,yawl,yaw,pitchh,pitchl,pitch,rollh,rolll,roll;
  
// 主程序， 定义中断源，并对定时器赋初值，以及向8253寄存器写控制字。
void main(void)
{	
// 以下是设置中断和定时器
	EA=1; PT0=1; 
	ET0=1;
	IT0=1;IT1=1;
	EX0=1;EX1=1;ET2=1;
	T2CON=0x08;
	TMOD=0x21;
	
// 定时器0为产生18ms的中断，定时器1为9600bit/s 的波特率发生器
	TH0=0xB9;
	TL0=0xB0;
	TL1=0xfd;
	TH1=0xfd;
	SCON=0x50;
	PCON=0x80;
	
// 向8253中写入控制字，门控的方式1计数方式
	COMI=0x30;
	C0I=0;C0I=0;
	COMI=0x70;
	C1I=0;C1I=0;
	COMI=0xB0;
	C2I=0;C2I=0;
	
// 开定时器
	TR1=1;
	TR0=1;
	TI=1;
	sendflag=1;
	while(1){}
}

// 中断0的服务子程序，单片机读入8253计数器0中的计数值
void intsvrex0(void) interrupt 0 
{	
// 中断0到来，单片机读入8253计数器0中的计数值
	COMI=0x00;
	l=C0I;
	h=C0I;
	BUF810=-(h*256+l);
	COMI=0x30;
	C0I=0;C0I=0;
}		

// 中断1的服务子程序，单片机读入8253计数器1中的计数值。
void intsvrex1(void) interrupt 2 
{	
// 中断1到来，单片机读入8253计数器1中的计数值
	COMI=0x40;
	l=C1I;
	h=C1I;
	BUF811=-(h*256+l);
	COMI=0x70;
	C1I=0;C1I=0;
}	

// 中断3的服务子程序，单片机读入8253计数器2中的计数值。
void intsvr2(void) interrupt 5
{
// 中断3到来，单片机读入8253计数器2中的计数值
	EXF2=0;
	COMI=0x80;
	l=C2I;
	h=C2I;
	BUF812=-(h*256+l);
	COMI=0xB0;
	C2I=0;C2I=0;
}

// 定时器0的中断服务程序，产生18ms的计数中断，读取姿态数据，并向串口发送姿态数据。
void intsvr1(void) interrupt 1
{
// 读取姿态数据
yawh=XBYTE[0x6000];
	yawl=XBYTE[0x1000];
	yaw=yawh*256+yawl;
	pitchh=XBYTE[0x2000];
	pitchl=XBYTE[0x3000];
	pitch=pitchh*256+pitchl;
	rollh=XBYTE[0x4000];
	rolll=XBYTE[0x5000];
	roll=rollh*256+rolll;
	
// 重新装入定时器0的初值；
	TH0=0xB9;
	TL0=0xB0;
	
	switch(sendflag)
{
// 向串口发送8253的计数值；
case 1:
{
printf("$%d,%d,%d,%d*",BUF810,BUF811,BUF812);
			sendflag=0;
}break;

// 向串口发送姿态反馈的数值；
case 0:
{
printf("$%d,%d,%d,%d*",yaw,pitch,roll);
sendflag=1;
}break;
}
}  

