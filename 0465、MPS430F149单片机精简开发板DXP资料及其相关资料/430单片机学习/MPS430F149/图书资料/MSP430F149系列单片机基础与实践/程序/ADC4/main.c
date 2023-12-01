#include  <msp430x14x.h>
#define uint unsigned int
#define uchar unsigned char

uint results0;             //����A0ת���������
uint results1;             //����A1ת���������
uint results2;             //����A2ת���������
uint results3;             //����A3ת���������
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
void int_adc()
{
  P6SEL |= 0x0F;                              //ѡ��ADͨ��
  ADC12CTL0 = ADC12ON+MSC+SHT0_2+REF2_5V;   //��������ʱ��Ϊ16��ADC12CLK
                                            //�ο���ѹѡ��2.5V
  ADC12CTL1 =SHP+CONSEQ_3;                 // SAMPCON�źŲ���ʱ���·����
                                            //��ͨ�����ת��ģʽ
  ADC12MCTL0 = INCH_0;                      // ref+=AVcc, channel = A0
  ADC12MCTL1 = INCH_1;                      // ref+=AVcc, channel = A1
  ADC12MCTL2 = INCH_2;                       // ref+=AVcc, channel = A2
  ADC12MCTL3 = INCH_3+EOS;                  // ref+=AVcc, channel = A3, ����ת��ͨ��ѡ��.
  ADC12IE |= 0x08;                           // ʹ��ת���ж�
  ADC12CTL0 |= ENC;                         // ʹ��ADת����
}

#pragma vector=ADC_VECTOR
__interrupt void ADC12ISR (void)
{
 
  results0 = ADC12MEM0;               // ��תA0��ֵ
  results1 = ADC12MEM1;               // ��תA0��ֵ
  results2 = ADC12MEM2;               // ��תA0��ֵ
  results3 = ADC12MEM3;               // ��תA0��ֵ
}

void main(void)
{
  WDTCTL = WDTPW+WDTHOLD;                   // ֹͣ���Ź�
  int_clk();
  int_adc();
  _EINT();
  ADC12CTL0 |= ADC12SC;                     // ����ת�� 
  while(1);
}

