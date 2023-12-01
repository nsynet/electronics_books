void cc2420init();
int isTxIntrPending();
int isRxIntrPending();
unsigned char SPI_Rx();
void SPI_Tx(unsigned char data);
void HPLCC2420_cmd(char addr);
void flushRxfifo(void);

