/********************************************************************
                            汇诚科技
网址：http://www.ourhc.cn
产品有售淘宝店：http://shop36330473.taobao.com   
*********************************************************************/
#include <iom8v.h>
#define uchar unsigned char 
#define uint unsigned int
uchar duan[10]={0xc0,0Xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};	 //所需的段的位码
//uchar wei[4]={0XFE,0XFD,0XFB,0XF7};                                 //位的控制端	(开发板)
uchar wei[4]={0X08,0X04,0X02,0X01};                                 //位的控制端	(仿真)
uint z,x,c,v, date;	//定义数据类型
uchar CNT=0;//计数初值
uint lck=0;
uint Load;
/******************************************************************

延时函数

******************************************************************/
void delay(uchar t)
{
  uchar i,j;
   for(i=0;i<t;i++)
   {
   	 for(j=13;j>0;j--);
	 { ;
	 }
   }
}

/**********************************************************************
                数码管动态扫描
*********************************************************************/
void xianshi()
 { 
 /*****************数据转换*****************************/ 
  z=date/1000;			 //求千位
  x=date%1000/100;		 //求百位
  c=date%100/10;		 //求十位
  v=date%10;			 //求个位

      PORTC=wei[0];
	  PORTB=duan[z];
	  delay(50);  
  	  PORTC=wei[1];
      PORTB=duan[x];
	  delay(50);  
   	  PORTC=wei[2];
      PORTB=duan[c];
	  delay(50);  
      PORTC=wei[3];
      PORTB=duan[v];
	  delay(50);  
 			               

 }

//////////////////////////////初始化////////////////////////////////////
void Init_IO(void)//初始化I/O
{
//设置B口为输入
DDRB=0xFF;
PORTB=0xFF;
//设置C口为输出
DDRC=0xFF;
PORTC=0xFF;
//设置D口为输出
DDRD=0X00;
PORTD=0x00;
}
/////////////////////////////主函数/////////////////////////////////////
void main(void)
{

Init_IO();  //初始化I/O
PORTC=0XFF; //点亮数码管
PORTB=0X00; //点亮数码管
delay(30);//延时
PORTB=0xff; //关闭数码管

TCCR0=0x02; //T/C0工作方式选择，8分频
TCNT0=0x9c; //计数初始值9c

TCCR1B=0x06; //T/C0工作方式选择，下降沿
TCNT1H=0X00;
TCNT1L=0X00;
TIMSK=0x01;  //使能T0溢出中断

SREG=0x80;  //使能全局中断
while(1)
{
 date=Load; //计数值
 xianshi(); //动态扫秒显示
}
}
//////////////////////////T/CO中断服务函数//////////////////////////////////////////
#pragma interrupt_handler Timer0:10
void Timer0(void)
{
 TCNT0=0xa0; //计数初始值9c
 lck++;
 if(lck==1000)
       {
        Load=TCNT1H*256+TCNT1L;//求出计数值
 	    lck=0;
		TCNT1H=0X00;
        TCNT1L=0X00;
       }
}
