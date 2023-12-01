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
#define CRC16_LEN            0x02  //����ֵ����

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
typedef  struct _PKT_CRC
{
   UINT8 m_ucHead1;       //�ײ�1
   UINT8 m_ucHead2;       //�ײ�2
   UINT8 m_ucOptCode;     //������
   UINT8 m_ucDataLength;  //���ݳ���
   UINT8 m_szDataBuf[16]; //����

   UINT8 m_szCrc[2];      //CRC16Ϊ2���ֽ�

}PKT_CRC;

/*ʹ�ù�������һ�ζ����ݰ����з�װ
 *�������ݸ��ӷ���
 */
typedef union _PKT_CRC_EX
{
    PKT_CRC r;
    UINT8 p[32];
} PKT_CRC_EX;


PKT_CRC_EX    PktCrcEx; //�������ݰ�����

code UINT16 szCRC16Tbl[256] = {                                 
    0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50a5, 0x60c6, 0x70e7,/*ע�Ȿ�е�0x1021 */
    0x8108, 0x9129, 0xa14a, 0xb16b, 0xc18c, 0xd1ad, 0xe1ce, 0xf1ef,
    0x1231, 0x0210, 0x3273, 0x2252, 0x52b5, 0x4294, 0x72f7, 0x62d6,
    0x9339, 0x8318, 0xb37b, 0xa35a, 0xd3bd, 0xc39c, 0xf3ff, 0xe3de,
    0x2462, 0x3443, 0x0420, 0x1401, 0x64e6, 0x74c7, 0x44a4, 0x5485,
    0xa56a, 0xb54b, 0x8528, 0x9509, 0xe5ee, 0xf5cf, 0xc5ac, 0xd58d,
    0x3653, 0x2672, 0x1611, 0x0630, 0x76d7, 0x66f6, 0x5695, 0x46b4,
    0xb75b, 0xa77a, 0x9719, 0x8738, 0xf7df, 0xe7fe, 0xd79d, 0xc7bc,
    0x48c4, 0x58e5, 0x6886, 0x78a7, 0x0840, 0x1861, 0x2802, 0x3823,
    0xc9cc, 0xd9ed, 0xe98e, 0xf9af, 0x8948, 0x9969, 0xa90a, 0xb92b,
    0x5af5, 0x4ad4, 0x7ab7, 0x6a96, 0x1a71, 0x0a50, 0x3a33, 0x2a12,
    0xdbfd, 0xcbdc, 0xfbbf, 0xeb9e, 0x9b79, 0x8b58, 0xbb3b, 0xab1a,
    0x6ca6, 0x7c87, 0x4ce4, 0x5cc5, 0x2c22, 0x3c03, 0x0c60, 0x1c41,
    0xedae, 0xfd8f, 0xcdec, 0xddcd, 0xad2a, 0xbd0b, 0x8d68, 0x9d49,
    0x7e97, 0x6eb6, 0x5ed5, 0x4ef4, 0x3e13, 0x2e32, 0x1e51, 0x0e70,
    0xff9f, 0xefbe, 0xdfdd, 0xcffc, 0xbf1b, 0xaf3a, 0x9f59, 0x8f78,
    0x9188, 0x81a9, 0xb1ca, 0xa1eb, 0xd10c, 0xc12d, 0xf14e, 0xe16f,
    0x1080, 0x00a1, 0x30c2, 0x20e3, 0x5004, 0x4025, 0x7046, 0x6067,
    0x83b9, 0x9398, 0xa3fb, 0xb3da, 0xc33d, 0xd31c, 0xe37f, 0xf35e,
    0x02b1, 0x1290, 0x22f3, 0x32d2, 0x4235, 0x5214, 0x6277, 0x7256,
    0xb5ea, 0xa5cb, 0x95a8, 0x8589, 0xf56e, 0xe54f, 0xd52c, 0xc50d,
    0x34e2, 0x24c3, 0x14a0, 0x0481, 0x7466, 0x6447, 0x5424, 0x4405,
    0xa7db, 0xb7fa, 0x8799, 0x97b8, 0xe75f, 0xf77e, 0xc71d, 0xd73c,
    0x26d3, 0x36f2, 0x0691, 0x16b0, 0x6657, 0x7676, 0x4615, 0x5634,
    0xd94c, 0xc96d, 0xf90e, 0xe92f, 0x99c8, 0x89e9, 0xb98a, 0xa9ab,
    0x5844, 0x4865, 0x7806, 0x6827, 0x18c0, 0x08e1, 0x3882, 0x28a3,
    0xcb7d, 0xdb5c, 0xeb3f, 0xfb1e, 0x8bf9, 0x9bd8, 0xabbb, 0xbb9a,
    0x4a75, 0x5a54, 0x6a37, 0x7a16, 0x0af1, 0x1ad0, 0x2ab3, 0x3a92,
    0xfd2e, 0xed0f, 0xdd6c, 0xcd4d, 0xbdaa, 0xad8b, 0x9de8, 0x8dc9,
    0x7c26, 0x6c07, 0x5c64, 0x4c45, 0x3ca2, 0x2c83, 0x1ce0, 0x0cc1,
    0xef1f, 0xff3e, 0xcf5d, 0xdf7c, 0xaf9b, 0xbfba, 0x8fd9, 0x9ff8,
    0x6e17, 0x7e36, 0x4e55, 0x5e74, 0x2e93, 0x3eb2, 0x0ed1, 0x1ef0
};

BOOL  bLedOn=FALSE;    //�����Ƿ����LED��������
BOOL  bBellOn=FALSE;   //�����Ƿ�������첼������
BOOL  bReqData=FALSE;  //�����Ƿ��������ݲ�������

/****************************************************
** ��������: CRC16Check
** ��    ��: buf ҪУ�������;
             len ҪУ������ݵĳ��� 
** ��    ��: У��ֵ
** ��������: CRC16ѭ������У��
*****************************************************/
UINT16 CRC16Check(UINT8 *buf, UINT8 len) 
{
    UINT8  i, j;
    UINT16 uncrcReg = 0xffff;
    UINT16 uncur;

    for (i = 0; i < len; i++) 
    {
        uncur = buf[i] << 8;

        for (j = 0; j < 8; j++) 
        { 
            if ((INT16)(uncrcReg ^ uncur) < 0)
            {
                 uncrcReg = (uncrcReg << 1) ^ 0x1021;
            }
            else
            {
                  uncrcReg <<= 1; 
            } 
               
            uncur <<= 1;            
        }
    }

    return uncrcReg;
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
** ��������: UartSendNBytes
** ��    ��: buf ���ݻ�����;
             len �������ݳ���
** ��    ��: ��
** ��������: ���� ���Ͷ���ֽ�
*****************************************************/ 
void UartSendNBytes(UINT8 *buf,UINT8 len)
{
     while(len--)
     {
         UARTSendByte(*buf++);
     }
}


 
/****************************************************
** ��������: main
** ��    ��: ��
** ��    ��: ��
** ��������: ��������
*****************************************************/
void main(void)
{
     UINT8 i=0;
	 UINT16 uscrc=0;

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
			 
			 PktCrcEx.r.m_ucHead1=UCMD_CTRL_HEAD1;//MCU�ϴ�����֡ͷ��1
			 PktCrcEx.r.m_ucHead2=UCMD_CTRL_HEAD2;//MCU�ϴ�����֡ͷ��2
			 PktCrcEx.r.m_ucOptCode=UCMD_REQ_DATA;//MCU�ϴ�����֡������
			 
			 uscrc=CRC16Check(PktCrcEx.p,CTRL_FRAME_LEN+PktCrcEx.r.m_ucDataLength);//����У��ֵ
 
             PktCrcEx.r.m_szCrc[0]=(UINT8) uscrc;    //У��ֵ���ֽ�
             PktCrcEx.r.m_szCrc[1]=(UINT8)(uscrc>>8);//У��ֵ���ֽ�

  		      /*
			    ��������ԭ������Ϊ��ʱд���ݳ��Ȳ�һ��,
  		        ����PktCrcEx.r.m_szCrc�����Ϊ0�����
				����ʹ��BufCpy��У��ֵ���Ƶ���Ӧ��λ��
			   */

			 BufCpy(&PktCrcEx.p[CTRL_FRAME_LEN+PktCrcEx.r.m_ucDataLength],
			         PktCrcEx.r.m_szCrc,
					 CRC16_LEN);
			 
			 UartSendNBytes(PktCrcEx.p,
			                CTRL_FRAME_LEN+PktCrcEx.r.m_ucDataLength+CRC16_LEN);//��������

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
			UINT16 uscrc;
     
     if(RI) //�Ƿ���յ�����
     {
        RI=0;

        PktCrcEx.p[uccnt++]=SBUF;//��ȡ�����ֽ�

        if(PktCrcEx.r.m_ucHead1 == DCMD_CTRL_HEAD1)//�Ƿ���Ч������֡ͷ��1
        {
           if(uccnt<CTRL_FRAME_LEN+PktCrcEx.r.m_ucDataLength+CRC16_LEN)//�Ƿ��������������
           {
              if(uccnt>=2 && PktCrcEx.r.m_ucHead2!=DCMD_CTRL_HEAD2)//�Ƿ���Ч������֡ͷ��2
              {
                 uccnt=0;

                 return;
              }
                    
           }
           else
           {
		      
		      uclen=CTRL_FRAME_LEN+PktCrcEx.r.m_ucDataLength;//��ȡ����֡��Ч����(������У��ֵ)

			  uscrc=CRC16Check(PktCrcEx.p,uclen);//����У��ֵ

  		      /*
			    ��������ԭ������Ϊ��ʱд���ݳ��Ȳ�һ��,
  		        ����PktCrcEx.r.m_szCrc�����Ϊ0�����
				����ʹ��BufCpy��У��ֵ���Ƶ���Ӧ��λ��
			   */
			  BufCpy(PktCrcEx.r.m_szCrc,&PktCrcEx.p[uclen],CRC16_LEN);

			  if((UINT8)(uscrc>>8) !=PktCrcEx.r.m_szCrc[1]\
			   ||(UINT8) uscrc     !=PktCrcEx.r.m_szCrc[0])//У��ֵ�Ƿ�ƥ��
			  {
			      uccnt=0;

			      return;  
			  }

              switch(PktCrcEx.r.m_ucOptCode)//���������л�ȡ���Ӧ�Ĳ���
              {
                case DCMD_CTRL_BELL://���Ʒ�����������
                {
					 if(DCTRL_BELL_ON==PktCrcEx.r.m_szDataBuf[0])//���ݲ��ֺ�������
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

					 if(DCTRL_LED_ON==PktCrcEx.r.m_szDataBuf[0])//���ݲ��ֺ�������
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
