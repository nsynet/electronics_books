/************************************************************
*   �ļ����ƣ�main_c.c
*   �ļ�˵�������� basic Timer1 ��ʱ�����ܵ�C����
*   ʵ��ʹ�ö�ʱ���жϷ�ʽ������������LED��ʵ��
*************************************************************/
#include <msp430x44x.h>
#include "keyboard12.c"
#include "led.c"

 /*****************************************
 *    ��ʼ�� basic timer 1
 ******************************************/
 void  init_BT(void)
 {
    BTCTL  = 0x06;                  //  Basic Timer 1 �ж�Ƶ������
    IE2   |= 0x80;                  // ʹ�� basic timer �ж�
 }

/***************************************************
*  main����
****************************************************/
void main()
{
     WDTCTL = WDTHOLD + WDTPW;  //�رտ��Ź�
     init_BT();                 //��ʼ��Basic Timer 1
     init_Keyboard();           //��ʼ������
     init_LED();                //��ʼ��LED
     _EINT();                   //ʹ���ж�
}
/*************************************************
*  �жϴ�����
**************************************************/
 #pragma vector = BASICTIMER_VECTOR
 __interrupt void  BT_Interrupt(void)
 {
      char tmp;
      key_Event();                  //��ⰴ���¼�
      if (key_Flag == 1)            // ���key_val���Ƿ��м�ֵ���Զ�ȡ
      {
         for(tmp=LED_IN_USE-1; tmp>0;tmp--)
         {
            led_Buf[tmp]=led_Buf[tmp-1];// ��ֵ����
         }
         led_Buf[0]=key_val;        // ȡ����ǰ��ֵ
         key_Flag = 0;              // �ָ����̰�����ʶ
      }
      led_Display();               // ʹ��LED��������
}



