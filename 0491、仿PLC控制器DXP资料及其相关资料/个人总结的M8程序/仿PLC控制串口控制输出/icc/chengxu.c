/***************************************************
AVR单片机8路可编程输入、输出板编程需求

1.串口通信格式为：9600，N,8,1
2.与上位机的通信全部采用ASCII码；
3.8路输入状态可由上位机发送查询指令时返回所有通道状态，在每个端口的状态改变时，
  自动发送状态改变信息；有输入为1，无输入为0；
4.8路输出的状态由上位机发送指令进行控制，彼此间不互相关联即可以由上位机单独控制
  每个通道的状态；如发送"K1"表示第1通道输出为1（开）、发送“G1”表示第1通道输出为0（关）；
5.所有第1个通道在程序或协议中即为"1",不从0开始计算。



/*****************************************************/
/*****************************************************
Project : 
Version : 
Date    : 2009-8-12
Author  : F4CG                            
Company : F4CG                            
Comments: 


Chip type           : ATmega8
Program type        : Application
Clock frequency     : 8.000000 MHz
Memory model        : Small
External SRAM size  : 0
Data Stack size     : 256
*****************************************************/

#include <mega8.h>
#include <delay.h>  

#define uchar unsigned char
#define uint  unsigned int
#define BAUD   9600
/*设置波特率为     9600*/
#define CRS    8000000   
/*设置晶振   4MHZ*/
#define BAUD_SET (unsigned int)  ((unsigned long)CRS/(16*(unsigned long)BAUD)-1) 
#define BAUD_H   (unsigned char) (BAUD_SET>>8) 
#define BAUD_L   (unsigned char) (BAUD_SET)
//定义UCSRA寄存器的位    控制和状态寄存器
#define RXC  7
#define TXC  6
#define UDRE 5
#define FE   4
#define DOR  3
#define PE   2
#define U2X  1
#define MPCM 0 
//定义UCSRB寄存器的位   控制和状态寄存器
#define RXCIE 7
#define TXCIE  6
#define UDRIE  5
#define RXEN   4
#define TXEN   3
#define UCSZ2  2
#define RXB8   1
#define TXB8   0
//定义UCSRC寄存器的位    控制和状态寄存器
#define URSEL  7
#define UMSEL  6
#define UPM1   5
#define UPM0   4
#define USBS   3
#define UCSZ1  2
#define UCSZ0  1
#define UCPOL  0 

#define FRAMING_ERROR  (1<<FE)
#define PARITY_ERROR   (1<<PE) 
#define DATA_OVERRUN     (1<<DOR)
#define DATA_REGISTER_EMPTY  (1<<UDRE)  
//定义继电器的输出端口
#define io1 PORTC.0
#define io2 PORTC.1
#define io3 PORTC.2
#define io4 PORTC.3
#define io5 PORTB.0
#define io6 PORTB.1
#define io7 PORTB.2
#define io8 PORTB.3
// 定义串口读取的数值
uchar data;//那个通道标志
uchar temp;//状态标志 
uchar tempK;
//uchar dataK;
uint counter;
void main(void)
{

UCSRA=0X00;
UCSRB=0X98;
UCSRC=0X86;
UBRRH=BAUD_H;
UBRRL=BAUD_L; 
PORTC=0X00;
PORTB=0X00;
DDRC=0XFF;
DDRB=0XFF;
PORTC=0XFF;
PORTB=0XFF;
#asm("sei")
while (1)
      {
	   	   	   	switch(data)
       {
          case 'K':  
             { 
               tempK=temp;
               temp='';
                switch(tempK)
                   {
                   case '1': io1=0; break;
                   case '2': io2=0; break;
                   case '3': io3=0; break;
                   case '4': io4=0; break;
                   case '5': io5=0; break;
                   case '6': io6=0; break;
                   case '7': io7=0; break;
                   case '8': io8=0; break;
                    }
             }
              break;
          case 'G':
          tempK=temp;
               temp='';              
             {   switch(tempK)
                   {
                   case '1': io1=1; break;
                   case '2': io2=1; break;
                   case '3': io3=1; break;
                   case '4': io4=1; break;
                   case '5': io5=1; break;
                   case '6': io6=1; break;
                   case '7': io7=1; break;
                   case '8': io8=1; break;
                    }
                    } break;
       
       } 
      };
}
interrupt [USART_RXC] void ucsra_rx(void)
{  
     counter++; 
     switch(counter)
         {
            case 1:      data=UDR; break;
            case 2:   { 
                         temp=UDR; 
                         counter=0;         
                       }
                      break;  
         } 
}  