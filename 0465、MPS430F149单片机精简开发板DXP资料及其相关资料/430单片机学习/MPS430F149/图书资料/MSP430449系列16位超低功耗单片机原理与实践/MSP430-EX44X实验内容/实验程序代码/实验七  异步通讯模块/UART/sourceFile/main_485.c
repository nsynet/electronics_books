/******************************************************************
*   文件名称：main_485.c
*   文件说明：
*           程序在两块实验板上运行，使用LED显示接收到的数据，使用行列
*          扫描键盘发送的字符， 程序使用波特率为9600
******************************************************************/

#define MSP430F449_H 0
#include <msp430x44x.h>

#include "rs485.c"

#ifndef LED_IN_USE
#include "led.c"
#endif

#ifndef KEY_BOARD
#include "keyboard12.c"
#endif

/*****************************************************************/
void init_BT(void);
void main()
{
     char tmp; 
     WDTCTL = WDTHOLD + WDTPW;    //关闭看门狗
     init_Keyboard();             //初始化键盘
     init_LED();                  //初始化LED
     init_BT();                   //初始化Basic Timer
     init_485();                  //初始化UART0
     _EINT();                     //开中断，允许接收中断
     while(1)
     {
         key_Event();             //检测键盘事件
         if (key_Flag==1)         //有按键
         {
            rs485_TBuf = key_val ;     
            rs485_SendData();     // 开启uart发送  
            key_Flag=0;           //清除按键标识   
         }
      if(rs485_RFlag>0)
      {
         for(tmp=0;tmp < LED_IN_USE-1;tmp++)
         {      
              led_Buf[tmp]= led_Buf[tmp+1];// 填充数据到LED 缓冲区
          }
          led_Buf[LED_IN_USE-1]=rs485_RBuf;
          rs485_RFlag = 0;                //清除标识 
     } 
     }
}
 /*****************************************
 *    初始化 basic timer 1
 ******************************************/
 void  init_BT(void)
 {
    BTCTL  =0x16;                           //  Basic Timer 1 中断频率设置
    IE2   |= 0x80;                          //使能 basic timer 中断
 }
 /*****************************************
 * Basic Timer 中断向量
 ******************************************/
 #pragma vector = BASICTIMER_VECTOR 
 __interrupt void  BT_Interrupt(void)
 {
      led_Display();                      //显示数据
 }
