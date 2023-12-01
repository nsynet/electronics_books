#include <reg51.h>
#include <stdio.h>
#define uchar unsigned char
#define uint unsigned int

sbit P1_0=P1^0; 							// 引脚连接关系
sbit P1_1=P1^1;
sbit P1_2=P1^2;

uchar readclk(uchar addr)
{
uchar i,k;
P1_1=0;
addr=1;
P1_2=1;
k=1;
for (i=0;i<8;i++)					// 按时序读RAM中的数据
{
if (addr&k)P1_0=1;
else P1_0=0;
P1_1=1;
k<<=1;
P1_1=0;
}

k=0;
P1_0=1;
for (i=0;i<8;i++)
{
k>>=1;
P1_1=0;
if(P1_0) k|=0x80;
P1_1=1;
}

P1_2=0;
return k;
} 

void writeclk(uchar addr, uchar d)
{
uchar i,k;
P1_1=0;						// clk
P1_2=1;						// 片选
addr&=0xfe;
k=1;
for (i=0;i<8;i++)
{
if (addr&k) P1_0=1; 			// 按时序写RAM中的数据
else P1_0=0;
P1_1=1;
k<<=1;
P1_1=0;
}
k=1;
for (i=0;i<8;i++)
{
if(d&k) P1_0=1;
else P1_0=0;
P1_1=1;
k<<=1;
P1_1=0;
}
P1_2=0;
} 

void main(void)
 {
unsigned char addr,d;
addr=0;
d=readclk(0xc0|addr); 				//读内部RAM 0:
addr=1; 						//读内部RAM 1:
d=readclk(0xc0|addr);

addr=0;
d=5; 					//写内部RAM 0，写入5:
writeclk(0xc1|addr,d);
addr=1;
d=123; 					//读内部RAM 1，写入123:
d=readclk(0xc0|addr);
addr=0;
d=3; 					//写内部时钟日历数据0：秒，写入03秒
writeclk(0x80|addr,d);
}


