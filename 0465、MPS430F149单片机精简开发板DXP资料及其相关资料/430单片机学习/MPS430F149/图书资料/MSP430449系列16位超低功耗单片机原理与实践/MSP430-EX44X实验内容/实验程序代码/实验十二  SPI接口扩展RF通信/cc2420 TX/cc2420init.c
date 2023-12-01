#include "port_config_CC2420.h"
#include "cc2420const.h"
#include <msp430x44x.h>
volatile int gCurrentParameters[14];
void CC2420_Set_PIN_DIR(void){

 DIROUT_PHY_RESETn;
 DIROUT_PHY_VREG_EN;
 DIROUT_PHY_CSn;
 
 SET_PHY_RESETn(1);
 SET_PHY_VREG_EN(0);
 SET_PHY_CSn(1);
 
 DIRIN_PHY_FIFOP;   
 DIRIN_PHY_GIO0;      
 DIRIN_PHY_SFD;        
 DIRIN_PHY_GIO1;       
}
void delay(void)
{
  int i;
  for(i=0;i<1000;i++);
}
int isTxIntrPending()	//TXFIFO EMPTY 返回true
{
  if (IFG2 & UTXIFG1){
    IFG2 &= ~UTXIFG1;
    return 1;
  }
  return 0;
}
int isRxIntrPending()//RXFIFO FULL 返回true
{
  if (IFG2 & URXIFG1){
    IFG2 &= ~URXIFG1;
    return 1;
  }
  return 0;
}
void SPI_Tx(unsigned char data) //SPI tx
{   
  while((UTCTL1 & 0x01 )!=0x01);        //等待直到没有数据发送
  TXBUF1 = data;
 
}
unsigned char SPI_Rx() //SPI rx
{ 
  unsigned char data;
  data = RXBUF1;
  return data;
}
void HPLCC2420_cmd(char addr) {
  
   
   P6OUT &= ~0x04;

      isTxIntrPending();
      SPI_Rx(); //isRxIntrPending();
      SPI_Tx(addr);
      while(!(isRxIntrPending())) ;
      P6OUT |= 0x04;

    

}
void halRfWaitForCrystalOscillator(){
	char spiStatusByte;
       PHY_Selected();//CS=0  
    // Poll the SPI status byte until the crystal oscillator is stable
    do {
	    SPI_Tx(CC2420_SNOP);
            spiStatusByte = SPI_Rx();
   } while (!(spiStatusByte & 0x40));
     PHY_Deselected();//CS=1
}
 /**
   * Read 16-bit data
   *
   * @return 16-bit register value
   */
int HPLCC2420_read(char addr) {
    int data = 0;
    PHY_Selected();
      isTxIntrPending();
      SPI_Rx(); //isRxIntrPending();
      SPI_Tx(addr | 0x40);
      while(!isRxIntrPending()) ;
      SPI_Rx();
      SPI_Tx(0);
      while(!(isRxIntrPending())) ;
      data = SPI_Rx();
      SPI_Tx(0);
      while( !(isRxIntrPending())) ;
      data = ((data << 8) & 0x0FF00 )| (SPI_Rx() & 0x0FF);
    PHY_Deselected();
   return data;      
}
void flushRxfifo(void)
{
     HPLCC2420_read(CC2420_RXFIFO);          //flush Rx fifo
     HPLCC2420_cmd(0x08);//FASTSPI_STROBE(CC2420_SFLUSHRX);
     HPLCC2420_cmd(0x08);//FASTSPI_STROBE(CC2420_SFLUSHRX);
}
void RfRegInit(void){
       // Set default parameters
    gCurrentParameters[CP_MAIN] = 0xf801;
 #ifdef I_AM_COORDINATOR
      gCurrentParameters[CP_MDMCTRL0]=0x1AF2;
      //0b 0001 1010 1111 0010
 #else
     gCurrentParameters[CP_MDMCTRL0]=0x0AF2;
     //0b 0000 1010 1111 0010
#endif
    gCurrentParameters[CP_MDMCTRL0] &= ~(1 << CC2420_MDMCTRL0_AUTOACK);
 
    gCurrentParameters[CP_RSSI] =     0xE080;
    gCurrentParameters[CP_SYNCWORD] = 0xA70F;
 
    gCurrentParameters[CP_TXCTRL] = ((1 << CC2420_TXCTRL_BUFCUR) | 
       (1 << CC2420_TXCTRL_TURNARND) | (3 << CC2420_TXCTRL_PACUR) | 
       (1 << CC2420_TXCTRL_PADIFF) | (CC2420_DEF_RFPOWER << CC2420_TXCTRL_PAPWR));

    gCurrentParameters[CP_RXCTRL0] = ((1 << CC2420_RXCTRL0_BUFCUR) | 
       (2 << CC2420_RXCTRL0_MLNAG) | (3 << CC2420_RXCTRL0_LOLNAG) | 
       (2 << CC2420_RXCTRL0_HICUR) | (1 << CC2420_RXCTRL0_MCUR) | 
       (1 << CC2420_RXCTRL0_LOCUR));

    gCurrentParameters[CP_RXCTRL1]  = ((1 << CC2420_RXCTRL1_LOLOGAIN) | 
       (1 << CC2420_RXCTRL1_HIHGM) |  (1 << CC2420_RXCTRL1_LNACAP) | 
       (1 << CC2420_RXCTRL1_RMIXT) |  (1 << CC2420_RXCTRL1_RMIXV)  | 
       (2 << CC2420_RXCTRL1_RMIXCUR));

    gCurrentParameters[CP_FSCTRL]   = ((1 << CC2420_FSCTRL_LOCK) | 
       ((357+5*(CC2420_DEF_CHANNEL-11)) << CC2420_FSCTRL_FREQ));

    gCurrentParameters[CP_SECCTRL0] = ((1 << CC2420_SECCTRL0_CBCHEAD) |
       (1 << CC2420_SECCTRL0_SAKEYSEL)  | (1 << CC2420_SECCTRL0_TXKEYSEL) | 
       (1 << CC2420_SECCTRL0_SECM));

    gCurrentParameters[CP_SECCTRL1] = 0;
    gCurrentParameters[CP_BATTMON]  = 0;

    // set fifop threshold to greater than size of tos msg, 
    // fifop goes active at end of msg
   /* gCurrentParameters[CP_IOCFG0]   = (((127) << CC2420_IOCFG0_FIFOTHR) | 
        (1 <<CC2420_IOCFG0_FIFOPPOL)) ;*/
    	gCurrentParameters[CP_IOCFG0]   = (((127) << CC2420_IOCFG0_FIFOTHR) | 
        (0 <<CC2420_IOCFG0_FIFOPPOL)) ;
         gCurrentParameters[CP_IOCFG0]|=1<<CC2420_IOCFG0_BCNACCEPT; //add 
    gCurrentParameters[CP_IOCFG1]   =  0;

}
int isTxEmpty(){
    if (U1TCTL & TXEPT) {
      return 1;
    }
    return 0;
}
char HPLCC2420_write(char addr, int data) {
    char status = 0;
    PHY_Selected();//P4OUT &= ~0x04;
      isTxIntrPending();
     SPI_Rx();
     SPI_Tx(addr);
   
      while(!(isRxIntrPending())) ;

     
      status = (SPI_Rx()&0x7E);  
      SPI_Tx((data >> 8) & 0x0FF);
      while( !(isTxIntrPending())) ;
      SPI_Tx(data & 0x0FF);
      while(!(isTxEmpty())) ;
      PHY_Deselected();
    return status;
}
int SetRegs(void){
    int data;

    HPLCC2420_write(CC2420_IOCFG0, gCurrentParameters[CP_IOCFG0]);     
    HPLCC2420_write(CC2420_FSCTRL, gCurrentParameters[CP_FSCTRL]);  
		    
     HPLCC2420_write(CC2420_MDMCTRL0, gCurrentParameters[CP_MDMCTRL0]);
    data =  HPLCC2420_read(CC2420_MDMCTRL0);
    if (data != gCurrentParameters[CP_MDMCTRL0]) return 0;
    return 1;


 
  
}
/*初始化CC2420，开启接收网络功能*/
void HPLCC2420_ini(){
	HPLCC2420_cmd(CC2420_SXOSCON);//HPLCC2420_cmd(0x01);    //
	 RfRegInit();  	
	if(!SetRegs())return;
	  halRfWaitForCrystalOscillator();
	flushRxfifo();//HPLCC2420_cmd(CC2420_SFLUSHRX);//HPLCC2420_cmd(0x08);//FASTSPI_STROBE(CC2420_SFLUSHRX);//0x08
	HPLCC2420_cmd(CC2420_SFLUSHTX);	 //flush tx
	HPLCC2420_cmd(CC2420_SRXON);//HPLCC2420_cmd(0x03);//FASTSPI_STROBE(CC2420_SRXON);//0x03

}
void cc2420init()
{
   CC2420_Set_PIN_DIR();//置引脚状态
    SET_PHY_VREG_EN(1);//Enable voltage regulator

    delay();              //wait 1ms
    //PHY_RESET
    SET_PHY_RESETn(0);
    delay();             //wait 1ms
    SET_PHY_RESETn(1);
    delay();             //wait 1ms 
    //power down status now
    HPLCC2420_ini();
    //enable I/O receive interrupt
    P2IE = 0x02;//BIT0; //PKT_INT  FIFOP 
    P2IFG = 0X00;
}
