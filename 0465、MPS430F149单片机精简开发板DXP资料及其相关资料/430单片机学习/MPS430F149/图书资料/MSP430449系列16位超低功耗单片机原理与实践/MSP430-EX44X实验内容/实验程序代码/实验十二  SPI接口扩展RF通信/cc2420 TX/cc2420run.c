#include "port_config_CC2420.h"
#include "cc2420init.h"
#include "cc2420const.h"
#include <msp430x44x.h>
char txlen;
char *txbuf;

void HPLCC2420_writeTXFIFO(char length, char *data) {
    char i = 0;
	
        txlen = length;
        txbuf = data;
   
      PHY_Selected();
      
      isTxIntrPending();
      SPI_Rx(); 
      SPI_Tx(CC2420_TXFIFO);
      while(!(isTxIntrPending())) ;
      SPI_Tx(length);//发送长度
      while(!(isTxIntrPending())) ;
      for (i =1; i < txlen; i++) {
        SPI_Tx(txbuf[i]);
        while(!(isTxIntrPending())) ;
      }
      while(!(isTxEmpty())) ;
      PHY_Deselected();
}
void sendAMessage(char length,char*tBuf)
{
  char spiStatusByte;
  unsigned char v;
  
  HPLCC2420_writeTXFIFO(length,tBuf);

  
  if(READ_PIN_CCA)//1表示可以发送了，0表示忙
          {
              PHY_Selected();
              HPLCC2420_cmd(CC2420_STXON);
      
              
              do {
                        SPI_Tx(CC2420_SNOP);
                        v = SPI_Rx();
               } while (!(v & 0x08 ));//等待是否有发送
               
              do {
                        SPI_Tx(CC2420_SNOP);
                        v = SPI_Rx();
                        if(v&0x20)
                        HPLCC2420_cmd(CC2420_SFLUSHTX);
               } while ((v & 0x08 ));    //等待发完  
              PHY_Deselected(); 
            }
}
