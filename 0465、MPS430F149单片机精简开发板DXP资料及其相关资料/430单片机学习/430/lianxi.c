#include <msp430x14x.h> 
     void Init(void);//������ʼ������ 
    char Data[20]="wang qing"; //���͵��ַ��� 

     void int_clk()
{
    unsigned char i;
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
     void Init(void) 
     { 
 
  U0CTL|=SWRST;//��λ����
  U0CTL|=CHAR; //8λ����
  U0TCTL|=SSEL1;//select SMCLK AS CLK
  U0BR0=0xA0;
  U0BR1=0x01;
  UMCTL0=0xC0;//19200
  ME1|=UTXE0;//ʹ�ܽ��պͷ��� 
  U0CTL&=~SWRST;//������ڸ�λ�ź�
  IE1|=URXIE0;//ʹ�ܽ����ж�
  P3SEL|=BIT4;
  P3SEL|=BIT5;//ѡ��I/O��ʹ����չ���ܺͷ���
  P3DIR|=BIT4;  
}
     void main(void) 
     { 
       unsigned int i,m=1; 
       WDTCTL = WDTPW + WDTHOLD; 
       int_clk();
       Init();  //���ó�ʼ������ 
      while(m--)  //���޴�ѭ�� 
      { 
       for(i=0;i<=21;i++) 
       { 
       
       while((UTCTL0&0x01)==0); //���ͻ������д�������ʱ��UTCTL0�ĵ�0λ��λ������ȴ� 
      TXBUF0=Data[i]; //�򻺳���������������� 
       } 
      } 
     }
