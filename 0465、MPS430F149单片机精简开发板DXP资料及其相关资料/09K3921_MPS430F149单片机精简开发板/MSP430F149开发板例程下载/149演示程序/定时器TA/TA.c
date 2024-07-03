

#include  <msp430x41x.h>
#define uchar unsigned char
#define uint unsigned int
uchar key_buffer;
uchar key_long;
uchar digit[8] = {1,2,3,4,5,6,7,8};
uint con = 0 ;

unsigned char seg[]={
        0x3f,0x06,0x5b,0x4f,
	0x66,0x6d,0x7d,0x07,
	0x7f,0x6f,0x77,0x7c,
	0x39,0x5e,0x79,0x71,
	0xbf,0x86,0xdb,0xcf,
	0xe6,0xed,0xfd,0x87,
	0xff,0xef,0xf7,0xfc,
	0xb9,0xde,0xf9,0xf1,

	0x80,0x40,0x00,0x73,0xc0};

void delay(int v)
    {
        while(v!=0)v--;
    }


void main(void)
{
  WDTCTL = WDTPW + WDTHOLD;             // Stop watchdog timer
  P4DIR=0x1f;
  P1DIR=0x0f;
  P6DIR = 0XFF ;
  P3DIR = 0XFF ;
    P2DIR=0X0f;
    P2OUT=0X0f;
    P2IE=0Xf0;
    P2IES=0xf0;
    P2IFG=0;
  TACTL = TASSEL0 + TACLR;              // SMCLK, clear TAR
  CCTL0 = CCIE;                         // CCR0 interrupt enabled
  CCR0 = 8000;
  TACTL |= MC1;                         // Start Timer_A in continuous mode
  P4DIR = 0XFF;
  _EINT();                              // Enable interrupts

  for (;;)
  {
    _BIS_SR(CPUOFF);                    // CPU off
    _NOP();                             // Required only for C-spy
  }
}


#pragma vector=TIMERA0_VECTOR
__interrupt void Timer_A(void)
  {
  CCR0 += 8000; 
  P6OUT ^= 0XFF ;

  }


