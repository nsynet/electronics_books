/******************************************************************
*   �ļ����ƣ�main_485.c
*   �ļ�˵����
*           ����������ʵ��������У�ʹ��LED��ʾ���յ������ݣ�ʹ������
*          ɨ����̷��͵��ַ��� ����ʹ�ò�����Ϊ9600
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
     WDTCTL = WDTHOLD + WDTPW;    //�رտ��Ź�
     init_Keyboard();             //��ʼ������
     init_LED();                  //��ʼ��LED
     init_BT();                   //��ʼ��Basic Timer
     init_485();                  //��ʼ��UART0
     _EINT();                     //���жϣ���������ж�
     while(1)
     {
         key_Event();             //�������¼�
         if (key_Flag==1)         //�а���
         {
            rs485_TBuf = key_val ;     
            rs485_SendData();     // ����uart����  
            key_Flag=0;           //���������ʶ   
         }
      if(rs485_RFlag>0)
      {
         for(tmp=0;tmp < LED_IN_USE-1;tmp++)
         {      
              led_Buf[tmp]= led_Buf[tmp+1];// ������ݵ�LED ������
          }
          led_Buf[LED_IN_USE-1]=rs485_RBuf;
          rs485_RFlag = 0;                //�����ʶ 
     } 
     }
}
 /*****************************************
 *    ��ʼ�� basic timer 1
 ******************************************/
 void  init_BT(void)
 {
    BTCTL  =0x16;                           //  Basic Timer 1 �ж�Ƶ������
    IE2   |= 0x80;                          //ʹ�� basic timer �ж�
 }
 /*****************************************
 * Basic Timer �ж�����
 ******************************************/
 #pragma vector = BASICTIMER_VECTOR 
 __interrupt void  BT_Interrupt(void)
 {
      led_Display();                      //��ʾ����
 }
