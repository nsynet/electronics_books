#include <reg52.H>
#include <stdio.h>
#include <absacc.h>
unsigned char code table[]={ 0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0x40};
signed char sec=1; //定义计数值，每过1 秒，sec加1
unsigned int tcnt; //定时中断次数
unsigned char jd=0;
unsigned char gd=0;
bit write=0; //写24C08 的标志；
sbit gewei=P2^6; //个位选通定义
sbit shiwei=P2^5; //十位选通定义
sbit baiwei=P2^7; //百位选通定义
sbit qianwei=P2^4; //千位选通定义
sbit P10=P1^0;
sbit P11=P1^1;
sbit P12=P1^2;
sbit P13=P1^3;
sbit P14=P1^4;
sbit P15=P1^5;
sbit P16=P1^6;
sbit P17=P1^7;
sbit P30=P3^0;
sbit P31=P3^1;
sbit P32=P3^2;
sbit P35=P3^5;



sbit jia=P2^0;
sbit jian=P2^1;
sbit res=P2^2;

/////////24C08 读写驱动程序////////////////////
sbit scl=P3^3; // 24c08 SCL
sbit sda=P3^4; // 24c08 SDA
void delay1(unsigned char x)
{ unsigned int i;
for(i=0;i<x;i++);
;}
void flash()
{ ; ; }
void x24c08_init() //24c08 初始化子程序
{scl=1; flash(); sda=1;                     flash();}
void start() //启动（I方C）总线
{sda=1; flash(); scl=1; flash(); sda=0; flash(); scl=0; flash();}
void stop() //停止（I方C）总线
{sda=0; flash(); scl=1; flash(); sda=1; flash();}
void writex(unsigned char j) //写一个字节
{ unsigned char i,temp;
temp=j;
for (i=0;i<8;i++)
{temp=temp<<1; scl=0; flash(); sda=CY; flash(); scl=1; flash();}
scl=0; flash(); sda=1; flash();
}
unsigned char readx() //读一个字节
{
unsigned char i,j,k=0;
scl=0; flash(); sda=1;
for (i=0;i<8;i++)
{
flash(); scl=1; flash();
if (sda==1) j=1;
else j=0;
k=(k<<1)|j;
scl=0;}
flash(); return(k);
}
void clock() //(I方C）线时钟
{
unsigned char i=0;
scl=1; flash();
while ((sda==1)&&(i<255))i++;
scl=0; flash();
}
////////从24c02 的地址address 中读取一个字节数据/////
unsigned char x24c08_read(unsigned char address)
{
unsigned char i;
start(); writex(0xa0);
clock(); writex(address);
clock(); start();
writex(0xa1); clock();
i=readx(); stop();
delay1(10);
return(i);
}
//////向24c02 的address                     地址中写入一字节数据info/////
void x24c08_write(unsigned char address,unsigned char info)
{
EA=0;
start(); writex(0xa0);
clock(); writex(address);
clock(); writex(info);
clock(); stop();
EA=1;
delay1(50);
}
/////////////24C08 读写驱动程序完/////////////////////
void Delay(unsigned int tc) //延时程序
{
while( tc != 0 )
{unsigned int i;
for(i=0; i<100; i++);
tc--;}
}
void LED() //LED显示函数
{
qianwei=0; P0=0xc0; Delay(3); qianwei=1;
baiwei=0; P0=0xc0; Delay(3); baiwei=1;
shiwei=0; P0=table[sec/10]; Delay(3); shiwei=1;
gewei=0; P0=table[sec%10]; Delay(3); gewei=1;

}

void t0(void) interrupt 1 using 0 //定时中断服务函数
{
TH0=(65536-50000)/256; //对TH0 TL0 赋值
TL0=(65536-50000)%256; //重装计数初值
tcnt++; //每过250ust tcnt 加一
if(tcnt==1) //计满20次（1 秒）时
{
tcnt=0; //重新再计
write=1; //1 秒写一次24C08
}
}
void main(void)
{
TMOD=0x01; //定时器工作在方式1
ET0=1; EA=1;
x24c08_init(); //初始化24C08
sec=x24c08_read(2);//读出保存的数据赋于sec
TH0=(65536-50000)/256;                     //对TH0 TL0 赋值
TL0=(65536-50000)%256; //使定时器0.05 秒中断一次
TR0=1; //开始计时*/

while(1)
{


if(jia==0){Delay(8);   while(!jia){LED();}; {sec++;if(sec==36){sec=0;}} }
if(jian==0){ Delay(8); while(!jian){LED();};{sec--;if(sec<0){sec=35;}} }
if(res==0){sec=0;}
switch(sec)
{
case 0:P1=0X81;P30=1;P31=1;P32=1;P35=1;break;
case 1:P1=0X82;P30=1;P31=1;P32=1;P35=1;break;
case 2:P1=0X84;P30=1;P31=1;P32=1;P35=1;break;
case 3:P1=0X88;P30=1;P31=1;P32=1;P35=1;break;
case 4:P1=0X90;P30=1;P31=1;P32=1;P35=1;break;
case 5:P1=0XA0;P30=1;P31=1;P32=1;P35=1;break;
case 6:P1=0X41;P30=1;P31=1;P32=1;P35=1;break;
case 7:P1=0X42;P30=1;P31=1;P32=1;P35=1;break;
case 8:P1=0X44;P30=1;P31=1;P32=1;P35=1;break;
case 9:P1=0X48;P30=1;P31=1;P32=1;P35=1;break;
case 10:P1=0X50;P30=1;P31=1;P32=1;P35=1;break;
case 11:P1=0X60;P30=1;P31=1;P32=1;P35=1;break;
case 12:P1=0XC1;P30=0;P31=1;P32=1;P35=1;break;
case 13:P1=0XC2;P30=0;P31=1;P32=1;P35=1;break;
case 14:P1=0XC4;P30=0;P31=1;P32=1;P35=1;break;
case 15:P1=0XC8;P30=0;P31=1;P32=1;P35=1;break;
case 16:P1=0XD0;P30=0;P31=1;P32=1;P35=1;break;
case 17:P1=0XE0;P30=0;P31=1;P32=1;P35=1;break;
case 18:P1=0XC1;P30=1;P31=0;P32=1;P35=1;break;
case 19:P1=0XC2;P30=1;P31=0;P32=1;P35=1;break;
case 20:P1=0XC4;P30=1;P31=0;P32=1;P35=1;break;
case 21:P1=0XC8;P30=1;P31=0;P32=1;P35=1;break;
case 22:P1=0XD0;P30=1;P31=0;P32=1;P35=1;break;
case 23:P1=0XE0;P30=1;P31=0;P32=1;P35=1;break;
case 24:P1=0XC1;P30=1;P31=1;P32=0;P35=1;break;
case 25:P1=0XC2;P30=1;P31=1;P32=0;P35=1;break;
case 26:P1=0XC4;P30=1;P31=1;P32=0;P35=1;break;
case 27:P1=0XC8;P30=1;P31=1;P32=0;P35=1;break;
case 28:P1=0XD0;P30=1;P31=1;P32=0;P35=1;break;
case 29:P1=0XE0;P30=1;P31=1;P32=0;P35=1;break;
case 30:P1=0XC1;P30=1;P31=1;P32=1;P35=0;break;
case 31:P1=0XC2;P30=1;P31=1;P32=1;P35=0;break;
case 32:P1=0XC4;P30=1;P31=1;P32=1;P35=0;break;
case 33:P1=0XC8;P30=1;P31=1;P32=1;P35=0;break;
case 34:P1=0XD0;P30=1;P31=1;P32=1;P35=0;break;
case 35:P1=0XE0;P30=1;P31=1;P32=1;P35=0;break;
default:break;
}
LED();
if(write==1) //判断计时器是否计时一秒
{
write=0; //清零
x24c08_write(2,sec); //在24c08 的地址2 中写入数据sec
} 
}
}
