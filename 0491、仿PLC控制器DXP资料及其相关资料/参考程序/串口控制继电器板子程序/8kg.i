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
// CodeVisionAVR C Compiler
// (C) 1998-2004 Pavel Haiduc, HP InfoTech S.R.L.
// I/O registers definitions for the ATmega8
#pragma used+
sfrb TWBR=0;
sfrb TWSR=1;
sfrb TWAR=2;
sfrb TWDR=3;
sfrb ADCL=4;
sfrb ADCH=5;
sfrw ADCW=4;      // 16 bit access
sfrb ADCSRA=6;
sfrb ADMUX=7;
sfrb ACSR=8;
sfrb UBRRL=9;
sfrb UCSRB=0xa;
sfrb UCSRA=0xb;
sfrb UDR=0xc;
sfrb SPCR=0xd;
sfrb SPSR=0xe;
sfrb SPDR=0xf;
sfrb PIND=0x10;
sfrb DDRD=0x11;
sfrb PORTD=0x12;
sfrb PINC=0x13;
sfrb DDRC=0x14;
sfrb PORTC=0x15;
sfrb PINB=0x16;
sfrb DDRB=0x17;
sfrb PORTB=0x18;
sfrb EECR=0x1c;
sfrb EEDR=0x1d;
sfrb EEARL=0x1e;
sfrb EEARH=0x1f;
sfrw EEAR=0x1e;   // 16 bit access
sfrb UBRRH=0x20;
sfrb UCSRC=0X20;
sfrb WDTCR=0x21;
sfrb ASSR=0x22;
sfrb OCR2=0x23;
sfrb TCNT2=0x24;
sfrb TCCR2=0x25;
sfrb ICR1L=0x26;
sfrb ICR1H=0x27;
sfrw ICR1=0x26;   // 16 bit access
sfrb OCR1BL=0x28;
sfrb OCR1BH=0x29;
sfrw OCR1B=0x28;  // 16 bit access
sfrb OCR1AL=0x2a;
sfrb OCR1AH=0x2b;
sfrw OCR1A=0x2a;  // 16 bit access
sfrb TCNT1L=0x2c;
sfrb TCNT1H=0x2d;
sfrw TCNT1=0x2c;  // 16 bit access
sfrb TCCR1B=0x2e;
sfrb TCCR1A=0x2f;
sfrb SFIOR=0x30;
sfrb OSCCAL=0x31;
sfrb TCNT0=0x32;
sfrb TCCR0=0x33;
sfrb MCUCSR=0x34;
sfrb MCUCR=0x35;
sfrb TWCR=0x36;
sfrb SPMCR=0x37;
sfrb TIFR=0x38;
sfrb TIMSK=0x39;
sfrb GIFR=0x3a;
sfrb GICR=0x3b;
sfrb SPL=0x3d;
sfrb SPH=0x3e;
sfrb SREG=0x3f;
#pragma used-
// Interrupt vectors definitions
// CodeVisionAVR C Compiler
// (C) 1998-2000 Pavel Haiduc, HP InfoTech S.R.L.
#pragma used+
void delay_us(unsigned int n);
void delay_ms(unsigned int n);
#pragma used-
//定义UCSRA寄存器的位    控制和状态寄存器
//定义UCSRB寄存器的位   控制和状态寄存器
//定义UCSRC寄存器的位    控制和状态寄存器
//定义继电器的输出端口
//定义单片机输入的端口
// #define  input7 PIND.0
// #define  input8 PIND.1
//  以上被串口传送占据故省略
// 定义串口读取数据的时候用的存储变量
unsigned char data;//  那个通道标志
unsigned char temp;//状态标志   
//定义函数处理数据时用的变量 
unsigned char  datak;
unsigned char tempK,tempG,tempD; 
unsigned char new_data,old_data; 
unsigned char new_num1,old_num1,new_num2,old_num2,new_num3,old_num3,new_num4,old_num4,new_num5,old_num5,new_num6,old_num6;
unsigned int  counter;   
flash unsigned char  code[9]={'0','1','2','3','4','5','6','F','C'}; 
void UART_SCEND(unsigned char data)
{
  while(!(UCSRA&(1<<5)  ));
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
void rs232_scend(unsigned char i,unsigned char j)
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
  new_num1=PIND.2;
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
  new_num2=PIND.3;
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
  new_num3=PIND.4;
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
  new_num4=PIND.5;
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
  new_num5=PIND.6;
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
  new_num6=PIND.7;
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
 UBRRH=(unsigned char) ((unsigned int)  ((unsigned long)8000000   /(16*(unsigned long)9600  )-1) >>8) ;
 UBRRL=(unsigned char) ((unsigned int)  ((unsigned long)8000000   /(16*(unsigned long)9600  )-1) ); 
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
                    case '1': PORTC.0=0; break;
                    case '2': PORTC.1=0; break;
                    case '3': PORTC.2=0; break;
                    case '4': PORTC.3=0; break;
                    case '5': PORTB.0=0; break;
                    case '6': PORTB.1=0; break;
                    case '7': PORTB.2=0; break;
                    case '8': PORTB.3=0; break;
                    }
                     #asm("wdr")
     switch(tempG)
                   {
                    case '1': PORTC.0=1; break;
                    case '2': PORTC.1=1; break;
                    case '3': PORTC.2=1; break;
                    case '4': PORTC.3=1; break;
                    case '5': PORTB.0=1; break;
                    case '6': PORTB.1=1; break;
                    case '7': PORTB.2=1; break;
                    case '8': PORTB.3=1; break;
                    } //#asm("wdr")
   if(tempD=='D') 
    {  #asm("wdr")   delay_ms(3);   #asm("wdr")                  
      rs232_scend(1, PIND.2); 
      delay_ms(3);
      rs232_scend(2, PIND.3);    delay_ms(3);// #asm("wdr") 
      rs232_scend(3, PIND.4);  #asm("wdr")    delay_ms(3);
      rs232_scend(4, PIND.5);    delay_ms(3);// #asm("wdr") 
      rs232_scend(5, PIND.6);  #asm("wdr")    delay_ms(3);
      rs232_scend(6, PIND.7);    delay_ms(3);// #asm("wdr") 
    }      
      };
}
interrupt [12] void ucsra_rx(void)
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
