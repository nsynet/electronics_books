#include <iom16v.h>
#define uchar unsigned char
#define uint  unsigned int

//数码管字型表，对应0，1，2，3，4，5，6，7，8，9//
uchar Table[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f};
uchar Data[4]={0,0,0,0};       //显示初始值：0 0 0 0
uchar CNT=0;                   //初始计数值：0
uchar Timer[2]={0x00,0x00};    //初始时间00：00 

void DelayMs(uint i)           //Ms级延时，参数i为延时时间
{uint j;
 for(;i!=0;i--)
  {for(j=8000;j!=0;j--) {;}}
}

void Display(uchar *p)         //动态显示函数，参数p为待显示的数组名
{uchar i,sel=0x01;           
 for(i=0;i<4;i++)
  {PORTC=sel;                  //选通最右边的数码管
   PORTA=Table[p[i]];          //送字型码
   DelayMs(2);                 //显示延时    
   sel=sel<<1;                 //移位以显示前一位
  }
}

//计数值处理函数。参数p1:时间数组名；参数p2:显示数组名//
//功能：此函数用于将计数值拆分为BCD码的10分，分，10秒，秒//
void Process(uchar *p1,uchar *p2) 
{p2[0]=p1[0]/10;
 p2[1]=p1[0]-p2[0]*10;
 p2[2]=p1[1]/10;
 p2[3]=p1[1]-p2[2]*10;
}

void Init_IO(void)             //初始化I/O口
{DDRA=0xff;                    //设置A口为推挽1输出
 PORTA=0xff;
 DDRC=0xff;                    //设置C口为推挽1输出；             
 PORTC=0xff;
}

void main(void)
{uchar Load; 
 Init_IO();                    //初始化I/O口
 PORTA=0xff;                   //点亮以测试所有的数码管
 PORTC=0x00;                   
 DelayMs(30);                //延时
 PORTC=0xff;                   //熄灭所有的数码管
 TCCR0=0x04;                   //T/C0工作于定时方式，系统时钟256分频
 TCNT0=0x06;   
 SREG=0X80;
 TIMSK=0X01;                //计数初始值6    
 while(1)
 {Process(Timer,Data);          //计数值处理
  Display(Data);               //动态扫描显示
 }
}

//********************T/C0中断服务函数********************//
#pragma interrupt_handler Timer0:10 
void Timer0(void)
{CNT++;                        //中断次数累加
 if(CNT==125)           
    {CNT=0;                    //计数到125次，计数值复位
	 Timer[1]++;               //秒加1
	 if(Timer[1]==60)
	    {Timer[1]=0;
		 Timer[0]++;}          //分进位
     if(Timer[0]==60)
	     Timer[0]=0;}          //计数到达最高位，计数复位
}
