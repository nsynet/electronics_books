#include "iom16v.h"
#pragma interrupt_handler t1_vo:9
#pragma interrupt_handler int0_srv:2
//#pragma interrupt_handler t0_vo:10
//    �ⲿ8M ����
char flag_vof=0;  //�����־
char ttt,cc,laba;
unsigned int h=0,j2=0,delay;     //�洦������ѭ����ʯ
float s=0;         //����
unsigned long ds1=1,ds2=2,ds3=3,sum,sum2=0;// �������ʾλ�����룬����
unsigned long ds4=0,ds5=0,ds6=0,ds7,ds8,ds9,dell;

void t1_vo() 
{flag_vof=1;  //�洦
 h++; 
             //����
			  		TCCR2&=0XF1;
					DDRB&=0XF7;
					PORTB&=0Xf7;											
 stop();
 start();
}
void int0_srv()
{  char i_cnt;
   //asm("wdr");
   TCCR1B&=0XF8;
  // PORTD&=0Xf5;  
     
 
  if(flag_vof==0)
  				  {
   				    s=TCNT1;
  				    sum=s*43;   // ȥ·�̲�    
  				    sum2=sum;
   					sum2/=2500;  //  *172 /10000
   					sum2-=3;
   					ds1=sum2%10;
   					ds2=(sum2/10)%10;
   					ds3=sum2/100;
					i_cnt=ds6-ds3;
					if(i_cnt<0)i_cnt=-i_cnt;
   if((ds5==ds2)&&(ds1==ds4)&&(i_cnt<=1)){
                              if(ds3<1)dis();
							  if(ds8!=ds5)  {//��λ���²���
							                
	                           				TCCR2&=0XF1;
											DDRB|=0X8;
							   				TCNT0=0;
							   				laba=ds2+ds3*10;
							   				if(laba==0)laba=1;
							   				OCR0=laba; 
							   				TCCR2|=0X06;  
							                 }       
                              }
   							  ds7=ds4;
   							  ds8=ds5;
   							  ds9=ds6;							  
   							  ds4=ds1;
   							  ds5=ds2;
   							  ds6=ds3;						  
							  SREG|=0X80;
							  i_cnt=1;
	
							  while(--i_cnt)						  
            				   				{j2=50000;
            				                 while(--j2);
								            }
   
    			}
  else {flag_vof=0;   //���ܵȴ���ʱ
        stop();
		start();
        return;		
		}
		
  TCNT1=0X0;
  stop();
  start();
   
}
void gpio()
{ DDRA=0XFF;
  PORTA=0X0;
  DDRB=0XFF;
  PORTB=0;
  DDRD=0X8a;
  PORTD=0;
}
void set()
{ 
  TCCR1A=0;      //   ��ʽ0
  TCCR1B=0X0;   //δ��ʼ����  ��������   �½��ز���   
  MCUCR=0X02;
  GIFR|=0XE0;
  GICR|=0X40;
  TIMSK=0X04;
  
  OCR2=2;
  TCNT0=0;
  TCCR0=0X1F;
  TCCR2=0X1e;
}


void stop()
{  
     GICR&=0xbf;
     j2=50000;
	 PORTD&=0Xf5;  //ֹͣ�ź�
	 TCCR1B&=0XF8; // ֹͣ��ʱ
	 while(--j2);
	 j2=50000;
	 while(--j2);
	 j2=50000;
	 while(--j2);
	 GIFR|=0XE0;
	 
	
}

void start()
{ int i;
  i=125;
 PORTD|=0X0a;      //����
 TCCR1B=0X02;      //  1us  ��1����
 while(--i);        // 125us
 PORTD&=0Xf5;       //ͣ
 i=15;
 while(--i);        // 16US
 GIFR|=0XE0;
 GICR|=0X40;         //��
 SREG|=0X80;
 
}
void dis()
{  PORTB&=0x0f;

   PORTA=ds1;
   PORTB|=0X10;
   
   PORTA=ds2;
   PORTB|=0X30;
   
   PORTA=ds3;
   PORTB|=0X70;
}

main()
{   gpio();
    PORTD&=0Xf5;       
    dell=99999;
    while(dell--);
    flag_vof=0;     
    SREG=0X0;   
    PORTD&=0Xf5; //ֹͣ�ź�
    //PORTD|=0X0a; //��ʼ�ź� 
	
  dis();
  set();
  stop(); 
  start();
  //WDTCR=0x0f;
 
  asm("nop");
  while(1){
         // asm("wdr");
          }
 
}