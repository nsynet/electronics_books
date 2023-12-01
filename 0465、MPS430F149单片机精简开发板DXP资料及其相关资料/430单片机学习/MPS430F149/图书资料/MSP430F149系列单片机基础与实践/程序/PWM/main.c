#include <msp430x14x.h>
#define   uint  unsigned int
#define   uchar unsigned char
#define   PWM   BIT2
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
void int_pwm()
{ 
  P1SEL|=PWM;//选择P12作为PWM输出
  P1DIR|=PWM;  
  TACCR0=800;//PWM信号周期10KHz
  TACCR1=400;//占空比1：1
  TACCTL1=OUTMOD0+OUTMOD1+OUTMOD2; //输出模式选择
  TACTL|=TASSEL1+MC0; 
}
void main()
{
  WDTCTL=WDTPW+WDTHOLD;//关看门狗
  int_clk();  //初始化时钟
  int_pwm();  //初始化PWM
  while(1);//结束
}
