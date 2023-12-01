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
    
typedef char            INT8;
typedef int             INT16;
typedef long            INT32;
typedef bit             BOOL;

/***************************************************
 *          �����궨�壬���ڴ�����ֲ���Ķ�
 ***************************************************/
//--------------------------------
                                   //----ͷ��----
#define DCMD_CTRL_HEAD1      0x10  //PC�´����ư�ͷ��1
#define DCMD_CTRL_HEAD2      0x01  //PC�´����ư�ͷ��2

                                   //----������----
#define DCMD_NULL            0x00  //������:�ղ���
#define DCMD_CTRL_BELL       0x01  //������:���Ʒ�����
#define DCMD_CTRL_LED        0x02  //������:����LED
#define DCMD_REQ_DATA        0x03  //������:��������

                                   //----����----
#define DCTRL_BELL_ON        0x01  //��������
#define DCTRL_BELL_OFF       0x02  //����������
#define DCTRL_LED_ON         0x03  //LED��
#define DCTRL_LED_OFF        0x04  //LED��

//--------------------------------
                                   //----ͷ��----
#define UCMD_CTRL_HEAD1      0x20  //MCU�ϴ����ư�ͷ��1
#define UCMD_CTRL_HEAD2      0x01  //MCU�ϴ����ư�ͷ��2

                                   //----������----
#define UCMD_NULL            0x00  //������:�ղ���
#define UCMD_REQ_DATA        0x01  //������:��������


#define CTRL_FRAME_LEN       0x04  //֡����(���������ݺ�У��ֵ)
#define CHECKSUM_LEN         0x01  //����ֵ����

#define EN_UART()            ES=1 //�������ж�
#define NOT_EN_UART()        ES=0 //��ֹ�����ж�

#define BELL(x)             {if((x))P0_6=1 ;else P0_6=0;} //���������ƺ꺯��
#define LED(x)              {if((x))P2=0x00;else P2=0xFF;}//LED���ƺ꺯��    

#define TRUE                1
#define FALSE               0

#define HIGH                1
#define LOW                 0   

#define ON                  1
#define OFF                 0

#define NULL                (void *)0 

/*ʹ�ýṹ������ݰ����з�װ
 *�����������
 */
typedef  struct _PKT_SUM
{
	UINT8 m_ucHead1;       //�ײ�1
	UINT8 m_ucHead2;       //�ײ�2
	UINT8 m_ucOptCode;     //������
	UINT8 m_ucDataLength;  //���ݳ���
	UINT8 m_szDataBuf[16]; //����

	UINT8 m_ucCheckSum;      //CRC16Ϊ2���ֽ�

}PKT_SUM;

/*ʹ�ù�������һ�ζ����ݰ����з�װ
 *�������ݸ��ӷ���
 */
typedef union _PKT_SUM_EX
{
	PKT_SUM r;
	UINT8 p[32];
} PKT_SUM_EX;


PKT_SUM_EX    PktSumEx; //�������ݰ�����
BOOL  bLedOn=FALSE;     //�����Ƿ����LED��������
BOOL  bBellOn=FALSE;    //�����Ƿ�������첼������
BOOL  bReqData=FALSE;   //�����Ƿ��������ݲ�������

/****************************************************
** ��������: CheckSum
** ��    ��: buf ҪУ�������;
             len ҪУ������ݵĳ��� 
** ��    ��: У��ֵ
** ��������: ����У���
*****************************************************/
UINT16 CheckSum(UINT8 *buf, UINT8 len) 
{
	  UINT8 i=0,Sum=0;

	  for (i=0;i<len;i++)
	  {
		  Sum+=*buf++;
	  }

	  return Sum;
} 
/*************************************************************
* ��������:BufCpy
* ��    ��:destĿ�껺����; 
           Src  Դ������
           size �������ݵĴ�С
* ��    ��:��
* ˵    ��:���ƻ�����
**************************************************************/
BOOL BufCpy(UINT8 * dest,UINT8 * src,UINT32 size)
{
    if(NULL ==dest || NULL==src ||NULL==size)
    {
    	return FALSE;
    }
    
	do
	{
		*dest++ = *src++;
		
	}while(--size!=0);
	
	return TRUE;
}
/****************************************************
** ��������: UartInit
** ��    ��: ��
** ��    ��: ��
** ��������: ���ڳ�ʼ��
*****************************************************/                                                                               
void UartInit(void)
{
	SCON=0x40;
	T2CON=0x34;
	RCAP2L=0xD9;
	RCAP2H=0xFF;
	REN=1;
    ES=1;
}
/****************************************************
** ��������: UARTSendByte
** ��    ��: b �����ֽ�
** ��    ��: ��
** ��������: ���� ���͵����ֽ�
*****************************************************/ 
void UARTSendByte(UINT8 b)
{
 	 SBUF=b;
	 while(TI==0);
	 TI=0;
}
/****************************************************
** ��������: UARTSendByte
** ��    ��: b �����ֽ�
** ��    ��: ��
** ��������: ���� ���͵����ֽ�
*****************************************************/ 
void UartSendNBytes(UINT8 *buf,UINT8 len)
{
     while(len--)
     {
         UARTSendByte(*buf++);
     }
}
code INT8 HexTable[16]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
void UARTCiPrintfString(const INT8 *str)
{
     while(str && *str)
     {
     
        UARTSendByte(*str++); 
               
     }

}
void UARTCiPrintfVal(UINT8 *str,UINT32 val,UINT8 show)
{    
     UINT8 i=0;
     UINT8 buf[10]={0}; 
     
	 UARTCiPrintfString(str);

     if(10 == show)
     {
         for(i=0; i<10 ;i++)
         {
             buf[i]=(UINT8)('0'+val%10);   
             val/=10;   
         } 
     
         
         for(i=9;i>=0;)
         {
             if('0' == buf[i])
             {
                 i--;
             }
             else
             {
                break;
             }
         } 
         
         while(1)
         {    
             
             UARTSendByte(buf[i]); 
             
             if(!i)
             {
                 break; 
             } 
             
             i--;
         } 
         
         
     }
     
     if(16 == show)
     {
        UARTSendByte('0');
	    UARTSendByte('x');
	    
        i=28;
        
        while(i)
        {
            if(0  == ((val>>i) &0x0f))
            {   
                i=i-4;
               
            }
            else
            {
                break;
            }
        } 
        
        while(1)
        {
            UARTSendByte(HexTable[(val>>i) &0x0f]); 
            
            if(!i)
            {
                break; 
            }     
                    
            i=i-4;
        }  
        
     } 
     
     UARTCiPrintfString("\r\n");
}
#define DEBUGMSG   UARTCiPrintfString
#define DEBUGMSGEx UARTCiPrintfVal
/****************************************************
** ��������: main
** ��    ��: ��
** ��    ��: ��
** ��������: ��������
*****************************************************/
void main(void)
{
     UINT8 i=0;
	 UINT8 ucCheckSum=0;

	 UartInit();//���ڳ�ʼ��

	 EA=1;      //�����ж�
	 
     while(1)
     {
          if(bLedOn)  //�Ƿ����Led
		  {
		     LED(ON);  
		  }
		  else
		  {
		     LED(OFF); 
		  }
		  
		  
		  if(bBellOn)//�Ƿ��������
		  {
		     BELL(ON);
		  }
		  else
		  {
		     BELL(OFF);
		  }
		  
		  if(bReqData)//�Ƿ���������
		  {
		     bReqData=FALSE;

			 NOT_EN_UART(); //��ֹ�����ж�
			 
			 PktSumEx.r.m_ucHead1=UCMD_CTRL_HEAD1;//MCU�ϴ�����֡ͷ��1
			 PktSumEx.r.m_ucHead2=UCMD_CTRL_HEAD2;//MCU�ϴ�����֡ͷ��2
			 PktSumEx.r.m_ucOptCode=UCMD_REQ_DATA;//MCU�ϴ�����֡������
			 
			 PktSumEx.r.m_ucCheckSum=CheckSum(PktSumEx.p,
			                                  CTRL_FRAME_LEN+
											  PktSumEx.r.m_ucDataLength);//����У��ֵ

  		     /*
			    ��������ԭ������Ϊ��ʱд���ݳ��Ȳ�һ��,
  		        ����PktSumEx.r.m_ucCheckSum�����Ϊ0�����
				����ʹ��BufCpy��У��ֵ���Ƶ���Ӧ��λ��
			 */

			 BufCpy(&PktSumEx.p[CTRL_FRAME_LEN+PktSumEx.r.m_ucDataLength],
			        &PktSumEx.r.m_ucCheckSum,
					 CHECKSUM_LEN);
			 
			 UartSendNBytes(PktSumEx.p,
			                CTRL_FRAME_LEN+
							PktSumEx.r.m_ucDataLength+CHECKSUM_LEN);//��������

			 EN_UART();//�������ж�
			 		
		  }
     }
}
/****************************************************
** ��������: UartIRQ
** ��    ��: ��
** ��    ��: ��
** ��������: �����жϷ������
*****************************************************/
void UartIRQ(void)interrupt 4
{
     static UINT8  uccnt=0;
	        UINT8  uclen;
			UINT8  ucCheckSum;
     
     if(RI) //�Ƿ���յ�����
     {
        RI=0;

        PktSumEx.p[uccnt++]=SBUF;//��ȡ�����ֽ�

        if(PktSumEx.r.m_ucHead1 == DCMD_CTRL_HEAD1)//�Ƿ���Ч������֡ͷ��1
        {
           if(uccnt<CTRL_FRAME_LEN+PktSumEx.r.m_ucDataLength+CHECKSUM_LEN)//�Ƿ��������������
           {
              if(uccnt>=2 && PktSumEx.r.m_ucHead2!=DCMD_CTRL_HEAD2)//�Ƿ���Ч������֡ͷ��2
              {
                 uccnt=0;

                 return;
              }
                    
           }
           else
           {
		      
		      uclen=CTRL_FRAME_LEN+PktSumEx.r.m_ucDataLength;//��ȡ����֡��Ч����(������У��ֵ)

			  ucCheckSum=CheckSum(PktSumEx.p,uclen);//����У��ֵ

  		      /*
			    ��������ԭ������Ϊ��ʱд���ݳ��Ȳ�һ��,
  		        ����PktSumEx.r.m_ucCheckSum�����Ϊ0�����
				����ʹ��BufCpy��У��ֵ���Ƶ���Ӧ��λ��
			   */
			  BufCpy(&PktSumEx.r.m_ucCheckSum,&PktSumEx.p[uclen],CHECKSUM_LEN);

			  //DEBUGMSGEx("ucCheckSum:=",ucCheckSum,16);
			  //DEBUGMSGEx("PktSumEx.r.m_ucCheckSum:=",PktSumEx.r.m_ucCheckSum,16);


			  //DEBUGMSG("CheckSuming ...\r\n");

			  if(ucCheckSum!=PktSumEx.r.m_ucCheckSum)//У��ֵ�Ƿ�ƥ��
			  {
			      uccnt=0;

			      return;  
			  }

			 // DEBUGMSG("CheckSum OK\r\n");

              switch(PktSumEx.r.m_ucOptCode)//���������л�ȡ���Ӧ�Ĳ���
              {
                case DCMD_CTRL_BELL://���Ʒ�����������
                {
					 if(DCTRL_BELL_ON==PktSumEx.r.m_szDataBuf[0])//���ݲ��ֺ�������
					 {
					    bBellOn=TRUE;
					 }
					 else
					 {
					    bBellOn=FALSE;
					 }
                }
                break;

                case DCMD_CTRL_LED://����LED������
                {

					 if(DCTRL_LED_ON==PktSumEx.r.m_szDataBuf[0])//���ݲ��ֺ�������
					 {
					    bLedOn=TRUE;
					 }
					 else
					 {
					    bLedOn=FALSE;
					 }
                }
                break;

                case DCMD_REQ_DATA://��������������
                {
                     bReqData=TRUE;
                }
                break;

              }

              uccnt=0; 

              return;
           }

        }
        else
        {
            uccnt=0;
        }

     }
}
