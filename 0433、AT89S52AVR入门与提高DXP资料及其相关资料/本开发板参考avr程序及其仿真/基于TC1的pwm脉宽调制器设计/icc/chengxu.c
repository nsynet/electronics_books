#include <iom16v.h>
#define uchar unsigned char
#define uint  unsigned int

//数码管字型表，对应0，1，2，3，4，5，6，7，8，9,E//
uchar Table[12]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x79};
uchar Data1[4]={10,0,5,0};      //定义初始方波占空比：50％
uchar Data2[4]={3,9,1,0};            //设定PWM频率：8M/2046=3910Hz 
uchar Key1_Flag,Key2_Flag;
            
void DelayMs(uint i)           //Ms级延时，参数i为延时时间
{uint j;
 for(;i!=0;i--)
  {for(j=8000;j!=0;j--) {;}}
}

void Display(uchar *p)         //动态显示函数，参数p为待显示的数组名
{uchar i,sel=0x01;           
 for(i=0;i<4;i++)
  {
   PORTC=~sel;                  //选通最右边的数码管
   PORTA=~(0xff-Table[p[i]]);     //送字型码
   //PORTA=Table[2];     //送字型码
   DelayMs(1);                 //显示延时    
   sel=sel<<1;                 //移位以显示前一位
  }
}

void Add_Process(uchar *p)
{if(p[1]!=1)
  {p[2]=p[2]+1;
   if(p[2]==10) {p[2]=0;p[1]++;}
  }
}

void Sub_Process(uchar *p)
{uchar temp;
 temp=p[1]*10+p[2];
 if(temp!=0)
  {temp=temp-1;
   p[1]=temp/10;
   p[2]=temp-p[1]*10;
  }
}
 
void Key_Process()
{while((PINB&0x01)==0) {Display(Data1);Key1_Flag=1;}  
 while((PINB&0x02)==0) {Display(Data1);Key2_Flag=1;}
 if(Key1_Flag==1)
     {Add_Process(Data1);           
	  Key1_Flag=0;}
 if(Key2_Flag==1)
     {Sub_Process(Data1);
	  Key2_Flag=0;} 
}
	    
void Set_Process(uchar *p)
{uint i;
 i=p[1]*10+p[2];
 i=1023*i/10;
 OCR1AH=i>>8;
 OCR1AL=i&0x00ff;
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

void main(void)
{uchar i;
 Init_IO();                    //初始化I/O口
 PORTA=0xff;                   //点亮以测试所有的数码管
 PORTC=0x00;   
 //DelayMs(300);                 //延时
 PORTC=0xff;                   //熄灭所有的数码管
 TCCR1A=0xc3;                  //10位PWM,向上计数清除OC1A，向下计数置位OC1A
 TCCR1B=0x02;                  //时钟8分频,最小频率1M/2046=0.5KHz       
 while(1)
 {Key_Process();
  Set_Process(Data1);         //设置PWM占空比
  for(i=50;i!=0;i--)
    Display(Data1);
  for(i=50;i!=0;i--)
    Display(Data2);
 }
}