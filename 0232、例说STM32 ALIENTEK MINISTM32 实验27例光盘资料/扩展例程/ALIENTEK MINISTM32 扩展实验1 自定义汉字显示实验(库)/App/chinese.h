#ifndef __CHINESE_H
#define __CHINESE_H	 
#include "stm32f10x.h"
//Mini STM32开发板——扩展实验
//自定义汉字显示 代码			 
//正点原子@ALIENTEK
//2010/7/6

void TEST_FONT(void);
void Test_Show_CH_Font16(u16 x,u16 y,u8 index,u16 color);
void Test_Show_CH_Font24(u16 x,u16 y,u8 index,u16 color);		  				    
#endif
