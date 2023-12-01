#include <msp430x14x.h>
#define   uint  unsigned int
#define   uchar unsigned char
uchar static adc_flag=0;
void int_clk()
{
    uchar i;
    BCSCTL1&=~XT2OFF;  //��XT����
    BCSCTL2|=SELM1+SELS;//MCLK 8M and SMCLK 1M  
    do
	{
        IFG1 &= ~OFIFG;                 //����񵴴����־ 
        for(i = 0; i < 100; i++)
	  _NOP();			//��ʱ�ȴ�
        }
    while ((IFG1 & OFIFG) != 0);	//�����־Ϊ1����ѭ���ȴ�
    IFG1&=~OFIFG;
}
int_adc()
{  
   P6SEL |= 0x0F;                              //ѡ��ADͨ��
  ADC12CTL0 = ADC12ON+MSC+SHT0_2+REF2_5V+REFON;           // //��������ʱ��Ϊ16��ADC12CLK
                                               //�ο���ѹ������ѡ��2.5V
  ADC12CTL1 = SHP+CONSEQ_1;                    // SAMPCON�źŲ���ʱ���·����
                                               //��ͨ������ת��ģʽ
  ADC12MCTL0 = 0x10;                        // ref+=REF2_5V, channel = A0
  ADC12MCTL1 = 0x11;                        // ref+=REF2_5V, channel = A1
  ADC12MCTL2 = 0x12;                        // ref+=REF2_5V, channel = A2
  ADC12MCTL3 = 0x93;                       // ref+=REF2_5V, channel = A3, ����ת��ͨ��ѡ��.
  ADC12IE = 0x08;                            // ʹ��ת���ж�
  ADC12CTL0 |= ENC;                          // ʹ��ADת����
}
#pragma vector=ADC_VECTOR
__interrupt void ADC12ISR (void)
{        
  uint results[4];
  results[0] = ADC12MEM0;                   // ��ȡA0ת�����
  results[1] = ADC12MEM1;                   // ��ȡA1ת�����
  results[2] = ADC12MEM2;                   // ��ȡA2ת�����
  results[3] = ADC12MEM3;                   //��ȡA3ת�����
  adc_flag=1;                               //�´�ת����־д1
}

int main( void )
{  
  
  WDTCTL=WDTPW+WDTHOLD;//�رտ��Ź�
  int_clk();  //ϵͳʱ�ӳ�ʼ��
  int_adc();//��ʼ������                   
  _EINT();  //ʹ���ж� 
  adc_flag=1;
  while(1)
  {
    while(adc_flag==1)
    {        
        ADC12CTL0 |= ADC12SC;                     // ����ת��
        adc_flag=0;//���жϱ�־
    }
  }
 }
 
 
 