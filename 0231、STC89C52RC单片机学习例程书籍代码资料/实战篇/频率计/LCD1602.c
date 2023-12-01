/*
 ----------------------------------------------------
 *��    �ߣ�������
 ----------------------------------------------------
 */
#include "stc.h"
#include "global.h"
#include "74LS164.h"
#include "LCD1602.h"
/***************************************************
 *          �����궨�壬���ڴ�����ֲ���Ķ�
 ***************************************************/
#define LCD1602_LINE1         0         
#define LCD1602_LINE2         1         
#define LCD1602_LINE1_HEAD   0x80      
#define LCD1602_LINE2_HEAD   0xC0
#define LCD1602_DATA_MODE    0x38     
#define LCD1602_OPEN_SCREEN  0x0C
#define LCD1602_DISP_ADDRESS 0x80

#define LCD1602_RS(x)      {if((x))P0_0=1;else P0_0=0;}//����RS����
#define LCD1602_RW(x)      {if((x))P0_1=1;else P0_1=0;}//����RW����
#define LCD1602_EN(x)      {if((x))P0_2=1;else P0_2=0;}//����EN����
#define LCD1602_PORT(x)    LS164Send((x))//д����

/*************************************************************
* ��������:LCD1602WriteByte
* ��    ��:byte ����
* ��    ��:��
* ˵    ��:LCD1602 д�����ֽ�����
**************************************************************/
void LCD1602WriteByte(UINT8 byte)
{
     LCD1602_PORT(byte);
     LCD1602_RS(HIGH);
     LCD1602_RW(LOW);
     LCD1602_EN(LOW);
     DelayNus(50);
     LCD1602_EN(HIGH);
}
/*************************************************************
* ��������:LCD1602WriteCommand
* ��    ��:command ����
* ��    ��:��
* ˵    ��:LCD1602 д�����ֽ�����
**************************************************************/
void LCD1602WriteCommand(UINT8 command)
{
     LCD1602_PORT(command);
     LCD1602_RS(LOW);       
     LCD1602_RW(LOW);
     LCD1602_EN(LOW);
     DelayNus(50);
     LCD1602_EN(HIGH);
}
/*************************************************************
* ��������:LCD1602SetXY
* ��    ��:x ������
           y ������
* ��    ��:��
* ˵    ��:LCD1602 ����x��y����
**************************************************************/
void LCD1602SetXY(UINT8 x,UINT8 y)
{
	 UINT8 address;

     if(y == LCD1602_LINE1) //��һ��
     {
        address=LCD1602_LINE1_HEAD+x;
     }
     else                       //�ڶ���
     {
        address=LCD1602_LINE2_HEAD+x;
     }
	 LCD1602WriteCommand(address);
}
/*************************************************************
* ��������:LCD1602PrintfString
* ��    ��:x  ������
           y  ������
		   *s �ַ���
* ��    ��:��
* ˵    ��:LCD1602 ��ӡ�ַ���
**************************************************************/
UINT8 LCD1602PrintfString(UINT8 x,
                          UINT8 y,
                          UINT8 *s)
{
     UINT8 i=0;

	 LCD1602SetXY(x,y);
	 
     while(s && *s)
     {
        LCD1602WriteByte(*s);
        s++;
        i++;
        
     }

     return i;
}

/*************************************************************
* ��������:LCD1602ClearScreen
* ��    ��:��
* ��    ��:��
* ˵    ��:LCD1602 ����
**************************************************************/ 
void LCD1602ClearScreen(void)
{
	 LCD1602WriteCommand(0x01);//��������
     DelayNus(50);
}

/*************************************************************
* ��������:LCD1602Init
* ��    ��:��
* ��    ��:��
* ˵    ��:LCD1602 ��ʼ��
**************************************************************/ 
void LCD1602Init(void)
{
	 LCD1602ClearScreen();
     LCD1602WriteCommand(LCD1602_DATA_MODE);    //��ʾģʽ���ã�����16x2��ʾ��5x7����
                                                //8λ���ݽӿ�
     LCD1602WriteCommand(LCD1602_OPEN_SCREEN);  //����ʾ
     LCD1602WriteCommand(LCD1602_DISP_ADDRESS); //��ʼ��ʾ��ַ
     LCD1602ClearScreen();
}
