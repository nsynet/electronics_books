#include <msp430x14x.h>
#define   uint  unsigned int
#define   uchar unsigned char
static uchar adc_flag=0;
uint AD_TEMP=0;
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
  P6SEL|=0x01;                              //ѡ��ADͨ��
  ADC12CTL0|=ADC12ON+SHT0_2+REF2_5V+REFON;           // //��������ʱ��Ϊ16��ADC12CLK
  ADC12CTL1|=ADC12SSEL1+ADC12SSEL1;                                              //�ο���ѹ������ѡ��2.5V
  ADC12MCTL0=0x10;                        // ref+=REF2_5V, channel = A0
  ADC12IE|=0x01;                            // ʹ��ת���ж�
  ADC12CTL0|=ENC;                          // ʹ��ADת����
}
#pragma vector=ADC_VECTOR
__interrupt void ADC12ISR (void)
{
 while((ADC12CTL1&0X01)==1);//�ȴ�ת����
  adc_flag=1;
  AD_TEMP=ADC12MEM0;//����ADCת�����־�����Ҷ�ȡADCֵ
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
       ADC12CTL0 &= ~ADC12SC;          
       adc_flag=0;//���жϱ�־
    }
  }
 }
 
 
 