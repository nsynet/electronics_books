/******************************************
*   文件名：
*       LED3.c
*   功能：
*     主程序
*     运行后可以看到LED3每过大约1秒闪一次
******************************************/
#include <msp430x14x.h>

/******************************************/
void main(void)
{
    unsigned long tmp;

     WDTCTL = WDTHOLD + WDTPW;     //关闭看门狗
     P5OUT = 0x02;                 //设置P5.1输出为1
       P5DIR = 0x02;              // 使能P5.1为输出
     while(1)
     {                             //循环
      
        P5OUT ^= 0x02;             // 对输出置反
        for(tmp=0;tmp<67500;tmp++);// 延时
     }

}
