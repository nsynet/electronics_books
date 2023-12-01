#ifndef __RED_H
#define __RED_H 

#include "stm32f10x.h"


//IO�ڲ����궨��
#define BITBAND(addr, bitnum) ((addr & 0xF0000000)+0x2000000+((addr &0xFFFFF)<<5)+(bitnum<<2)) 
#define MEM_ADDR(addr)  *((volatile unsigned long  *)(addr)) 
#define BIT_ADDR(addr, bitnum)   MEM_ADDR(BITBAND(addr, bitnum)) 
//IO�ڵ�ַӳ��
#define GPIOA_ODR_Addr    (GPIOA_BASE+12) //0x4001080C 
#define GPIOB_ODR_Addr    (GPIOB_BASE+12) //0x40010C0C 
#define GPIOC_ODR_Addr    (GPIOC_BASE+12) //0x4001100C 
#define GPIOD_ODR_Addr    (GPIOD_BASE+12) //0x4001140C 
#define GPIOE_ODR_Addr    (GPIOE_BASE+12) //0x4001180C 
#define GPIOF_ODR_Addr    (GPIOF_BASE+12) //0x40011A0C    
#define GPIOG_ODR_Addr    (GPIOG_BASE+12) //0x40011E0C    

#define GPIOA_IDR_Addr    (GPIOA_BASE+8) //0x40010808 
#define GPIOB_IDR_Addr    (GPIOB_BASE+8) //0x40010C08 
#define GPIOC_IDR_Addr    (GPIOC_BASE+8) //0x40011008 
#define GPIOD_IDR_Addr    (GPIOD_BASE+8) //0x40011408 
#define GPIOE_IDR_Addr    (GPIOE_BASE+8) //0x40011808 
#define GPIOF_IDR_Addr    (GPIOF_BASE+8) //0x40011A08 
#define GPIOG_IDR_Addr    (GPIOG_BASE+8) //0x40011E08

//IO�ڵ�ַӳ��
#define GPIOA_ODR_Addr    (GPIOA_BASE+12) //0x4001080C 

//Mini STM32������
//����ң�ؽ��� �������� 
//����ԭ��@ALIENTEK
//2010/6/17	  
//#define RDATA PAin(1)	 //�������������
#define RDATA_PORT              GPIOA
#define RDATA_CLK               RCC_APB2Periph_GPIOA  
#define RDATA_PIN               GPIO_Pin_1
//#define Set_RDATA  {GPIO_SetBits(RDATA_PORT,RDATA_PIN);}
//#define Clr_RDATA  {GPIO_ResetBits(RDATA_PORT,RDATA_PIN);} 
#define RDATA  BIT_ADDR(GPIOA_IDR_Addr,1)  //���� 
//#define RDATA  (GPIO_ReadInputDataBit(RDATA_PORT, RDATA_PIN))

//����ң��ʶ����(ID),ÿ��ң�����ĸ�ֵ��������һ��,��Ҳ��һ����.
//����ѡ�õ�ң����ʶ����Ϊ0
#define REMOTE_ID 0      

extern u8 Remote_Cnt;    //��������,�˴ΰ��¼��Ĵ���
extern u8 Remote_Rdy;    //������յ����� 
extern u32 Remote_Odr;   //�����ݴ洦
void Remote_Init(void);    //���⴫��������ͷ���ų�ʼ��
u8 Remote_Process(void);   //������յ����ݴ���
u8 Pulse_Width_Check(void);//�������	  	
#endif















