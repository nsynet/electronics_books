/******************************************************
*  �ļ�˵����
*     �ļ�����main.c
*    �����ʼ��Flash�����Ȳ���flash�����ݣ�
*    Ȼ��д��write_Buf�����ݣ����Ŷ������ݵ�read_Buf
*   �����ִ�н����ͨ���鿴read_Buf��ֵȷ���Ƿ������ȷ
******************************************************/

#include <msp430x44x.h>
#define _MSP430F449_ _F449_

#ifndef FLASH_C
#include "Flash.c"
#endif
/*****************************************************
*    Main() ����
******************************************************/
void main(void)
{
  char write_Buf[10] ={                       // Data Buffer to write
       0x00,0x01,0x02,0x03,0x04,
       0x05,0x06,0x07,0x08,0x09
       };
  char read_Buf[10];                          // Data Buffer be read into
  WDTCTL = WDTHOLD + WDTPW;                   // Stop watchDog
  init_Flash();                               // ��ʼ��Flash
  while(1)
  {
     erase_Flash((char*)0x01080);             //����ָ���ε�Flash����
     write_Flash((char*)0x01080,write_Buf,10);//д��Write_Buf�е����ݵ�Flash
     read_Flash((char*)0x01080,read_Buf,10);  //����ָ��λ�õ�����
  };
}
