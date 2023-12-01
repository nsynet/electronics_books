/**********************************************
*  �ļ����ƣ�
*          main.c
*  �ļ�˵����
*          keyBoard3�����ļ�
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
*  main()����
*********************************************/
void main(void)
{
     unsigned char tmp;
     WDTCTL = WDTHOLD + WDTPW ;                  // �ؿ��Ź�
     init_LED();                                 // ��ʼ��LED
     init_Keyboard();
     while(1)
     {
           key_Event();                          // ����Ƿ��а���
           if (key_Flag == 2)
           {
             for(tmp=LED_IN_USE-1; tmp>0;tmp--)
             {
               led_Buf[tmp]=led_Buf[tmp-1];       // ��ֵ����
             }
             led_Buf[0]=key_val;                 // ȡ����ǰ��ֵ
             key_Flag = 0;                       // �ָ����̰�����ʶ
           }
           led_Display();                        // ʹ��LED��������
    }
}
