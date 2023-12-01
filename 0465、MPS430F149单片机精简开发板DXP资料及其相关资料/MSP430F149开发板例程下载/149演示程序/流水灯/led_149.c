//
//    4 键 时钟程序
//    左边第一键 调整分钟 加一调整
//    左边第二键 调整时钟 加一调整
//    右边第一键 开启蜂鸣器
//    右边第二键 点亮发光二极管
//
//
#include <msp430x14x.h>
# define  uint unsigned int
# define  uchar unsigned char

uchar time = 1 ;

void delay(int x)   // 5*x+12  nop
      {             //128- 23    256-49
      while(x--);   
      }             //192- 36    280- 54   448- 87

void main(void)
{ 
  WDTCTL = WDTPW + WDTHOLD;             // Stop WDT
  P3DIR = 0xff ;
    _EINT();
  for(;;)                              
  {
      delay(30000);
        time = time << 1 ;
        if(time == 0x80 )
            time = 1 ;
        P3OUT = time+0X80 ;
    _NOP();                             // Required only for C-spy
  }
}


