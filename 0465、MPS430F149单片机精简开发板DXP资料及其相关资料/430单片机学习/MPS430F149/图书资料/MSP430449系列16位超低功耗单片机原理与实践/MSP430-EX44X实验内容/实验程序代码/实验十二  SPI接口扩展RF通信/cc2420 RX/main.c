/*******************************************************************
CC2420 RF receive
*******************************************************************/
#include <msp430x44x.h>

#include "cc2420init.h"
#include "cc2420run.h"
#include "cc2420const.h"
#include "port_config_CC2420.h"
#define TOSH_DATA_LENGTH 100
typedef struct {
    char val;
    char *Data;
} tTxPacket;
typedef struct 
{
  /* The following fields are transmitted/received on the radio. */
  char length;
  char fcfhi;
  char fcflo;
  char dsn;
  int destpan;
  int addr;
  char type;
  char group;
  char Txdata[TOSH_DATA_LENGTH];

  /* The following fields are not actually transmitted or received 
   * on the radio! They are used for internal accounting only.
   * The reason they are in this structure is that the AM interface
   * requires them to be part of the TOS_Msg that is passed to
   * send/receive operations.
   */
  char strength;
  char lqi;
  int crc;
  int ack;
  int time;
} TOS_Msg;


void init_SPI()
{ 
  P6DIR |= 0x04;    
    P4SEL |= 0x38;    
                      
      IE2 &= ~(UTXIE1 | URXIE1);  // interrupt disable    
		
      U1CTL = SWRST;
      U1CTL |= CHAR | SYNC | MM;  // 8-bit char, SPI-mode, USART as master
      U1CTL &= ~(0x20); 
		
      U1TCTL = STC ;     // 3-pin
      U1TCTL |= CKPH;    // half-cycle delayed UCLK
		
         U1TCTL &= ~(SSEL1 | SSEL0 );
      U1TCTL |= SSEL1; // use SMCLK, assuming 1MHz
     
	
      U1MCTL = 0;
		
      ME2&= ~(UTXE1 | URXE1); //USART UART module disable
      ME2 |= USPIE1;   // USART SPI module enable
      U1CTL &= ~SWRST;  
		
      IFG2 &= ~(UTXIFG1 | URXIFG1);
      IE2 &= ~(UTXIE1 | URXIE1);  // interrupt disabled  
}
void hardwareinit()
{
  init_SPI();
  cc2420init();
  
}

void main()
{
    WDTCTL = WDTPW + WDTHOLD;                 // Stop WDT
    hardwareinit();
    P2DIR&=~0XFD;
    P2SEL&=~0XFD;
    IE2 &=URXIE1;
    P2IES|=0X02;
    P2IE |= 0x02;
_EINT();
while(1);
}

#pragma vector = PORT2_VECTOR
__interrupt void Data_Rev()
{ 
  P2IE &= ~0x02; 
  HPLCC2420_readRXFIFO();
  P2IFG &= ~0x02;
  P2IE |= 0x02;
     
}
