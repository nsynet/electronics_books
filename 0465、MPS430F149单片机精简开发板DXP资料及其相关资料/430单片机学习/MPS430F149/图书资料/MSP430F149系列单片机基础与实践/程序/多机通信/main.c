#include <msp430x14x.h>
#define   uint  unsigned int
#define   uchar unsigned char
#define   RS485   BIT0
#define   LED1_ON    P6DIR|= BIT7,P6OUT&=~BIT7
#define   LED1_OFF    P6DIR|= BIT7,P6OUT|=BIT7
#define led   BIT7  //����led����λ
const uchar  segment[11]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0xff};
uchar static add=0x5;
uchar static add_flag=0;
uchar static com_flag=0;
uchar com=0;
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

/**********************************************
�������ƣ�SPI��ʼ���ӳ���
��������
����������
***********************************************/
void int_spi()
{  
  P3SEL|=0x0E;
  U0CTL|=SWRST;   
  U0CTL|=CHAR+SYNC+MM;
  U0TCTL|=SSEL1+SSEL0+STC;  //3 BIT AND SMCLK AS SPI CLOCK    
  U0TCTL|=CKPH;
  U0TCTL&=~CKPL;           //CKPL CKPH:01 �������������
  U0BR0=0X02;
  U0BR1=0X00;
  U0MCTL=0X00; 
  ME1|=USPIE0;           //SPIģ��ʹ��
  U0CTL&=~SWRST;
  IE1&=~UTXIE0;
  IE1&=~URXIE0;    
  P3DIR|=BIT2+BIT4;     //���������������
}
write_byte(uchar byte)
{  
   U0TXBUF=byte; 
  while((IFG1&UTXIFG0)==0);//UTXIFG0=0����ʾ���ݴӷ���
   IFG1&=~UTXIFG0;     
}
display(uchar data)
{
P2DIR|=led;
P2OUT|=led;//ʹ��164CLK
write_byte(segment[data]);//д����
P2OUT&=~led;  //��ֹ164CLK
}
int_usart()
{ 
  U1CTL|=SWRST;
  U1CTL|=CHAR+MM;
  U1TCTL|=SSEL1;//select SMCLK AS CLK
  U1RCTL|=URXWIE;
  U1BR0=0Xa0;
  U1BR1=0X01;
  UMCTL1=0Xc0;//19200
  ME2|=UTXE1+URXE1;//ʹ�ܽ��ܺͷ���
  U1CTL&=~SWRST; 
  IE2|=URXIE1;//ʹ�ܽ����ж�
  P3SEL|=BIT6+BIT7;
  P3DIR|=BIT6;  //����I/O���ܺͷ���
}
sent_byte(uchar data)//����һ���ֽ�����
{
  while((IFG2&UTXIFG1)==0);
  U1TXBUF=data;  
 }
delay()
{
  uchar i;
  for(i=0;i<=200;i++)
       ;
 }
 
#pragma vector=UART1RX_VECTOR
__interrupt  void UART0_RX_ISR(void)
{   
  
     uchar data;
     data=U1RXBUF;  
  
  if(data==add)//�ж��ǲ��Ǳ�����ַ���������ַλ׼���������ݣ����ҵ�ַ��־д1
      {
        U1RCTL&=~URXWIE;
        add_flag=1; 
        return;     
      }
  if(add_flag==1)//�ж��ǲ����Ѿ����յ�һ����Ч��ַ��Ϣ���Ƿ��ر�����ַ�ͽ��ܵ�����������
   {          
     P2OUT|=RS485;
     sent_byte(add+0x30);
     sent_byte(data);
     com=data-0x30;  
     delay();
     P2OUT&=~RS485;  
     U1RCTL|=URXWIE; 
     com_flag=1;//�����־д1
     add_flag=0;
     } 
 
}
int main( void )
{
  WDTCTL=WDTPW+WDTHOLD;
  int_clk(); 
  int_usart(); 
  int_spi(); //ϵͳ��ʼ��
  P2DIR|=RS485;
  P2OUT&=~RS485;
  _EINT(); 
  while(1)
  { 
  if(com_flag==1)//�ж������־�ǲ���Ϊ1��Ϊ1������������
  {
    if(com==5) {LED1_ON;display(10);display(10);display(add);display(com);}
    if(com==6) {LED1_OFF;display(10);display(10);display(add);display(com);}
    com_flag=0;  
  }  
  }
  while(1);
}
