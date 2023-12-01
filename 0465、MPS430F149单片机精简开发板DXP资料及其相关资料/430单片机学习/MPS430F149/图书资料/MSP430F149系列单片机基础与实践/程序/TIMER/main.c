#include <msp430x14x.h>
#define   uint  unsigned int
#define   uchar unsigned char
#define   OUT   BIT2
static uchar flag=0;

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
void int_timer()
{
  TACTL|=TASSEL1+TACLR+ID0+ID1;//ѡ��SMCLK��Ϊ��ʱ����ʱ�ӣ�8��Ƶ
  TACTL|=MC0+TAIE;//����ģʽ������ʹ���ж�
  TACCR0=9999;//�ж�����Ϊ10ms  
}
#pragma vector=TIMERA1_VECTOR
__interrupt void Timer_A(void)
{
  switch(TAIV)
  {
    case 2:break;
    case 4:break;
    case 10:flag=1;break;//10ms�жϱ�־��1
  }   
}
int main( void )
{
  uchar time=0; 
  WDTCTL=WDTPW+WDTHOLD; //�ؿ��Ź�
  int_clk();  //��ʼ��ʱ��
  int_timer();//��ʼ����ʱ��
  P1DIR|=OUT;  //����P12Ϊ�����
  _EINT();//���ж�
  while(1)
  {
    while(flag)//��ѯ�жϱ�־
     {
        flag=0;//���жϱ�־
        time++;//ʱ�������1
        if(time==50) //����500msȡ��
          {
            P1OUT=(~P1OUT&OUT);//�ı����״̬
            time=0;
          }
      }
  }
}
