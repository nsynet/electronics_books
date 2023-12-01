#include <iom8v.h>
#include <macros.h> 
/**********************************************************************
				  函数数据类型说明							   	
**********************************************************************/
#define uchar unsigned char 
#define uint unsigned int
/**********************************************************************
				  MS级延时函数程序，参数i 延时时间								   	
**********************************************************************/
void DelayMS(uint i)
{
uint j;
for(;i!=0;i--)
{
for(j=1000;j!=0;j--);
}
}
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
/**********************************************************************
				  主函数				   	
**********************************************************************/
void main(void)
{
Init_IO();  //初始化I/O
while(1)
{
WDR();//WDT 复位 
if((PIND&0X01)==0)//按下PD0,PC0闭合
{PORTC=0xFE;PORTB=0xFF;}
if((PIND&0X02)==0)//按下PD1,PC1闭合
{PORTC=0xFD;PORTB=0xFF;}
if((PIND&0X04)==0)//按下PD2,PC2闭合
{PORTC=0xFB;PORTB=0xFF;}
if((PIND&0X08)==0)//按下PD3,PC3闭合
{PORTC=0xF7;PORTB=0xFF;}
if((PIND&0X10)==0)//按下PD4,PB0闭合
{PORTB=0xFE;PORTC=0xFF;}
if((PIND&0X20)==0)//按下PD5,PB1闭合
{PORTB=0xFD;PORTC=0xFF;}
if((PIND&0X40)==0)//按下PD6,PB2闭合
{PORTB=0xFB;PORTC=0xFF;}
if((PIND&0X80)==0)//按下PD7,PB3闭合
{PORTB=0xF7;PORTC=0xFF;}
}
}
