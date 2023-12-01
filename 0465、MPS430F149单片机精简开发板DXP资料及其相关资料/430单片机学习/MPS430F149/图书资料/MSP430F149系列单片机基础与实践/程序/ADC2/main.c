#include <msp430x14x.h>
#define   uint  unsigned int
#define   uchar unsigned char
uchar static adc_flag=0;
uchar static count=0;
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
  P6SEL |= 0X01;                              //选择AD通道
  ADC12CTL0=ADC12ON+MSC+SHT0_2+REF2_5V+REFON;           // //采样保持时间为16个ADC12CLK
                                              //参考电压开启，选择2.5V
  ADC12CTL1=SHP+CONSEQ_2;                                               //多通道单次转换模式
  ADC12MCTL0 = 0X10;                        // ref+=REF2_5V, channel = A0
  ADC12IE = 0x01;                            // 使能转换中断
  ADC12CTL0 |= ENC;                          // 使能AD转换器
}
#pragma vector=ADC_VECTOR
__interrupt void ADC12ISR (void)
{ 
  uint results[10];
  adc_flag=1;   
  results[count] = ADC12MEM0;                   // 读取A0转换结果
  count++;
}

int main( void )
{   
  WDTCTL=WDTPW+WDTHOLD;//关闭看门狗
  int_clk();  //系统时钟初始化
  int_adc();//初始化串口                   
  _EINT();  //使能中断 
  ADC12CTL0 |= ADC12SC;   // 开启转换
  while(1);
 }
 
 
 