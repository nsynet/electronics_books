/**********************************************
*  �ļ����ƣ�
*          main.c
*  �ļ�˵����
*       �������к�����ɨ����̹���,�а�������
*  ʱ�����ļ�ֵ��ʾ��LED�����м��̵ġ�������Ӧ��ֵΪA
*  ��* ����Ӧ��ֵΪB
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
*  main()����
*********************************************/
void main(void)
{
     unsigned char tmp;
     WDTCTL = WDTHOLD + WDTPW ;           // ֹͣ���Ź�
     init_LED();                          // ��ʼ��LED
     init_Keyboard();                     // ��ʼ������
     while(1)
     {
           key_Event();                  //��ⰴ���¼�
           if (key_Flag == 1)            // ���key_val���Ƿ��м�ֵ���Զ�ȡ
           {
             for(tmp=LED_IN_USE-1; tmp>0;tmp--)
             {
               led_Buf[tmp]=led_Buf[tmp-1];// ��ֵ����
             }
             led_Buf[0]=key_val;          // ȡ����ǰ��ֵ
             key_val = 0xFF;
             key_Flag = 0;                // �ָ����̰�����ʶ
          }
          led_Display();                   // ʹ��LED��������
   }
}
