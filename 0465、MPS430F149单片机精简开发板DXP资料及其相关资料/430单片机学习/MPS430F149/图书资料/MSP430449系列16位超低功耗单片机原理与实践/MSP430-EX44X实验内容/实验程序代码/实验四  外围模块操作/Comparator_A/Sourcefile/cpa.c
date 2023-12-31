/********************************************
*  文件名称：
*         cpa.c
* 文件说明；
*       程序使用比较器的CA0端接内部电源Vcc/4, 根据P1.6口线接收的欠压
*   的电路的电压控制LED3。程序运行时调节PR2，观察LED3
********************************************/
#include <msp430x44x.h>

/************************************************
*  light led3
*************************************************/
void light_LED3(void)
{

  P5DIR |= 0x02;                //P5.1 输出模式
  P5OUT |= 0x02;                //P5.1=1
}
/************************************************
*   熄灭LED3
*************************************************/
void quench_LED3(void)
{
  P5DIR |= 0x02;                //P5.1 输出模式
  P5OUT &= 0xfd;                //P5.1 =0
}
/*******************************************
*  main() 函数
********************************************/
void main(void)
{
    WDTCTL = WDTHOLD + WDTPW;         // 关看门狗
    CACTL1 = CARSEL + CAREF0 + CAON ; //  Vcc/4 = - cmp
    CACTL2 = P2CA0;                   // 使用 CA0
    quench_LED3();                    // 熄灭LED
    while(1){

        if((CACTL2 | 0xfe) ==0xff)
        {                             // 比较电压是否超过0.25Vcc
          light_LED3();               // 点亮LED3
          CACTL1 &= 0xfe;             // CAIFG = 0
        }else
        {
          quench_LED3();              // 熄灭LED3
        }
    }

}


