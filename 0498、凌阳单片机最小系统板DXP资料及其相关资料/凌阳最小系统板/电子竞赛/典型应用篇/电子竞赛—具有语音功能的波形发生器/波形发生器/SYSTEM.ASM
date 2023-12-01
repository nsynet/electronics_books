.include hardware.inc
.external _sum
.define P_INT_Ctrl_NEW 0x702d
.code
.public _SP_INT_64Hz
.public F_SP_INT_64Hz;
 _SP_INT_64Hz:
 F_SP_INT_64Hz:
     irq off
     R1 = 0x0003;
     [P_TimeBase_Setup]=r1
     r1 = [P_INT_Ctrl_NEW]
     r1 |= 0x0002 						//¿ªÖÐ¶ÏIRQ6_TMB1ºÍIRQ6_TMB2
	 [P_INT_Ctrl_NEW]= r1 
	 int IRQ
     irq on
     retf;
     
 .public _Turnoff_INT_64Hz;
 _Turnoff_INT_64Hz: 
    irq off
    r1 = [P_INT_Ctrl_NEW]
	r1 &= 0xfffd;
	[P_INT_Ctrl_NEW] = r1;
    irq on
     retf