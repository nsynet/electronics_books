#include <msp430x14x.h>
#define   uint  unsigned int
#define   uchar unsigned char
/******************************************define  lcd******/
#define LCD_CS   BIT2
#define LCD_DAT  BIT4
#define LCD_SCK  BIT3
#define  WR  BIT2
#define  RS  BIT1
/************************************************************/

uchar charge=0;
uchar SYNCH=0xfe;  //LCD显示同步字
static uchar adc_flag=0;
static uchar time_flag=0;
static uchar count=0;
uint AD_TEMP=0;
float AD=0;
void int_clk()
{
    uchar i;
    BCSCTL1&=~XT2OFF;  //打开XT振荡器
    BCSCTL2|=SELM1+SELS;//MCLK 8M and SMCLK 1M  
    do
	{
        IFG1 &= ~OFIFG;                 //清除振荡错误标志 
        for(i = 0; i < 100; i++)
	  _NOP();			//延时等待
        }
    while ((IFG1 & OFIFG) != 0);	//如果标志为1继续循环等待
    IFG1&=~OFIFG;
}

void get_clk()
{
  P6DIR|=LCD_SCK;  
   _NOP();
  P6OUT&=~LCD_SCK;  
  _NOP();
  _NOP();
  _NOP();
  _NOP();
  _NOP();  
  P6OUT|=LCD_SCK; 
  _NOP();
  _NOP();
  _NOP();
  _NOP();
  _NOP();
  _NOP();
  _NOP();   
}
void inport(uchar com,uchar dat)//com=1,rs=1,com=0,rs=0;
{
  uchar i,temp; 
  P6DIR|=LCD_DAT;
  P6DIR|=LCD_CS;
  P6OUT|=LCD_CS;
  temp=SYNCH;
  temp&=~WR;
  if(com)      temp|=RS;
  else         temp&=~RS;
  for(i=0;i<=7;i++)
    {
      if(temp<<i&0x80)    P6OUT|=LCD_DAT;
      else             P6OUT&=~LCD_DAT;
      get_clk();
    }
  temp=dat&0xf0;
 for(i=0;i<=7;i++)
    {
      if(temp<<i&0x80)    P6OUT|=LCD_DAT;
      else             P6OUT&=~LCD_DAT;
      get_clk();
    }
    temp=dat&0x0f;
    temp=temp<<4;
 for(i=0;i<=7;i++)
    {
      if(temp<<i&0x80)    P6OUT|=LCD_DAT;
      else             P6OUT&=~LCD_DAT;
      get_clk();
    } 
 P6OUT|=LCD_DAT;
 P6OUT&=~LCD_CS;
}
print_string(uchar add,uchar *pt)
{
  uchar i;
  inport(0x00,add);
  for(i=0;;i++)
 {
    if(*pt=='\n') break;
    inport(0x01,*pt);
    pt++;
 }
}
print_han(uchar h_neima,uchar l_neima)\
{
 inport(0x01,h_neima);
 inport(0x01,l_neima); 
}
print_float(float data)
{
    uint temp;
    uchar a1,a2,a3,a4;
    temp=data*1000;
    a1=temp/1000;
    a2=(temp-a1*1000)/100;
    temp=(temp-a1*1000)-a2*100;
    a3=temp/10;
    a4=temp%10;
    inport(0x01,a1+0x30);  
    inport(0x01,'.');  
    inport(0x01,a2+0x30);  
    inport(0x01,a3+0x30);  
    inport(0x01,a4+0x30);  
}
void int_lcd()
{
  inport(0x00,0x30);
  inport(0x00,0x01);
  inport(0x00,0x02);
  inport(0x00,0x0c);
  inport(0x00,0x06);
}
int_adc()
{  
  P6SEL|=0x01;                              //选择AD通道
  ADC12CTL0|=ADC12ON+SHT0_2+REF2_5V+REFON;           // //采样保持时间为16个ADC12CLK
  ADC12CTL1|=ADC12SSEL1+ADC12SSEL1;                                              //参考电压开启，选择2.5V
  ADC12MCTL0=0x10;                        // ref+=REF2_5V, channel = A0
  ADC12IE|=0x01;                            // 使能转换中断
  ADC12CTL0|=ENC;                          // 使能AD转换器
}
#pragma vector=ADC_VECTOR
__interrupt void ADC12ISR (void)
{
 while((ADC12CTL1&0X01)==1);//等待转换完
  adc_flag=1;
  AD_TEMP=ADC12MEM0;//设置ADC转换完标志，并且读取ADC值
 }
void int_timer()
{
  TACTL|=TASSEL1+TACLR+ID0+ID1;//选择SMCLK作为定时器的时钟，8分频
  TACTL|=MC0+TAIE;//增加模式，并且使能中断
  TACCR0=9999;//中断周期为10ms  
}
#pragma vector=TIMERA1_VECTOR
__interrupt void Timer_A(void)
{
  switch(TAIV)
  {
    case 2:break;
    case 4:break;
    case 10:if(adc_flag==0){ADC12CTL0 |= ADC12SC;ADC12CTL0 &= ~ADC12SC;}break;//10ms中断标志加1
    default:break;
  }   
}
int main( void )
{  
  WDTCTL=WDTPW+WDTHOLD;//关闭看门狗
  int_clk();  //系统时钟初始化
  int_adc();//初始化串口   
  int_lcd(); //初始化LCD
  int_timer(); //初始化TIMER
  _EINT();  //使能中断 
  while(1)
  {
    while(adc_flag==1)
    {    
        AD+=AD_TEMP;
        count++;
        if(count==100)
        {
        AD=AD/100;  
        AD=(AD*2.5/4096);      
        inport(0x00,0x80);  
        print_han(0xb5,0xe7);
        print_han(0xd1,0xb9);//电压
        inport(0x01,':');       
        print_float(AD);
        inport(0x01,'V');//显示电压值
         AD=0;
         count=0;
         AD_TEMP=0;//变量清零
       }
        adc_flag=0;//清中断标志        
       
    }
  }
 }
 
 
 
