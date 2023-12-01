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
//.include a2000.inc;
.include s480.inc;
//.external R_SpeechType;
.TEXT
//.public _BREAK;
.public _FIQ;
//.public _IRQ0;
//.public _IRQ1;
//.public _IRQ2;
//.public _IRQ3;
//.public _IRQ4;
//.public _IRQ5;
//.public _IRQ6;
//.public _IRQ7;
              
              
_FIQ:
	push R1,R5 to [SP]
	R1 = 0x0800
	R1&=[P_INT_Ctrl] 
	jnz FIQ_is_TimB
	R1 = 0x2000
	R1&=[P_INT_Ctrl] 
	jnz FIQ_is_TimA
	R1 = 0x8000
	R1&=[P_INT_Ctrl] 
	jnz FIQ_is_PWM

FIQ_is_PWM:
    [P_INT_Clear] = R1
	pop	R1,R5 from [SP];
	reti;

FIQ_is_TimA:
    call F_FIQ_Service_SACM_S480;
	R1 = 0x2000
	[P_INT_Clear] = R1
	pop	R1,R5 from [SP];
	reti;

FIQ_is_TimB:   
    r1=0x0800;  
    [P_INT_Clear] = r1;           
    pop r1,r5 from [sp];
    reti;   
    


//========================================================================================        
// End of isr.asm
//========================================================================================
        