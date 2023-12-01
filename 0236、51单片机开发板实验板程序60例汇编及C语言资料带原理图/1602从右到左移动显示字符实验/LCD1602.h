/**************************************LCD1602ͷ�ļ�*********************************/
#ifndef _LCD1602_H_
#define _LCD1602_H_

//���뷽ʽ����
#define LCD_AC_AUTO_INCREMENT     0x06   //���ݶ���д������AC�Զ���һ
#define LCD_AC_AUTO_DECREASE      0x04   //���ݶ���д������AC�Զ���һ
#define LCD_MOVE_ENABLE           0x05   //���ݶ���д����������ƽ��
#define LCD_MOVE_DISENABLE        0x04   //���ݶ���д���������治��
#define LCD_GO_HOME               0x02   //AC=0����ꡢ�����HOMEλ
//������ʾ����꼰��˸������
#define LCD_DISPLAY_ON            0x0C         //��ʾ��
#define LCD_DISPLAY_OFF           0x08         //��ʾ��
#define LCD_CURSOR_ON             0x0A         //�����ʾ
#define LCD_CURSOR_OFF            0x08         //��겻��ʾ
#define LCD_CURSOR_BLINK_ON       0x09         //�����˸
#define LCD_CURSOR_BLINK_OFF      0x08         //��겻��˸
//��ꡢ�����ƶ�����Ӱ��DDRAM
#define LCD_LEFT_MOVE             0x18         //LCD��ʾ����һλ
#define LCD_RIGHT_MOVE            0x1C         //LCD��ʾ����һλ
#define LCD_CURSOR_LEFT_MOVE      0x10         //�������һλ
#define LCD_CURSOR_RIGHT_MOVE     0x14         //�������һλ
//������ʽ����
#define LCD_DISPLAY_DOUBLE_LINE   0x38         //������ʾ
#define LCD_DISPLAY_SINGLE_LINE   0x30         //������ʾ
#define LCD_CLEAR_SCREEN  0X01   //����
/***********************LCD1602��ַ���******************************/
#define LINE1_HEAD    0x80   // ��һ��DDRAM��ʼ��ַ 
#define LINE2_HEAD    0xc0   //  �ڶ���DDRAM��ʼ��ַ
#define LINE1         0      //��һ��
#define LINE2         1      //�ڶ���
#define LINE_LENGTH   16     //ÿ�е�����ַ�����
/***********************LCD1602�������Ŷ���**************************/

#define LCDIO     P0         //����P2����LCD1602�����ݿ����
  sbit   LCD_RS=P3^0;         
  sbit   LCD_RW=P3^1;         
  sbit   LCD_EN=P3^2;
  sbit  LCD_BUSY=LCDIO^7;
 /**********************������صĶ�*********************************/
 #define HIGH               1
 #define LOW                0   
 #define TURE               1
 #define  FALSE             0
 #define  uchar unsigned char
 #define  uint  unsigned int
 
 /*************************�����Ǻ�����������*************************/
 void LCD_init(void);                    //LCD1602��ʼ��
 void LCD_send_command(uchar command);   //
 void LCD_send_data(uchar dat);
 void LCD_write_char(uchar x,uchar y,uchar dat);
 void LCD_disp_string(uchar x,uchar y,char *Data);
 void delay_ms(uint n);
 void LCD_check_busy(void);
 #endif
 /******************************************************************