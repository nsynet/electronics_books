#include <msp430x14x.h>
#define uchar unsigned char
#define uint  unsigned int
#define spi_cs BIT1
#define da_cs  BIT6
#define Enable  P2OUT&=~spi_cs;
#define Disable P2OUT|=spi_cs;
uchar str[256];
uchar ID;
void int_clk()
{
    uchar i;
    BCSCTL1&=~XT2OFF;  //打开XT振荡器
    BCSCTL2|=SELM1+SELS;//MCLK 8M and SMCLK 1M  
    do
	{
        IFG1 &= ~OFIFG;                 //清除振荡错误标志 
        for(i = 0; i < 100; i++)
	  _NOP();			//延时等待
        }
    while ((IFG1 & OFIFG) != 0);	//如果标志为1继续循环等待
    IFG1&=~OFIFG;
}
void int_spi()
{  
  
  P2DIR|=spi_cs;
  Disable;             // NOT SELECT 
  U0CTL|=SWRST;   
  U0CTL|=CHAR+SYNC+MM;
  U0TCTL|=SSEL1+SSEL0+STC;  //3 BIT AND SMCLK AS SPI CLOCK    
  U0TCTL|=CKPH;
  U0TCTL&=~CKPL;           //CKPL CKPH:01 rising Write data
  U0BR0=0X02;
  U0BR1=0X00;
  U0MCTL=0X00; 
  ME1|=USPIE0;
  U0CTL&=~SWRST;
  IE1&=~UTXIE0;
  IE1&=~URXIE0;
   P3SEL|=0x0E;
  P3DIR|=BIT2+BIT4; 
}
 write_byte(uchar byte)
{  
   U0TXBUF=byte; 
  while((IFG1&UTXIFG0)==0);
   IFG1&=~UTXIFG0;     
}
uchar read_byte()
{
  uchar byte;  
  U0TXBUF=0X00; 
  while((IFG1&UTXIFG0)==0);
  IFG1&=~UTXIFG0;
  while((IFG1&URXIFG0)==1); 
  byte=U0RXBUF;      
  return(byte);   
}

void busy()
{ 
     uchar i; 
     Enable;  
     write_byte(0x05);//Read Status Register 
     while(1)
     {
      i=read_byte();    
      i&=0x01;
      if(i==0) {Disable;break;}
     }
}
write_enable()
{
  Enable;
  write_byte(0x06);//Write enable command
  Disable;   
  busy();
}
write_sr()
{
  write_enable();
  Enable;
  write_byte(0x01);//write status register as 0x01
  write_byte(0x02);
  Disable;
  busy();
}
section_erase(uchar add1,uchar add2,uchar add3)
{
  write_enable();
  Enable;
  write_byte(0xD8);// Sector erase    
  write_byte(add1);
  write_byte(add2);
  write_byte(add3);
  Disable;   
  busy();
}
write_data(uchar add1,uchar add2,uchar add3,uchar *p)
{
  uchar  i;
  Enable;
  write_byte(0x06);//Write enable command
  Disable;
  busy();  
  Enable;
  write_byte(0x02);
  write_byte(add1);
  write_byte(add2);
  write_byte(add3);
  for(i=0;i<255;i++)
    {
      write_byte(i);
      p++;
    }
   Disable;  
   busy();
}
read_data(uchar add1,uchar add2,uchar add3,uchar *p)
{
  uchar i;
   Enable;
  write_byte(0x03);
  write_byte(add1);
  write_byte(add2);
  write_byte(add3);   
  for(i=0;i<255;i++)    
   {
    *p=read_byte();
      p++;
   }
  Disable;  
}
fast_read(uchar add1,uchar add2,uchar add3,uchar *p)
{
   uchar i;
   Enable;
  write_byte(0x0b);
  write_byte(add1);
  write_byte(add2);
  write_byte(add3);  
  write_byte(0) ;
  for(i=0;i<255;i++)    
   {
     *p=read_byte();
      p++;
   }
  Disable;  
}
bulk_erase()
{
  write_enable();
  write_byte(0xc7);
  busy();  
}
powerdown()
{
  Enable;
  write_byte(0xb9);
  Disable;
}
powerup()
{
  Enable;
  write_byte(0xab);
  Disable;
}
read_ID()
{
  Enable;
  write_byte(0xab);
  write_byte(0x00);
  write_byte(0x00);
  write_byte(0x00);
  ID=read_byte();
  Disable;
}
int main( void )
{ 
  uchar *p; 
  uint i;  
  WDTCTL=WDTPW+WDTHOLD;
  int_clk();
  int_spi();
  p=str;
  for(i=0;i<=255;i++)
  {
  str[i]=i;
  }
  ID=read_ID();
  write_enable();
  write_sr();
  section_erase(0x00,0x00,0x00);
  write_data(0x00,0x00,0x00,p);
  read_data(0x00,0x00,0x00,p); 
  while(1);
  }  