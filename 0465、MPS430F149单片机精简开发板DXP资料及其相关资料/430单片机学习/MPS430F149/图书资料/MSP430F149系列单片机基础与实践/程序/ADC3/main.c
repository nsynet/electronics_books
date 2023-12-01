#include <msp430x14x.h>
#define   uint  unsigned int
#define   uchar unsigned char
uchar static adc_flag=0;
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
   P6SEL |= 0x0F;                              //选择AD通道
  ADC12CTL0 = ADC12ON+MSC+SHT0_2+REF2_5V+REFON;           // //采样保持时间为16个ADC12CLK
                                               //参考电压开启，选择2.5V
  ADC12CTL1 = SHP+CONSEQ_1;                    // SAMPCON信号采用时序电路产生
                                               //多通道单次转换模式
  ADC12MCTL0 = 0x10;                        // ref+=REF2_5V, channel = A0
  ADC12MCTL1 = 0x11;                        // ref+=REF2_5V, channel = A1
  ADC12MCTL2 = 0x12;                        // ref+=REF2_5V, channel = A2
  ADC12MCTL3 = 0x93;                       // ref+=REF2_5V, channel = A3, 结束转换通道选择.
  ADC12IE = 0x08;                            // 使能转换中断
  ADC12CTL0 |= ENC;                          // 使能AD转换器
}
#pragma vector=ADC_VECTOR
__interrupt void ADC12ISR (void)
{        
  uint results[4];
  results[0] = ADC12MEM0;                   // 读取A0转换结果
  results[1] = ADC12MEM1;                   // 读取A1转换结果
  results[2] = ADC12MEM2;                   // 读取A2转换结果
  results[3] = ADC12MEM3;                   //读取A3转换结果
  adc_flag=1;                               //下次转换标志写1
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
        adc_flag=0;//清中断标志
    }
  }
 }
 
 
 