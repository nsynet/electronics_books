#ifndef __BIGFONT_H
#define __BIGFONT_H  
//Mini STM32������
//��չ����--OLED������ʾ			 
//����ԭ��@ALIENTEK
//2010/8/22

void OLED_ShowChar22(u8 x,u8 y,u8 chr,u8 mode);
void OLED_ShowNum22(u8 x,u8 y,u32 num,u8 len);
void OLED_ShowFont22(u8 x,u8 y,u8 fno,u8 mode);
void OLED_ShowString22(u8 x,u8 y,const u8 *p);


#endif
