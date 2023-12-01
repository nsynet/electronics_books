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
#define TIMER0_INITIAL_VALUE 5000

#define HIGH               1
#define LOW                0

#define ON                 1
#define OFF                0

#define SEG_PORT           P0

/**************************************
74LS164�����꺯��
 **************************************/

#define LS164_DATA(x)      {if((x))P0_4=1;else P0_4=0;}         
#define LS164_CLK(x)       {if((x))P0_5=1;else P0_5=0;} 
//-----------------------------------------------------

/**************************************
*                ��ͨ�Ʋ����꺯��
*NORTH��������
*SOUTH���Ϸ���
 **************************************/
#define NORTH_R_LIGHT(x)   {if((x))P2_0=0;else P2_0=1;}
#define NORTH_Y_LIGHT(x)   {if((x))P2_1=0;else P2_1=1;}
#define NORTH_G_LIGHT(x)   {if((x))P2_2=0;else P2_2=1;}

#define SOUTH_R_LIGHT(x)   {if((x))P2_3=0;else P2_3=1;}
#define SOUTH_Y_LIGHT(x)   {if((x))P2_4=0;else P2_4=1;}
#define SOUTH_G_LIGHT(x)   {if((x))P2_5=0;else P2_5=1;}
//-----------------------------------------------------

#define UART_MARKER         0xEE    //����֡�ײ���ʶ

UINT8  Timer0IRQEvent=0;            //T/C0�ж��¼�
UINT8  Time1SecEvent=0;             //��ʱ1���¼�
UINT8  Time500MsEvent=0;            //��ʱ500�����¼�
UINT8  TimeCount=0;                  //������

UINT8  SegCurPosition=0;            //�����

UINT8  LightOrgCount[4]={15,5,15,5};//��ͨ�Ƽ�����ʼֵ
UINT8  LightCurCount[4]={15,5,15,5};//��ͨ�Ƽ�����ǰֵ

UINT8  TrafficLightStatus=0;          //��ǰ��ͨ��״̬

//����������������룬���ұ����ڳ���洢������ʡRAM��Դ
code UINT8  SegCode[10]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90};
//�����������Ƭѡ���飬���ұ����ڳ���洢������ʡRAM��Դ
code UINT8  SegSelTbl[4]={0x07,0x0b,0x0d,0x0e};
UINT8  SegBuf[4]   ={0};         //�������ʾ������

/**************************************
*              ��ͨ������֡��ʽ
**************************************/
typedef struct _LIGHT_VAL
{
    UINT8 Head;   
    UINT8 val[4]; 
}LIGHT_VAL;

typedef union _LIGHT_VAL_EX
{
     LIGHT_VAL lv;
     UINT8    p[5]; 
}LIGHT_VAL_EX;
//-----------------------------------------------------

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
* ��    ��: s1 ����ֵ
* ��    ��: ��
* ��������: ˢ����ʾ����
*****************************************************/
void SegRefreshDisplayBuf(UINT8 s1)
{
	SegBuf[0] = s1%10;
	SegBuf[1] = s1/10;
	SegBuf[2] = s1%10;
	SegBuf[3] = s1/10;

}
/****************************************************
* ��������: SegDisplay
* ��    ��: ��
* ��    ��: ��
* ��������: ��ʾ����
*****************************************************/
void SegDisplay(void)
{
   unsigned char  t;

   SEG_PORT = 0x0F;  //Ϩ�����������
   
   t = SegCode[SegBuf[SegCurPosition]];   //ȷ����ǰ��������

   LS164Send(t); 

   SEG_PORT = SegSelTbl[SegCurPosition];//ѡ��һ�����������ʾ	
		
   if(++SegCurPosition>=4) 
   {				
	    SegCurPosition=0;
   }		  
}
/****************************************************
* ��������: TimerInit
* ��    ��: ��
* ��    ��: ��
* ��������: T/C��ʼ��
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
* ��������: UartInit
* ��    ��: ��
* ��    ��: ��
* ��������: ���ڳ�ʼ��
*****************************************************/
void UartInit(void)
{
	SCON=0x40;    //10λ�첽�շ�
	T2CON=0x34;   //ʹ��T/C2Ϊ�����ʷ�����
	RCAP2L=0xD9; //9600������
	RCAP2H=0xFF;
	REN=1;        //�����ڽ���
     ES=1;         //�������ж�
}
/****************************************************
* ��������: UartSendByte
* ��    ��: byte �����ֽ�
* ��    ��: ��
* ��������: ���� ���͵����ֽ�
*****************************************************/
void UartSendByte(UINT8 byte)
{
	SBUF=byte;
     while(TI==0);
     TI=0;
}
/****************************************************
* ��������: UartPrintfString
* ��    ��: str �ַ���
* ��    ��: ��
* ��������: ���� ��ӡ�ַ���
*****************************************************/
void UartPrintfString(INT8 *str)
{
	while(str && *str)
    {
		UartSendByte(*str++);
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
    UINT8 i=0;
    PortInit();
    TimerInit();
    Timer0Start();
    UartInit();
    SegRefreshDisplayBuf (LightCurCount[0]);
    EA=1;
    NORTH_R_LIGHT(ON);
    SOUTH_G_LIGHT(ON);

    while(1)
    {
		if(Timer0IRQEvent)//T/C0�ж��¼�
		{ 
            Timer0IRQEvent=0;
            TimeCount++;
  
            if(TimeCount>=200)//������1��
            {
			  TimeCount=0;
				
			  if(LightCurCount[0])
                {
                    TrafficLightStatus=0;//״̬0
                }
			  else if(LightCurCount[1])
                {
                    TrafficLightStatus=1; //״̬1
                }
			  else if(LightCurCount[2])
                {   
                    TrafficLightStatus=2; //״̬2
                }
                else if(LightCurCount[3])
                {
				  TrafficLightStatus=3; //״̬3
                }
                else //���м���ֵΪ0ʱ����ͨ�Ƶ�ǰ����ֵ���س�ֵ
                {
                   for(i=0;i<4;i++)
                   {
                     LightCurCount[i]=LightOrgCount[i];
                   }
                   TrafficLightStatus=0;
                }	
			
				switch(TrafficLightStatus)//���ݲ�ͬ�Ľ�ͨ��״̬�������Ӧ�����Ʋ���
				{
				  case 0:
                    {
                        NORTH_R_LIGHT(ON);
                        SOUTH_R_LIGHT(OFF);
                        NORTH_G_LIGHT(OFF);
                        SOUTH_G_LIGHT(ON);
					    NORTH_Y_LIGHT(OFF);
                        SOUTH_Y_LIGHT(OFF);
                    }
                    break;
                    
                    case 1:
                    {
                        if(LightCurCount[1]%2)//״̬�л�����˸����
                        {
					       NORTH_R_LIGHT(ON);
                           SOUTH_G_LIGHT(ON);
                        }
                        else
                        {
					       NORTH_R_LIGHT(OFF);
                           SOUTH_G_LIGHT(OFF);		
                        }

                        NORTH_Y_LIGHT(ON);
                        SOUTH_Y_LIGHT(ON);

                    }
                    break;

                    case 2:
                    {
                        NORTH_R_LIGHT(OFF);
                        SOUTH_R_LIGHT(ON);
                        NORTH_G_LIGHT(ON);
                        SOUTH_G_LIGHT(OFF);
                        NORTH_Y_LIGHT(OFF);
                        SOUTH_Y_LIGHT(OFF);
                    }
                    break;
                       
                    case 3:
                    {
                        if(LightCurCount[3]%2) //״̬�л�����˸����
                        {
                           NORTH_G_LIGHT(ON);
                           SOUTH_R_LIGHT(ON);
                        }
                        else
                        {
                           NORTH_G_LIGHT(OFF);
                           SOUTH_R_LIGHT(OFF);		
                        }

                        NORTH_Y_LIGHT(ON);
                        SOUTH_Y_LIGHT(ON);

                    }
                    break;  
                    
                   default:break;                  
                }

             SegRefreshDisplayBuf (LightCurCount[TrafficLightStatus]);
             LightCurCount[TrafficLightStatus]--;//���ղ�ͬ��״̬�����е�ǰ����ֵ�Լ�
            }
            
			SegDisplay();//��ʾ�������ֵ
        }
        
		

    }

}
/****************************************************
* ��������: UartIRQ
* ��    ��: ��
* ��    ��: ��
* ��������: ���� �жϷ�����
*****************************************************/
void UartIRQ(void)interrupt 4 
{
  static UINT8 cnt=0;              //�������ݼ�����
  static LIGHT_VAL_EX LightValEx;//���彻ͨ������֡���ͱ���������Ϊ��̬����

  if(RI)  
  {  
     RI=0;
	 LightValEx.p[cnt++]=SBUF;//��ȡ����

     if(LightValEx.lv.Head == UART_MARKER)//���֡ͷ���Ƿ�ƥ��
     {  						
	    if(cnt>=5)
        {
		  for(cnt=0;cnt<4;cnt++)//��������ȷ�����ֽ���Ϊ5�ֽ�ʱ����������ܳ�ֵ��
                                          //����ֵ���¸�ֵ
            {
			  LightOrgCount[cnt]=LightValEx.lv.val[cnt]; 
                LightCurCount[cnt]=LightValEx.lv.val[cnt];
               
            }

            cnt=0;
            UartPrintfString("���ý�ͨ�����\r\n");//���óɹ��󣬴�ӡ��Ϣ
        }
     }
     else
     {
		cnt=0;
     }
  
  }

}
/****************************************************
* ��������: Timer0IRQ
* ��    ��: ��
* ��    ��: ��
* ��������: T/C0 �жϷ�����
*****************************************************/
void Timer0IRQ(void) interrupt 1 
{
	
	TH0 = (65536-TIMER0_INITIAL_VALUE)/256;//T/C��ֵ����
   	TL0 = (65536-TIMER0_INITIAL_VALUE)%256; 
	Timer0IRQEvent=1;
    

}

