//****************************************************************
// Function: ISR Service routine Area V1.0                    
// By Arthur: Shieh
//
// Plateform: SPCE061A, unSP IDE 1.642, Windows 2000
// Date 12/04/2002
//
// 	Hook user's interrupt here                            
// 	_FIQ:	TMA,TMB,PWM 					// Fast interrupt entry
//  _IRQ0:	PWM								// interrupt entry
//  _IRQ1:	TMA								// interrupt entry
//  _IRQ2:	TMB								// interrupt entry
//  _IRQ3:	EXT1,EXT2,Key			    	// interrupt entry
//  _IRQ4:	1KHz,2KHz 4KHz					// interrupt entry
//  _IRQ5:	2Hz, 4Hz        				// interrupt entry
//  _IRQ6:	TMB1,TMB2						// interrupt entry     
//  _IRQ7:	UART							// interrupt entry
//  _Break: Software interrupt              // interrupt entry
//
// Note:
// 1. Interrupts must be declared in TEXT area.
// 2. INT Priority, FIQ > IRQ > Break; 
//    For IRQs, IRQ1>IRQ2>..>IRQ7, in case that all IRQ take place 
//    at the same time
// 3. For FIQ,IRQ1~IRQ7, user needs to clear P_INT_Clear before 
//    exiting interrupt routine
// 4. For SPCE 500A, R_InterruprStatus is used to 
//    keep track of Interrupt setting status. User needs to update 
//    the setting to the variable by every time when setting a new 
//    INT sorces. Please check out SPCE.asm for R_InterruprStatus 
//    declaration.
//****************************************************************
.TEXT
.include spce.inc				// include io config. information
.include ms01.inc					// include ms01 information

.public _BREAK
.public _FIQ
.public	_IRQ0
.public _IRQ1
.public _IRQ2
.public _IRQ3
.public _IRQ4
.public _IRQ5
.public _IRQ6
.public _IRQ7

 
_FIQ:
       PUSH R1,R5 TO [SP];
       //------------------------------------------------------------------
       // hook Timer A FIQ subroutine here and define it to be external
       CALL    F_ISR_Service_SACM_MS01
       //------------------------------------------------------------------
       R1 = C_FIQ_TMA
       [P_INT_Clear] = R1
       POP R1,R5 FROM [SP]
       RETI

/////////////////////////////////////////////////////////////////////////////////////////
// Function: Interrupt Service routine Area
//      Service for     IRQ1 - IRQ7
//      User's IRQ must hook on here
/////////////////////////////////////////////////////////////////////////////////////////        
_BREAK:        
_IRQ0:        
_IRQ1:        
		PUSH R1,R5 to [sp]
		//R1 = C_x
        //[P_INT_Clear] = R1
		POP R1,R5 from [sp] 
		RETI

_IRQ2:        
        PUSH R1,R5 TO [SP]
        CALL F_IRQ2_Service_SACM_MS01			 //2ch drum sound
        R1 = C_IRQ2_TMB  				
 		[P_INT_Clear] = R1
   		POP R1,R5 FROM [SP]
        RETI
_IRQ3:
		PUSH R1,R5 to [sp]
		//R1 = C_x
        //[P_INT_Clear] = R1
		POP R1,R5 from [sp] 
		RETI
_IRQ4:        
        PUSH R1,R5 TO [SP]
        CALL F_IRQ4_Service_SACM_MS01;  // SONG Tempo control
        R1 = C_IRQ4_1KHz;  
        [P_INT_Clear] = R1
        POP R1,R5 FROM [SP]
        RETI
_IRQ5:
_IRQ6:        
_IRQ7:        
		PUSH R1,R5 to [sp]
		//R1 = C_x
        //[P_INT_Clear] = R1
		POP R1,R5 from [sp] 
		RETI

//========================================================================================        
// End of isr.asm
//========================================================================================
        
