#include <msp430x14x.h>
#define   uint  unsigned int
#define   uchar unsigned char
#define   PWM   BIT2
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
void int_pwm()
{ 
  P1SEL|=PWM;//ѡ��P12��ΪPWM���
  P1DIR|=PWM;  
  TACCR0=800;//PWM�ź�����10KHz
  TACCR1=400;//ռ�ձ�1��1
  TACCTL1=OUTMOD0+OUTMOD1+OUTMOD2; //���ģʽѡ��
  TACTL|=TASSEL1+MC0; 
}
void main()
{
  WDTCTL=WDTPW+WDTHOLD;//�ؿ��Ź�
  int_clk();  //��ʼ��ʱ��
  int_pwm();  //��ʼ��PWM
  while(1);//����
}
