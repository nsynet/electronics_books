#include <msp430x14x.h> 
     void Init(void);//声明初始化函数 
    char Data[20]="wang qing"; //发送的字符串 

     void int_clk()
{
    unsigned char i;
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
     void Init(void) 
     { 
 
  U0CTL|=SWRST;//复位串口
  U0CTL|=CHAR; //8位数据
  U0TCTL|=SSEL1;//select SMCLK AS CLK
  U0BR0=0xA0;
  U0BR1=0x01;
  UMCTL0=0xC0;//19200
  ME1|=UTXE0;//使能接收和发送 
  U0CTL&=~SWRST;//清除串口复位信号
  IE1|=URXIE0;//使能接收中断
  P3SEL|=BIT4;
  P3SEL|=BIT5;//选择I/O口使用扩展功能和方向
  P3DIR|=BIT4;  
}
     void main(void) 
     { 
       unsigned int i,m=1; 
       WDTCTL = WDTPW + WDTHOLD; 
       int_clk();
       Init();  //调用初始化函数 
      while(m--)  //无限次循环 
      { 
       for(i=0;i<=21;i++) 
       { 
       
       while((UTCTL0&0x01)==0); //发送缓冲器有待发数据时，UTCTL0的第0位复位，进入等待 
      TXBUF0=Data[i]; //向缓冲器送入待发送数据 
       } 
      } 
     }
