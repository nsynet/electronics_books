/*****************************************************
*  LCD 模块
*****************************************************/
#ifndef MSP430F449_H
#include <msp430x44x.h>
#endif

#define LCD_IN_USE 7
#define RADIX_POINT 0x08
/*****************************************************/
/*   数据定义                                        */
/*****************************************************/
const unsigned char NUM_LCD_ABCD[10]={ 0xf0, 0x60, 0xb0, 0xf0, 0x60,  //'0'~ '4'，驱动abcd段
		                  0xd0, 0xd0, 0x70, 0xf0, 0xf0  //'5' ~ '9'
		                  };
const unsigned char NUM_LCD_FGE[10]={ 0x05, 0x00, 0x06, 0x02, 0x03,  //'0'~ '4'，驱动efg段
		                  0x03, 0x07, 0x00, 0x07,0x03  //'5' ~ '9'
		                  };
unsigned char lcd_Buf[LCD_IN_USE];         // 自定义显示缓冲区，用于
                                           // 外部设定要显示的数据 
/*******************************************************
*     模块初始化
*******************************************************/
void init_LCD(void){
    char tmpv;
    BTCTL |= 0x10;                         // set LCD 时钟
    P3DIR  = 0xff;
    //P4DIR  = 0x03;
    P5SEL  = 0xfc;
    LCDCTL = LCDON+LCD4MUX+LCDP2+LCDP0;
     for (tmpv = 0;tmpv<LCD_IN_USE;tmpv++){
        LCDMEM[tmpv+5] |= NUM_LCD_ABCD[0];
        LCDMEM[tmpv+6] = NUM_LCD_FGE[0];    //初始时LCD显示"0000000",
    }
   for(tmpv=0;tmpv<5;tmpv++)                //清除lcd上其余不需要显示的字符
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
*    LCD 显示
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
