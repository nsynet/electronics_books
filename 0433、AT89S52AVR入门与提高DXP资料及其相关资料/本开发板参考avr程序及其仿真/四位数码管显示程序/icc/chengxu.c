#include <iom16v.h>
#include <macros.h>
#define uchar unsigned char 
#define uint unsigned int
#define CON 1000   
//频率常数定义
uchar Flag=0;   //捕获次数定义
uint CNT1;
uint CNT2;
uint CNT=100;
///////////////////////////////////////////////////////////////////////////////
uchar duan[10]={0xc0,0Xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};	 //所需的段的位码
//uchar wei[4]={0XEf,0XDf,0XBf,0X7f};                                 //位的控制端	(开发板)
uchar wei[4]={0X08,0X04,0X02,0X01};                                 //位的控制端	(仿真)
uint z,x,c,v, date;	//定义数据类型
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
//////////////////////////////显示函数//////////////////////////////////////
void DelayMS(uint i)
{
uint j;
for (;i!=0;i--)
{for(j=2000;j!=0;j--){;}}
}
////////////////////////////////////////////////////////////////////////////////
/**********************************************************************
                数码管动态扫描
*********************************************************************/
void Pre_Display()
 { 
 /*****************数据转换*****************************/ 
  z=date/1000;			 //求千位
  x=date%1000/100;		 //求百位
  c=date%100/10;		 //求十位
  v=date%10;			 //求个位

      PORTC=wei[0];
	  PORTA=duan[z];
	  DelayMS(3);  
  	  PORTC=wei[1];
      PORTA=duan[x];
	  DelayMS(3);  
   	  PORTC=wei[2];
      PORTA=duan[c];
	  DelayMS(3);  
      PORTC=wei[3];
      PORTA=duan[v];
	  DelayMS(3);  
 			               

       }
///////////////////////////////计数值处理函数///////////////////////////////////
/*void HZ(uint i;uchar *p)
{
uint TEM;
p[0]=CON/i;
TEM=CON%i;
TEM=CON*10;
p[1]=TEM/i;
TEM=TEM%i;
TEM=TEM*10;
p[2]=TEM/i;
TEM=TEM%i;
TEM=TEM*10;
p[3]=TEM/i;
}*/

//////////////////////////////初始化////////////////////////////////////
void Init_IO(void)//初始化I/O
{
//设置A口为输入
DDRA=0xFF;
PORTA=0xFF;
//设置C口为输出
DDRC=0xFF;
PORTC=0xFF;
//设置D口为输出
DDRD=0X00;
PORTD=0x00;
}
//////////////////////////////////////////////////////////////////////
/*void Init_Timer1(void)
{
TIMSK=TIMSK|0x20;
TCCR1B=0xc2;
TIFR=0x20;
SREG=SREG&0x7f;
}*/
/////////////////////////////主函数/////////////////////////////////////
void main(void)
{
uchar i;
Init_IO();  //初始化I/O
PORTA=0X00; //点亮数码管
PORTC=0X0f; //点亮数码管
DelayMS(300);//延时
PORTC=0x00; //关闭数码管
//Pre_Display();
//PORTC=0xff; //关闭数码管
//Init_Timer1();
while(1)
{
date=2345;
Pre_Display();
 /*while(TIFR&0X20)
 {
 TIFR|=0x20;
 CNT=ICR1L;
 CNT2=(ICR1H<<8)+ICR1L;
 CNT=CNT2-CNT1;
 CNT1=CNT2;
 Flag++;
 }
 if(Flag==2)
 {
 Flag=0;
 HZ(CNT,Data);
 for(i=0;i<100;i++)
 Display(Data);
 CNT=0;CNT1=0;CNT2=0;
 }*/
}
}
