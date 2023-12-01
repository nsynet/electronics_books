/********************************************************************
                            汇诚科技
网址：http://www.ourhc.cn
产品有售淘宝店：http://shop36330473.taobao.com   
*********************************************************************/
#include <iom8v.h>
#define uchar unsigned char 
#define uint unsigned int
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
PORTD=0xff;
}
/////////////////////////////主函数/////////////////////////////////////
void main(void)
{
Init_IO();  //初始化I/O
while(1)
{
while((PIND&0X04)==0)//按键加计数标志
{PORTB=0x55;}
while((PIND&0X08)==0)//按键减计数标志
{PORTB=0xaa;}
while((PIND&0X10)==0)//按键加计数标志
{PORTB=0x0f;}
while((PIND&0X20)==0)//按键减计数标志
{PORTB=0xf0;}
}
}
