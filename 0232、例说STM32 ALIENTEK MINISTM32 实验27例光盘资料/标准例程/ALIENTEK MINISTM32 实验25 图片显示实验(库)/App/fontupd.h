#ifndef __FONTUPD_H__
#define __FONTUPD_H__	 
#include "stm32f10x.h" 
//Mini STM32������
//���ĺ���֧�ֳ��� V1.1					   
//����ԭ��@ALIENTEK
//2010/5/23	

//#define EN_UPDATE_FONT //ʹ���������,ͨ���ر�����ʵ�ֽ�ֹ�ֿ����

 
extern u32 FONT16ADDR ;
extern u32 FONT12ADDR ;
extern u32 UNI2GBKADDR;

u8 Update_Font(void);//�����ֿ�   
u8 Font_Init(void);//��ʼ���ֿ�
#endif





















