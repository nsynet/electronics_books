/**************************************************************************
  
                   		THE REAL TIMER DS1302 DRIVER LIB
  
             		COPYRIGHT (c)   2005 BY JJJ.
                       		--  ALL RIGHTS RESERVED  --
  
   File Name:       DS1302.h
   Author:          Jiang Jian Jun
   Created:         2003/7/21
   Modified:		NO
   Revision: 		1.0
  
***************************************************************************/
#ifndef __DS1302_H__
#define __DS1302_H__

#define		P_IOB_Data				(volatile unsigned int *)0x7005
#define		P_IOB_Buffer			(volatile unsigned int *)0x7006
#define		P_IOB_Dir				(volatile unsigned int *)0x7007
#define		P_IOB_Attrib			(volatile unsigned int *)0x7008

#define     SET_BIT(x,y)           ((x)|=(0x0001<<(y)))        //��x�ĵ�yλΪһ
#define     CLR_BIT(x,y)           ((x)&=~(0x0001<<(y)))       //��x�ĵ�yλΪ��
#define     GET_BIT(x,y)           (((x)&(1<<(y)))== 0 ? 0:1)  //��ȡx�ĵ�yλ������0��1

/********************************************************
sbit  DS1302_CLK = P1^6;              //ʵʱʱ��ʱ��������  IOB11    CLK
sbit  DS1302_IO  = P1^7;              //ʵʱʱ������������  IOB15    IO
sbit  DS1302_RST = P1^5;              //ʵʱʱ�Ӹ�λ������  IOB10    RST
sbit  ACC0 = ACC^0;
sbit  ACC7 = ACC^7
*********************************************************/;

typedef struct __SYSTEMTIME__
{
	unsigned char Second;
	unsigned char Minute;
	unsigned char Hour;
	unsigned char Week;
	unsigned char Day;
	unsigned char Month;
	unsigned char  Year;
	unsigned char DateString[9];
	unsigned char TimeString[9];
}SYSTEMTIME;	//�����ʱ������

#define AM(X)	X
#define PM(X)	(X+12)            	  // ת��24Сʱ��
#define DS1302_SECOND	0x80
#define DS1302_MINUTE	0x82
#define DS1302_HOUR		0x84 
#define DS1302_WEEK		0x8A
#define DS1302_DAY		0x86
#define DS1302_MONTH	0x88
#define DS1302_YEAR		0x8C
#define DS1302_RAM(X)	(0xC0+(X)*2)   	//���ڼ��� DS1302_RAM ��ַ�ĺ� 

void IOB15OutputData()          //����IOB15�˿�Ϊ���,�����˿�״̬����
{
	*P_IOB_Dir|=0x8000;
	*P_IOB_Attrib|=0x8000;    
	*P_IOB_Data|=0x8000; 	
}
void IOB15InputData()           //����IOB15�˿�Ϊ���룬�����˿�״̬����
{
	*P_IOB_Dir&=~0x8000;
	*P_IOB_Attrib|=0x8000;    
	*P_IOB_Data&=~0x8000;
}
void DS1302InputByte(unsigned char d) 	//ʵʱʱ��д��һ�ֽ�(�ڲ�����)
{ 
    unsigned int i;
    unsigned int temp;
    temp=d;                //ACC
    for(i=8;i>0;i--)
    {
        if(temp&0x01)     SET_BIT(*P_IOB_Data,15);//IO=ACC0
        else              CLR_BIT(*P_IOB_Data,15);
        SET_BIT(*P_IOB_Data,11);//CLK=1    
        CLR_BIT(*P_IOB_Data,11);//CLK=0    
        temp>>=1;
    }
}

unsigned char DS1302OutputByte(void) 	//ʵʱʱ�Ӷ�ȡһ�ֽ�(�ڲ�����)
{ 
    unsigned int i;
    unsigned int temp=0;
    
    IOB15InputData();   //����IOB15Ϊ����˿�
    
    for(i=8; i>0; i--)
    {
        temp>>=1;
        temp&=0x7fff;        
        if(GET_BIT(*P_IOB_Data,15))temp+=0x8000;
        SET_BIT(*P_IOB_Data,11);//CLK=1    
        CLR_BIT(*P_IOB_Data,11);//CLK=0   
    } 
    
    IOB15OutputData(); //����IOB15Ϊ����˿�
    
    temp>>=8;
    temp&=0x00ff;
    return(temp); 
}

void Write1302(unsigned char ucAddr, unsigned char ucDa)	//ucAddr: DS1302��ַ, ucData: Ҫд������
{
    CLR_BIT(*P_IOB_Data,10);    //RST=0
    CLR_BIT(*P_IOB_Data,11);    //CLK=0
    SET_BIT(*P_IOB_Data,10);    //RST=1
    DS1302InputByte(ucAddr);   // ��ַ������ 
    DS1302InputByte(ucDa);     // д1Byte����
    SET_BIT(*P_IOB_Data,11);    //CLK=1
    CLR_BIT(*P_IOB_Data,10);    //RST=0
} 

unsigned char Read1302(unsigned char ucAddr)	//��ȡDS1302ĳ��ַ������
{
    unsigned char ucData;
    CLR_BIT(*P_IOB_Data,10);    //RST=0
    CLR_BIT(*P_IOB_Data,11);    //CLK=0
    SET_BIT(*P_IOB_Data,10);    //RST=1
    DS1302InputByte(ucAddr|0x01);        // ��ַ������ 
    ucData = DS1302OutputByte();         // ��1Byte����
    SET_BIT(*P_IOB_Data,11);    //CLK=1
    CLR_BIT(*P_IOB_Data,10);    //RST=0
    return(ucData);
}

void DS1302_SetProtect(unsigned char flag)        //�Ƿ�д����
{
	if(flag)
		Write1302(0x8E,0x10);
	else
		Write1302(0x8E,0x00);
}

void DS1302_SetTime(unsigned char Address, unsigned char Value)        // ����ʱ�亯��
{
	DS1302_SetProtect(0);
	Write1302(Address, ((Value/10)<<4 | (Value%10))); 
}

void set_ds1302(unsigned char addr,unsigned char *p,unsigned char n)   //���ó�ʼʱ��
{
 Write1302(0x8e,0x00);//д�����֣�����д����
 for(;n>0;n--)
 {
 Write1302(addr,*p);
 p++;
 addr=addr+2;
 }
 Write1302(0x8e,0x80);//д��������ֹд��
}

void DS1302_GetTime(SYSTEMTIME *Time)
{
	unsigned char ReadValue;
	ReadValue = Read1302(DS1302_SECOND);
	Time->Second = ((ReadValue&0x70)>>4)*10 + (ReadValue&0x0F);	  //->��ʾָ��
	ReadValue = Read1302(DS1302_MINUTE);
	Time->Minute = ((ReadValue&0x70)>>4)*10 + (ReadValue&0x0F);
	ReadValue = Read1302(DS1302_HOUR);
	Time->Hour = ((ReadValue&0x70)>>4)*10 + (ReadValue&0x0F);
	ReadValue = Read1302(DS1302_DAY);
	Time->Day = ((ReadValue&0x70)>>4)*10 + (ReadValue&0x0F);	
	ReadValue = Read1302(DS1302_WEEK);
	Time->Week = ((ReadValue&0x70)>>4)*10 + (ReadValue&0x0F);
	ReadValue = Read1302(DS1302_MONTH);
	Time->Month = ((ReadValue&0x70)>>4)*10 + (ReadValue&0x0F);
	ReadValue = Read1302(DS1302_YEAR);
	Time->Year = ((ReadValue&0x70)>>4)*10 + (ReadValue&0x0F);	
}

void DateToStr(SYSTEMTIME *Time)
{
	Time->DateString[0] = Time->Year/10 + '0';	   //�����'0'��ʾ��ǰʱ��
	Time->DateString[1] = Time->Year%10 + '0';
	Time->DateString[2] = '-';
	Time->DateString[3] = Time->Month/10 + '0';
	Time->DateString[4] = Time->Month%10 + '0';
	Time->DateString[5] = '-';
	Time->DateString[6] = Time->Day/10 + '0';
	Time->DateString[7] = Time->Day%10 + '0';
	Time->DateString[8] = '\0';
}

void TimeToStr(SYSTEMTIME *Time)
{
	Time->TimeString[0] = Time->Hour/10 + '0';
	Time->TimeString[1] = Time->Hour%10 + '0';
	Time->TimeString[2] = ':';
	Time->TimeString[3] = Time->Minute/10 + '0';
	Time->TimeString[4] = Time->Minute%10 + '0';
	Time->TimeString[5] = ':';
	Time->TimeString[6] = Time->Second/10 + '0';
	Time->TimeString[7] = Time->Second%10 + '0';
	Time->DateString[8] = '\0';
}

void Initial_DS1302(void)
{
	unsigned char Second=Read1302(DS1302_SECOND);
	if(Second&0x80)		  
		DS1302_SetTime(DS1302_SECOND,0);
}

/********************************************************************************
void BurstWrite1302(unsigned char *pWClock)	//��DS1302д��ʱ������(���ֽڷ�ʽ)
{
    unsigned char i;
    Write1302(0x8e,0x00);         	// ��������,WP=0,д����?
    DS1302_RST = 0;
    DS1302_CLK = 0;
    DS1302_RST = 1;
    DS1302InputByte(0xbe);        	// 0xbe:ʱ�Ӷ��ֽ�д����
    for (i = 8; i>0; i--)     		//8Byte = 7Byte ʱ������ + 1Byte ����
    {
        DS1302InputByte(*pWClock); 	// д1Byte����
        pWClock++;
    }
    DS1302_CLK = 1;
    DS1302_RST = 0;
} 

void BurstRead1302(unsigned char *pRClock)	//��ȡDS1302ʱ������(ʱ�Ӷ��ֽڷ�ʽ)
{
    unsigned char i;
    DS1302_RST = 0;
    DS1302_CLK = 0;
    DS1302_RST = 1;
    DS1302InputByte(0xbf);             	// 0xbf:ʱ�Ӷ��ֽڶ����� 
    for (i=8; i>0; i--) 
    {
       *pRClock = DS1302OutputByte();   // ��1Byte���� 
       pRClock++;
    }
    DS1302_CLK = 1;
    DS1302_RST = 0;
}

void DS1302_TimeStop(bit flag)           // �Ƿ�ʱ��ֹͣ
{
	unsigned char Data;
	Data=Read1302(DS1302_SECOND);
	DS1302_SetProtect(0);
	if(flag)
		Write1302(DS1302_SECOND, Data|0x80);
	else
		Write1302(DS1302_SECOND, Data&0x7F);
}
********************************************************************************/
#endif