#include <reg51.h>
#include "LCD1602.h"
/*******************������**********************************/
uchar string[]=" I LOVE YOU! C51 ";            //������Ҫ��ʾ���ַ�
void main(void)
{
 uchar *cp;
 cp=string;
 LCD_init();
 while(1)
 {
  LCD_send_command(LCD_CLEAR_SCREEN);
  delay_ms(2);
  LCD_disp_string(0,0,cp);
  delay_ms(100);
         cp++;
  if(*cp=='\0')
  {
   cp=string;                 //�����ַ���β��ʱ,�ı�ָ��,����ָ���ַ�����ͷ��
  }
 }
}
/*********************************************************/
/**************LCD1602�ĳ�ʼ��***************************/
void LCD_init(void)
{
 LCD_send_command(LCD_DISPLAY_DOUBLE_LINE);
 LCD_send_command(LCD_AC_AUTO_INCREMENT|LCD_MOVE_DISENABLE);
 LCD_send_command(LCD_DISPLAY_ON|LCD_CURSOR_OFF);
 LCD_send_command(LCD_CLEAR_SCREEN);
}
/********************************************************/
 
void LCD_check_busy(void)   //���LCD״̬�������ǲ��ǻ���æ��
{
 do
  {
   LCD_EN=0;
   LCD_RS=0;
   LCD_RW=1;
   LCDIO=0xff;
   LCD_EN=1;
   }
   while(LCD_BUSY==1);
  
    LCD_EN=0;
}
/************LCD1602д����*******************************/
void LCD_send_command(uchar command)
{
 LCD_check_busy();
 LCD_RS=LOW;
 LCD_RW=LOW;
 LCD_EN=HIGH;
 LCDIO=command;
 LCD_EN=LOW;
}
/********************************************************/
/*****************LCD1602д����**************************/
void LCD_send_data(uchar dat)
{
 LCD_check_busy();
 LCD_RS=HIGH;
 LCD_RW=LOW;
 LCD_EN=HIGH;
 LCDIO=dat;
 LCD_EN=LOW;
}
/********************************************************
 void LCD_write_char(uchar x,uchar y,uchar dat)
{
     unsigned char address;
     if (y == LINE1) 
         address = LINE1_HEAD + x;
     else 
        address = LINE2_HEAD + x;
     LCD_send_command(address); 
    LCD_send_data(dat);
}
******************LCD1602��ʾ�ַ���*********************/
void LCD_disp_string(uchar x,uchar y,uchar *Data)
{
 if(y==LINE1)
 {
  if(x<LINE_LENGTH)
  {
   LCD_send_command(LINE1_HEAD+x);
   for(;x<LINE_LENGTH&&*Data!='\0';x++)
   {
    LCD_send_data(*(Data++));
   }
   if(*Data!='\0')
   {
    x=0;
    y=LINE2;
   }
  }
 }
 if(y==LINE2)
 {
  LCD_send_command(LINE2_HEAD+x);
  for(;x<LINE_LENGTH&&*Data!='\0';x++)
  {
   LCD_send_data(*(Data++));
  }
 }
}
/****************************************************************/
/********************��ʱ����***********************************/
  
/***************************************************************/
void delay_ms(uint n)
{
 uint i,j;
 for(i=n;i>0;i--)
    for(j=0;j<1140;j++)
    ;
}
/*********************************************************************/ 