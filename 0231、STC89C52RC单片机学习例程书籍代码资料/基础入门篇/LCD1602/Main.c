/*
 ----------------------------------------------------
 *��    �ߣ�������
 ----------------------------------------------------
 */


#include "stc.h"
#include <intrins.h>
/***************************************************
 *          �����궨�壬���ڴ�����ֲ���Ķ�
 ***************************************************/
#define NOP()             _nop_() 
#define HIGH               1
#define LOW                0
#define LS164_DATA(x)      {if((x))P0_4=1;else P0_4=0;}         
#define LS164_CLK(x)       {if((x))P0_5=1;else P0_5=0;} 
#define LCD1602_LINE1        0
#define LCD1602_LINE2        1
#define LCD1602_LINE1_HEAD   0x80
#define LCD1602_LINE2_HEAD   0xC0
#define LCD1602_DATA_MODE    0x38
#define LCD1602_OPEN_SCREEN  0x0C
#define LCD1602_DISP_ADDRESS 0x80
#define LCD1602_RS(x)      {if((x))P0_0=1;else P0_0=0;}//RS���ſ���
#define LCD1602_RW(x)      {if((x))P0_1=1;else P0_1=0;}//RW���ſ���
#define LCD1602_EN(x)      {if((x))P0_2=1;else P0_2=0;}//EN���ſ���
#define LCD1602_PORT         LS164Send                     //��������


/********************************************
*��������:DelayNus
*��    ��:t ��ʱʱ��
*��    ��:��
*˵    ��:΢�뼶��ʱ
********************************************/
void DelayNus(unsigned int t)
{
	unsigned int d=0;

	d=t;

	do
	{
		NOP();

	}while(--d >0);	
}
/********************************************
*��������:LS164Send
*��    ��:byte Ҫ���͵��ֽ�
*��    ��:��
*˵    ��:74LS164��������
********************************************/
void LS164Send(unsigned char byte)
{
   unsigned char j;

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
/********************************************
*��������:LCD1602WriteByte
*��    ��:byte Ҫд����ֽ�
*��    ��:��
*˵    ��:LCD1602 д�ֽ�
********************************************/
void LCD1602WriteByte(unsigned char byte)
{
     LCD1602_PORT(byte);
     LCD1602_RS(HIGH);
     LCD1602_RW(LOW);
     LCD1602_EN(LOW);
     DelayNus(50);
     LCD1602_EN(HIGH);
}
/********************************************
*��������:LCD1602WriteCommand
*��    ��:command Ҫд�������
*��    ��:��
*˵    ��:LCD1602 д����
********************************************/
void LCD1602WriteCommand(unsigned char command)
{
     LCD1602_PORT(command);
     LCD1602_RS(LOW);
     LCD1602_RW(LOW);
     LCD1602_EN(LOW);
     DelayNus(50);
     LCD1602_EN(HIGH);
}
/********************************************
*��������:LCD1602SetXY
*��    ��:x ������ y ������
*��    ��:��
*˵    ��:LCD1602 ��������
********************************************/
void LCD1602SetXY(unsigned char x,unsigned char y)
{
	 unsigned char address;

     if(y == LCD1602_LINE1)
     {
        address=LCD1602_LINE1_HEAD+x;
     }
     else
     {
        address=LCD1602_LINE2_HEAD+x;
     }

	 LCD1602WriteCommand(address);
}
/********************************************
*��������:LCD1602PrintfString
*��    ��:x ������ y ������ s�ַ���
*��    ��:��
*˵    ��:LCD1602 ��ӡ�ַ���
********************************************/
void LCD1602PrintfString(unsigned char x,
                         unsigned char y,
                         unsigned char *s)
{
	 LCD1602SetXY(x,y);
	 
     while(s && *s)
     {
        LCD1602WriteByte(*s);
        s++;
        
     }
}
/********************************************
*��������:LCD1602ClearScreen
*��    ��:��
*��    ��:��
*˵    ��:LCD1602 ����
********************************************/ 
void LCD1602ClearScreen(void)
{
	 LCD1602WriteCommand(0x01);
     DelayNus(50);
}
/********************************************
*��������:LCD1602Init
*��    ��:��
*��    ��:��
*˵    ��:LCD1602 ��ʼ��
********************************************/
void LCD1602Init(void)
{
	 LCD1602ClearScreen();
     LCD1602WriteCommand(LCD1602_DATA_MODE);//��ʾģʽ���ã�����16x2��ʾ��5x7����
                                              //8λ���ݽӿ�
     LCD1602WriteCommand(LCD1602_OPEN_SCREEN);//����ʾ
     LCD1602WriteCommand(LCD1602_DISP_ADDRESS); //��ʼ��ʾ��ַ
     LCD1602ClearScreen();
}
/********************************************
*��������:PortInit
*��    ��:��
*��    ��:��
*˵    ��:I/O�ڳ�ʼ��
********************************************/
void PortInit(void)
{
	 P0=P1=P2=P3=0xFF;
}
/********************************************
*��������:main
*��    ��:��
*��    ��:��
*˵    ��:��������
********************************************/
void main(void)
{
     PortInit();
     LCD1602Init();
     LCD1602PrintfString(0,LCD1602_LINE1,"0123456789");
	 LCD1602PrintfString(0,LCD1602_LINE2,"ABCDEFGHIJ");	

     while(1)
     {
		;//�ղ���
     }
}

