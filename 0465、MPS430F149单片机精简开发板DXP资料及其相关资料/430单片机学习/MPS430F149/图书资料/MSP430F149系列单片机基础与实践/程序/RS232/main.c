#include <msp430x14x.h>
#define   uint  unsigned int
#define   uchar unsigned char
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
int_usart()
{  
  U0CTL|=SWRST;//复位串口
  U0CTL|=CHAR; //8位数据
  U0TCTL|=SSEL1;//select SMCLK AS CLK
  U0BR0=0Xa0;
  U0BR1=0X01;
  UMCTL0=0Xc0;//19200
  ME1|=UTXE0+URXE0;//使能接收和发送 
  U0CTL&=~SWRST;//清除串口复位信号
  IE1|=URXIE0;//使能接收中断
  P3SEL|=BIT4;
  P3SEL|=BIT5;//选择I/O口使用扩展功能和方向
  P3DIR|=BIT4;  
}
sent_byte(uchar data)
{
  while((IFG1&UTXIFG0)==0);//判断发送缓冲区是否结束
  U0TXBUF=data;  
 }
#pragma vector=UART0RX_VECTOR
__interrupt  void UART0_RX_ISR(void)
{ 
  uchar data=0;
  data=U0RXBUF; //读取接受到的数据并且发送到PC机
  sent_byte( data);  
}
int main( void )
{  
  WDTCTL=WDTPW+WDTHOLD;//关闭看门狗
  int_clk();  //系统时钟初始化
  int_usart();//初始化串口
  _EINT();  //使能中断
  while(1);
 }
 