/*
 ----------------------------------------------------
 *��    �ߣ�������
 ----------------------------------------------------
 */
#include "stc.h"

/***************************************************
 *          �����궨�壬���ڴ�����ֲ���Ķ�
 ***************************************************/
#define HIGH               1
#define LOW                0
#define LS164_DATA(x)    {if((x))P0_4=1;else P0_4=0;}         
#define LS164_CLK(x)     {if((x))P0_5=1;else P0_5=0;} 
#define SEG_PORT          P0    //���������������˿�

unsigned char   Timer0IRQEvent=0; //T/C0�ж��¼�
unsigned char   Time1SecEvent=0;  //��ʱ1���¼�
unsigned int    TimeCount=0;       //ʱ�����ֵ
unsigned char   SegCurPosition=0; //��ǰ�����������

//Ϊ����֤���������������ǹ������ķ��룬������������Ϊ�������ķ���
//������������洢�ڴ��������ùؼ���"code"����
code unsigned char SegCode[10]={~0x3F,~0x06,~0x5B,~0x4F,~0x66,~0x6D,~0x7D,
~0x07,~0x7F,~0x6F};

//Ƭѡ��������飬�洢�ڴ��������ùؼ���"code"����
code unsigned char  SegPosition[4]={0xf7,0xfb,0xfd,0xfe};
//�������ʾ���ݻ�����
  unsigned char  SegBuf[4]  ={0};

/****************************************
*��������:LS164Send
*��    ��:byte �����ֽ�
*��    ��:��
*��    ��:74LS164���͵����ֽ�
******************************************/
void LS164Send(unsigned char byte)
{
   unsigned char j;

   for(j=0;j<=7;j++)//���������ݽ�����λ���
   {

     if(byte&(1<<(7-j))) //����ֽڵ�ǰλ
     {
	        LS164_DATA(HIGH); //����������������Ϊ�ߵ�ƽ
	 }
	 else
	 {
	        LS164_DATA(LOW); //����������������Ϊ�͵�ƽ
	 }

     LS164_CLK(LOW); 
     LS164_CLK(HIGH);
       
   }
}

/****************************************
*��������:SegRefreshDisplayBuf
*��    ��:��
*��    ��:��
*��    ��:�����ˢ����ʾ����
******************************************/
void SegRefreshDisplayBuf(void)	 
{
		
	SegBuf[0] =TimeCount%10;       //��λ
	SegBuf[1] =TimeCount/10%10;   //ʮλ
	SegBuf[2] =TimeCount/100%10;  //��λ
	SegBuf[3] =TimeCount/1000%10; //ǧλ

}
/****************************************
*��������:SegDisplay
*��    ��:��
*��    ��:��
*��    ��:�������ʾ����
******************************************/
void SegDisplay(void)
{

   unsigned char  t;

   SEG_PORT = 0x0F;  //Ϩ�����������
   
   t = SegCode[SegBuf[SegCurPosition]];   //ȷ����ǰ��������

   LS164Send(t); 

   SEG_PORT = SegPosition[SegCurPosition];//ѡ��һ�����������ʾ	
		
   if(++SegCurPosition>=4) //�´�Ҫ�����������
   {				
	    SegCurPosition=0;
   }
		  
}
/****************************************
*��������:TimerInit
*��    ��:��
*��    ��:��
*��    ��:T/C��ʼ��
******************************************/
void TimerInit(void)
{
   TH0 = (65536-5000)/256;
   TL0 = (65536-5000)%256; //��ʱ5MS
   TMOD = 0x01;	             //T/C0ģʽ1
}
/****************************************
*��������:Timer0Start
*��    ��:��
*��    ��:��
*��    ��: T/C0����
******************************************/
void Timer0Start(void)    
{
   TR0 = 1;		 
   ET0 = 1;	
}
/****************************************
*��������:PortInit
*��    ��:��
*��    ��:��
*��    ��:I/O�ڳ�ʼ��
******************************************/
void PortInit(void)         
{
   P0=P1=P2=P3=0xFF;
}
/****************************************
*��������:main
*��    ��:��
*��    ��:��
*��    ��:��������
******************************************/
void main(void)
{
    PortInit();
    TimerInit();
    Timer0Start();
    SegRefreshDisplayBuf();
    EA=1;

    while(1)
    {
		if(Timer0IRQEvent)       //���T/C0�ж��¼��Ƿ����
		{ 
            Timer0IRQEvent=0;

		    if(Time1SecEvent)     //���1���¼��Ƿ����
         	    {
				Time1SecEvent=0;

				if(++TimeCount>=9999)//����ֵ�Լ�
                   {
					 TimeCount=0;
                   }

                   SegRefreshDisplayBuf();//ˢ�»�����
               }

               SegDisplay();	          //����ѡ�е������

            }
    }
}
/****************************************
*��������:Timer0IRQ
*��    ��:��
*��    ��:��
*��    ��:T/C0�жϷ�����
******************************************/
void Timer0IRQ(void) interrupt 1 
{
     static unsigned int cnt=0;

     TH0 = (65536-5000)/256;
     TL0 = (65536-5000)%256; //���س�ֵ

     Timer0IRQEvent=1;        //T/C0�ж��¼���־λ��1

     if(++cnt>=200)           
     {
	     cnt=0;
          Time1SecEvent=1;   //��ʱ1���¼���1
     }
}

