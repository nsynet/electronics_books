/***************************************************
*  文件名称：
*            main.c
*  文件说明：
*      对MSP430片内温度传感器进行采样，输出温度到LCD
*      程序使用单通道单次转换，温度显示的格式是华氏温度,
*      带两位小数
***************************************************/
#define MSP430F449_H  0
#include <msp430x44x.h>

#include "adc12.c"

void main(void)
{
    unsigned int tmpv;
    
    WDTCTL = WDTHOLD + WDTPW;     //停止看门狗
    init_LCD();                   //初始化LCD
    init_ADC12();                 //初始化ADC12
    _EINT();                      //使能中断
    while(1)
    {
        start_ADC12();            //启动ADC12
        while(adc_Flag == 0);     //等待转换完称
        lcd_Display();            //显示数据到LCD
        lcd_SetRP();              //显示小数点
        tmpv = 0;
        while(tmpv < 0xffff) tmpv++;//延时
   }
}
