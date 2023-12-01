#include <iom16v.h>
#include <macros.h> 

#define DISP_DDR   DDRD
#define DISP_PORT  PORTD 

void timer1_init(void)
{
 TCCR1B = 0x00;  //stop timer 

 TCNT1H = 0xE3;  //设置 TC1 的 计数寄存器 高8位值，基于7.3728M晶振
 TCNT1L = 0xE1;  //设置 TC1 的 计数寄存器 低8位值，基于7.3728M晶振 

 TCCR1A = 0x00;
 TCCR1B = 0x05;  //设置TC1 为 CLK/1024分频，启动TC1 

 MCUCR = 0x00;  //设置 MCU 的 控制寄存器
 GICR  = 0x00;  //设置 中断控制寄存器
 TIMSK = 0x04;  //设置 定时计数器 的 屏蔽寄存器
 }

#pragma interrupt_handler timer1_ovf_isr:9
void timer1_ovf_isr(void)
{
 TCNT1H = 0xE3;  //reload counter high value
 TCNT1L = 0xE1;  //reload counter low value
 DISP_PORT++;  //每加1S，显示加1
}

void main(void)
{
 DISP_DDR = 0XFF; //设置显示口为输出
 timer1_init();
 SEI();
 while(1);
} 



