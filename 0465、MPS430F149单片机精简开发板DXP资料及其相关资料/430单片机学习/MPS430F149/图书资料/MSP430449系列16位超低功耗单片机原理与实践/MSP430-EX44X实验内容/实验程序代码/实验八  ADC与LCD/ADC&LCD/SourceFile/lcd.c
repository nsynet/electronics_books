/*****************************************************
*  LCD ģ��
*****************************************************/
#ifndef MSP430F449_H
#include <msp430x44x.h>
#endif

#define LCD_IN_USE 7
#define RADIX_POINT 0x08
/*****************************************************/
/*   ���ݶ���                                        */
/*****************************************************/
const unsigned char NUM_LCD_ABCD[10]={ 0xf0, 0x60, 0xb0, 0xf0, 0x60,  //'0'~ '4'������abcd��
		                  0xd0, 0xd0, 0x70, 0xf0, 0xf0  //'5' ~ '9'
		                  };
const unsigned char NUM_LCD_FGE[10]={ 0x05, 0x00, 0x06, 0x02, 0x03,  //'0'~ '4'������efg��
		                  0x03, 0x07, 0x00, 0x07,0x03  //'5' ~ '9'
		                  };
unsigned char lcd_Buf[LCD_IN_USE];         // �Զ�����ʾ������������
                                           // �ⲿ�趨Ҫ��ʾ������ 
/*******************************************************
*     ģ���ʼ��
*******************************************************/
void init_LCD(void){
    char tmpv;
    BTCTL |= 0x10;                         // set LCD ʱ��
    P3DIR  = 0xff;
    //P4DIR  = 0x03;
    P5SEL  = 0xfc;
    LCDCTL = LCDON+LCD4MUX+LCDP2+LCDP0;
     for (tmpv = 0;tmpv<LCD_IN_USE;tmpv++){
        LCDMEM[tmpv+5] |= NUM_LCD_ABCD[0];
        LCDMEM[tmpv+6] = NUM_LCD_FGE[0];    //��ʼʱLCD��ʾ"0000000",
    }
   for(tmpv=0;tmpv<5;tmpv++)                //���lcd�����಻��Ҫ��ʾ���ַ�
    LCDMEM[tmpv] = 0x00;
   for(tmpv=13;tmpv<29;tmpv++)
      LCDMEM[tmpv]=0x00;
   
   
}
/***************************************************
*  set Radix point
***************************************************/
void lcd_SetRP(){
    LCDMEM[0] |= 0x04; 
}

/****************************************************
* 
*    LCD ��ʾ
*     
****************************************************/
void lcd_Display(){                      
    
    char tmpv;
    LCDMEM[12]=0x00;
    for(tmpv=LCD_IN_USE;tmpv>0;tmpv--){
        LCDMEM[tmpv+5] |= NUM_LCD_FGE[lcd_Buf[tmpv-1]]; 
        LCDMEM[tmpv+4] = NUM_LCD_ABCD[lcd_Buf[tmpv-1]];
    }
     //lcd_SetRP();
}
