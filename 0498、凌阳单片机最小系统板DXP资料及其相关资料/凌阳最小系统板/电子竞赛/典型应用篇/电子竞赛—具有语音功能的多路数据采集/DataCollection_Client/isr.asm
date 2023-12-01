//****************************************************************
// Function: Fast Interrupt Service routine Area                     
//      Service for     (1)PWM FIQ
//                      (2)Timer A FIQ
//                      (3)Timer B FIQ
//      User's FIQ must hook on here                            
//  _FIQ:                            // Fast interrupt entrence
//  _IRQ1:                           // interrupt entrence
//  _IRQ2:                           // interrupt entrence
//  _IRQ3:                           // interrupt entrence
//  _IRQ4:                           // interrupt entrence
//  _IRQ5:                           // interrupt entrence
//  _IRQ6:                           // interrupt entrence     
//  _IRQ7:                           // interrupt entrence
//****************************************************************

.include hardware.inc;              // include hardware information
.EXTERNAL _g_uiUARTCommand;

.TEXT
.public _BREAK;
.public _FIQ;
.public _IRQ0;
.public _IRQ1;
.public _IRQ2;
.public _IRQ3;
.public _IRQ4;
.public _IRQ5;
.public _IRQ6;
.public _IRQ7;
              
_FIQ:
		push r1,r5 to [sp];
		r1 = C_FIQ_PWM;
        test r1,[P_INT_Ctrl];
        jne     L_FIQ_PWM;
        r1 = C_FIQ_TMA;
        test r1,[P_INT_Ctrl];
        jne L_FIQ_TimerA;
L_FIQ_TimerB:
		r1 = C_FIQ_TMB;
        [P_INT_Clear] = r1;
        pop r1,r5 from [sp];
        reti;                
L_FIQ_PWM:      		                                  // PWM FIQ entrence
        [P_INT_Clear] = r1;
        pop r1,r5 from [sp];
        reti;
L_FIQ_TimerA:
        [P_INT_Clear] = r1;
        pop r1,r5 from [sp];
        reti;

/////////////////////////////////////////////////////////////////////////////////////////
// Function: Interrupt Service routine Area
//      Service for     IRQ1 - IRQ7
//      User's IRQ must hook on here
/////////////////////////////////////////////////////////////////////////////////////////        
_BREAK:        
        push r1,r1 to [sp];
		[P_INT_Clear] = r1;                
        pop r1,r1 from [sp];
        reti;

_IRQ0:        
        push r1,r1 to [sp];
     	[P_INT_Clear] = r1;
        pop r1,r1 from [sp];
        reti;

_IRQ1:        
        push r1,r1 to [sp];
        [P_INT_Clear] = r1;
        pop r1,r1 from [sp];
        reti;
_IRQ2:        
        push r1,r1 to [sp];
        [P_INT_Clear] = r1;
        pop r1,r1 from [sp];
        reti;
_IRQ3:
        push r1,r1 to [sp];
        [P_INT_Clear] = r1;
        pop r1,r1 from [sp];
        reti;
_IRQ4:        
        push r1,r1 to [sp];
        [P_INT_Clear] = r1;
        pop r1,r1 from [sp];
        reti;
_IRQ5:        
        push r1,r1 to [sp];
                
        pop r1,r1 from [sp];
        reti;
_IRQ6:        
        push r1,r1 to [sp];
        pop r1,r1 from [sp];
        reti;
_IRQ7:        

        push r1,r5 to [sp];
                
		r1 = [P_UART_Data];		//接收数据
		[_g_uiUARTCommand]=r1;
				
        pop r1,r5 from [sp];

        reti;
//========================================================================================        
// End of isr.asm
//========================================================================================
        