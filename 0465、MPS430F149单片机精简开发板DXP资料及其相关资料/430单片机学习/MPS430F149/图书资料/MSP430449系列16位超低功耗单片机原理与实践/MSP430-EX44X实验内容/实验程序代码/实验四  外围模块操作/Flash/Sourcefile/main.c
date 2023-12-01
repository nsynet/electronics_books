/******************************************************
*  文件说明：
*     文件名：main.c
*    程序初始化Flash后，首先擦除flash的内容，
*    然后写入write_Buf的内容，接着读出内容到read_Buf
*   程序的执行结果可通过查看read_Buf的值确定是否操作正确
******************************************************/

#include <msp430x44x.h>
#define _MSP430F449_ _F449_

#ifndef FLASH_C
#include "Flash.c"
#endif
/*****************************************************
*    Main() 函数
******************************************************/
void main(void)
{
  char write_Buf[10] ={                       // Data Buffer to write
       0x00,0x01,0x02,0x03,0x04,
       0x05,0x06,0x07,0x08,0x09
       };
  char read_Buf[10];                          // Data Buffer be read into
  WDTCTL = WDTHOLD + WDTPW;                   // Stop watchDog
  init_Flash();                               // 初始化Flash
  while(1)
  {
     erase_Flash((char*)0x01080);             //擦除指定段的Flash内容
     write_Flash((char*)0x01080,write_Buf,10);//写入Write_Buf中的内容到Flash
     read_Flash((char*)0x01080,read_Buf,10);  //读出指定位置的内容
  };
}
