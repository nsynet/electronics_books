#include <msp430x14x.h>
//#include "lcd.c"
//#include "key.c"
#define   uint  unsigned int
#define   uchar unsigned char
#define   SDA   BIT0
#define   SCL   BIT1
#define   DIN   P1IN  
#define   DOUT  P1OUT 
#define   DDIR  P1DIR
#define   S_SDA DDIR|=SDA,DOUT|=SDA
#define   C_SDA DDIR|=SDA,DOUT&=~SDA
#define   S_SCL DDIR|=SCL,DOUT|=SCL
#define   C_SCL DDIR|=SCL,DOUT&=~SCL
#define   SDA_IN DDIR&=~SDA
#define   READ_SDA  (DIN&SDA)
#define   delay()  _NOP(),_NOP(),_NOP(),_NOP(),_NOP(),_NOP(),_NOP(),_NOP(),_NOP(),_NOP(),_NOP(),_NOP(),_NOP(),_NOP(),_NOP(),_NOP(),\
                  _NOP(),_NOP(),_NOP(),_NOP(),_NOP(),_NOP(),_NOP(),_NOP(),_NOP(),_NOP(),_NOP(),_NOP(),_NOP(),_NOP(),_NOP(),_NOP()
/******************************************************/

uchar static key_flag=0;
/********************************************************/                 
uchar temp=0;                  
uchar ack;
uchar   rom_sed[9];
uchar  rom_rec[7];

/************************************
/***************************************/
/******************************************define  lcd******/
#define LCD_CS   BIT2
#define LCD_DAT  BIT4
#define LCD_SCK  BIT3
#define  WR  BIT2
#define  RS  BIT1
/************************************************************/
uchar charge=0;
uchar SYNCH=0xfe;  //LCD显示同步字
uchar time=0;
uchar hour=0,min=0,sec=0;
uchar static adc_flag=0;
void int_clk()  
{
  uint i;
  do  
    {  
    BCSCTL1&=~XT2OFF;//SET XT2 IS ON
    IFG1&=~OFIFG;//CLEAR  Oscillator fault flag
    for(i=0;i<=1000;i++)
         _NOP();
      }
    while(IFG1&OFIFG!=0);
    BCSCTL2|=SELM1+SELS;//SELECT XT2 FOR MCLK,FOR SMCLK AND DIVIDE FOR 0
                        //ACLK 32768hz  
}


void get_clk()
{
  P6DIR|=LCD_SCK;  
   _NOP();
  P6OUT&=~LCD_SCK;  
  _NOP();
  _NOP();
  _NOP();
  _NOP();
  _NOP();  
  P6OUT|=LCD_SCK; 
  _NOP();
  _NOP();
  _NOP();
  _NOP();
  _NOP();
  _NOP();
  _NOP();   
}
void inport(uchar com,uchar dat)//com=1,rs=1,com=0,rs=0;
{
  uchar i,temp; 
  P6DIR|=LCD_DAT;
  P6DIR|=LCD_CS;
  P6OUT|=LCD_CS;
  temp=SYNCH;
  temp&=~WR;
  if(com)      temp|=RS;
  else         temp&=~RS;
  for(i=0;i<=7;i++)
    {
      if(temp<<i&0x80)    P6OUT|=LCD_DAT;
      else             P6OUT&=~LCD_DAT;
      get_clk();
    }
  temp=dat&0xf0;
 for(i=0;i<=7;i++)
    {
      if(temp<<i&0x80)    P6OUT|=LCD_DAT;
      else             P6OUT&=~LCD_DAT;
      get_clk();
    }
    temp=dat&0x0f;
    temp=temp<<4;
 for(i=0;i<=7;i++)
    {
      if(temp<<i&0x80)    P6OUT|=LCD_DAT;
      else             P6OUT&=~LCD_DAT;
      get_clk();
    } 
 P6OUT|=LCD_DAT;
 P6OUT&=~LCD_CS;
}
print_char(uchar add,uchar data)
{
 inport(0x00,add);
 inport(0x01,data);
}
print_string(uchar add,uchar *pt)
{
  uchar i;
  inport(0x00,add);
  for(i=0;;i++)
 {
    if(*pt=='\n') break;
    inport(0x01,*pt);
    pt++;
 }
}
print_han(uchar h_neima,uchar l_neima)\
{
 inport(0x01,h_neima);
 inport(0x01,l_neima); 
}
print_float(float data)
{
    uint temp;
    uchar a1,a2,a3,a4;
    temp=data*1000;
    a1=temp/1000;
    a2=(temp-a1*1000)/100;
    temp=(temp-a1*1000)-a2*100;
    a3=temp/10;
    a4=temp%10;
    inport(0x01,a1+0x30);  
    inport(0x01,'.');  
    inport(0x01,a2+0x30);  
    inport(0x01,a3+0x30);  
    inport(0x01,a4+0x30);  
}
void int_lcd()
{
  inport(0x00,0x30);
  inport(0x00,0x01);
  inport(0x00,0x02);
  inport(0x00,0x0c);
  inport(0x00,0x06);
}
/*********************************************************/

void delay2()
{
   uint i;
  for(i=0;i<=1000;i++)
       ;
} 
 
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
  P5OUT&=0XF0;//低位全部为0，判断有无键按下
  temp=P5IN&0xf0;
  if(temp==0xf0)key_flag=0;
  else          
  {
  key_flag=1;
  }  
}
void over()
{
  uchar temp;
  P5OUT&=0XF0;//低位全部为0，判断有无键按下
  do
  {
  temp=P5IN&0xf0;
  if(temp==0xf0)break;
  } 
  while(1);
}
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
 key=key;
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
/********************************************************/
/********************************************

启动总线函数
**************************************/
void  start()
{     
      S_SDA;
      _NOP();
      S_SCL;
      delay();
      C_SDA;
      delay();
      C_SCL;
      _NOP();
      _NOP();
}
/************************************
停止总线函数
**************************************/
void stop()
{   
     C_SCL;
    _NOP();
     C_SDA;
      delay();
      S_SCL;
      delay();
      S_SDA;   
    _NOP();
    _NOP();
    _NOP();
    _NOP();     
}
/************************************
发送一个字节函数
**************************************/
void SendByte(uchar c)
{
      uchar i;    
      for(i=0;i<8;i++)
          {
            if((c<<i)&0x80)
                S_SDA;
            else
                C_SDA;
            delay();
            S_SCL;
            delay();
            C_SCL;
            delay();
          }
        S_SCL;
        delay();
        SDA_IN;    
       _NOP();
       _NOP();
       _NOP();   
      if(DIN&SDA==SDA)
          ack=0;
      else
          ack=1;
       delay();
      C_SCL;
     
      _NOP();
     _NOP();
}
/************************************
停止总线函数
**************************************/
void send_ack(uchar a)
{     
      if(a==0)       
       { 
       C_SDA;
       delay();
       S_SCL;
       delay();
       C_SCL;
       delay();
       S_SDA;
      }
      else
       { 
        S_SDA;          
        delay();
        S_SCL;
        delay();
        C_SCL;
        delay();
      }      
}
/************************************
接收一个字节函数
**************************************/
uchar RcvByte()
{
      uchar retc;
      uchar i;
      retc=0;   
      SDA_IN;
      for(i=0;i<8;i++)
        {       
          delay();
          S_SCL;
          delay();       
          retc=retc<<1;
          SDA_IN;
          if(READ_SDA==SDA)//read p4in 
              retc+=1;                         
         delay();
         C_SCL;
         delay();
         }     
      return(retc);        
}
/************************************
接收一个字节函数
**************************************/
uchar ISendByte(uchar sla,uchar c)
{
      start();
      SendByte(sla);
      if(ack==0)
          return(0);
      SendByte(c);
      if(ack==0)
          return(0);
      stop();
      return(1);
}
/************************************
发送一个数据串函数
**************************************/
uchar ISendstr(uchar sla,uchar suba,uchar *s,uchar no)
{
      uchar i;     
      start();
      SendByte(sla);
      if(ack==0)
          return(0);
      SendByte(suba);
      if(ack==0)
          return(0);
     for(i=0;i<no;i++)
          {
            SendByte(*s);
            if(ack==0)
              return(0);
            s++;
            suba++;
          }
      stop();     
      return(1);  
}
/************************************
接收多个数据串函数
**************************************/
uchar IRcvbyte(uchar sla,uchar *c)
{
      start();
      SendByte(sla+1);
      if(ack==0)
          return(0);
      *c=RcvByte();
      send_ack(1);
      stop();
      return(1);
}
//check
uchar IRcvStr(uchar sla,uchar suba,uchar *s,uchar no)
{
      uchar i;
      start();
      SendByte(sla);
      if(ack==0)
          return(0);
      SendByte(suba);
      if(ack==0)
          return(0);
      start();
      SendByte(sla+1);
      if(ack==0)
          return(0);
      for(i=0;i<no-1;i++)
          {
              *s=RcvByte();
              send_ack(0);
              s++;             
          }
      *s=RcvByte();
      temp=*s;
      send_ack(1);
      stop();
      return(1);
}

uchar static time_flag=0;
void int_timer()
{
  TACTL|=TASSEL1+TACLR+ID0+ID1;//选择SMCLK作为定时器的时钟，8分频
  TACTL|=MC0+TAIE;//增加模式，并且使能中断
  TACCR0=9999;//中断周期为10ms  
  }
  
#pragma vector=TIMERA1_VECTOR
__interrupt void Timer_A(void)
{
  switch(TAIV)
  {
    case 2:break;
    case 4:break;
    case 10:time_flag=1;break;//10ms中断标志加1
  }   
}

 



uchar key=0xff;
uchar static set_flag=0;
uchar static ok_flag=0;
uchar static cansel_flag=0;
uchar static year_flag=0;
uchar static month_flag=0;
uchar static day_flag=0;
uchar static hour_flag=0;
uchar static minute_flag=0;
uchar static second_flag=0;
uchar static count=0;
uchar static lcd_flag=1;
uchar static  iic_flag=0;
struct RTC
{
  uchar year;
  uchar month;
  uchar day;
  uchar hour;
  uchar minute;
  uchar seconed;
};

struct RTC DATA;

/*
DATA.year=0x07;
DATA.month=0x01;
DATA.day=0x01;
DATA.hour=0x01;a
DATA.minute=0x00;
DATA.second=0x00;*/ 
   uchar tt=0;
   uchar static aa=0;
   
   
int main( void )
   {
        uchar time=0,xx;
        uchar flag=0;
        uchar count=0;
        uchar temp[16]={0};
        uchar i=0;
	uchar *p;	
	uchar bb=0;
	WDTCTL=WDTPW+WDTHOLD;   
	int_clk();	
	int_lcd();
	P5DIR|=BIT0+BIT1+BIT2+BIT3;
	_EINT(); 	
	while(1)
        {   
	        
	   fast_scan(); 
	  if(key_flag==1)
	    {  delay2();
	       key=get_key();
	       over();
	       delay2();
	     }
	  if(key!=0xff)
	  {
	      
	    switch(key)
	    {
	      case 0:  {lcd_flag=1;temp[count]=key;count++;  if(count==16) count=0;key=0xff;break;}
	      case 1:  {lcd_flag=1;temp[count]=key;count++;  if(count==16) count=0;key=0xff;break;}
	      case 2:  {lcd_flag=1;temp[count]=key;count++;  if(count==16) count=0;key=0xff;break;}
	      case 3:  {lcd_flag=1;temp[count]=key;count++;  if(count==16) count=0;key=0xff;break;}
	      case 4:  {lcd_flag=1;temp[count]=key;count++;  if(count==16) count=0;key=0xff;break;}
	      case 5:  {lcd_flag=1;temp[count]=key;count++;  if(count==16) count=0;key=0xff;break;}
	      case 6:  {lcd_flag=1;temp[count]=key;count++;  if(count==16) count=0;key=0xff;break;}
	      case 7:  {lcd_flag=1;temp[count]=key;count++;  if(count==16) count=0;key=0xff;break;}
	      case 8:  {lcd_flag=1;temp[count]=key;count++;  if(count==16) count=0;key=0xff;break;}
	      case 9:  {lcd_flag=1;temp[count]=key;count++;  if(count==16) count=0;key=0xff;break;}
	      case 10: {set_flag=1;count=0;lcd_flag==1;int_timer();key=0xff;iic_flag=0;break;}//初始化定时器
	      case 11: {ok_flag=1;count=0;aa=0; print_char(0x90,aa+0x30);TACTL&=~TAIE;key=0xff;break;}
	      case 12: {key=0xff;lcd_flag=1;if(count<15)count++;break;}
	      case 13: {key=0xff;lcd_flag=1;if(count!=0)count--;break;}
	      case 14: {iic_flag=1;key=0xff;break;}
	      case 15: key=0xff;break;
	      default: break;
	    }
	  }	   
	  if(lcd_flag==1)
	   {
	      lcd_flag=0;
	      inport(0x00,0x80);
	      for(i=0;i<16;i++)
	        {	     
                 inport(0x01,temp[i]+0x30);
	        }
	    }
	   if(time_flag==1)	
	         {
	            time++;time_flag=0;
	         }
	   if(time==8) 
	 
	         { 
	         //if(count!=0)       bb=count-1;
	        // else             
	           bb=count;
	        // TACTL&=~TAIE;
	          time=0;
	        //    lcd_flag=1;
	            if((bb%2)!=0)
	                { 
	                 inport(0x00,bb/2+0x80);
	                 inport(0x01,temp[bb-1]+0x30);
	                }
	              else 
	                {
	                  inport(0x00,bb/2+0x80);
	                 }
	               if(flag==0)
	                  {
	                    flag=1;inport(0x01,' ');
	                    lcd_flag=0;
	                   }
	               else
	                  {
	                    flag=0;inport(0x01,temp[bb]+0x30);
	                    lcd_flag=1;
	                   }
	                     // TACTL|=TAIE;
	           }
	   if(ok_flag==1)
	   {
	  ok_flag=0;
	   inport(0x00,0x01);
	  iic_flag=1;
	  rom_sed[0]=0x00;
	  rom_sed[1]=0x00; 
	  rom_sed[2]=temp[15]|(temp[14]<<4);
	  rom_sed[3]=temp[13]|(temp[12]<<4);  
	  rom_sed[4]=temp[11]|(temp[10]<<4); 
	  rom_sed[5]=temp[9]|(temp[8]<<4);  
	  rom_sed[6]=temp[7]|(temp[6]<<4);
	  rom_sed[7]=temp[5]|(temp[4]<<4);
	  rom_sed[8]=temp[3]|(temp[2]<<4);;
	  p=rom_sed; 	
	  ISendstr(0xA2,0x00,p,9);//set first time
	   }   
	  if(iic_flag==1)
	  {
	 inport(0x00,0x89);
	 delay();
	 delay();
	 delay();
	 delay();
	 delay();
		_NOP();
        _NOP();
	   
		p=rom_rec;
		IRcvStr(0xA2,0x02,p,0x07);//get time
		rom_rec[0]&=0x7f;//s
		inport(0x01,(rom_rec[0]&0x0f)+0x30);
		rom_rec[0]=rom_rec[0]>>4;
		inport(0x01,(rom_rec[0]&0x0f)+0x30);
		rom_rec[1]&=0x7f;//m
		inport(0x01,(rom_rec[1]&0x0f)+0x30);
		rom_rec[1]=rom_rec[1]>>4;
		inport(0x01,(rom_rec[1]&0x0f)+0x30);
		rom_rec[2]&=0x3f;//x
		inport(0x01,(rom_rec[2]&0x0f)+0x30);
		rom_rec[2]=rom_rec[2]>>4;
		inport(0x01,(rom_rec[2]&0x0f)+0x30);
		rom_rec[3]&=0x3f;
		inport(0x01,(rom_rec[3]&0x0f)+0x30);
		rom_rec[3]=rom_rec[3]>>4;
		inport(0x01,(rom_rec[3]&0x0f)+0x30);
		rom_rec[4]&=0x07;
		inport(0x01,(rom_rec[4]&0x0f)+0x30);
		rom_rec[5]&=0x1f;
		inport(0x01,(rom_rec[5]&0x1f)+0x30);
		rom_rec[6]&=0xff;	
		inport(0x01,rom_rec[6]+0x30);
           }
    }   
 }

    
  
