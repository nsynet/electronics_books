#include <reg52.h>
#include <absacc.h>
#include <stdio.h>
#include <math.h>
#define uchar unsigned char
#define uint unsigned int
sbit	P36	= P3^6;					// 比较器内部判断脚
// 内部标志位定义
bit	less;							// 比较是否大于 1.小于，0.大于
// 全局变量定义
uchar  timer1;		        			// 通用延时计数器
uchar  adcdata;						// ad转换变量

void Delay(unsigned int number);      	// 毫秒延时
uchar adcread(void);					// adc转换程序

void main(void)  using 0
{
TMOD = 0x11;					// 计数器设定
IP = 0x8;						// 优先级的设定
IE = 0x8A;						// 中断允许
TCON = 5;						// 外部中断低电平触发
TR0 = 1;						// 打开定时器中断 
TR1 = 0;
ET0 = 1;
ET1 = 0;
P1 = 0xff;
Delay(120);
while(1) 
{
adcdata= adcread();				// 读取数据进行A/D转换
}
}
// 毫秒延时
void Delay(unsigned int number) 
{
unsigned char temp;
for(;number!=0;number--) 
for(temp=112;temp!=0;temp--);
}

//  6位 ADC转换
uchar adcread(void)
{
uchar i=0x3f,temp=0;					// 初始化转换变量
P36 =1;							// 比较器端口置1
P1 = 3; _nop_();_nop_();				// 从零开始转换
while ((i--)&& (P36))					// 开始数据读取和比较
{
temp += 4;
P1 = temp|3;
_nop_(); 
}
temp >>= 2;
return temp;							// 转换完毕，返回
} 

