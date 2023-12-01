#include <msp430x14x.h>
#define uchar unsigned char
#define uint  unsigned int
#define spi_cs BIT5
#define da_cs  BIT6
#define Enable  P2OUT&=~spi_cs;
#define Disable P2OUT|=spi_cs;
uint temp=0,temp1=0;
uint aa[38];
float  str[37]={1.00,1.173,1.342,1.500,1.643,1.766,1.87,1.94,1.984,2.00,1.984,1.94,1.866,1.766,1.643,1.50,1.342,1.173,1.00,0.826,0.658,0.5,0.357,0.234,0.134,0.060,0.015,0.00,0.015,0.060,0.134,0.234,0.357,0.500,0.658,0.826,1.00};
float  sanjiao[37]={0.0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0,0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1};
float  fangbo[21]={0.0,1.0};
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
  P3SEL|=0x0E;
  P2DIR|=spi_cs;
  Disable;             // NOT SELECT 
  U0CTL|=SWRST;   
  U0CTL|=CHAR+SYNC+MM;
  U0TCTL|=SSEL1+SSEL0+STC;  //3 BIT AND SMCLK AS SPI CLOCK    
  U0TCTL|=CKPH;
  U0TCTL&=~CKPL;          
  U0BR0=0X02;
  U0BR1=0X00;
  U0MCTL=0X00;   
  ME1|=USPIE0; 
  U0CTL&=~SWRST;
  IE1&=~UTXIE0;
  IE1&=~URXIE0;
  P3DIR|=BIT2+BIT4; 
}
write_byte(uchar byte)			//通过SPI接口送出一个字节数据
{  
   U0TXBUF=byte; 
  while((IFG1&UTXIFG0)==0);
   IFG1&=~UTXIFG0;     
}
delay()
{
 uint i;
 for(i=0;i<=10000;i++)
     ;
}
void DAC_OUT(uint temp)
{    
    
      temp=temp<<2;
      Enable;
      write_byte((temp>>8)&0x0f);
      write_byte(temp);
      Disable;    
    		
}

void main( )
{
  uchar i=0;
  WDTCTL=WDTPW+WDTHOLD;
  int_clk();					//初始化时钟
  int_spi();	
  for(i=0;i<37;i++)
  {
    aa[i]=(str[i]+1)*204.8;
  }//计算波形数据
  while(1)
  {
    for(i=0;i<37;i++)
      {
      temp=aa[i]<<2;
      Enable;
      write_byte((temp>>8)&0x0f);
      write_byte(temp);
      Disable;  //连续写数据
      }  
  }
}