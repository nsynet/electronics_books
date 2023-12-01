#include <msp430x14x.h>
#define   uint  unsigned int
#define   uchar unsigned char
uchar static adc_flag=0;
uchar static count=0;
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
  P6SEL |= 0X01;                              //ѡ��ADͨ��
  ADC12CTL0=ADC12ON+MSC+SHT0_2+REF2_5V+REFON;           // //��������ʱ��Ϊ16��ADC12CLK
                                              //�ο���ѹ������ѡ��2.5V
  ADC12CTL1=SHP+CONSEQ_2;                                               //��ͨ������ת��ģʽ
  ADC12MCTL0 = 0X10;                        // ref+=REF2_5V, channel = A0
  ADC12IE = 0x01;                            // ʹ��ת���ж�
  ADC12CTL0 |= ENC;                          // ʹ��ADת����
}
#pragma vector=ADC_VECTOR
__interrupt void ADC12ISR (void)
{ 
  uint results[10];
  adc_flag=1;   
  results[count] = ADC12MEM0;                   // ��ȡA0ת�����
  count++;
}

int main( void )
{   
  WDTCTL=WDTPW+WDTHOLD;//�رտ��Ź�
  int_clk();  //ϵͳʱ�ӳ�ʼ��
  int_adc();//��ʼ������                   
  _EINT();  //ʹ���ж� 
  ADC12CTL0 |= ADC12SC;   // ����ת��
  while(1);
 }
 
 
 