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
//写数据
void send_data(uchar data)
{
  while(P2IN&TXF==1);//判断状态
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
//读数据
uchar recive_data()
{
  uchar data;
  P4DIR=0X00;
  while(P2IN&RXF==1);//判断状态
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
  WDTCTL = WDTPW + WDTHOLD; //关闭看门狗        
  int_clk();//初始化时钟
  P1DIR|=Read+Write;
  P5DIR=0xff;
  P1IE|=RXF;
  P1IES|=RXF;//I/O口功能和方向初始化
  _EINT();
  while(1)
  {
  while(usb_flag==1)//判断接受数据标志，如果接受到数据则返回改数据
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
  P1IFG&=~RXF;//清除中断标志
  usb_flag=1;//接收数据标志写1
 } 
 
 