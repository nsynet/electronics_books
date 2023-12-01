/**********************************************
*  文件名称：
*          main.c
*  文件说明：
*          keyBoard3测试文件
**********************************************/

#define MSP430F449_H 0
#include <msp430x44x.h>

#ifndef LED_IN_USE
#include "..//..//led//led.c"
#endif

#ifndef KEY_BOARD
#include "keyboard3.c"
#endif

/*********************************************
*  main()函数
*********************************************/
void main(void)
{
     unsigned char tmp;
     WDTCTL = WDTHOLD + WDTPW ;                  // 关看门狗
     init_LED();                                 // 初始化LED
     init_Keyboard();
     while(1)
     {
           key_Event();                          // 检测是否有按键
           if (key_Flag == 2)
           {
             for(tmp=LED_IN_USE-1; tmp>0;tmp--)
             {
               led_Buf[tmp]=led_Buf[tmp-1];       // 键值左移
             }
             led_Buf[0]=key_val;                 // 取出当前键值
             key_Flag = 0;                       // 恢复键盘按键标识
           }
           led_Display();                        // 使用LED键盘数据
    }
}
