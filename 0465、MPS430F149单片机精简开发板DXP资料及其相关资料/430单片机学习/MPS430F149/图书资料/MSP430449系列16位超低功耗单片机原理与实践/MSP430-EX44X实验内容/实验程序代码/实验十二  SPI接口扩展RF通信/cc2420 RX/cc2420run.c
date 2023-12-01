#include <msp430x44x.h>
#include "cc2420init.h"
#include "cc2420const.h"
#include "port_config_CC2420.h"
#define ok 1;
int HPLCC2420_readRXFIFO() 
{
int RevLen,i=0;
int data[20];

        PHY_Selected();

         isTxIntrPending();
         SPI_Rx(); 
         SPI_Tx(CC2420_RXFIFO |CMD_READ);
         while(!(isRxIntrPending())) ;
         SPI_Rx();
         SPI_Tx(0);
         while(!(isRxIntrPending())) ;
        // get the length of the buffer
         RevLen = SPI_Rx();
         while(!(RevLen==0))
         {
            SPI_Tx(0);
	    while(!(isRxIntrPending())) ;
            data[i++]=SPI_Rx();
            RevLen--;
            
         }
          
     flushRxfifo();
     return ok;
     }
