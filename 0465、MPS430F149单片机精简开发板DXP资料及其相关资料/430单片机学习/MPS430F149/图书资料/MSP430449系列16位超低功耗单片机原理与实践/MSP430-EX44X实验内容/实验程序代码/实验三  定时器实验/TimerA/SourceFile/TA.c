/****************************************************************************
*  �ļ����ƣ�
*          TB.c
*  �ļ�˵����
*          ʹ��TB���PWM���Σ���ͨ��set_TB�趨��ͬ��ģʽ
*****************************************************************************/
#include  "msp430x44x.h"
/******************************************************************************
* ����TimerB���PWM�Ĺ���ģʽ
********************************************************************************/
void set_TB(int mode)
{
     if (mode==2)
     {                          // ��ת/��λģʽ��CCR1��25����CCR2��75��
         TBCCR0  = 11;           // PWM ����
         TBCCTL1 = OUTMOD_2;      // PWM toggle/reset
         TBCCR1  = 9;           // ccr1 Pwm cycle
         TBCCTL2 = OUTMOD_2;      // PWM toggle/reset
         TBCCR2  = 3;           // ccr2 Pwm cycle
         P2DIR |= 0x02;         // p2.1 ģʽ����
         P2SEL |= 0x02;         // p2.1 option select
         P2DIR |= 0x08;         // P2.3 output mode
         P2SEL |= 0x08;         // P2.3 option select
         TBCTL |= MC0;          // ���õ���ģʽ
      }else if (mode==0x03)
      {                         //��λ/��λģʽ��CCR1��25����CCR2��75��

         TBCCR0  = 11;           // PWM ����
         TBCCTL1 = OUTMOD_3;      // PWM toggle/reset
         TBCCR1  = 9;           // ccr1 Pwm cycle
         TBCCTL2 = OUTMOD_3;      // PWM toggle/reset
         TBCCR2  = 3;           // ccr2 Pwm cycle
         P2DIR |= 0x02;         // p2.1 output mode
         P2SEL |= 0x02;         // p2.1 option select
         P2DIR |= 0x08;         // P2.3 output mode
         P2SEL |= 0x08;         // P2.3 option select
         TBCTL |= MC0;          // ���õ���ģʽ
      }else if (mode==0x04)
      {                         // ��תģʽ��CCR1��50����CCR2��50��
         TBCCR0  = 11;           // PWM ����
         TBCCTL1 = OUTMOD_4;      // PWM toggle/reset
         TBCCR1  = 9;           // ccr1 Pwm cycle
         TBCCTL2 = OUTMOD_4;      // PWM toggle/reset
         TBCCR2  = 3;           // ccr2 Pwm cycle
         P2DIR |= 0x02;         // p2.1 output mode
         P2SEL |= 0x02;         // p2.1 option select
         P2DIR |= 0x08;         // P2.3 output mode
         P2SEL |= 0x08;         // P2.3 option select
         TBCTL |= MC0;          // ���õ���ģʽ
      }else if (mode==0x06)
      {                         //��ת/��λģʽ��CCR1��75����CCR2��25��

         TBCCR0  = 11;           // PWM ����
         TBCCTL1 = OUTMOD_6;      // PWM toggle/reset
         TBCCR1  = 9;           // ccr1 Pwm cycle
         TBCCTL2 = OUTMOD_6;      // PWM toggle/reset
         TBCCR2  = 3;           // ccr2 Pwm cycle
         P2DIR |= 0x02;         // p2.1 output mode
         P2SEL |= 0x02;         // p2.1 option select
         P2DIR |= 0x08;         // P2.3 output mode
         P2SEL |= 0x08;         // P2.3 option select
        TBCTL |= MC0;           // ���õ���ģʽ
      }else if (mode==0x07)
      {                         // ��λ/��λģʽ

         TBCCR0  = 11;           // P1.2--> CCR1 - 75% PWM
                                // P2.0--> CCR2 - 25% PWM
                                // PWM ����
         TBCCTL1 = OUTMOD_7;      // ccrl reset/set
         TBCCR1  = 9;           // ccr1 Pwm cycle
         TBCCTL2 = OUTMOD_7;      // ccr1 reset/set
         TBCCR2  = 3;           // ccr2 Pwm cycle
         P2DIR |= 0x02;         // p2.1 output mode
         P2SEL |= 0x02;         // p2.1 option select
         P2DIR |= 0x08;         // P2.3 output mode
         P2SEL |= 0x08;         // P2.3 option select
         TBCTL |= MC0;          // ���õ���ģʽ
      }
}
/******  ��Timer B�Ĳ�ͬ����ģʽ�����PWM����  *****/
void main()
{
     unsigned int pwm_Delay;
     char tmpv,tmp[5] = {2,3,4,6,7};

     WDTCTL = WDTHOLD + WDTPW;  //�رտ��Ź�
     FLL_CTL0 |= XCAP14PF;
     TBCTL = TBSSEL0 + TBCLR;  //ACLK,���TAR
     tmpv=0;
     while(1)
     {
        set_TB(tmp[tmpv]);      //ѡ�� PWM ģʽ
        tmpv = (tmpv + 1) % 5;  //�ı�ģʽ
        for(pwm_Delay=0;pwm_Delay<0xffff;pwm_Delay++);//delay
     };
}
