/******************************************************
*   �ļ����ƣ�
*           main.c
*   �ļ�˵����
*           ����ͨ������ģ��IIC���߲���EEPROM��ʵ������
*       EEPROM�ĵ�ַ0x02д����0x06��Ȼ����ʾ��LED[0],
*       ������������ʾ��LED[1]
******************************************************/

#define MSP430F449_H 0
#include <msp430x44x.h>

#include "IIC.c"

#ifndef LED_IN_USE
#include "led.c"
#endif

void main()
{
   WDTCTL = 0x5A80;          // �رտ��Ź�

   init_LED();               // ��ʼ��LED
   write_Buf = 0x06;         // ����д������
   addr_Buf  = 0x02;         // ����д��ַ
   write_EEPROM();           // д���ݵ�EEPROM
   read_EEPROM();            // ��EEPROM�ж�ȥ�ղ�д������

   led_Buf[1] = write_Buf;   // ����д�����ݵ�LED����
   led_Buf[0] = read_Buf;    // ���ö������ݵ�LED����
   write_EEPROM();           // д���ݵ�EEPROM
   read_EEPROM();            // ��EEPROM�ж�ȥ�ղ�д������
   while(1)
   {
      led_Display();         // ��ʾLED
   }
}
