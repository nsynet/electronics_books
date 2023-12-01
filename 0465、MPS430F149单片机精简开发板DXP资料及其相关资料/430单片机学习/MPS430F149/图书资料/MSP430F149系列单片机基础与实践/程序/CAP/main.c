#include <msp430x14x.h>
#define   uint  unsigned int
#define   uchar unsigned char
uint str[100]={0};
uchar flag=0;
#define led   BIT7
const uchar  segment[10]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};
float count=0;
uint temp2=0,temp1=0;
uchar a1=0,a2=0,a3=0,a4=0;
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
void int_spi()
{  
  U0CTL|=SWRST;   
  U0CTL|=CHAR+SYNC+MM;
  U0TCTL|=SSEL1+SSEL0+STC;  //3 BIT AND SMCLK AS SPI CLOCK    
  U0TCTL|=CKPH;
  U0TCTL&=~CKPL;           //CKPL CKPH:01 上升沿写数据
  U0BR0=0X02;
  U0BR1=0X00;
  U0MCTL=0X00; 
  ME1|=USPIE0; //使能SPI
  U0CTL&=~SWRST;
  IE1&=~UTXIE0;
  IE1&=~URXIE0; //禁止中断
  P3SEL|=0x0E;
  P3DIR|=BIT2+BIT4; //选择第二功能和I/O方向
}
 write_byte(uchar byte)
{  
   U0TXBUF=byte; 
  while((IFG1&UTXIFG0)==0);//UTXIFG0=0，表示数据从发送
   IFG1&=~UTXIFG0;     
}
display(uchar data)
{
  P2DIR|=led;
  P2OUT|=led;//使能164CLK
  write_byte(segment[data]);//写数据
  P2OUT&=~led;  //禁止164CLK
}
delay()
{
  uint i,j;
  for(i=0;i<=1000;i++)
    {
    for(j=0;j<=1000;j++)
         ;
    }
}

void int_cap()
{   
  P1SEL=0X04; //选择P12作为捕捉的输入端子
  TACCTL1|=CM0+SCS+CAP+CCIE;//上升沿触发捕捉，同步模式、使能中断
  TACTL|=TASSEL1+MC1; //选择SMCLK时钟作为计数脉冲，不分频
}
#pragma vector=TIMERA1_VECTOR
__interrupt void Timer_A(void)//中断服务程序
{
  switch(TAIV)
  {
    case 2:{flag=1;}//置捕捉标志为1 
    case 4:break;
    case 10:break;
  }   
} 
 
void main()
{ 
  uchar temp=0;
  WDTCTL=WDTPW+WDTHOLD;//关看门狗
  int_clk();  //初始化时钟
  int_cap();  //初始化CAP
  int_spi();
  _EINT();    //开总中断
  while(1)
  {
    while(flag)//查询捕捉标志
    {
     _DINT();
    flag=0;//清零捕捉标志
    str[temp]=TACCR1;//读时间str
    temp++;
    if(temp==2)
      {
      count=str[1]-str[0];//保存2次捕捉信号的时间差，计算出信号频率
      count=8000/count;
      count=count*1000;    
      temp2=count;
      temp1=temp2/1000;
      a1=temp1;
      temp2=temp2-temp1*1000;
      temp1=temp2/100;
      temp2=temp2-temp1*100;
       a2=temp1;
      temp1=temp2/10;
      temp2=temp2-temp1*10;
       a3=temp1;
      a4=temp2;
      display(a4);
      display(a3);
      display(a2);
      display(a1);
      str[0]=0;
      str[1]=0;
      temp=0;       
      delay();
      delay();        
      } 
       _EINT();  
    }
  }
 }
