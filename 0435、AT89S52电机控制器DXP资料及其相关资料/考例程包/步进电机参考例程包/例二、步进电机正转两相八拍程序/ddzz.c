
////////////////////////汇诚科技////////////////////
//////////////////http://www.ourhc.cn///////////////
///////////////////步进电机正转调试程序/////////////

#include<reg52.h>  

/*****P1.0=A ;P1.1=B ;P1.2=A' ; P1.3=B'****/  
code unsigned char run[8]={0x0e,0x0c,0x0d,0x09,0x0b,0x03,0x07,0x06};  //两相四线八拍工作方式
unsigned char s,i,j,k;

void delay(i)//延时函数
{
for(j=0;j<i;j++)
for(k=0;k<250;k++);
}
main()
{
unsigned char z,y;
y=30;	    //定义延时时间，时间越长电机转速越慢反之则快
while(1)
{
for(z=0;z<8;z++)  //改变数组的长度值需改变这个数字8，8为数组的长度。
{
P1=run[z];
delay(y);
}
}
}