#include  <msp430x14x.h>
#define uint unsigned int
#define uchar unsigned char

uint results0;             //定义A0转换结果数组
uint results1;             //定义A1转换结果数组
uint results2;             //定义A2转换结果数组
uint results3;             //定义A3转换结果数组
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
void int_adc()
{
  P6SEL |= 0x0F;                              //选择AD通道
  ADC12CTL0 = ADC12ON+MSC+SHT0_2+REF2_5V;   //采样保持时间为16个ADC12CLK
                                            //参考电压选择2.5V
  ADC12CTL1 =SHP+CONSEQ_3;                 // SAMPCON信号采用时序电路产生
                                            //多通道多次转换模式
  ADC12MCTL0 = INCH_0;                      // ref+=AVcc, channel = A0
  ADC12MCTL1 = INCH_1;                      // ref+=AVcc, channel = A1
  ADC12MCTL2 = INCH_2;                       // ref+=AVcc, channel = A2
  ADC12MCTL3 = INCH_3+EOS;                  // ref+=AVcc, channel = A3, 结束转换通道选择.
  ADC12IE |= 0x08;                           // 使能转换中断
  ADC12CTL0 |= ENC;                         // 使能AD转换器
}

#pragma vector=ADC_VECTOR
__interrupt void ADC12ISR (void)
{
 
  results0 = ADC12MEM0;               // 读转A0换值
  results1 = ADC12MEM1;               // 读转A0换值
  results2 = ADC12MEM2;               // 读转A0换值
  results3 = ADC12MEM3;               // 读转A0换值
}

void main(void)
{
  WDTCTL = WDTPW+WDTHOLD;                   // 停止看门狗
  int_clk();
  int_adc();
  _EINT();
  ADC12CTL0 |= ADC12SC;                     // 开启转换 
  while(1);
}

