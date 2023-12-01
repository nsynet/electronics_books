#include <msp430x14x.h>
#define   uint  unsigned int
#define   uchar unsigned char
#define   beef   BIT6
uchar flag=0;
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
void int_COMPARATORA()
{
  P2SEL|=0X14;//P22、P24分别作为比较器的输出和输入
  P2DIR|=0X04;//设置P22作为输出
  CACTL1&=~CAEX;//输出取反
  CACTL1|=CARSEL+CAREF0+CAON+CAIE+CAIES;//选择参考电压接负端、CA1接正端，允许中断下降沿触发中断，参考电压为0。25倍VCC
  CACTL2|=CAF+P2CA1;//使能输出滤波器，CA1作为比较输入功能
}


#pragma vector=COMPARATORA_VECTOR
__interrupt void COMPARATORA(void)	//中断服务程序
{
  flag=1;			//置中断标志为1
}
void delay()		        //软件延时
{
  uint i,j;
  for(i=0;i<=100;i++)
    {
      for(j=0;j<100;j++)
            ;
    }     
}
void main()
{   
  WDTCTL=WDTPW+WDTHOLD;//关看门狗
  int_clk();  //初始化时钟  
  delay();    //调用软件延时子程序
  int_COMPARATORA();//初始化比较器
  _EINT(); 
  while(1)
  {
    while(flag)
        {
        P4DIR|=beef;
        P4OUT&=~beef;		//P4.6输出低电平
        delay();                //调用软件延时子程序
        P4OUT|=beef;        	//P4.6输出高电平
        flag=0;			//标志清零
        }
   }
 } 
