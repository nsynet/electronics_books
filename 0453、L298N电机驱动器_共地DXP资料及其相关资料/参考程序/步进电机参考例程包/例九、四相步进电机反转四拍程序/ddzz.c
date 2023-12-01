
////////////////////////汇诚科技////////////////////
//////////////////http://www.ourhc.cn///////////////
///////////////////步进电机反转调试程序/////////////

#include<reg52.h>  

/*****P1.0=A ;P1.1=B ;P1.2=A' ; P1.3=B'****/  
code unsigned char run[4]={0x08,0x04,0x02,0x01};  //四相四拍工作方式
unsigned char s,i,j,k;

void delay(i)//延时函数
{
for(j=0;j<i;j++)
for(k=0;k<250;k++);
}
main()
{
unsigned char z,y;
y=10;	    //定义延时时间，时间越长电机转速越慢反之则快
while(1)
{
for(z=0;z<4;z++)
{
P1=run[z];
delay(y);
}
}
}