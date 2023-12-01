/*
 ----------------------------------------------------
 *��    �ߣ�������
 ----------------------------------------------------
 */
#include "stc.h"

/***************************************************
 *          ���Ͷ��壬���������ֲ
 ***************************************************/
typedef unsigned char   UINT8;
typedef unsigned int	UINT16;
typedef unsigned long   UINT32;  
typedef char               INT8;
typedef int                INT16;
typedef long               INT32; 

 
/***************************************************
 *          �����궨�壬���ڴ�����ֲ���Ķ�
 ***************************************************/
#define TIMER0_INITIAL_VALUE 5000 //5Ms��ʱ

#define SEG_PORT            P0    //�����ռ�õ�I/O��

#define KEY_PORT            P1    //����ռ�õ�I/O��
#define KEY_MASK            0x0F //��������

#define KEY_SEARCH_STATUS    0 //��ѯ����״̬
#define KEY_ACK_STATUS       1 //ȷ�ϰ���״̬
#define KEY_REALEASE_STATUS 2 //�ͷŰ���״̬

#define KEY1                1     //����1��ֵ
#define KEY2                2     //����2��ֵ
#define KEY3                3     //����3��ֵ
#define KEY4                4     //����4��ֵ

#define HIGH                1     
#define LOW                 0
#define ON                  1
#define OFF                 0


#define LS164_DATA(x)      {if((x))P0_4=1;else P0_4=0;}         
#define LS164_CLK(x)       {if((x))P0_5=1;else P0_5=0;} 


UINT8  Timer0IRQEvent=0;   //T/C0�ж��¼�
UINT8  Time1SecEvent=0;    //1�붨ʱ�¼�
UINT8  TimeCount=0;         //T/C0�����������ڼ�������1�붨ʱ�¼�
UINT8  SegCurPosMark=0;    //��ѡ�е������
UINT16 CounterValue=0;     //������

      UINT8  SegCurSel  = 0 ; //��ǰѡ�е������
      UINT8  SegBuf[4]  ={0}; //�������ʾ������
//����������������룬���ұ����ڳ���洢������ʡRAM��Դ
code UINT8  SegCode[10]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90};
//�����������Ƭѡ���飬���ұ����ڳ���洢������ʡRAM��Դ
code UINT8  SegSelTbl[4]={0x07,0x0b,0x0d,0x0e};

UINT8  bSetTime=0;  //��־λ���Ƿ�Ҫ���ü���ֵ

/****************************************************
* ��������: LS164Send
* ��    ��: byte Ҫ���͵��ֽ�
* ��    ��: ��
* ��������: 74LS164�������ݺ���
*****************************************************/
void LS164Send(UINT8 byte) 
{
   UINT8 j;

   for(j=0;j<=7;j++)
   {
      if(byte&(1<<(7-j)))
      {
	     LS164_DATA(HIGH);
	 }
	 else
	 {
	    LS164_DATA(LOW);
	 }

     LS164_CLK(LOW); 
     LS164_CLK(HIGH);
   }
}
/****************************************************
* ��������: SegRefreshDisplayBuf
* ��    ��: ��
* ��    ��: ��
* ��������: ˢ����ʾ����
*****************************************************/
void SegRefreshDisplayBuf(void)	 
{
		
	SegBuf[0] =CounterValue%10;       //��λ
	SegBuf[1] =CounterValue/10%10;   //ʮλ 
	SegBuf[2] =CounterValue/100%10;  //��λ
	SegBuf[3] =CounterValue/1000%10; //ǧλ

}
/****************************************************
* ��������: SegDisplay
* ��    ��: ��
* ��    ��: ��
* ��������: ��ʾ����
*****************************************************/
void SegDisplay(void)
{
      
   UINT8  t;
       
   SEG_PORT = 0x0F;  //Ϩ�����������
  
   if(bSetTime)       //����Ƿ����ü���ֵ
   {
	   if(SegCurSel==SegCurPosMark)
        {
			 
             t = SegCode[SegBuf[SegCurSel]]&0x7F; //����С�����ʶ   
			
        }
	    else
        {
			 t = SegCode[SegBuf[SegCurSel]]; //������ʾ��ǰ��ֵ
        }		
   }
   else
   {
		 t = SegCode[SegBuf[SegCurSel]]; //������ʾ��ǰ��ֵ
   }
	
   
   LS164Send(t); 

   SEG_PORT = SegSelTbl[SegCurSel];	//������ǰҪ��ʾ�������	
		
   if(++SegCurSel>=4) 
   {				
 	    SegCurSel=0;
   }	 
}
/****************************************************
* ��������: TimerInit
* ��    ��: ��
* ��    ��: ��
* ��������: ��ʱ����ʼ��
*****************************************************/
void TimerInit(void)
{ 
   TH0 = (65536-TIMER0_INITIAL_VALUE)/256;
   TL0 = (65536-TIMER0_INITIAL_VALUE)%256; //��ʱ5MS
   TMOD = 0x01;	
  
}
/****************************************************
* ��������: Timer0Start
* ��    ��: ��
* ��    ��: ��
* ��������: T/C0����
*****************************************************/
void Timer0Start(void)
{
     TR0 = 1;		 
	 ET0 = 1;	
}
/****************************************************
* ��������: Timer0Stop
* ��    ��: ��
* ��    ��: ��
* ��������: T/C0ֹͣ
*****************************************************/
void Timer0Stop(void)
{
     TR0 = 0;		 
     ET0 = 0;  	
}
/****************************************************
* ��������: PortInit
* ��    ��: ��
* ��    ��: ��
* ��������: ��Ƭ��I/O�ڳ�ʼ��
*****************************************************/
void PortInit(void)
{
	 P0=P1=P2=P3=0xFF;
}
/****************************************************
* ��������: KeyRead
* ��    ��: ��
* ��    ��: ��ǰ���µİ���
* ��������: ��ȡ����ֵ
*****************************************************/
UINT8 KeyRead(void)
{
//KeyStatus:��̬���������水��״̬
//KeyCurPress:��̬���������浱ǰ�����ļ�ֵ
static UINT8 KeyStatus=KEY_SEARCH_STATUS,KeyCurPress=0;
           UINT8 KeyValue;
           UINT8 i=0;
	
	KeyValue=(~KEY_PORT)&KEY_MASK;//�����һ����������
  
    switch(KeyStatus)
    {
		case KEY_SEARCH_STATUS:   //������ѯ״̬
        {
             if(KeyValue)
             {
				 KeyStatus=KEY_ACK_STATUS;//������һ��״̬Ϊȷ��״̬
             }
         
             return 0;
      
        }
        break;

		case KEY_ACK_STATUS:    //����ȷ��״̬
        {
             if(!KeyValue)         //û�а�������
             {
                KeyStatus=KEY_SEARCH_STATUS; ;//������һ��״̬Ϊ��ѯ״̬

             }
             else
             {
			 for(i=0;i<4;i++)         //�����ĸ���������
               {
				if(KeyValue & (1<<i))
                   {
				   KeyCurPress=KEY1+i;
                      break;
                   }
                 
               }

               KeyStatus=KEY_REALEASE_STATUS; //������һ��״̬Ϊ�ͷ�״̬
             }

             return 0;
        }
        break;

	    case KEY_REALEASE_STATUS:      //�����ͷ�״̬
        {
		    if(!KeyValue)      //�����ͷ�
             {
				KeyStatus=KEY_SEARCH_STATUS; //������һ��״̬Ϊ�ͷ�״̬

                   return KeyCurPress;//���ص�ǰ����
             }
            
             return 0;
            
        }

        default:break;
    }	
}
/****************************************************
* ��������: main
* ��    ��: ��
* ��    ��: ��
* ��������: ��������
*****************************************************/
void main(void)
{    

PortInit();
TimerInit();
    Timer0Start();
    SegRefreshDisplayBuf();
    EA=1;

	while(1)
    {

        SegRefreshDisplayBuf(); //ˢ����ʾ������

		if(Timer0IRQEvent)      //��ʱ���ж��¼�
		{ 
			Timer0IRQEvent=0;

		   switch(KeyRead())    //ɨ�谴������ȡ��ֵ
            {
			  case KEY1:         //����1
                {
				  bSetTime=~bSetTime;//��־λ���Ƿ����ü���ֵ
                     SegCurPosMark=0;
                }
                break;

                case KEY2:        //����2
                {
                      if(++SegCurPosMark>=4) //ѡ����һ��λҪ�޸�
                      {
                           SegCurPosMark=0;
                      }
                }
                break;

                case KEY3:       //����3
                {
                      if(!bSetTime)break; //�������ü���ģʽ������switch

                      //���ݱ�ѡ���λ�����ԼӲ���
                      if(CounterValue>=9999)CounterValue=0;

                      if      (SegCurPosMark==0)CounterValue+=1;
                      else if(SegCurPosMark==1)CounterValue+=10;
                      else if(SegCurPosMark==2)CounterValue+=100;
                      else                         CounterValue+=1000;

                      

                }
                break;

                case KEY4:                 //����4
                {
                      if(!bSetTime)break; //�������ü���ģʽ������switch

//���ݱ�ѡ���λ�����Լ�����
                      if(CounterValue<=0)CounterValue=9999;

                      if      (SegCurPosMark==0)CounterValue-=1;
                      else if(SegCurPosMark==1)CounterValue-=10;
                      else if(SegCurPosMark==2)CounterValue-=100;
                      else                         CounterValue-=1000;

                      
                }
                break;

                default:break;
            }
            
        }
	    else if(Time1SecEvent)//һ�붨ʱ�¼�����
	    {
	 	    Time1SecEvent=0;
		
		    if(!bSetTime)      //�������ü���ֵģʽ
		    {
		       if(++CounterValue>=9999)//����ֵ�Լ�1��ͬʱ����ֵ���ܴ���9999
		       {
			        CounterValue=0;
		       }		
		    }
	    } 	
    }

}
/****************************************************
** ��������: Timer0IRQ
** ��    ��: ��
** ��    ��: ��
** ��������: T/C0�жϷ�����
*****************************************************/
void Timer0IRQ(void) interrupt 1 
{
	TH0 = (65536-TIMER0_INITIAL_VALUE)/256;
   	TL0 = (65536-TIMER0_INITIAL_VALUE)%256; //���س�ֵ

	Timer0IRQEvent=1;
    
    SegDisplay();         //�������ʾ
 
    if(++TimeCount>=200)
    {
	    TimeCount=0;
         Time1SecEvent=1;
    }

}

