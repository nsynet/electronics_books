/******************************************************************
*   文件名称：main.c
*   文件说明：
*           使用LED显示接收到的数据，使用LCD显示发送的字符
*           程序使用波特率为9600，程序运行时需要在pc机上使用一个串口
*          接收发送程序，发送字符应为asc码，接收的字符为十六进制
******************************************************************/

#define MSP430F449_H 0
#include <msp430x44x.h>

#ifndef LED_IN_USE
#include "led.c"
#endif

#ifndef UART_BUF_SIZE
#include "uart.c"
#endif

#ifndef KEY_BOARD
#include "keyboard12.c"
#endif
/*****************************************************************/
void init_BT(void);
void main()
{
     char tmp,tt; 
     WDTCTL = WDTHOLD + WDTPW;              //关闭看门狗
     init_Keyboard();                       //初始化键盘
     init_LED();                            //初始化LED
    init_BT();                             //初始化Basic Timer
    init_UART();                           //初始化UART0
     _EINT();   //开中断，允许接收中断
     //while(1);
     
     while(1)
     {
        key_Event();                       //检测键盘事件
         if (key_Flag==1)
         {
            if (uart_TNum == 0)             //有按键
            {                       
               uart_TBuf[0] = key_val ;     //如果UART空闲，发送数据    
            }
            uart_TNum = 1;                  // 设定发送数量
            uart_Start();                   // 开启uart发送   
            key_Flag=0;                     //清除按键标识   
        }
      if(uart_RFlag>0)
      {
         for(tmp=0;tmp < LED_IN_USE;tmp++)
         {      
              tt = uart_RDataPos + tmp - LED_IN_USE + UART_BUF_SIZE;// 填充数据到LED 缓冲区
              if(tt >= UART_BUF_SIZE)
              {
                 tt-= UART_BUF_SIZE;
              }
              led_Buf[tmp] = uart_RBuf[tt];
          }
         
         uart_RFlag = 0;//清除标识  
     }
      //led_Display();     
     
         
   }
}
 /*****************************************
 *    Initiate basic timer 1
 ******************************************/
 void  init_BT(void)
 {
    BTCTL  =0x16;                           //  Basic Timer 1 中断频率设置
    IE2   |= 0x80;                          // 使能 basic timer 中断
 }
 /*****************************************
 * Basic Timer 中断向量
 ******************************************/
 #pragma vector = BASICTIMER_VECTOR 
 __interrupt void  BT_Interrupt(void)
 {
      led_Display();                        //更新LED内容
 }
