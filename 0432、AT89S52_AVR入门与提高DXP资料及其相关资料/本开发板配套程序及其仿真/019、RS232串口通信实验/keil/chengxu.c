/*******************************************************/
/*RS232������ʾʵ�� 				        		   */
/*Ŀ��������AT89S52						        	   */
/*����:11.0592MHZ							    	   */
/*���뻷����Keil    						    	   */
/*******************************************************/

#include "reg52.h"		

unsigned char code tab[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};

unsigned char dat;				//����ȫ�ֱ���

//���пڳ�ʼ������
void Init_Com(void)
{
     TMOD = 0x20;
     PCON = 0x00;
     SCON = 0x50;			
     TH1 = 0xFd;
     TL1 = 0xFd;
     TR1 = 1;				
}

//LED�������ʱ����
void delay(void)
{
	int k;
	for(k=0;k<600;k++);
}

//�����жϷ������
serial()interrupt 4 using 1
{
	if(RI)
	RI=0;
	dat=SBUF;
}

//LED�������ʾ����
void display(int k)
{
	P2=0xef;								//λѡ			
	P0=tab[k/1000];							//��ʾǧλ����
	delay();								//��ʱ
	P2=0xdf;								//λѡ
	P0=tab[k%1000/100];						//��ʾ��λ����
	delay();								//��ʱ
	P2=0xbf;								//λѡ
	P0=tab[k%100/10];						//��ʾʮλ����
	delay();								//��ʱ
	P2=0x7f;								//λѡ
	P0=tab[k%10];							//��ʾ��λ����
	delay();								//��ʱ
	P2=0xff;								//λѡ
}

//������
void main()
{   
   	P2=0xff;
  	P0=0xff;
	P1=0xff;
	EA=1;
	ES=1;
   	Init_Com();
   	while(1)
   {
      display(dat);							//��ʾ����
   }
}



