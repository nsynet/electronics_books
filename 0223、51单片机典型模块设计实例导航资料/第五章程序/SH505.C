#include <reg52.h>
#include <absacc.h>
#include <stdio.h>
#include <math.h>

#define uchar unsigned char
uchar num;
uchar s1_out1,s1_out2,s1_out3,s1_out4,s2_out1,s2_out2,s2_out3,s2_out4;
uchar yout,u1,u2,u3,u4;

void main(void)
{
EA=1; 
ET0=1;
TMOD=0x01;
	
TH0=0x00;
TL0=0x00;
num=0;		
u1=-0.0107;
u2=0.3055;
u3=0.3046;
u4=0.3038;

TR0=1;							// 开始神经网络算法的计时，

// 神经网络算法的第一级输出      
s1_out1=(-0.6113*u1+1.1958*u2+0.1451*u3-1.4079*u4+2.0969);			
s1_out1=2/(1+exp(-2*s1_out1))-1;
s1_out2=(0.7955*u1+0.4564*u2+1.6416*u3-0.6515*u4-0.6728);
s1_out2=2/(1+exp(-2*s1_out2))-1;
s1_out3=(0.1069*u1+0.6961*u2-1.3756*u3+1.5583*u4-0.0661);
s1_out3=2/(1+exp(-2*s1_out3))-1;
s1_out4=(0.1996*u1+1.0877*u2+1.0905*u3+0.3446*u4-2.8265);
s1_out4=2/(1+exp(-2*s1_out4))-1;

// 神经网络算法的第二级输出      
s2_out1=(-1.0403*s1_out1-0.8898*s1_out2-1.3195*s1_out3+0.2691*s1_out4+2.0827);
s2_out1=2/(1+exp(-2*s2_out1))-1;
s2_out2=(-1.3146*s1_out1-0.4266*s1_out2+1.7021*s1_out3+0.0018*s1_out4+0.6756);
s2_out2=2/(1+exp(-2*s2_out2))-1;
s2_out3=(1.6830*s1_out1-0.9289*s1_out2+0.3520*s1_out3-0.2839*s1_out4+0.6526);
s2_out3=2/(1+exp(-2*s2_out3))-1;
s2_out4=(-1.4929*s1_out1-0.1193*s1_out2-0.4037*s1_out3-1.2339*s1_out4-2.0409);
s2_out4=2/(1+exp(-2*s2_out4))-1;

// 神经网络算法的输出      
yout=(-0.1805*s2_out1+0.9100*s2_out2+0.5065*s2_out3-0.2351*s2_out4-0.1674);      
      
TR0=0;	
ET0=0;
while(1){};
}

// 计算神经网络算法时间的计时器T0      
void intsvr1(void) interrupt 1 using 1
{
num++;
TH0=0x00;
TL0=0x00;
}  

