/**********************************************
*  文件名称：
*          main.c
*  文件说明：
*       程序运行后，行列扫描键盘工作,有按键按下
*  时按键的键值显示到LED。行列键盘的“＃”对应键值为A
*  “* ”对应键值为B
**********************************************/

#define MSP430F449_H 0
#include <msp430x44x.h>

#ifndef LED_IN_USE
#include "..//..//led//led.c"
#endif

#ifndef KEY_BOARD
#include "keyboard12.c"
#endif

/*********************************************
*  main()函数
*********************************************/
void main(void)
{
     unsigned char tmp;
     WDTCTL = WDTHOLD + WDTPW ;           // 停止看门狗
     init_LED();                          // 初始化LED
     init_Keyboard();                     // 初始化键盘
     while(1)
     {
           key_Event();                  //检测按键事件
           if (key_Flag == 1)            // 检测key_val里是否有键值可以读取
           {
             for(tmp=LED_IN_USE-1; tmp>0;tmp--)
             {
               led_Buf[tmp]=led_Buf[tmp-1];// 键值左移
             }
             led_Buf[0]=key_val;          // 取出当前键值
             key_val = 0xFF;
             key_Flag = 0;                // 恢复键盘按键标识
          }
          led_Display();                   // 使用LED键盘数据
   }
}
