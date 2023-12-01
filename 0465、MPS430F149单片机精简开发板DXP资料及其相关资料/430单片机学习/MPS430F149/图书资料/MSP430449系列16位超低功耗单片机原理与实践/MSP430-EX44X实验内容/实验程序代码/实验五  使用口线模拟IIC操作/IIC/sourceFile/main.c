/******************************************************
*   文件名称：
*           main.c
*   文件说明：
*           程序通过口线模拟IIC总线操作EEPROM，实验中在
*       EEPROM的地址0x02写数据0x06，然后显示到LED[0],
*       读出的数据显示到LED[1]
******************************************************/

#define MSP430F449_H 0
#include <msp430x44x.h>

#include "IIC.c"

#ifndef LED_IN_USE
#include "led.c"
#endif

void main()
{
   WDTCTL = 0x5A80;          // 关闭看门狗

   init_LED();               // 初始化LED
   write_Buf = 0x06;         // 设置写的内容
   addr_Buf  = 0x02;         // 设置写地址
   write_EEPROM();           // 写数据到EEPROM
   read_EEPROM();            // 从EEPROM中读去刚才写的数据

   led_Buf[1] = write_Buf;   // 设置写的数据到LED缓冲
   led_Buf[0] = read_Buf;    // 设置读的内容到LED缓冲
   write_EEPROM();           // 写数据到EEPROM
   read_EEPROM();            // 从EEPROM中读去刚才写的数据
   while(1)
   {
      led_Display();         // 显示LED
   }
}
