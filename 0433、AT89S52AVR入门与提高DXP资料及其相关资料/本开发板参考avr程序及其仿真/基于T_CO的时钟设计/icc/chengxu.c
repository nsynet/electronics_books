#include <iom16v.h>
#define uchar unsigned char 
#define uint unsigned int
uchar Table[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};//数字0~9
uchar Data[4]={0,0,0,0};//位控制
uchar CNT=0;//计数初值
uchar Timer[2]={0x00,0x00};//初始时间00:00

////////////////////////////////////////////////////////////////////
void DelayMS(uint i)//延时
   {
    uint j;
    for(;i!=0;i--)
        {
          for(j=8000;j!=0;j--);
        }
   }
//////////////////////////////显示函数//////////////////////////////////////
void Display(uchar *p)
{
uchar i,sel=0x01;
for(i=0;i<4;i++)
{
PORTC=sel;              //选通最右边的数码管
PORTD=Table[p[i]];      //送数字码
DelayMS(1);             //显示延时
sel=sel<<1;             //移动显示位
}
}
///////////////////////////////计数值处理函数///////////////////////////////////////
//计数处理函数
//参数p1：时间数组名
//参数p2：显示数组名
//功能：将计数值拆分为BCD码的10分，分；10秒，秒
void Process(uchar *p1,uchar *p2)
{
p2[0]=p1[0]/10;
p2[1]=p1[0]-p2[0]*10;
p2[2]=p1[1]/10;
p2[3]=p1[1]-p2[2]*10;
}
//////////////////////////////初始化////////////////////////////////////
void Init_IO(void)//初始化I/O
{
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
//uchar Load;
Init_IO();  //初始化I/O
PORTC=0XFF; //点亮数码管
PORTD=0X00; //点亮数码管
DelayMS(30);//延时
PORTD=0xff; //关闭数码管
TCCR0=0x04; //T/C0工作方式选择，系统时钟256分频
//(上一句可以改为)TCCR0 |= (1<<CS02);//T/C0工作于定时方式，系统时钟256分频
TCNT0=0X06; //计数初始值
TIMSK=0x01;  //使能T0溢出中断
//(上一句可以改为)TIMSK |= (1<<TOIE0);  //使能T0溢出中断
SREG=0x80;  //使能全局中断
//(上一句可以改为)SREG |= (1<<7);  //使能全局中断
while(1)
{
 Process(Timer,Data);//计数初值处理
 Display(Data);      //动态扫秒显示
}
}
//////////////////////////T/CO中断服务函数//////////////////////////////////////////
#pragma interrupt_handler Timer0:10
void Timer0(void)
{
CNT++;           //中断次数累加
if(CNT==125)     //计数到125次，计数复位
{
CNT=0;
Timer[1]++;      //秒加1
if(Timer[1]==60)
{
Timer[1]=0;
Timer[0]++;      //分进位
}
if(Timer[0]==60)
{
Timer[0]=0;      //计数到最高位置位
}
}
}