#include <msp430x14x.h>
#define uchar unsigned char
#define uint  unsigned int
#define led   BIT7
const uchar  segment[10]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};
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
int main( void )
{ 
  uchar i;  
  WDTCTL=WDTPW+WDTHOLD;//关闭看门狗
  int_clk();//初始化时钟
  int_spi(); //初始化SPI
  while(1)
  {
     for(i=0;i<=9;i++)
      {
      delay();
      display(i);//循环显示0-9
      }

  } 
  }  