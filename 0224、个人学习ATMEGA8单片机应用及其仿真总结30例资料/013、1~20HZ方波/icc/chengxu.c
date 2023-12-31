#include <iom8v.h>
#define uchar unsigned char 
#define uint unsigned int
//定义BIT 0-7 置1 
#define BIT0_POS (1<<0)   
#define BIT1_POS (1<<1) 
#define BIT2_POS (1<<2) 
#define BIT3_POS (1<<3) 
#define BIT4_POS (1<<4) 
#define BIT5_POS (1<<5) 
#define BIT6_POS (1<<6) 
#define BIT7_POS (1<<7) 

//定义BIT 0-7 清零 
#define BIT0_NEG ((unsigned char)(~(1<<0))) 
#define BIT1_NEG ((unsigned char)(~(1<<1))) 
#define BIT2_NEG ((unsigned char)(~(1<<2))) 
#define BIT3_NEG ((unsigned char)(~(1<<3))) 
#define BIT4_NEG ((unsigned char)(~(1<<4))) 
#define BIT5_NEG ((unsigned char)(~(1<<5))) 
#define BIT6_NEG ((unsigned char)(~(1<<6))) 
#define BIT7_NEG ((unsigned char)(~(1<<7))) 

//定义红色LED熄灭、亮、翻转 
#define LED_red_OFF PORTB&=BIT2_NEG 
#define LED_red_ON   PORTB|=BIT2_POS   
#define LED_red_OTN PORTB^=BIT2_POS 

uchar CNT=0;//计数初值
uchar CNT1=0;//判断值
uchar CNT2=0;//改变频率值
////////////////////////////////////////////////////////////////////
void DelayMS(uint i)//延时
   {
    uint j;
    for(;i!=0;i--)
        {
          for(j=8000;j!=0;j--);
        }
   }
//////////////////////////////初始化////////////////////////////////////
void Init_IO(void)//初始化I/O
{
//设置C口为输出
DDRC=0xFF;
PORTC=0xFF;
//设置B口为输出
DDRB=0XFF;
PORTB=0xFF;
}
/////////////////////////////主函数/////////////////////////////////////
void main(void)
{
//uchar Load;
Init_IO();  //初始化I/O
TCCR0=0x04; //T/C0工作方式选择，系统时钟256分频
//(上一句可以改为)TCCR0 |= (1<<CS02);//T/C0工作于定时方式，系统时钟256分频
TCNT0=0X06; //计数初始值
TIMSK=0x01;  //使能T0溢出中断
//(上一句可以改为)TIMSK |= (1<<TOIE0);  //使能T0溢出中断
SREG=0x80;  //使能全局中断
//(上一句可以改为)SREG |= (1<<7);  //使能全局中断
while(1)
{

}
}
//////////////////////////T/CO中断服务函数//////////////////////////////////////////
#pragma interrupt_handler Timer0:10
void Timer0(void)
{
CNT++;           //中断次数累加
CNT2++;
if(CNT==4)     //计数到125次，计数复位
{
CNT=0;
CNT1++;
LED_red_OTN;

}

}