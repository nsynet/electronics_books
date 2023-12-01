#ifndef _PORT_CONFIG_CC2420
#define _PORT_CONFIG_CC2420

#define USE_CC2420
#ifdef USE_CC2420

  

    #define PHY_FIFO        BIT7  //P1IN
    #define PHY_SFD         BIT2  //P2IN
    #define PHY_FIFOP       BIT1  //P2IN
    #define PHY_CSn         BIT2  //P6OUT
    #define PHY_VREG_EN     BIT1  //P6OUT
    #define PHY_RESETn      BIT0  //P6OUT
    #define PHY_CCA         BIT0  //P2IN
    

    #define SET_PHY_RESETn(a)     {                       \
                                if(!a) P6OUT &= ~PHY_RESETn;    \
                                else P6OUT |= PHY_RESETn ;    \
                              }                             
    #define DIROUT_PHY_RESETn    P6DIR|=PHY_RESETn
    
    #define SET_PHY_VREG_EN(a)      {if(a) P6OUT|=PHY_VREG_EN;\
                                else  P6OUT&=(~PHY_VREG_EN);}
    #define DIROUT_PHY_VREG_EN   P6DIR|=PHY_VREG_EN
    
    #define SET_PHY_CSn(a)          {if(a)  P6OUT|=PHY_CSn;\
                                else P6OUT&=(~PHY_CSn);}
    #define DIROUT_PHY_CSn       P6DIR|=PHY_CSn
    
    #define DIRIN_PHY_FIFOP      P2DIR&=(~PHY_FIFOP)
    #define DIRIN_PHY_GIO0       P1DIR&=(~PHY_FIFO)
    #define DIRIN_PHY_SFD        P2DIR&=(~PHY_SFD)
    #define DIRIN_PHY_GIO1       P2DIR&=(~PHY_CCA)
    #define READ_PIN_CCA      (P2IN&PHY_CCA)//TRUE表示1，FALSE表示0
    #define READ_PIN_FIFO         (P1IN&PHY_FIFO)
    #define READ_PIN_FIFOP        (P2IN&PHY_FIFOP)

    #define PHY_Selected() SET_PHY_CSn(0);
    #define PHY_Deselected() SET_PHY_CSn(1);
    void CC2420_Set_PIN_DIR(void);
    
#endif
#endif
