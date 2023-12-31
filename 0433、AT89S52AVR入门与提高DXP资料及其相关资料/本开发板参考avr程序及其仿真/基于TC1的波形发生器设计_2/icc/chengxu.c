#include <iom16v.h>
#define uchar unsigned char
#define uint  unsigned int

//数码管字型表，对应0，1，2，3，4，5，6，7，8，9//
uchar Table[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f};
uchar Data[4]={0,0,0,1};       //定义初始方波频率：1KHz
uchar Key1_Flag,Key2_Flag,Key3_Flag;

void DelayMs(uint i)           //Ms级延时，参数i为延时时间
{uint j;
 for(;i!=0;i--)
  {for(j=8000;j!=0;j--) {;}}
}

void Display(uchar *p)         //动态显示函数，参数p为待显示的数组名
{uchar i,sel=0x01;           
 for(i=0;i<4;i++)
  {PORTC=sel;                  //选通最右边的数码管
   PORTA=0xff-Table[p[i]];          //送字型码
   DelayMs(1);                 //显示延时    
   sel=sel<<1;                 //移位以显示前一位
  }
}

void Key_Process(uchar *p)
{uchar i,j,k;
 while((PINB&0x01)==0) {Display(Data);Key1_Flag=1;}                //处理频率百位，最高5
 while((PINB&0x02)==0) {Display(Data);Key2_Flag=1;}
 while((PINB&0x04)==0) {Display(Data);Key3_Flag=1;}
 if(Key1_Flag==1)
   {p[3]++;
	if(p[3]==10) p[3]=0;
	Key1_Flag=0;}   
 if(Key2_Flag==1)                 //处理频率十位，最高9
    {p[2]++;
	 if(p[2]==10) p[2]=0;
	 Key2_Flag=0;}
 if(Key3_Flag==1)                 //处理频率各位，最高9
    {p[1]++;
	 if(p[1]==10) p[1]=0;
	 Key3_Flag=0;}
}

void Set_Process(void)
{uint i,j;
 i=Data[0]*1000+Data[1]*100+Data[2]*10+Data[3];
 j=500/i;
 OCR1AH=j>>8;
 OCR1AL=j&0x00ff;
}

void Init_IO(void)             //初始化I/O口
{DDRA=0xff;                    //设置A口为推挽1输出
 PORTA=0xff;
 DDRC=0xff;                    //设置C口为推挽1输出             
 PORTC=0xff;
 DDRB=0x00;                    //设置B口为三态输入
 PORTB=0x00;
 DDRD=0xff;                    //设置D口为推挽1输出
 PORTD=0xff;    
}

void Init_Timer1(void)         //初始化T/C1的输入捕获中断
{TIMSK=TIMSK|0x10;             //输出比较使能
 TCCR1B=0x0a;                  //时钟1                                                               频,输出比较匹配清除定时器值
 TCNT1H=0x00;                  //清除定时器值
 TCNT1L=0x00;
 Set_Process();                //OCR1A,OCR1B置初值
 SREG=SREG|0x80;               //全局中断开
} 

void main(void)
{Init_IO();                    //初始化I/O口
 PORTA=0xff;                   //点亮以测试所有的数码管
 PORTC=0x00;   
 Init_Timer1();                
 DelayMs(30);                //延时
 PORTC=0xff;                   //熄灭所有的数码管
 while(1)
 {Key_Process(Data);
  Set_Process();
  Display(Data);               //动态扫描显示
 }
}

#pragma interrupt_handler Compare:7
void Compare(void)
{PORTD=~PORTD;}