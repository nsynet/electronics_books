#include<msp430x14x.h>
#define uint unsigned  int
#define uchar unsigned char 
#define  RXF     BIT7//p2
#define  TXF     BIT6
#define  Read    BIT4//p3
#define  Write   BIT5//p3
uchar static usb_flag=0;
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
//д����
void send_data(uchar data)
{
  while(P2IN&TXF==1);//�ж�״̬
  P1OUT|=Write;
   _NOP();
   _NOP();
  P4DIR=0XFF;
  P4OUT=data;
  _NOP();
  _NOP();
  P1OUT&=~Write;  
  _NOP();
  _NOP();
}
//������
uchar recive_data()
{
  uchar data;
  P4DIR=0X00;
  while(P2IN&RXF==1);//�ж�״̬
  P1OUT&=~Read;  
  _NOP();
  _NOP();
  data=P4IN;
  P1OUT|=Read;
  _NOP();
  _NOP(); 
  return (data);
}
void main( void )
{
  uchar temp;
  WDTCTL = WDTPW + WDTHOLD; //�رտ��Ź�        
  int_clk();//��ʼ��ʱ��
  P1DIR|=Read+Write;
  P5DIR=0xff;
  P1IE|=RXF;
  P1IES|=RXF;//I/O�ڹ��ܺͷ����ʼ��
  _EINT();
  while(1)
  {
  while(usb_flag==1)//�жϽ������ݱ�־��������ܵ������򷵻ظ�����
  {
   temp=recive_data();
   send_data( temp);
   usb_flag=0;
  }
  }  
}

//
#pragma vector=PORT1_VECTOR 
__interrupt void rec_usb()
{
  P1IFG&=~RXF;//����жϱ�־
  usb_flag=1;//�������ݱ�־д1
 } 
 
 