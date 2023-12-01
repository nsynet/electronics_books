#include <msp430x14x.h>
#define   uint  unsigned int
#define   uchar unsigned char
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
int_usart()
{  
  U0CTL|=SWRST;//��λ����
  U0CTL|=CHAR; //8λ����
  U0TCTL|=SSEL1;//select SMCLK AS CLK
  U0BR0=0Xa0;
  U0BR1=0X01;
  UMCTL0=0Xc0;//19200
  ME1|=UTXE0+URXE0;//ʹ�ܽ��պͷ��� 
  U0CTL&=~SWRST;//������ڸ�λ�ź�
  IE1|=URXIE0;//ʹ�ܽ����ж�
  P3SEL|=BIT4;
  P3SEL|=BIT5;//ѡ��I/O��ʹ����չ���ܺͷ���
  P3DIR|=BIT4;  
}
sent_byte(uchar data)
{
  while((IFG1&UTXIFG0)==0);//�жϷ��ͻ������Ƿ����
  U0TXBUF=data;  
 }
#pragma vector=UART0RX_VECTOR
__interrupt  void UART0_RX_ISR(void)
{ 
  uchar data=0;
  data=U0RXBUF; //��ȡ���ܵ������ݲ��ҷ��͵�PC��
  sent_byte( data);  
}
int main( void )
{  
  WDTCTL=WDTPW+WDTHOLD;//�رտ��Ź�
  int_clk();  //ϵͳʱ�ӳ�ʼ��
  int_usart();//��ʼ������
  _EINT();  //ʹ���ж�
  while(1);
 }
 