#include <msp430x14x.h>
#define   uint  unsigned int
#define   uchar unsigned char
#define   OUT   BIT2
static uchar flag=0;

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
    case 10:flag=1;break;//10ms中断标志加1
  }   
}
int main( void )
{
  uchar time=0; 
  WDTCTL=WDTPW+WDTHOLD; //关看门狗
  int_clk();  //初始化时钟
  int_timer();//初始化定时器
  P1DIR|=OUT;  //设置P12为输出脚
  _EINT();//开中断
  while(1)
  {
    while(flag)//查询中断标志
     {
        flag=0;//清中断标志
        time++;//时间变量加1
        if(time==50) //等于500ms取反
          {
            P1OUT=(~P1OUT&OUT);//改变输出状态
            time=0;
          }
      }
  }
}
