#include <iom16v.h>
#include <macros.h> 
#define uchar unsigned char
#define uint  unsigned int
/**********************************************************************
								定义数组								   	
**********************************************************************/
uchar Table[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f};
uchar Data[4]={0,0,0,0};
/**********************************************************************
								延时函数								   	
**********************************************************************/
void DelayMs(uint i)  //0.25ms
{uchar j;
 for(;i!=0;i--)
  {for(j=250;j!=0;j--) {;}}
}
/**********************************************************************
								显示函数								   	
**********************************************************************/
void Display(uchar *p) //间隔5ms显示
{uchar i,sel=0x01;
 for(i=0;i<4;i++)
  {PORTD=sel;
   PORTB=0xff-Table[p[i]];
   DelayMs(20);
   sel=sel<<1;
  }
}
/**********************************************************************
								电压值处理								   	
**********************************************************************/
uint ADC_Convert(void)
{uint temp1,temp2;
 temp1=(uint)ADCL;
 temp2=(uint)ADCH;
 //temp1=2;
 //temp2=1;
 //temp2=2356;
 temp2=(temp2<<8)+temp1;
 temp2=temp2*4;
 return(temp2);
}
/**********************************************************************
								显示处理								   	
**********************************************************************/
void Process(uint i,uchar *p)
{p[0]=i/1000;
 i=i%1000;
 p[1]=i/100;
 i=i%100;
 p[2]=i/10;
 i=i%10;
 p[3]=i;
}
/**********************************************************************
								主函数								   	
**********************************************************************/
void main(void)
{uint i;
 DDRA=0x00;                    //设置A口为不带上拉输入；
 PORTA=0x00;
 DDRB=0xff;                    //设置B口为推挽1输出；
 PORTB=0xff;
 DDRD=0xff;                    //设置C口为推挽1输出；
 PORTD=0xff;
 PORTB=0x00;                   //B口初始化输出1；C口初始化输出0；点亮全部数码管；
 PORTD=0xff;
 ADMUX=0x00;                   //选择第一通道；
 ADCSR=0xe6;                   //125K转换速率，自由转换模式；启动AD转换器；
 DelayMs(3000);                //延时待系统稳定；
 while(1)
 {
  i=ADC_Convert();             //显示电压值(0~1024)
  //i=5678;
  Process(i,Data);
  Display(Data);
 }
}
/**********************************************************************
								程序结束								   	
**********************************************************************/