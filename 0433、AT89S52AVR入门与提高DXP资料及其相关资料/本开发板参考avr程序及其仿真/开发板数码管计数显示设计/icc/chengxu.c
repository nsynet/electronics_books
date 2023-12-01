#include <iom16v.h>
#define uchar unsigned char 
#define uint unsigned int
#define WEI PORTC
#define DUAN PORTA

uchar table[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};

uint cnt=0000;//计数初值

uchar key_up;
uchar key_down;
////////////////////////////////////////////////////////////////////
void delayms(uint i)//延时
{
uint j;
for(;i!=0;i--)
{
for(j=8000;j!=0;j--);
}
}
////////////////////////////////////////////////////////////////////
void delayus(uint i)//延时
{
uint j;
for(;i!=0;i--)
{
for(j=100;j!=0;j--);
}
}
////////////////////////////////////////////////////////////////////
void Led() //显示函数
{
uchar m=1;//消隐延时

WEI=0x7f; //输出低电平，选通千位数
DUAN=table[cnt/1000]; //取出千位数，查表，输出。
delayus(m); //延时
WEI=0xbf;
//delayus(m); //延时
DUAN=0xff;
WEI=0xbf; //输出低电平，选通百位数
DUAN=table[cnt%1000/100]; //取出百位数，查表，输出。
delayus(m); //延时
WEI=0xff;
//delayus(m); //延时
DUAN=0xff;
WEI=0xdf; //输出低电平，选通十位数
DUAN=table[cnt%100/10]; //取出十位数，查表，输出。
delayus(m); //延时
WEI=0xff;
//delayus(m); //延时
DUAN=0xff;
WEI=0xef;
DUAN=table[cnt%10]; //取出个位数，查表，输出。
delayus(m);
WEI=0xff;
delayus(m); //延时
DUAN=0xff;

}
//////////////////////////////////////////////////////////////////
void init_io(void)//初始化I/O
{
//设置A口为输出
DDRA=0XFF;
PORTA=0xFF;
//设置B口为输出
DDRB=0XFF;
PORTB=0xFF;
//设置C口为输入
DDRC=0xFF;
PORTC=0xFF;
//设置D口为输出
DDRD=0XFF;
PORTD=0xFF;
}

//////////////////////////////////////////////////////////////////

void get_key(void)//按键扫描函数

{
while((PINB&0X01)==0)//按键加计数标志
{key_up=1;
Led();
}
while((PINB&0X02)==0)//按键减计数标志
{key_down=1;
Led();}
}
//////////////////////////////////////////////////////////////////
void main(void)
{
init_io();//初始化I/O

while(1)
{
get_key();//按键扫描
Led();
cnt=1234;
/*
if (key_up==1)
       {
if(cnt!=9999)//判断是否计数到9999
             {
               cnt=cnt+1;//加一
               key_up=0;
			   }
        }
if (key_down==1)
     {
if(cnt!=0)//判断是否计数到0
       {
	   cnt=cnt-1;//减一
       key_down=0;
       }
     }
	 */
}
}