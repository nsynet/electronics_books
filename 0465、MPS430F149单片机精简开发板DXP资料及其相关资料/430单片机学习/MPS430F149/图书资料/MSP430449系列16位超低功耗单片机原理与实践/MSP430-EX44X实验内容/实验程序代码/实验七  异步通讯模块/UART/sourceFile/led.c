/*****************************************************
*  文件名称：
*           led.c
*  文件说明:显示的时候首先设置要显示的内容
*           然后使能相应的LED
*
*****************************************************/

#ifndef MSP430F449_H
#include <msp430x44x.h>
#endif

#define LED_IN_USE 6
/*****************************************************/
/*   数据定义                                        */
/*****************************************************/
const unsigned char NUM_LED[17]=
                       {0xd7,0x14,0xcd,0x5d,0x1E,  // 0 ~ 4
                       0x5b,0xdb,0x15,0xdf,0x5f,   // 5 ~ 9
                       0x9f,0xda,0xc3,0xcc,0xcf,   // a ~ e
                       0x8b,0x00};                 //f,0x00使LED不显示

                       
unsigned char led_Buf[LED_IN_USE];  // LED显示缓冲区 ，
                                    // 存放要显示数据                         
unsigned char led_Ctrl;
/*******************************************************
*     模块初始化
*******************************************************/
void init_LED(void){
    char tmpv;
    P3DIR  = 0xff;    // 设置 p3 输出  
    P3OUT  = 0x00;    // 设置 初始值为0
    P4DIR |= 0x03;    // 设置 p4.0,p4.1 输出 
    P4OUT &= 0xfc;    // 设置初始值
    led_Ctrl = 0;     // led_Ctrl用于控制那个LED可显示
    for(tmpv=0;tmpv<LED_IN_USE;tmpv++)
    {                 // 初始化缓冲区 
      led_Buf[tmpv] = 0;
    }
    
}
/****************************************************
*     LED 显示  ,该函数可以放到定时器中断中
****************************************************/
void led_Display(){                   
    unsigned tmp ;
       P3DIR  = 0xff;    // 设置 p3 输出
    P3OUT  = 0x00;    // 设置 初始值为0
    P4DIR |= 0x03;    // 设置 p4.0,p4.1 输出
    P4OUT &= 0xfc;    // 设置初始值
      tmp    = 0x01;
      P3OUT  = NUM_LED[led_Buf[led_Ctrl]];  // 设置显示值
      P4OUT |= 0x02;                        // 打开数据锁存器 
      P4OUT &= 0XFD;                        // 关闭数据锁存
      P3OUT  = ~(tmp<<led_Ctrl);            // 设置那只LED显示 
      P4OUT  |= 0x01;                       // 打开控制锁存
      P4OUT  &= 0XFE;                       // 关闭控制锁存
      led_Ctrl= (led_Ctrl +1) % LED_IN_USE; // 设置下一个要显示的LED
      
}

