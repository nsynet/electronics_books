/******************************************
*  ���ܣ�
*     ���� Basic Timer 1
*    �����жϺ�����ֻ�����ñ������    
*
******************************************/
#ifndef _MSP430XF449H_
#include <msp430x44x.h>
#endif

 /*****************************************
 *    Initiate basic timer 1
 ******************************************/
 void  init_BT(void){
    BTCTL  =0x06;                           //  Basic Timer 1 interrupt rate
    IE2   |= 0x80;                          // enable basic timer interrupt
 }
 
 

