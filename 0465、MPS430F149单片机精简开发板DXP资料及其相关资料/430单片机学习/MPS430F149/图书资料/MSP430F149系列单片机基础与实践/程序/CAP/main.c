#include <msp430x14x.h>
#define   uint  unsigned int
#define   uchar unsigned char
uint str[100]={0};
uchar flag=0;
#define led   BIT7
const uchar  segment[10]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};
float count=0;
uint temp2=0,temp1=0;
uchar a1=0,a2=0,a3=0,a4=0;
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
void int_spi()
{  
  U0CTL|=SWRST;   
  U0CTL|=CHAR+SYNC+MM;
  U0TCTL|=SSEL1+SSEL0+STC;  //3 BIT AND SMCLK AS SPI CLOCK    
  U0TCTL|=CKPH;
  U0TCTL&=~CKPL;           //CKPL CKPH:01 ������д����
  U0BR0=0X02;
  U0BR1=0X00;
  U0MCTL=0X00; 
  ME1|=USPIE0; //ʹ��SPI
  U0CTL&=~SWRST;
  IE1&=~UTXIE0;
  IE1&=~URXIE0; //��ֹ�ж�
  P3SEL|=0x0E;
  P3DIR|=BIT2+BIT4; //ѡ��ڶ����ܺ�I/O����
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
delay()
{
  uint i,j;
  for(i=0;i<=1000;i++)
    {
    for(j=0;j<=1000;j++)
         ;
    }
}

void int_cap()
{   
  P1SEL=0X04; //ѡ��P12��Ϊ��׽���������
  TACCTL1|=CM0+SCS+CAP+CCIE;//�����ش�����׽��ͬ��ģʽ��ʹ���ж�
  TACTL|=TASSEL1+MC1; //ѡ��SMCLKʱ����Ϊ�������壬����Ƶ
}
#pragma vector=TIMERA1_VECTOR
__interrupt void Timer_A(void)//�жϷ������
{
  switch(TAIV)
  {
    case 2:{flag=1;}//�ò�׽��־Ϊ1 
    case 4:break;
    case 10:break;
  }   
} 
 
void main()
{ 
  uchar temp=0;
  WDTCTL=WDTPW+WDTHOLD;//�ؿ��Ź�
  int_clk();  //��ʼ��ʱ��
  int_cap();  //��ʼ��CAP
  int_spi();
  _EINT();    //�����ж�
  while(1)
  {
    while(flag)//��ѯ��׽��־
    {
     _DINT();
    flag=0;//���㲶׽��־
    str[temp]=TACCR1;//��ʱ��str
    temp++;
    if(temp==2)
      {
      count=str[1]-str[0];//����2�β�׽�źŵ�ʱ��������ź�Ƶ��
      count=8000/count;
      count=count*1000;    
      temp2=count;
      temp1=temp2/1000;
      a1=temp1;
      temp2=temp2-temp1*1000;
      temp1=temp2/100;
      temp2=temp2-temp1*100;
       a2=temp1;
      temp1=temp2/10;
      temp2=temp2-temp1*10;
       a3=temp1;
      a4=temp2;
      display(a4);
      display(a3);
      display(a2);
      display(a1);
      str[0]=0;
      str[1]=0;
      temp=0;       
      delay();
      delay();        
      } 
       _EINT();  
    }
  }
 }
