#include<msp430x14x.h>
#define uint unsigned  int
#define uchar unsigned char 
#define   LED1_OFF     P6DIR|= BIT7,P6OUT|=BIT7
#define   LED2_OFF     P6DIR|= BIT6,P6OUT|=BIT6
#define   LED3_OFF     P6DIR|= BIT5,P6OUT|=BIT5
#define   LED4_OFF     P3DIR|= BIT0,P3OUT|=BIT0
#define   LED1_ON      P6DIR|= BIT7,P6OUT&=~BIT7
#define   LED2_ON      P6DIR|= BIT6,P6OUT&=~BIT6
#define   LED3_ON      P6DIR|= BIT5,P6OUT&=~BIT5
#define   LED4_ON      P3DIR|= BIT0,P3OUT&=~BIT0
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

delay()//延时子程序
{
  uint i,j;
  for(i=0;i<=1000;i++)
    {
      for(j=0;j<=1000;j++)
          ;
    }
    
}
void main( void )
{
  WDTCTL = WDTPW + WDTHOLD;         
  int_clk();
  while(1)
  {
  delay();
  LED1_ON;
  delay();
  LED2_ON;
  delay();
  LED3_ON;
  delay();
  LED4_ON;
  delay();
  LED1_OFF;
  delay();
  LED2_OFF;
  delay();
  LED3_OFF;
  delay();
  LED4_OFF;
  delay();
  }
 
 }
  
 
 
