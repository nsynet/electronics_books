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



void delay(int x)   // 5*x+12  nop
      {             //128- 23    256-49
      while(x--);   
      }             //192- 36    280- 54   448- 87
      


void main(void)
{ 
  WDTCTL = WDTPW + WDTHOLD;             // Stop WDT

  P3DIR = 0XFF ;
  P3OUT = 0X99 ;

  _EINT();
  
  for(;;)                              
  {
      delay(10000);
    P3OUT ^= 0XFF ;
  }
}



