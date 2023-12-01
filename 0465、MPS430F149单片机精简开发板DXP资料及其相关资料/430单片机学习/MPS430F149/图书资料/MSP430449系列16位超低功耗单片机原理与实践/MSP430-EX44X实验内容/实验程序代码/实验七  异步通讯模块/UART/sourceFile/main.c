/******************************************************************
*   �ļ����ƣ�main.c
*   �ļ�˵����
*           ʹ��LED��ʾ���յ������ݣ�ʹ��LCD��ʾ���͵��ַ�
*           ����ʹ�ò�����Ϊ9600����������ʱ��Ҫ��pc����ʹ��һ������
*          ���շ��ͳ��򣬷����ַ�ӦΪasc�룬���յ��ַ�Ϊʮ������
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
     WDTCTL = WDTHOLD + WDTPW;              //�رտ��Ź�
     init_Keyboard();                       //��ʼ������
     init_LED();                            //��ʼ��LED
    init_BT();                             //��ʼ��Basic Timer
    init_UART();                           //��ʼ��UART0
     _EINT();   //���жϣ���������ж�
     //while(1);
     
     while(1)
     {
        key_Event();                       //�������¼�
         if (key_Flag==1)
         {
            if (uart_TNum == 0)             //�а���
            {                       
               uart_TBuf[0] = key_val ;     //���UART���У���������    
            }
            uart_TNum = 1;                  // �趨��������
            uart_Start();                   // ����uart����   
            key_Flag=0;                     //���������ʶ   
        }
      if(uart_RFlag>0)
      {
         for(tmp=0;tmp < LED_IN_USE;tmp++)
         {      
              tt = uart_RDataPos + tmp - LED_IN_USE + UART_BUF_SIZE;// ������ݵ�LED ������
              if(tt >= UART_BUF_SIZE)
              {
                 tt-= UART_BUF_SIZE;
              }
              led_Buf[tmp] = uart_RBuf[tt];
          }
         
         uart_RFlag = 0;//�����ʶ  
     }
      //led_Display();     
     
         
   }
}
 /*****************************************
 *    Initiate basic timer 1
 ******************************************/
 void  init_BT(void)
 {
    BTCTL  =0x16;                           //  Basic Timer 1 �ж�Ƶ������
    IE2   |= 0x80;                          // ʹ�� basic timer �ж�
 }
 /*****************************************
 * Basic Timer �ж�����
 ******************************************/
 #pragma vector = BASICTIMER_VECTOR 
 __interrupt void  BT_Interrupt(void)
 {
      led_Display();                        //����LED����
 }
