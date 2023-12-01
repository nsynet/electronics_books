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
#define BAUD  9600  //设置波特率为     9600
#define CRS    7372800   //设置晶振   
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
//定义单片机输入的端口
// #define  input7 PIND.0
// #define  input8 PIND.1
//  以上被串口传送占据故省略
#define  input1 PIND.2
#define  input2 PIND.3
#define  input3 PIND.4
#define  input4 PIND.5
#define  input5 PIND.6
#define  input6 PIND.7
// 定义串口读取数据的时候用的存储变量
uchar data;//  那个通道标志
uchar temp;//状态标志   
//定义函数处理数据时用的变量 
uchar  datak;
uchar tempK,tempG,tempD; 
uchar new_data,old_data; 
uchar new_num1,old_num1,new_num2,old_num2,new_num3,old_num3,new_num4,old_num4,new_num5,old_num5,new_num6,old_num6;
uint  counter;   
flash uchar  code[9]={'0','1','2','3','4','5','6','F','C'}; 
void UART_SCEND(uchar data)
{
  while(!(UCSRA&DATA_REGISTER_EMPTY));
    UDR=data; 
}
void scend_head()  //发送头文件字符FF 0
{
UART_SCEND(code[7]);
UART_SCEND(code[7]);
UART_SCEND(code[0]);
}
void scend_end()  //发送结束文件字符FC
{
UART_SCEND(code[7]);
UART_SCEND(code[8]);
}
void rs232_scend(uchar i,uchar j)
{ 
scend_head();
UART_SCEND(code[i]);
UART_SCEND(code[0]); //固定的状态
UART_SCEND(code[j]);
scend_end();

}  
void PD_canshu_int()
{
new_num1=1;
 old_num1=new_num1; 
 new_num2=1;
 old_num2=new_num2; 
  new_num3=1;
 old_num3=new_num3; 
  new_num4=1;
 old_num4=new_num4; 
  new_num5=1;
 old_num5=new_num5; 
  new_num6=1;
 old_num6=new_num6; 
}
void read_d1()
{ 
  new_num1=input1;
 if(old_num1==new_num1 )
    {  
     old_num1=new_num1; 
    }  
  else
    { rs232_scend(1,new_num1);
      old_num1=new_num1;  
      delay_ms(2); 
    }
} 
void read_d2()
{ 
  new_num2=input2;
 if(old_num2==new_num2 )
    {  
     old_num2=new_num2; 
    }  
  else
    { rs232_scend(2,new_num2);
      old_num2=new_num2;  
      delay_ms(2); 
    }
}
void read_d3()
{ 
  new_num3=input3;
 if(old_num3==new_num3 )
    {  
     old_num3=new_num3; 
    }  
  else
    { rs232_scend(3,new_num3);
      old_num3=new_num3;  
      delay_ms(2); 
    }
}
void read_d4()
{ 
  new_num4=input4;
 if(old_num4==new_num4 )
    {  
     old_num4=new_num4; 
    }  
  else
    { rs232_scend(4,new_num4);
      old_num4=new_num4;  
      delay_ms(2); 
    }
}
void read_d5()
{ 
  new_num5=input5;
 if(old_num5==new_num5 )
    {  
     old_num5=new_num5; 
    }  
  else
    { rs232_scend(5,new_num5);
      old_num5=new_num5;  
      delay_ms(2); 
    }
}
void read_d6()
{ 
  new_num6=input6;
 if(old_num6==new_num6 )
    {  
     old_num6=new_num6; 
    }  
  else
    { rs232_scend(6,new_num6);
      old_num6=new_num6;  
      delay_ms(2); 
    }
}
void check_every()
{
read_d1(); 
read_d2(); 
read_d3(); 
read_d4(); 
read_d5(); 
read_d6(); 
} 
void check_D()
{   
 // uchar new_data,old_data;
 new_data=PIND&0XFC;//屏蔽PD0 PD1
 if(old_data==new_data )
    {  
     old_data=new_data; 
    }  
  else
    { check_every();
      old_data=new_data;  
      delay_ms(40); 
    }
 }
void main(void)
{
    #asm("wdr")
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
 DDRD=0X03; 
    #asm("wdr")         
 new_data=PIND&0XFC;
 old_data=new_data;  
 PD_canshu_int();  
 tempK='';
 tempD='';
 tempG='';
    #asm("wdr")
 #asm("sei")
while (1)
      {
       check_D();   
       datak=data; 
       switch(datak)
          {
            case 'K':  
               {   #asm("wdr")
                 tempK=temp;
                 temp='';
               } break;
            case 'G':
               {  // #asm("wdr")
                 tempG=temp;
                   temp=''; 
                    } break;
            case 'C': 
                {  // #asm("wdr")  
                   tempD=temp;
                   temp=''; 
                   } break;    
       } 
     switch(tempK)
                   {  #asm("wdr")
                    case '1': io1=0; break;
                    case '2': io2=0; break;
                    case '3': io3=0; break;
                    case '4': io4=0; break;
                    case '5': io5=0; break;
                    case '6': io6=0; break;
                    case '7': io7=0; break;
                    case '8': io8=0; break;
                    }
                     #asm("wdr")
     switch(tempG)
                   {
                    case '1': io1=1; break;
                    case '2': io2=1; break;
                    case '3': io3=1; break;
                    case '4': io4=1; break;
                    case '5': io5=1; break;
                    case '6': io6=1; break;
                    case '7': io7=1; break;
                    case '8': io8=1; break;
                    } //#asm("wdr")
   if(tempD=='D') 
    {  #asm("wdr")   delay_ms(3);   #asm("wdr")                  
      rs232_scend(1, input1); 
      delay_ms(3);
      rs232_scend(2, input2);    delay_ms(3);// #asm("wdr") 
      rs232_scend(3, input3);  #asm("wdr")    delay_ms(3);
      rs232_scend(4, input4);    delay_ms(3);// #asm("wdr") 
      rs232_scend(5, input5);  #asm("wdr")    delay_ms(3);
      rs232_scend(6, input6);    delay_ms(3);// #asm("wdr") 
    }      
      };
}
interrupt [USART_RXC] void ucsra_rx(void)
{  
     counter++;  
     switch(counter)
         {
            case 1:     #asm("wdr")  data=UDR; break;
            case 2:   {   
                         temp=UDR;    
                         counter=0;      
                       }
                      break;  
         } #asm("wdr")
} 
