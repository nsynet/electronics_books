#ifndef __PS2_H
#define __PS2_H	 
#include "SysTickDelay.h"	   
#include "stm32f10x.h"
//Mini STM32������
//PS2 �������� 
//����ԭ��@ALIENTEK
//2010/6/17
				   
//����ӿڶ���
//PS2���� 		  				    
//#define PS2_SCL PAin(15)	//PA15
#define PS2_SCL_PORT              GPIOA
#define PS2_SCL_CLK               RCC_APB2Periph_GPIOA  
#define PS2_SCL_PIN               GPIO_Pin_15
//#define Set_PS2_SCL  {GPIO_SetBits(PS2_SCL_PORT,PS2_SCL_PIN);}
//#define Clr_PS2_SCL  {GPIO_ResetBits(PS2_SCL_PORT,PS2_SCL_PIN);} 
#define PS2_SCL    (GPIO_ReadInputDataBit(PS2_SCL_PORT, PS2_SCL_PIN))
//#define PS2_SDA PAin(13)	//PA13
#define PS2_SDA_PORT              GPIOA
#define PS2_SDA_CLK               RCC_APB2Periph_GPIOA  
#define PS2_SDA_PIN               GPIO_Pin_13
//#define Set_PS2_SDA  {GPIO_SetBits(PS2_SDA_PORT,PS2_SDA_PIN);}
//#define Clr_PS2_SDA  {GPIO_ResetBits(PS2_SDA_PORT,PS2_SDA_PIN);} 
#define PS2_SDA    (GPIO_ReadInputDataBit(PS2_SDA_PORT, PS2_SDA_PIN))

//PS2���
//#define PS2_SCL_OUT PAout(15)	//PA15
#define PS2_SCL_OUT_PORT              GPIOA
#define PS2_SCL_OUT_CLK               RCC_APB2Periph_GPIOA  
#define PS2_SCL_OUT_PIN               GPIO_Pin_15
#define Set_PS2_SCL_OUT  {GPIO_SetBits(PS2_SCL_OUT_PORT,PS2_SCL_OUT_PIN);}
#define Clr_PS2_SCL_OUT  {GPIO_ResetBits(PS2_SCL_OUT_PORT,PS2_SCL_OUT_PIN);} 
#define PS2_SDA_OUT PAout(13)	//PA13
#define PS2_SDA_OUT_PORT              GPIOA
#define PS2_SDA_OUT_CLK               RCC_APB2Periph_GPIOA  
#define PS2_SDA_OUT_PIN               GPIO_Pin_13
#define Set_PS2_SDA_OUT  {GPIO_SetBits(PS2_SDA_OUT_PORT,PS2_SDA_OUT_PIN);}
#define Clr_PS2_SDA_OUT  {GPIO_ResetBits(PS2_SDA_OUT_PORT,PS2_SDA_OUT_PIN);} 

//����PS2_SCL�������״̬.		  
#define PS2_SET_SCL_IN()  {GPIOA->CRH&=0X0FFFFFFF;GPIOA->CRH|=0X80000000;}
#define PS2_SET_SCL_OUT() {GPIOA->CRH&=0X0FFFFFFF;GPIOA->CRH|=0X30000000;}	  
//����PS2_SDA�������״̬.		  
#define PS2_SET_SDA_IN()  {GPIOA->CRH&=0XFF0FFFFF;GPIOA->CRH|=0X00800000;}
#define PS2_SET_SDA_OUT() {GPIOA->CRH&=0XFF0FFFFF;GPIOA->CRH|=0X00300000;} 

#define MOUSE    0X20 //���ģʽ
#define KEYBOARD 0X10 //����ģʽ
#define CMDMODE  0X00 //��������
//PS2_Status��ǰ״̬��־
//[5:4]:��ǰ������ģʽ;[7]:���յ�һ������
//[6]:У�����;[3:0]:�յ������ݳ���;	 
extern u8 PS2_Status;       //����Ϊ����ģʽ
extern u8 PS2_DATA_BUF[16]; //ps2���ݻ�����
extern u8 MOUSE_ID;

void PS2_Init(void);
u8 PS2_Send_Cmd(u8 cmd);
void PS2_Set_Int(u8 en);
u8 PS2_Get_Byte(void);
void PS2_En_Data_Report(void);  
void PS2_Dis_Data_Report(void);		  				    
#endif





















