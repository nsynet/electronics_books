//	�������ƣ�	1602.spj
//	����������	��������ʱ�ӵ�����
//	�漰�Ŀ⣺	CMacro1016.lib
//	����ļ���	main.c
//				LCD1602_Driver.asm
//				LCD1602_User.h/
//	Ӳ�����ӣ�	IOA8-IOA15 ---- D0-D7��1602Һ����
//				IOB12 ---- EP(1602Һ��)       ʵʱʱ��ʱ��������  IOB11    CLK
//				IOB14 ---- RS��1602Һ����     ʵʱʱ������������  IOB15    IO
//				IOB13 ---- R/w��1602Һ����    ʵʱʱ�Ӹ�λ������  IOB10    RST
#include<SPCE061A.h>
#include<DS1302.h>    //DS1302ʱ������
#include<1602.h>      //1602Һ����ʾ����
#define	uchar unsigned char  
char d[32]={'D', 'a', 't', 'a', ':', ' ','0', '0', '-', '0',  '0', '-', '0', '0', ' ',' ', 	

       	    'T', 'i', 'm', 'e', ':', ' ','0', '0', ':', '0',  '0', ':', '0', '0', ' ',' ', };
unsigned char now_time_date[8]={0x00,0x19,0x14,0x31,0x07,0x05,0x09,0x00};//�룬�֣�ʱ����,�£����ڣ���,��ֹд

//========================================================
//	�﷨��ʽ��	void Delay(unsigned int uiTime)
//	ʵ�ֹ��ܣ�	��ʱ���ڵ���Delay(1)ʱ,��ʱʱ��С��1us
//	������		uiTime
//	����ֵ��	��
//========================================================

void Delay(unsigned int uiTime)
{
	while(uiTime > 0)
	{
		uiTime -= 1;
	}
}

//========================================================
//	�﷨��ʽ��	void PowerOn(void)
//	ʵ�ֹ��ܣ�	��������
//	������		��
//	����ֵ��	��
//========================================================
void PowerOn(void)
{	
	int i;
    uchar h,v;
	LCD1602_Initial();			//���ó�ʼ�����򣬰������ж˿ڳ�ʼ����LCD��ʼ��
	Write_Command(0x0080);		//���õ�ǰDDRAM��ַΪ0x00
	for(h=0;h<16;h++)
    {
   	   Write_Data(d[h]);  
    }
    
	Write_Command(0x00c0);		//�ڵڶ�����ʾ
	
	for(v=(16);v<32;v++)
    {
    	Write_Data(d[v]);  ///n��ʾ��д��λ����
     }
	for(i=0;i<20;i++)
	{
		Delay(65535);						//��ʱ
		*P_Watchdog_Clear = 0x0001;			//�忴�Ź�
	}
	Write_Command(0x0001);
}

void Print(unsigned char *str0,unsigned char *str1)               //  �����ǰ��ȡ�õ�ʱ��
{   
	uchar h,v;
	
	Write_Command(0x0080);		//���õ�ǰDDRAM��ַΪ0x00����ʾData:
	for(h=0;h<5;h++)
    {
   	   Write_Data(d[h]);  
    }
    
	Write_Command(0x00c0);		//�ڵڶ�����ʾ,��ʾTime��            
	
	for(v=(16);v<21;v++)
    {
    	Write_Data(d[v]);  ///n��ʾ��д��λ����
     }
     
   	*P_Watchdog_Clear = 0x0001;			//�忴�Ź�
	
	Write_Command(0x0086);		//���õ�ǰDDRAM��ַΪ0x86����ʾ����
	
	
	while(*str0!='\0')
	{
		Write_Data(*str0);
		str0++;
	}
	
	Write_Command(0x00C6);		//���õ�ǰDDRAM��ַΪ0xc6����ʾʱ��
	
	while(*str1!='\0')
	{
		Write_Data(*str1);
		str1++;
	}
	
	Write_Command(0x00ce);		//�ڵڶ�����ʾ,�����ʾΪ���ַ�
	
	for(v=(30);v<32;v++)
    {
    	Write_Data(d[v]);  ///n��ʾ��д��λ����
     }
}
int main(void)
{   
	SYSTEMTIME CurrentTime;  //����CurrentTimeΪ�ṹ������
	
	*P_SystemClock = 0x0000;			//��ʼ��������ϵͳʱ��24.576MHz/1��ǿ��ģʽ
	*P_IOB_Attrib = 0xffff;				//��ʼ��IOBͬ��͵�ƽ�����
	*P_IOB_Dir = 0xffff;
	*P_IOB_Data = 0x0000;
	
	PowerOn();							//�������棺Data:  Time:
	
	LCD1602_Initial();					//���ó�ʼ�����򣬰������ж˿ڳ�ʼ����LCD��ʼ��
    Initial_DS1302();
    set_ds1302(0x80,now_time_date,8);   //���ó�ʼʱ�䣬���ڣ�����
   	*P_Watchdog_Clear = 0x0001;		    //�忴�Ź�
	while(1)
	{
	   	DS1302_GetTime(&CurrentTime);  //��ȡds1302�ڲ����ݣ����洢�������ṹ���ж���ı�����
		DateToStr(&CurrentTime);       //�����ڴ洢��DateString[]�����У��ṹ���ж�������飩
		TimeToStr(&CurrentTime);       //��ʱ��洢��TimeString[]�����У��ṹ���ж�������飩
       	 
       	Print(CurrentTime.DateString,CurrentTime.TimeString);		               //���ʱ��
		*P_Watchdog_Clear = 0x0001;		//�忴�Ź�
	}
}