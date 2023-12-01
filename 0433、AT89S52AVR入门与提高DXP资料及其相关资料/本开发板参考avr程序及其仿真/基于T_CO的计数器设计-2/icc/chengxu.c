#include <iom8v.h>
#define uchar unsigned char 
#define uint unsigned int
uchar duan[10]={0xc0,0Xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};	 //所需的段的位码
//uchar wei[4]={0XFE,0XFD,0XFB,0XF7};                                 //位的控制端	(开发板)
uchar wei[4]={0X08,0X04,0X02,0X01};                                 //位的控制端	(仿真)
uint z,x,c,v, date;	//定义数据类型
uchar CNT=0;//计数初值
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
	  PORTD=duan[z];
	  delay(50);  
  	  PORTC=wei[1];
      PORTD=duan[x];
	  delay(50);  
   	  PORTC=wei[2];
      PORTD=duan[c];
	  delay(50);  
      PORTC=wei[3];
      PORTD=duan[v];
	  delay(50);  
 			               

 }
//////////////////////////////初始化////////////////////////////////////
void Init_IO(void)//初始化I/O
{
//设置B口为输入
DDRB=0x00;
PORTB=0x00;
//设置C口为输出
DDRC=0xFF;
PORTC=0xFF;
//设置D口为输出
DDRD=0XFF;
PORTD=0xFF;
}
/////////////////////////////主函数/////////////////////////////////////
void main(void)
{
uchar Load;
Init_IO();  //初始化I/O
PORTC=0XFF; //点亮数码管
PORTD=0X00; //点亮数码管
//DelayMS(30);//延时
PORTD=0xff; //关闭数码管
TCCR0=0x06; //T/C0工作方式选择，系统时钟256分频
TCNT0=CNT; //计数初始值
//TIMSK=0x01;  //使能T0溢出中断
//(上一句可以改为)TIMSK |= (1<<TOIE0);  //使能T0溢出中断
//SREG=0x80;  //使能全局中断
//(上一句可以改为)SREG |= (1<<7);  //使能全局中断
while(1)
{
 Load=TCNT0;
 date=Load;
 xianshi();
 //Process(Load,Data);//计数初值处理
// Display(Data);      //动态扫秒显示
}
}
