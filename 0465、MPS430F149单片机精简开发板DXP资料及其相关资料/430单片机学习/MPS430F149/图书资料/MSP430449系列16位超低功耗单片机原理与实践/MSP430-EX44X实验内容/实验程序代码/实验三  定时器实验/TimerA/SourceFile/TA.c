/****************************************************************************
*  文件名称：
*          TB.c
*  文件说明：
*          使用TB输出PWM波形，可通过set_TB设定不同的模式
*****************************************************************************/
#include  "msp430x44x.h"
/******************************************************************************
* 设置TimerB输出PWM的工作模式
********************************************************************************/
void set_TB(int mode)
{
     if (mode==2)
     {                          // 翻转/复位模式，CCR1＝25％，CCR2＝75％
         TBCCR0  = 11;           // PWM 周期
         TBCCTL1 = OUTMOD_2;      // PWM toggle/reset
         TBCCR1  = 9;           // ccr1 Pwm cycle
         TBCCTL2 = OUTMOD_2;      // PWM toggle/reset
         TBCCR2  = 3;           // ccr2 Pwm cycle
         P2DIR |= 0x02;         // p2.1 模式设置
         P2SEL |= 0x02;         // p2.1 option select
         P2DIR |= 0x08;         // P2.3 output mode
         P2SEL |= 0x08;         // P2.3 option select
         TBCTL |= MC0;          // 设置递增模式
      }else if (mode==0x03)
      {                         //置位/复位模式，CCR1＝25％，CCR2＝75％

         TBCCR0  = 11;           // PWM 周期
         TBCCTL1 = OUTMOD_3;      // PWM toggle/reset
         TBCCR1  = 9;           // ccr1 Pwm cycle
         TBCCTL2 = OUTMOD_3;      // PWM toggle/reset
         TBCCR2  = 3;           // ccr2 Pwm cycle
         P2DIR |= 0x02;         // p2.1 output mode
         P2SEL |= 0x02;         // p2.1 option select
         P2DIR |= 0x08;         // P2.3 output mode
         P2SEL |= 0x08;         // P2.3 option select
         TBCTL |= MC0;          // 设置递增模式
      }else if (mode==0x04)
      {                         // 翻转模式，CCR1＝50％，CCR2＝50％
         TBCCR0  = 11;           // PWM 周期
         TBCCTL1 = OUTMOD_4;      // PWM toggle/reset
         TBCCR1  = 9;           // ccr1 Pwm cycle
         TBCCTL2 = OUTMOD_4;      // PWM toggle/reset
         TBCCR2  = 3;           // ccr2 Pwm cycle
         P2DIR |= 0x02;         // p2.1 output mode
         P2SEL |= 0x02;         // p2.1 option select
         P2DIR |= 0x08;         // P2.3 output mode
         P2SEL |= 0x08;         // P2.3 option select
         TBCTL |= MC0;          // 设置递增模式
      }else if (mode==0x06)
      {                         //翻转/置位模式，CCR1＝75％，CCR2＝25％

         TBCCR0  = 11;           // PWM 周期
         TBCCTL1 = OUTMOD_6;      // PWM toggle/reset
         TBCCR1  = 9;           // ccr1 Pwm cycle
         TBCCTL2 = OUTMOD_6;      // PWM toggle/reset
         TBCCR2  = 3;           // ccr2 Pwm cycle
         P2DIR |= 0x02;         // p2.1 output mode
         P2SEL |= 0x02;         // p2.1 option select
         P2DIR |= 0x08;         // P2.3 output mode
         P2SEL |= 0x08;         // P2.3 option select
        TBCTL |= MC0;           // 设置递增模式
      }else if (mode==0x07)
      {                         // 复位/置位模式

         TBCCR0  = 11;           // P1.2--> CCR1 - 75% PWM
                                // P2.0--> CCR2 - 25% PWM
                                // PWM 周期
         TBCCTL1 = OUTMOD_7;      // ccrl reset/set
         TBCCR1  = 9;           // ccr1 Pwm cycle
         TBCCTL2 = OUTMOD_7;      // ccr1 reset/set
         TBCCR2  = 3;           // ccr2 Pwm cycle
         P2DIR |= 0x02;         // p2.1 output mode
         P2SEL |= 0x02;         // p2.1 option select
         P2DIR |= 0x08;         // P2.3 output mode
         P2SEL |= 0x08;         // P2.3 option select
         TBCTL |= MC0;          // 设置递增模式
      }
}
/******  在Timer B的不同工作模式下输出PWM波形  *****/
void main()
{
     unsigned int pwm_Delay;
     char tmpv,tmp[5] = {2,3,4,6,7};

     WDTCTL = WDTHOLD + WDTPW;  //关闭看门狗
     FLL_CTL0 |= XCAP14PF;
     TBCTL = TBSSEL0 + TBCLR;  //ACLK,清除TAR
     tmpv=0;
     while(1)
     {
        set_TB(tmp[tmpv]);      //选择 PWM 模式
        tmpv = (tmpv + 1) % 5;  //改变模式
        for(pwm_Delay=0;pwm_Delay<0xffff;pwm_Delay++);//delay
     };
}
