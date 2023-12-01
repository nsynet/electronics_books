#ifndef __TOUCH_H__
#define __TOUCH_H__
#include "stm32f10x.h"
//Mini STM32������
//ADS7843/7846/UH7843/7846/XPT2046/TSC2046 ��������
//����ԭ��@ALIENTEK
//2010/6/13
//V1.3
//������u8 AI_Read_TP(void)����,���ڶ�ȡ����״̬	 
	    
//����״̬	 
#define Key_Down 0x01
#define Key_Up   0x00 
//�ʸ˽ṹ��
typedef struct 
{
	u16 X0;//ԭʼ����
	u16 Y0;
	u16 X; //����/�ݴ�����
	u16 Y;						   	    
	u8 Key_Sta;//�ʵ�״̬
	u8 Key_OK; //��׼������,���ú��������޸�			  
//������У׼����
	float xfac;
	float yfac;
	short xoff;
	short yoff;
}Pen_Holder;	   
extern Pen_Holder Pen_Point;
//�봥����оƬ��������	   
//#define PEN  PCin(1)   //PC1  INT
#define TOUCH_PEN_PORT              GPIOC
#define TOUCH_PEN_CLK               RCC_APB2Periph_GPIOC  
#define TOUCH_PEN_PIN               GPIO_Pin_1
#define Set_TOUCH_PEN  {GPIO_SetBits(TOUCH_PEN_PORT,TOUCH_PEN_PIN);}
#define Clr_TOUCH_PEN  {GPIO_ResetBits(TOUCH_PEN_PORT,TOUCH_PEN_PIN);} 
#define TOUCH_PEN    (GPIO_ReadInputDataBit(TOUCH_PEN_PORT, TOUCH_PEN_PIN))
//#define DOUT PCin(2)   //PC2  MISO
#define TOUCH_DOUT_PORT              GPIOC
#define TOUCH_DOUT_CLK               RCC_APB2Periph_GPIOC  
#define TOUCH_DOUT_PIN               GPIO_Pin_2
#define Set_TOUCH_DOUT  {GPIO_SetBits(TOUCH_DOUT_PORT,TOUCH_DOUT_PIN);}
#define Clr_TOUCH_DOUT  {GPIO_ResetBits(TOUCH_DOUT_PORT,TOUCH_DOUT_PIN);} 
#define TOUCH_DOUT    (GPIO_ReadInputDataBit(TOUCH_DOUT_PORT, TOUCH_DOUT_PIN))
//#define TDIN PCout(3)  //PC3  MOSI
#define TOUCH_TDIN_PORT              GPIOC
#define TOUCH_TDIN_CLK               RCC_APB2Periph_GPIOC  
#define TOUCH_TDIN_PIN               GPIO_Pin_3
#define Set_TOUCH_TDIN  {GPIO_SetBits(TOUCH_TDIN_PORT,TOUCH_TDIN_PIN);}
#define Clr_TOUCH_TDIN  {GPIO_ResetBits(TOUCH_TDIN_PORT,TOUCH_TDIN_PIN);} 
//#define TCLK PCout(0)  //PC0  SCLK
#define TOUCH_TCLK_PORT              GPIOC
#define TOUCH_TCLK_CLK               RCC_APB2Periph_GPIOC  
#define TOUCH_TCLK_PIN               GPIO_Pin_0
#define Set_TOUCH_TCLK  {GPIO_SetBits(TOUCH_TCLK_PORT,TOUCH_TCLK_PIN);}
#define Clr_TOUCH_TCLK  {GPIO_ResetBits(TOUCH_TCLK_PORT,TOUCH_TCLK_PIN);} 
//#define TCS  PCout(13) //PC13 CS    
#define TOUCH_TCS_PORT              GPIOC
#define TOUCH_TCS_CLK               RCC_APB2Periph_GPIOC  
#define TOUCH_TCS_PIN               GPIO_Pin_13
#define Set_TOUCH_TCS  {GPIO_SetBits(TOUCH_TCS_PORT,TOUCH_TCS_PIN);}
#define Clr_TOUCH_TCS  {GPIO_ResetBits(TOUCH_TCS_PORT,TOUCH_TCS_PIN);}   
//ADS7843/7846/UH7843/7846/XPT2046/TSC2046 ָ�
#define CMD_RDY 0X90  //0B10010000���ò�ַ�ʽ��X����
#define CMD_RDX	0XD0  //0B11010000���ò�ַ�ʽ��Y����   											 
#define TEMP_RD	0XF0  //0B11110000���ò�ַ�ʽ��Y����    
//ʹ�ñ���
#define ADJ_SAVE_ENABLE	    
			  
void Touch_Init(void);		 //��ʼ��
u8 Read_ADS(u16 *x,u16 *y);	 //��������˫�����ȡ
u8 Read_ADS2(u16 *x,u16 *y); //����ǿ�˲���˫���������ȡ
u16 ADS_Read_XY(u8 xy);		 //���˲��������ȡ(������)
u16 ADS_Read_AD(u8 CMD);	 //��ȡADת��ֵ
void ADS_Write_Byte(u8 num); //�����оƬд��һ������
void Drow_Touch_Point(u8 x,u16 y);//��һ�������׼��
void Draw_Big_Point(u8 x,u16 y);  //��һ�����
void Touch_Adjust(void);          //������У׼
void Save_Adjdata(void);		  //����У׼����
u8 Get_Adjdata(void); 			  //��ȡУ׼����
void Pen_Int_Set(u8 en); 		  //PEN�ж�ʹ��/�ر�
void Convert_Pos(void);           //���ת������	 
u8 AI_Read_TP(void);              //��ȡTP״̬	 
u8 Is_In_Area(u8 x1,u16 y1,u8 x2,u16 y2);//�жϰ����Ƿ������������.
#endif

















