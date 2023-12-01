#ifndef _PORT_CONFIG_CC2420
#define _PORT_CONFIG_CC2420

#define USE_CC2420
#ifdef USE_CC2420
// Following macros are specific to CC2420 and are used by MAC
// private functions only.

    // CC2420 I/O assignments with respect to MSP430
    
    // Changed to the Following
    // P1.7 <- FIFO     (Input)
    // P2.0 <- CCA      (not used here,Input - Not used in this version of stack)
    // P2.2 <- SFD      (Input - Generates interrupt on falling edge)
    // P2.1 <- FIFOP    (Input - Used to detect overflow)
    // P6.2 -> CSn      (Output - to select CC2420 SPI slave)
    // P6.1 -> VREG_EN   (Output - to enable CC2420 voltage regulator)
    // P6.0 -> RESETn    (Output - to reset CC2420)
    // P4.5 - > SCK      (Output - SPI Clock to CC2420)
    // P4.4 <- SO        (Input - SPI data from CC2420)
    // P4.3 -> SI        (Output - SPI data to CC2420)
  

    #define PHY_FIFO        BIT3  //P1IN
    #define PHY_SFD         BIT1  //P4IN
    #define PHY_FIFOP       BIT0  //P1IN
    #define PHY_CSn         BIT2  //P4OUT
    #define PHY_VREG_EN     BIT5  //P4OUT
    #define PHY_RESETn      BIT6  //P4OUT
    #define PHY_CCA         BIT4  //P1IN
    

    #define SET_PHY_RESETn(a)     {                       \
                                if(!a) P4OUT &= ~PHY_RESETn;    \
                                else P4OUT |= PHY_RESETn ;    \
                              }                             
    #define DIROUT_PHY_RESETn    P4DIR|=PHY_RESETn
    
    #define SET_PHY_VREG_EN(a)      {if(a) P4OUT|=PHY_VREG_EN;\
                                else  P4OUT&=(~PHY_VREG_EN);}
    #define DIROUT_PHY_VREG_EN   P4DIR|=PHY_VREG_EN
    
    #define SET_PHY_CSn(a)          {if(a)  P4OUT|=PHY_CSn;\
                                else P4OUT&=(~PHY_CSn);}
    #define DIROUT_PHY_CSn       P4DIR|=PHY_CSn
    
    #define DIRIN_PHY_FIFOP      P1DIR&=(~PHY_FIFOP)
    #define DIRIN_PHY_GIO0       P1DIR&=(~PHY_FIFO)
    #define DIRIN_PHY_SFD        P4DIR&=(~PHY_SFD)
    #define DIRIN_PHY_GIO1       P1DIR&=(~PHY_CCA)
    #define READ_PIN_CCA      (P1IN&PHY_CCA)//TRUE表示1，FALSE表示0
    #define READ_PIN_FIFO         (P1IN&PHY_FIFO)
    #define READ_PIN_FIFOP        (P1IN&PHY_FIFOP)

    #define PHY_Selected() SET_PHY_CSn(0);
    #define PHY_Deselected() SET_PHY_CSn(1);
    void CC2420_Set_PIN_DIR(void);
    
#endif
#endif
