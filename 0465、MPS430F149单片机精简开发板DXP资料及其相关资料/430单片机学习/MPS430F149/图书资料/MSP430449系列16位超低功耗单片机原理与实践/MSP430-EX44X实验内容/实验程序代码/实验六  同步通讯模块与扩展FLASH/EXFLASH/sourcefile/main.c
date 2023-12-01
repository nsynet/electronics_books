/***************************************************
*   �ļ����ƣ�
*           main.c
*   �ļ�˵����
*           ����չFlashAT45DB041���в�������Flash��0x08
*     λ��д0x08,д��������ʾ�� LED[0],������������ʾ��LED[1]
****************************************************/
#define MSP430F449_H 0
#include <msp430x44x.h>

#ifndef LED_IN_USE
#include "led.c"
#endif


#include "exflash.c"
void init_SPI()
{    ME2 |= USPIE1;    // ʹ�� USART1 SPI ģʽ
    //P3SEL |= 0x0E;                          //P1.1~3 ��λ��Χģ��
    //P3DIR |= 0x01;                          //P3.0 ���ģʽ
    U1CTL |= CHAR + SYNC + MM; //���� 8-bit �ַ�ģʽ
    U1TCTL|= SSEL1+SSEL0+STC ;// ���� SMCLK �� 3-pin ģʽ;


  UBR00 = 0x02;                             // UCLK/2
  UBR10 = 0x00;                             // 0
  UMCTL0 = 0x00;

    U1CTL &= ~SWRST;
   // IE2=URXIE1;
    P4SEL|=0X38;
    //P4DIR|=0X08;

}
/****************************************************
*    main����
*****************************************************/
void main(void)
{
      char wData=0x06;                        //���Ҫд������

      /****  ��ʼ��     ****/
      WDTCTL = WDTHOLD + WDTPW;               //�رտ��Ź�
      init_LED();                             //��ʼ��LED
      init_EXFlash();                         //��ʼ��Flash
      init_SPI();
 sector_erase(0X01,0X88,0X03);              //��������
       FLASH_CS(ENABLE);
     Send_Byte(WREN);
     FLASH_CS(DISABLE);
     FLASH_WaitForLastTask();
     FLASH_CS(ENABLE);
     Send_Byte(PP);                         //ҳ���
     Send_Byte(0x01);
     Send_Byte(0x81);
     Send_Byte(0x03);
     Send_Byte(wData);
     FLASH_CS(DISABLE);
     FLASH_WaitForLastTask();
     FLASH_CS(ENABLE);
   //for(long iii=0;iii<60000;iii++)flash_Delay();
     //flash_Delay();
     Send_Byte(READ);                     //��ȡ����
     Send_Byte(0x01);
     Send_Byte(0x81);
     Send_Byte(0x03);
     read_Buf = Send_Byte(Dummy_Byte);
     //read_Buf = Send_Byte(Dummy_Byte);
     FLASH_CS(DISABLE);


     /**** ��д�����ݺͶ�����������ʾ��LED ****/

      while(1) {
             led_Buf[0]= wData;
             led_Buf[1] =read_Buf;
             led_Display();                   // ��ʾ��LED
      }

}

/*#pragma vector = USART1RX_VECTOR
__interrupt void spi_rx(void)
{
  while(IFG2&URXIFG1==0);
   //TXBUF1 = write_Buf;
  read_Buf = RXBUF1;
}*/
