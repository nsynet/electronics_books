#include <iom16v.h>
#define uchar unsigned char
#define uint  unsigned int

//数码管字型表，对应0，1，2，3，4，5，6，7，8，9//
uchar Table[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f};
uchar Data[4]={0,0,0,0};       //显示初始值：0 0 0 0
uint  CNT=0;                    //初始计数值：0 

void DelayMs(uint i)           //Ms级延时，参数i为延时时间
{uint j;
 for(;i!=0;i--)
  {for(j=8000;j!=0;j--) {;}}
}

void Display(uchar *p)         //动态显示函数，参数p为待显示的数组名
{uchar i,sel=0x01;           
 for(i=0;i<4;i++)
  {PORTC=sel;                  //选通最右边的数码管
   PORTA=~Table[p[i]];          //送字型码
   DelayMs(2);                 //显示延时    
   sel=sel<<1;                 //移位以显示前一位
  }
}

//计数值处理函数。参数i:计数值；参数p:处理数据存放的数组名//
//功能：此函数用于将计数值拆分为BCD码的千，百，十，一数据，用于查表显示//
void Process(uchar i,uchar *p) 
{p[0]=i/1000;
 i=i%1000;
 p[1]=i/100;
 i=i%100;
 p[2]=i/10;
 i=i%10;
 p[3]=i;
}

void Init_IO(void)             //初始化I/O口
{DDRA=0xff;                    //设置A口为推挽1输出
 PORTA=0xff;
 DDRB=0x00;                    //设置B口为不带上拉电阻输入
 PORTB=0x00;    
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
 TCCR0=0x06;                   //T/C0工作于计数方式，下降沿计数
 TCNT0=CNT;                    //计数初始值0    
 while(1)
 {Load=TCNT0;
  Process(Load,Data);          //计数值处理
  Display(Data);               //动态扫描显示
 }
}