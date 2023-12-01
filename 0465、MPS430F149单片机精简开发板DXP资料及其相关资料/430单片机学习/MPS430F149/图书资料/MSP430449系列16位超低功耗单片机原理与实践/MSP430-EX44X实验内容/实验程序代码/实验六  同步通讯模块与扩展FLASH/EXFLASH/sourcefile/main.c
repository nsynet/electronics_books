/***************************************************
*   文件名称：
*           main.c
*   文件说明：
*           对扩展FlashAT45DB041进行操作，在Flash的0x08
*     位置写0x08,写入数据显示到 LED[0],读出的数据显示到LED[1]
****************************************************/
#define MSP430F449_H 0
#include <msp430x44x.h>

#ifndef LED_IN_USE
#include "led.c"
#endif


#include "exflash.c"
void init_SPI()
{    ME2 |= USPIE1;    // 使能 USART1 SPI 模式
    //P3SEL |= 0x0E;                          //P1.1~3 置位外围模块
    //P3DIR |= 0x01;                          //P3.0 输出模式
    U1CTL |= CHAR + SYNC + MM; //设置 8-bit 字符模式
    U1TCTL|= SSEL1+SSEL0+STC ;// 设置 SMCLK 和 3-pin 模式;


  UBR00 = 0x02;                             // UCLK/2
  UBR10 = 0x00;                             // 0
  UMCTL0 = 0x00;

    U1CTL &= ~SWRST;
   // IE2=URXIE1;
    P4SEL|=0X38;
    //P4DIR|=0X08;

}
/****************************************************
*    main函数
*****************************************************/
void main(void)
{
      char wData=0x06;                        //存放要写的内容

      /****  初始化     ****/
      WDTCTL = WDTHOLD + WDTPW;               //关闭看门狗
      init_LED();                             //初始化LED
      init_EXFlash();                         //初始化Flash
      init_SPI();
 sector_erase(0X01,0X88,0X03);              //擦除扇区
       FLASH_CS(ENABLE);
     Send_Byte(WREN);
     FLASH_CS(DISABLE);
     FLASH_WaitForLastTask();
     FLASH_CS(ENABLE);
     Send_Byte(PP);                         //页编程
     Send_Byte(0x01);
     Send_Byte(0x81);
     Send_Byte(0x03);
     Send_Byte(wData);
     FLASH_CS(DISABLE);
     FLASH_WaitForLastTask();
     FLASH_CS(ENABLE);
   //for(long iii=0;iii<60000;iii++)flash_Delay();
     //flash_Delay();
     Send_Byte(READ);                     //读取数据
     Send_Byte(0x01);
     Send_Byte(0x81);
     Send_Byte(0x03);
     read_Buf = Send_Byte(Dummy_Byte);
     //read_Buf = Send_Byte(Dummy_Byte);
     FLASH_CS(DISABLE);


     /**** 把写的内容和读出的内容显示到LED ****/

      while(1) {
             led_Buf[0]= wData;
             led_Buf[1] =read_Buf;
             led_Display();                   // 显示到LED
      }

}

/*#pragma vector = USART1RX_VECTOR
__interrupt void spi_rx(void)
{
  while(IFG2&URXIFG1==0);
   //TXBUF1 = write_Buf;
  read_Buf = RXBUF1;
}*/
