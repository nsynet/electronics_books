//
//    4 �� ʱ�ӳ���
//    ��ߵ�һ�� �������� ��һ����
//    ��ߵڶ��� ����ʱ�� ��һ����
//    �ұߵ�һ�� ����������
//    �ұߵڶ��� �������������
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


