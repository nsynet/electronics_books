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
#define NOP()              _nop_() 
#define HIGH               1
#define LOW                0
#define LS164_DATA(x)      {if((x))P0_4=1;else P0_4=0;}         
#define LS164_CLK(x)       {if((x))P0_5=1;else P0_5=0;} 
#define LCD12864_RS(x)      {if((x))P0_0=1;else P0_0=0;}//RS���ſ���
#define LCD12864_RW(x)      {if((x))P0_1=1;else P0_1=0;}//R/W���ſ���
#define LCD12864_EN(x)      {if((x))P0_2=1;else P0_2=0;}//E���ſ���
#define LCD12864_MD(x)      {if((x))P0_3=1;else P0_3=0;}//PSB���ſ���
#define LCD12864_PORT        LS164Send//��������

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
*��������:LCD12864WriteByte
*��    ��:byte Ҫд����ֽ�
*��    ��:��
*˵    ��:LCD12864 д�ֽ�
********************************************/
void LCD12864WriteByte(unsigned char byte)
{
     LCD12864_PORT(byte);
     LCD12864_RS(HIGH);
     LCD12864_RW(LOW);
     LCD12864_EN(LOW);
     DelayNus(5);
     LCD12864_EN(HIGH); 
}
/********************************************
*��������:LCD12864WriteCommand
*��    ��:command Ҫд�������
*��    ��:��
*˵    ��:LCD12864 д����
********************************************/
void LCD12864WriteCommand(unsigned char command)
{
     LCD12864_PORT(command);
     LCD12864_RS(LOW);
     LCD12864_RW(LOW);
     LCD12864_EN(LOW);
     DelayNus(5);
     LCD12864_EN(HIGH); 

}
/********************************************
*��������:LCD12864SetXY
*��    ��:x ������ y ������
*��    ��:��
*˵    ��:LCD12864 ��������
********************************************/
void LCD12864SetXY(unsigned char x,unsigned char y)
{
 	 switch(y)
     {
		case 1:
        {
             LCD12864WriteCommand(0x80|x);
        }
        break;

		case 2:
        {
             LCD12864WriteCommand(0x90|x);
        }
        break;

		case 3:
        {
             LCD12864WriteCommand(0x88|x);
        }
        break;

		case 4:
        {
             LCD12864WriteCommand(0x98|x);
        }
        break;

		default:break;

     }
}
/********************************************
*��������:LCD12864PrintfString
*��    ��:x ������ y ������ s�ַ���
*��    ��:��
*˵    ��:LCD12864 ��ӡ�ַ���
********************************************/
void LCD12864PrintfString(unsigned char x,
                          unsigned char y,
                          unsigned char *s)
{
	LCD12864SetXY(x,y);
	 
     while(s && *s)
     {
        LCD12864WriteByte(*s);
        s++;
        
     }
}
/********************************************
*��������:LCD12864ClearScreen
*��    ��:��
*��    ��:��
*˵    ��:LCD12864 ����
********************************************/ 
void LCD12864ClearScreen(void)
{
	 LCD12864WriteCommand(0x01);
     DelayNus(20);
}
/********************************************
*��������:LCD12864Init
*��    ��:��
*��    ��:��
*˵    ��:LCD12864 ��ʼ��
********************************************/
void LCD12864Init(void)
{
     LCD12864_MD(HIGH);
     LCD12864WriteCommand(0x30);//�������ã�һ����8λ���ݣ�����ָ�
     LCD12864WriteCommand(0x0C);//������ʾ���α�off���α�λ��off
     LCD12864WriteCommand(0x01);//��DDRAM    
     LCD12864WriteCommand(0x02);//DDRAM��ַ��λ
     LCD12864WriteCommand(0x80);//�趨DDRAM 7λ��ַ000��0000����ַ������AC
     LCD12864ClearScreen();
}
/********************************************
*��������:PortInit
*��    ��:��
*��    ��:��
*˵    ��:I/O��ʼ��
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
    unsigned char i=0;

    PortInit();    
    LCD12864Init();//��ʼ��
    LCD12864PrintfString(0,1,"1234567890ABCDEF");//��һ�д�ӡ
    LCD12864PrintfString(0,2,"----------------");//�ڶ��д�ӡ
    LCD12864PrintfString(0,3,"ѧ�õ��ӳɾ��Լ�");//�����д�ӡ
    LCD12864PrintfString(0,4,"----------------");//�����д�ӡ

	while(1)
    {

        
		;

    }

}

