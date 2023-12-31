/********************************************************************
                            汇诚科技
网址：http://www.ourhc.cn
产品有售淘宝店：http://shop36330473.taobao.com   
*********************************************************************/
#include <iom8v.h>
#include <macros.h>
/********************************************************************
                      串口初始化子程序
*********************************************************************/
void Uart_Init(void)
{
    UCSRB  =  0x00;     //disable while setting baud rate
    UCSRA  =  0x00;     //Bit1为1则倍速发送
    UCSRC  =  0x86;  
    UBRRL  =  0x33;     //波特率：9600 Bps
    UBRRH  =  0x00;     //误差率：0.156%
    UCSRB  =  0x18;  
}
/********************************************************************
                      串口接收字节子程序
*********************************************************************/
unsigned char Getchar(void)
{
   while(!(UCSRA& (1<<RXC)));
   return UDR;
}
/********************************************************************
                     串口发送字节子程序
*********************************************************************/
void Putchar(unsigned char c)
{
   while (!(UCSRA&(1<<UDRE)));
   UDR=c;
}
/********************************************************************
                     串口发送字符串子程序
*********************************************************************/
void Putstr(char *s)
{
   while (*s)
   {
      Putchar(*s);
      s++;
   }
}
/********************************************************************
                     串口发送字符串子程序(带有换行符)
*********************************************************************/
void Puts(char *s)
{
   while (*s)
   {
      Putchar(*s);
      s++;
   }
   Putchar(0x0a);   //回车换行
   Putchar(0x0d);
}
/********************************************************************
                            主函数
*********************************************************************/
void main(void)
{
   unsigned char i=0;

   Uart_Init();

   Puts("zhang xin chun ");
   Puts("Http://www.ourhc.cn");
   Puts("ATMega16 UART TEST");
   Putchar(0x0a);
   Putchar(0x0d);
   while(1)
   {
      i=Getchar();
      if (i!=0)    //发送0x0F开始测试
      {
         i=0;
         Puts("AVR-ARM RS232 TEST CODE");
         Puts("Http://www.ourhc.cn");
         Puts("ATMega16 UART TEST");
         Putchar(0x0a);
         Putchar(0x0d);
      }
   }
}



