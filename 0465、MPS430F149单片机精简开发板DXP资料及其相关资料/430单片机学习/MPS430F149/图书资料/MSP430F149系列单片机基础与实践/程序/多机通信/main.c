#include <msp430x14x.h>
#define   uint  unsigned int
#define   uchar unsigned char
#define   RS485   BIT0
#define   LED1_ON    P6DIR|= BIT7,P6OUT&=~BIT7
#define   LED1_OFF    P6DIR|= BIT7,P6OUT|=BIT7
#define led   BIT7  //定义led控制位
const uchar  segment[11]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0xff};
uchar static add=0x5;
uchar static add_flag=0;
uchar static com_flag=0;
uchar com=0;
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

/**********************************************
程序名称：SPI初始化子程序
参数：无
功能描述：
***********************************************/
void int_spi()
{  
  P3SEL|=0x0E;
  U0CTL|=SWRST;   
  U0CTL|=CHAR+SYNC+MM;
  U0TCTL|=SSEL1+SSEL0+STC;  //3 BIT AND SMCLK AS SPI CLOCK    
  U0TCTL|=CKPH;
  U0TCTL&=~CKPL;           //CKPL CKPH:01 上升沿输出数据
  U0BR0=0X02;
  U0BR1=0X00;
  U0MCTL=0X00; 
  ME1|=USPIE0;           //SPI模块使能
  U0CTL&=~SWRST;
  IE1&=~UTXIE0;
  IE1&=~URXIE0;    
  P3DIR|=BIT2+BIT4;     //设置输入输出方向
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
int_usart()
{ 
  U1CTL|=SWRST;
  U1CTL|=CHAR+MM;
  U1TCTL|=SSEL1;//select SMCLK AS CLK
  U1RCTL|=URXWIE;
  U1BR0=0Xa0;
  U1BR1=0X01;
  UMCTL1=0Xc0;//19200
  ME2|=UTXE1+URXE1;//使能接受和发送
  U1CTL&=~SWRST; 
  IE2|=URXIE1;//使能接受中断
  P3SEL|=BIT6+BIT7;
  P3DIR|=BIT6;  //设置I/O功能和方向
}
sent_byte(uchar data)//发送一个字节数据
{
  while((IFG2&UTXIFG1)==0);
  U1TXBUF=data;  
 }
delay()
{
  uchar i;
  for(i=0;i<=200;i++)
       ;
 }
 
#pragma vector=UART1RX_VECTOR
__interrupt  void UART0_RX_ISR(void)
{   
  
     uchar data;
     data=U1RXBUF;  
  
  if(data==add)//判断是不是本几地址，是清楚地址位准备接受数据，并且地址标志写1
      {
        U1RCTL&=~URXWIE;
        add_flag=1; 
        return;     
      }
  if(add_flag==1)//判断是不是已经接收到一个有效地址信息，是返回本机地址和接受到的命令数据
   {          
     P2OUT|=RS485;
     sent_byte(add+0x30);
     sent_byte(data);
     com=data-0x30;  
     delay();
     P2OUT&=~RS485;  
     U1RCTL|=URXWIE; 
     com_flag=1;//命令标志写1
     add_flag=0;
     } 
 
}
int main( void )
{
  WDTCTL=WDTPW+WDTHOLD;
  int_clk(); 
  int_usart(); 
  int_spi(); //系统初始化
  P2DIR|=RS485;
  P2OUT&=~RS485;
  _EINT(); 
  while(1)
  { 
  if(com_flag==1)//判断命令标志是不是为1，为1按照相关命令处理
  {
    if(com==5) {LED1_ON;display(10);display(10);display(add);display(com);}
    if(com==6) {LED1_OFF;display(10);display(10);display(add);display(com);}
    com_flag=0;  
  }  
  }
  while(1);
}
