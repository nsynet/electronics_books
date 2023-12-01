#include <MSP430x14x.h>
#define uchar unsigned char
#define uint  unsigned int
#define led   BIT7
const uchar  segment[10]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};
uchar static key_flag=0;
uchar static  count=0;
uchar key1;
uchar kk;
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
delay()
{
   uint i;
  for(i=0;i<=1000;i++)
       ;
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
//ɨ��һ�и��ݲ���line����ɨ�������һ��
uchar scan_key(uchar line)
{
  uchar key;
  
  P5OUT=line;  
  switch (P5IN&0Xf0)
 {
  case 0xe0:key=1+line;break;
  case 0xd0:key=2+line;break;
  case 0xb0:key=3+line;break;
  case 0x70:key=4+line;break;
  default:key=0xff;break;
 }
 return(key);
}
void fast_scan()
{
  uchar temp;
  P5OUT&=0XF0;//��λȫ��Ϊ0���ж����޼����� 
  temp=P5IN&0xf0;
  if(temp==0xf0)key_flag=0;
  else          
  {
   key_flag=1; //����м������߱�־Ϊ1������Ϊ0
  } 
}
void over()
{
  uchar temp;
  P5OUT&=0XF0;//��λȫ��Ϊ0���ж����޼�����
  do
  {
    temp=P5IN&0xf0;
    if(temp==0xf0)break;  //�ȴ����̵���
  } 
  while(1);
 
}
//��ȡ��ֵ
uchar get_key()
{
  uchar key;
  
  while(1)
  {
    key=scan_key(0xe);
    if(key!=0xff){key|=0x80;P5OUT=0X0f; break;}

    key=scan_key(0xd);
    if(key!=0xff){key|=0x40;P5OUT=0X0f;break;}
 
    key=scan_key(0xb);
    if(key!=0xff){key|=0x20;P5OUT=0X0f;break;}
  
    key=scan_key(0x7);
    if(key!=0xff){key|=0x20;P5OUT=0X0f;break;}
  }
  switch(key)
  {
     case 0x8f:key=0;break;
     case 0x90:key=1;break;
     case 0x91:key=2;break;
     case 0x92:key=3;break;
     case 0x4E:key=4;break;
     case 0x4F:key=5;break;
     case 0x50:key=6;break;
     case 0x51:key=7;break;
     case 0x2C:key=8;break;
     case 0x2D:key=9;break;
     case 0x2E:key=10;break;
     case 0x2F:key=11;break;
     case 0x28:key=12;break;
     case 0x29:key=13;break;
     case 0x2A:key=14;break;
     case 0x2B:key=15;break;    
     default:key=0xff;break;
  }
  _NOP();
  return(key);
}
delay2()
{
 uint i=0,j=0;
 for(i=0;i<=200;i++)
 {
   for(j=0;j<=300;j++)
         ;
         }
}
int main( void )
{  

 WDTCTL=WDTPW+WDTHOLD;//�رտ��Ź�
 int_clk(); //��ʼ��ʱ��
 P5DIR|=BIT0+BIT1+BIT2+BIT3;//���̳�ʼ��
 int_spi(); //��ʼ��SPI
 display(0);  
 display(0); 
 display(0);  
 display(0);  
 while(1)
 {  
   fast_scan();
   if(key_flag==0) continue;//�ж��Ƿ��м����£�����������������˳�����ɨ��
   key_flag=0;
   delay2();
   fast_scan();  
   if(key_flag==1)
   { 
    key_flag=0;
    key1=get_key();
    over(); 
    delay2();
    display(key1);
   }
 } 
     
}



