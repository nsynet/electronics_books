/*******************************************************************
CC2420 RF transmit
*******************************************************************/
#include <msp430x44x.h>
#include "cc2420init.h"
#include "cc2420run.h"
#include "cc2420const.h"
#define TOSH_DATA_LENGTH 100



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
WDTCTL = WDTHOLD + WDTPW;     //Í£Ö¹¿´ÃÅ¹·
  init_SPI();
  cc2420init();
}

void main()
{

tTxPacket *message;
 TOS_Msg *data;
 hardwareinit();
 message = (tTxPacket *)data->Txdata;
 message->val=1;
 message->Data=0x55;
 data->fcflo = CC2420_DEF_FCF_LO;
 data->fcfhi = CC2420_DEF_FCF_HI_ACK;
// destination PAN is broadcast
 data->destpan = TOS_BCAST_ADDR;
 // adjust the destination address to be in the right byte order
 data->addr = 0xffff;
 // adjust the data length to now include the full packet length
 data->length = 19;
 // keep the DSN increasing for ACK recognition
 data->dsn = 1;
 // reset the time field
 data->time = 0;
 sendAMessage(sizeof(message)+18,(char*)data);
    
}
