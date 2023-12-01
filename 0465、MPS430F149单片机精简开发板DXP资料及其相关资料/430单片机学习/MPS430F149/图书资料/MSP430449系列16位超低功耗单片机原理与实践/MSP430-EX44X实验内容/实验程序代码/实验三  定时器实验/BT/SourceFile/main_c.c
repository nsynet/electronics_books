/************************************************************
*   文件名称：main_c.c
*   文件说明：测试 basic Timer1 定时器功能的C程序
*   实验使用定时器中断方式，重做键盘与LED的实验
*************************************************************/
#include <msp430x44x.h>
#include "keyboard12.c"
#include "led.c"

 /*****************************************
 *    初始化 basic timer 1
 ******************************************/
 void  init_BT(void)
 {
    BTCTL  = 0x06;                  //  Basic Timer 1 中断频率设置
    IE2   |= 0x80;                  // 使能 basic timer 中断
 }

/***************************************************
*  main（）
****************************************************/
void main()
{
     WDTCTL = WDTHOLD + WDTPW;  //关闭看门狗
     init_BT();                 //初始化Basic Timer 1
     init_Keyboard();           //初始化键盘
     init_LED();                //初始化LED
     _EINT();                   //使能中断
}
/*************************************************
*  中断处理函数
**************************************************/
 #pragma vector = BASICTIMER_VECTOR
 __interrupt void  BT_Interrupt(void)
 {
      char tmp;
      key_Event();                  //检测按键事件
      if (key_Flag == 1)            // 检测key_val里是否有键值可以读取
      {
         for(tmp=LED_IN_USE-1; tmp>0;tmp--)
         {
            led_Buf[tmp]=led_Buf[tmp-1];// 键值左移
         }
         led_Buf[0]=key_val;        // 取出当前键值
         key_Flag = 0;              // 恢复键盘按键标识
      }
      led_Display();               // 使用LED键盘数据
}



