#include <msp430x14x.h>
#define   uint  unsigned int
#define   uchar unsigned char
static uchar adc_flag=0;
uint AD_TEMP=0;
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

int main( void )
{  
  WDTCTL=WDTPW+WDTHOLD;//关闭看门狗
  int_clk();  //系统时钟初始化
  int_adc();//初始化串口              
  _EINT();  //使能中断 
  adc_flag=1;
  while(1)
  {
    while(adc_flag==1)
    {      
       ADC12CTL0 |= ADC12SC;                     // 开启转换
       ADC12CTL0 &= ~ADC12SC;          
       adc_flag=0;//清中断标志
    }
  }
 }
 
 
 