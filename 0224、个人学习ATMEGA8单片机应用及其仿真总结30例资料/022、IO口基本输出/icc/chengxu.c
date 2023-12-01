#include <iom8v.h>
#define uchar unsigned char 
#define uint unsigned int
//////////////////////////////初始化////////////////////////////////////
void Init_IO(void)//初始化I/O
{
//设置B口为输出
DDRB=0xFF;
PORTB=0xFF;
//设置C口为输出
DDRC=0xFF;
PORTC=0xFF;
//设置D口为输入
DDRD=0X00;
PORTD=0xFF;
}
/////////////////////////////主函数/////////////////////////////////////
void main(void)
{
Init_IO();  //初始化I/O
while(1)
{

if((PIND&0X01)==0)//按键加计数标志
{PORTB=0xfe;}
if((PIND&0X02)==0)//按键加计数标志
{PORTB=0xfd;}
if((PIND&0X04)==0)//按键加计数标志
{PORTB=0xfb;}
if((PIND&0X08)==0)//按键加计数标志
{PORTB=0xf7;}
if((PIND&0X10)==0)//按键加计数标志
{PORTC=0xfe;}
if((PIND&0X20)==0)//按键加计数标志
{PORTC=0xfd;}
if((PIND&0X40)==0)//按键加计数标志
{PORTC=0xfb;}
if((PIND&0X80)==0)//按键加计数标志
{PORTC=0xf7;}
}
}
