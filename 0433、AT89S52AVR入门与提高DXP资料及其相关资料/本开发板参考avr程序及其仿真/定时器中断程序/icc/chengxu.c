#include <iom16v.h>
#include <macros.h> 

#define DISP_DDR   DDRD
#define DISP_PORT  PORTD 

void timer1_init(void)
{
 TCCR1B = 0x00;  //stop timer 

 TCNT1H = 0xE3;  //���� TC1 �� �����Ĵ��� ��8λֵ������7.3728M����
 TCNT1L = 0xE1;  //���� TC1 �� �����Ĵ��� ��8λֵ������7.3728M���� 

 TCCR1A = 0x00;
 TCCR1B = 0x05;  //����TC1 Ϊ CLK/1024��Ƶ������TC1 

 MCUCR = 0x00;  //���� MCU �� ���ƼĴ���
 GICR  = 0x00;  //���� �жϿ��ƼĴ���
 TIMSK = 0x04;  //���� ��ʱ������ �� ���μĴ���
 }

#pragma interrupt_handler timer1_ovf_isr:9
void timer1_ovf_isr(void)
{
 TCNT1H = 0xE3;  //reload counter high value
 TCNT1L = 0xE1;  //reload counter low value
 DISP_PORT++;  //ÿ��1S����ʾ��1
}

void main(void)
{
 DISP_DDR = 0XFF; //������ʾ��Ϊ���
 timer1_init();
 SEI();
 while(1);
} 



