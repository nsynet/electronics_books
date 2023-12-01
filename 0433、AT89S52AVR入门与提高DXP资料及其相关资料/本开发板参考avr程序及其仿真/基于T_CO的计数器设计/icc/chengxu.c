#include <iom16v.h>
#define uchar unsigned char 
#define uint unsigned int
uchar Table[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};//数字0~9
uchar Data[4]={0,0,0,0};//位控制
uchar CNT=0;//计数初值

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
void Process(uchar i,uchar *p)
{
p[0]=i/1000;
i=i%1000;
p[1]=i/100;
i=i%100;
p[2]=i/10;
i=i%10;
p[3]=i;
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
DelayMS(30);//延时
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
 Process(Load,Data);//计数初值处理
 Display(Data);      //动态扫秒显示
}
}
