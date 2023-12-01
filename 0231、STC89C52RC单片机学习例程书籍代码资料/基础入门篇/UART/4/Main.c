/*
 ----------------------------------------------------
 *��    �ߣ�������
 ----------------------------------------------------
 */

#include "stc.h"

#define RXD P3_0              //�궨��:�������ݵ�����
#define TXD P3_1              //�궨��:�������ݵ�����
#define RECEIVE_MAX_BYTES 16//�궨��:�������ֽ���

#define TIMER_ENABLE()  {TL0=TH0;TR0=1;fTimeouts=0;}//ʹ��T/C
#define TIMER_DISABLE() {TR0=0;fTimeouts=0;}//��ֹT/C
#define TIMER_WAIT()    {while(!fTimeouts);fTimeouts=0;}//�ȴ�T/C��ʱ


unsigned char fTimeouts=0;//T/C��ʱ�����־λ
unsigned char RecvBuf[16];//�������ݻ�����
unsigned char RecvCount=0;//�������ݼ�����


/****************************************
*��������:SendByte
*��    ��:byte Ҫ���͵��ֽ�
*��    ��:��
*��    ��:���ڷ��͵����ֽ�
******************************************/
void SendByte(unsigned char b)
{
     unsigned char i=8;
     
     TXD=0;

     TIMER_ENABLE();
     TIMER_WAIT();
     

     while(i--)
	 {
        if(b&1)TXD=1;
        else    TXD=0;

        TIMER_WAIT();
        
        b>>=1;

     }

     
     TXD=1;

     TIMER_WAIT();
     TIMER_DISABLE();
}
/****************************************
*��������:RecvByte
*��    ��:��
*��    ��:�����ֽ�
*��    ��:���� ���յ����ֽ�
******************************************/
unsigned char RecvByte(void)
{
     unsigned char i;
	 unsigned char b=0;
     
     TIMER_ENABLE();
     TIMER_WAIT();

     for(i=0;i<8;i++)
	 {
	     if(RXD)b|=(1<<i);

		 TIMER_WAIT();
	 }

     TIMER_WAIT();  //�ȴ�����λ
     TIMER_DISABLE();
  
	 return b;

}
/****************************************
*��������:PrintfStr
*��    ��:pstr �ַ���
*��    ��:��
*��    ��:���� ��ӡ�ַ���
******************************************/
void PrintfStr(char * pstr)
{
      while(pstr && *pstr)
	 {
	       SendByte(*pstr++);
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
     TMOD=0x02; 
     TR0=0;
     TF0=0;
     TH0=(256-99);
     TL0=TH0;
     ET0=1;
     EA=1;
}
/****************************************
*��������:StartBitCome
*��    ��:��
*��    ��:0/1
*��    ��:�Ƿ�����ʼλ����
******************************************/
unsigned char StartBitCome(void)
{
         return (RXD==0);
}
/****************************************
*��������:main
*��    ��:��
*��    ��:��
*��    ��:��������
******************************************/
void main(void)
{
     unsigned char i;

     TimerInit();

	 PrintfStr("Hello 8051\r\n");

	 while(1)
	 {
	    if(StartBitCome())
	    {	                 
           RecvBuf[RecvCount++]=RecvByte();
           
           if(RecvCount>=RECEIVE_MAX_BYTES)
           {
              RecvCount=0;

              for(i=0;i<RECEIVE_MAX_BYTES;i++)
              {
                  SendByte(RecvBuf[i]);
              }
           }  	 
        }
 
	 }
}
/****************************************
*��������:Timer0IRQ
*��    ��:��
*��    ��:��
*��    ��:T/C0�жϷ�����
******************************************/
void Timer0IRQ(void) interrupt 1 using 0
{
     fTimeouts=1;
} 

