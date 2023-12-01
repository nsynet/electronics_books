#include <iom8v.h>
#include <macros.h> 
#define uchar unsigned char 
#define uint unsigned int
uint x=200;
/**********************************************************************
				   初始化					   	
**********************************************************************/
void Init_IO(void)//初始化I/O
{
//设置B口为输出
DDRB=0x3F;
PORTB=0x3F;
//设置C口为输出
DDRC=0xFF;
PORTC=0xFF;
//设置D口为输入
DDRD=0X00;
PORTD=0x00;
}
/******************************************************************
延时函数
******************************************************************/
void delay(uint t)
{
  uint i,j;
   for(i=0;i<t;i++)
   {
   	 for(j=1000;j>0;j--);
	 WDR();//WDT 复位 
	 { ;
	 }
   }
}
/**********************************************************************
				  主函数				   	
**********************************************************************/
void main(void)
{
Init_IO();  //初始化I/O

while(1)
{
delay(x);
PORTC=0x0f;
delay(x);
PORTB=0x07;
delay(x);
PORTB=0x0b;
delay(x);
PORTB=0x0d;
delay(x);
PORTB=0x0e;
delay(x);
PORTB=0x0f;
PORTC=0x07;
delay(x);
PORTC=0x0b;
delay(x);
PORTC=0x0d;
delay(x);
PORTC=0x0e;
delay(x);
PORTC=0x0a;
delay(x);
PORTC=0x05;
delay(x);
PORTC=0x0f;
delay(x);
PORTC=0x00;
delay(x);
PORTC=0x0f;
delay(x);
PORTB=0x0a;
delay(x);
PORTB=0x05;
delay(x);
PORTB=0x0f;
delay(x);
PORTB=0x00;
delay(x);
PORTB=0x0f;
delay(x);
PORTB=0x00;
PORTC=0x00;
delay(x);
PORTB=0x0F;
PORTC=0x0F;
}
}
