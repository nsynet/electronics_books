#include <iom8v.h>
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
注意：使用开发板时sel=0xef;
**********************************************************************/
void Display(uchar *p)         //动态显示函数，参数p为待显示的数组名
{uchar i,sel=0x01;           
 for(i=0;i<4;i++)
  {PORTB=sel;                  //选通最右边的数码管
   PORTD=~Table[p[i]];         //送字型码
   if(i==0){PORTB=PORTB&0X7f;} //增加小数点
   DelayMs(1);                 //显示延时    
   sel=sel<<1;                 //移位以显示前一位
  }
}
/**********************************************************************
								电压值处理函数								   	
**********************************************************************/
uint ADC_Convert(void)
{uint temp1,temp2;
 temp1=(uint)ADCL;//先读ADCL
 temp2=(uint)ADCH;//再读ADCH
 temp2=(temp2<<8)+temp1;//求值
 temp2=temp2*49/10;//求显示的电压值（0~5.12）V
 return(temp2);
}
/**********************************************************************
								显示处理函数										   	
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
                      初始化I/O口
**********************************************************************/
void Init_IO(void)             //初始化I/O口
{
 DDRC=0x00;                    //设置A口为不带上拉输入；
 PORTC=0x00;
 DDRB=0xff;                    //设置B口为推挽1输出；
 PORTB=0xff;
 DDRD=0xff;                    //设置C口为推挽1输出；
 PORTD=0xff;
}
/**********************************************************************
								主函数								   	
**********************************************************************/
void main(void)
{uint i;
 Init_IO();
 ADMUX=0x00;                   //选择第一通道；
 /**********************转换速率应在50~200K****************************/
 ADCSR=0xe6;                   //125K转换速率，自由转换模式；启动AD转换器；
 DelayMs(300);                //延时待系统稳定；
 while(1)
 {
  i=ADC_Convert();             //显示电压值(0~1024)
  Process(i,Data);
  Display(Data);
 }
}
/**********************************************************************
								程序结束								   	
**********************************************************************/