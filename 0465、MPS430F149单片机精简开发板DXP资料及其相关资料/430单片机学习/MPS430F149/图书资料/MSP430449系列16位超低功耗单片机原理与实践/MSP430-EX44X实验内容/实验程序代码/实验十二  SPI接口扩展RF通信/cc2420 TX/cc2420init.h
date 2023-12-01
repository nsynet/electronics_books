void cc2420init();
int isTxIntrPending();
unsigned char SPI_Rx();
void SPI_Tx(unsigned char data);
void HPLCC2420_cmd(char addr);
int isTxEmpty();

