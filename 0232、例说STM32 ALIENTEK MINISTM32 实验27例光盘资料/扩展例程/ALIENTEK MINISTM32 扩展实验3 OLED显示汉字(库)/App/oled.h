#ifndef __OLED_H
#define __OLED_H			  	 
#include "stm32f10x.h"
#include "stdlib.h"	    
//SSD1306 OLED ����IC��������
//������ʽ:8080����/4�ߴ���
//�汾:V1.1
//����ԭ��@ALIENTEK
//2010-6-3

//OLEDģʽ����
//0:4�ߴ���ģʽ
//1:����8080ģʽ
#define OLED_MODE 1
		    						  
//-----------------OLED�˿ڶ���----------------  					   
//#define OLED_CS PCout(9)
#define OLED_CS_PORT              GPIOC
#define OLED_CS_CLK               RCC_APB2Periph_GPIOC  
#define OLED_CS_PIN               GPIO_Pin_9

#define Set_OLED_CS  {GPIO_SetBits(OLED_CS_PORT,OLED_CS_PIN);}
#define Clr_OLED_CS  {GPIO_ResetBits(OLED_CS_PORT,OLED_CS_PIN);} 
//#define OLED_RST  PBout(14)//��MINISTM32��ֱ�ӽӵ���STM32�ĸ�λ�ţ�
#define OLED_RST_PORT              GPIOC
#define OLED_RST_CLK               RCC_APB2Periph_GPIOC  
#define OLED_RST_PIN               GPIO_Pin_14

#define Set_OLED_RST  {GPIO_SetBits(OLED_RST_PORT,OLED_RST_PIN);}
#define Clr_OLED_RST  {GPIO_ResetBits(OLED_RST_PORT,OLED_RST_PIN);}

//#define OLED_RS PCout(8)
#define OLED_RS_PORT              GPIOC
#define OLED_RS_CLK               RCC_APB2Periph_GPIOC  
#define OLED_RS_PIN               GPIO_Pin_8

#define Set_OLED_RS  {GPIO_SetBits(OLED_RS_PORT,OLED_RS_PIN);}
#define Clr_OLED_RS  {GPIO_ResetBits(OLED_RS_PORT,OLED_RS_PIN);}

//#define OLED_WR PCout(7)		
#define OLED_WR_PORT              GPIOC
#define OLED_WR_CLK               RCC_APB2Periph_GPIOC  
#define OLED_WR_PIN               GPIO_Pin_7

#define Set_OLED_WR  {GPIO_SetBits(OLED_WR_PORT,OLED_WR_PIN);}
#define Clr_OLED_WR  {GPIO_ResetBits(OLED_WR_PORT,OLED_WR_PIN);}
  
//#define OLED_RD PCout(6)
#define OLED_RD_PORT              GPIOC
#define OLED_RD_CLK               RCC_APB2Periph_GPIOC  
#define OLED_RD_PIN               GPIO_Pin_6

#define Set_OLED_RD  {GPIO_SetBits(OLED_RD_PORT,OLED_RD_PIN);}
#define Clr_OLED_RD  {GPIO_ResetBits(OLED_RD_PORT,OLED_RD_PIN);}

//PB0~7,��Ϊ������
#define DATAOUT(x) GPIOB->ODR=(GPIOB->ODR&0xff00)|(x&0x00FF); //���,ԭ��ԭ�ӵĴ���
//#define DATAOUT(DataValue) {GPIO_Write(LCD_GPIO_DATA_PORT,DataValue);}  //δ�޸ĵ�
  
//ʹ��4�ߴ��нӿ�ʱʹ�� 
//#define OLED_SCLK PBout(0)
#define OLED_SCLK_PORT              GPIOB
#define OLED_SCLK_CLK               RCC_APB2Periph_GPIOB  
#define OLED_SCLK_PIN               GPIO_Pin_0

#define Set_OLED_SCLK  {GPIO_SetBits(OLED_SCLK_PORT,OLED_SCLK_PIN);}
#define Clr_OLED_SCLK  {GPIO_ResetBits(OLED_SCLK_PORT,OLED_SCLK_PIN);}

//#define OLED_SDIN PBout(1)
#define OLED_SDIN_PORT              GPIOB
#define OLED_SDIN_CLK               RCC_APB2Periph_GPIOB  
#define OLED_SDIN_PIN               GPIO_Pin_1

#define Set_OLED_SDIN  {GPIO_SetBits(OLED_SDIN_PORT,OLED_SDIN_PIN);}
#define Clr_OLED_SDIN  {GPIO_ResetBits(OLED_SDIN_PORT,OLED_SDIN_PIN);}

		     
#define OLED_CMD  0	//д����
#define OLED_DATA 1	//д����
//OLED�����ú���
void OLED_WR_Byte(u8 dat,u8 cmd);	    
void OLED_Display_On(void);
void OLED_Display_Off(void);
void OLED_Refresh_Gram(void);		   
							   		    
void OLED_Init(void);
void OLED_Clear(void);
void OLED_DrawPoint(u8 x,u8 y,u8 t);
void OLED_Fill(u8 x1,u8 y1,u8 x2,u8 y2,u8 dot);
void OLED_ShowChar(u8 x,u8 y,u8 chr,u8 size,u8 mode);
void OLED_ShowNum(u8 x,u8 y,u32 num,u8 len,u8 size);
void OLED_ShowString(u8 x,u8 y,const u8 *p);	 
#endif  
	 



