/***************************************************
*  �ļ����ƣ�
*            main.c
*  �ļ�˵����
*      ��MSP430Ƭ���¶ȴ��������в���������¶ȵ�LCD
*      ����ʹ�õ�ͨ������ת�����¶���ʾ�ĸ�ʽ�ǻ����¶�,
*      ����λС��
***************************************************/
#define MSP430F449_H  0
#include <msp430x44x.h>

#include "adc12.c"

void main(void)
{
    unsigned int tmpv;
    
    WDTCTL = WDTHOLD + WDTPW;     //ֹͣ���Ź�
    init_LCD();                   //��ʼ��LCD
    init_ADC12();                 //��ʼ��ADC12
    _EINT();                      //ʹ���ж�
    while(1)
    {
        start_ADC12();            //����ADC12
        while(adc_Flag == 0);     //�ȴ�ת�����
        lcd_Display();            //��ʾ���ݵ�LCD
        lcd_SetRP();              //��ʾС����
        tmpv = 0;
        while(tmpv < 0xffff) tmpv++;//��ʱ
   }
}
