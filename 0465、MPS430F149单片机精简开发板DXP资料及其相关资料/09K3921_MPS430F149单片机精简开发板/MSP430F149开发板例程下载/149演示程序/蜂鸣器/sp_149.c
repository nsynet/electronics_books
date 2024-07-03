//

//
//
#include <msp430x41x.h>
# define  uint unsigned int
# define  uchar unsigned char

    unsigned int tmp;
    unsigned int ff=10;


void delay(int x)   // 5*x+12  nop
      {             //128- 23    256-49
      while(x--);   
      }             //192- 36    280- 54   448- 87
      
/////////////////////////////////////
//    枪声为点射  带尾巴
/////////////////////////////////////
void gun(void)
{
      for(ff=40;ff<200;ff++)
        {
        P6OUT ^= BIT4;              // 对输出置反
        for(tmp=0;tmp<ff;tmp++);    // 延时
        }
}
/////////////////////////////////////
//    拖尾声音严重
/////////////////////////////////////
void s1(void)
{
      for(ff=30;ff<500;ff++)
        {
        P6OUT ^= BIT4;              // 对输出置反
        for(tmp=0;tmp<ff;tmp++);    // 延时
        }
}


/////////////////////////////////////
//    声音清脆
/////////////////////////////////////
void s2(void)
{
      for(ff=30;ff<80;ff++)
        {
        P6OUT ^= BIT4;              // 对输出置反
        for(tmp=0;tmp<ff;tmp++);    // 延时
        }
}


void main(void)
{ 
  WDTCTL = WDTPW + WDTHOLD;             // Stop WDT

  BTCTL = BTFRFQ1+BT_ADLY_250;  ;           // ACLK/(256*16)
  IE2 |= BTIE;                              // Enable BT interrupt
  P6DIR = 0XFF ;
  
  for(;;)                              
  {
      gun();
      gun();
      gun();
      gun();
      s2();
      s2();
      s2();
      s2();
      s2();
      s2();
      s2();
   // _BIS_SR(LPM3_bits);                    // CPU off
    _NOP();                             // Required only for C-spy
  }
}


