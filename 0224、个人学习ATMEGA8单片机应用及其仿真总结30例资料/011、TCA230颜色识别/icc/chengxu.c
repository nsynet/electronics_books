#include <iom8v.h>
#define uchar unsigned char 
#define uint unsigned int
uchar duan[10]={0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09};	 //����Ķε�λ��
//uchar wei[4]={0XFE,0XFD,0XFB,0XF7};                                 //λ�Ŀ��ƶ�	(������)
uchar wei[4]={0X08,0X04,0X02,0X01};                                 //λ�Ŀ��ƶ�	(����)
uint z,x,c,v, date;	//������������
uchar CNT=0;//������ֵ
uint lck=0;
uint Load;
/******************************************************************

��ʱ����

******************************************************************/
void delay(uchar t)
{
  uchar i,j;
   for(i=0;i<t;i++)
   {
   	 for(j=13;j>0;j--);
	 { ;
	 }
   }
}

/**********************************************************************
                ����ܶ�̬ɨ��
*********************************************************************/
void xianshi()
 { 
 /*****************����ת��*****************************/ 
  z=date/1000;			 //��ǧλ
  x=date%1000/100;		 //���λ
  c=date%100/10;		 //��ʮλ
  v=date%10;			 //���λ

      PORTC=wei[0];
	  PORTB=duan[z];
	  delay(50);  
  	  PORTC=wei[1];
      PORTB=duan[x];
	  delay(50);  
   	  PORTC=wei[2];
      PORTB=duan[c];
	  delay(50);  
      PORTC=wei[3];
      PORTB=duan[v];
	  delay(50);  
 			               

 }

//////////////////////////////��ʼ��////////////////////////////////////
void Init_IO(void)//��ʼ��I/O
{
//����B��Ϊ����
DDRB=0xFF;
PORTB=0xFF;
//����C��Ϊ���
DDRC=0xFF;
PORTC=0xFF;
//����D��Ϊ���
DDRD=0X00;
PORTD=0x00;
}
/////////////////////////////������/////////////////////////////////////
void main(void)
{

Init_IO();  //��ʼ��I/O
PORTC=0XFF; //���������
PORTB=0X00; //���������
delay(30);//��ʱ
PORTB=0xff; //�ر������

TCCR0=0x02; //T/C0������ʽѡ��8��Ƶ
//TCNT0=0x00; //������ʼֵ9c

TCCR1B=0x07; //T/C0������ʽѡ�������ش���
TCNT1H=0X00;
TCNT1L=0X00;
TIMSK=0x01;  //ʹ��T0����ж�
SREG=0x80;  //ʹ��ȫ���ж�
while(1)
{
 date=Load; //����ֵ
 //date=1234; //����ֵ
 xianshi(); //��̬ɨ����ʾ
}
}
//////////////////////////T/CO�жϷ�����//////////////////////////////////////////
#pragma interrupt_handler Timer0:10
void Timer0(void)
{
 TCNT0=0xa0; //������ʼֵ
 lck++;
 if(lck==1000)
       {
        Load=TCNT1;//H+TCNT1L;//�������ֵ
 	    lck=0;
		TCNT1=0X00;
        //TCNT1L=0X00;
       }
}
