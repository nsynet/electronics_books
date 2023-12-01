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
.include	hardware.inc
.include	S480.inc
.include	Resource.inc
.public	_FIQ;
.PUBLIC _BREAK;
.PUBLIC _IRQ0;
.PUBLIC _IRQ1;
.PUBLIC _IRQ2;
.PUBLIC _IRQ3;
.PUBLIC _IRQ4;
.PUBLIC _IRQ5; 
.PUBLIC _IRQ6; 
.PUBLIC _IRQ7; 

.external _uiTwoSecondTimeFlag;
.external _ui2HzIntCounter;
.text
_FIQ:
	PUSH	r1,r5 to [sp];
	r1=0x2000;
	test r1,[P_INT_Ctrl];
	jnz L_FIQ_TimerA;
	r1=0x0800;
	test r1,[P_INT_Ctrl];
	jnz L_FIQ_TimerB;
L_FIQ_PWM:
	r1=C_FIQ_PWM;
	[P_INT_Clear]=r1;
	POP R1,R5 from[sp];
	reti;
L_FIQ_TimerA:
	[P_INT_Clear]=r1;
	r1=0x0001;
	[P_Watchdog_Clear]=r1;
	call F_FIQ_Service_SACM_S480;
	pop r1,r5 from [sp];
	reti;
L_FIQ_TimerB:
	[P_INT_Clear]=r1;
	pop r1,r5 from [sp];
	reti;
	
/////////////////////////////////////////////////////////////////////////////////////////
// Function: Interrupt Service routine Area
//      Service for     IRQ1 - IRQ7
//      User's IRQ must hook on here
/////////////////////////////////////////////////////////////////////////////////////////        
_BREAK:        
                PUSH r1,r1 TO [sp];
				[P_INT_Clear] = r1;                
                POP r1,r1 FROM [sp];
                reti;

_IRQ0:        
                PUSH r1,r1 TO [sp];
     			[P_INT_Clear] = r1;
                POP r1,r1 FROM [sp];
                reti;

_IRQ1:        
                PUSH r1,r1 TO [sp];
                [P_INT_Clear] = r1;
                POP r1,r1 FROM [sp];
                reti;
_IRQ2:        
                PUSH r1,r1 TO [sp];
                [P_INT_Clear] = r1;
                POP r1,r1 FROM [sp];
                reti;
_IRQ3:
                PUSH r1,r1 TO [sp];
                [P_INT_Clear] = r1;
                POP r1,r1 FROM [sp];
                reti;
_IRQ4:        
                PUSH r1,r1 TO [sp];
                [P_INT_Clear] = r1;
                POP r1,r1 FROM [sp];
                reti;
_IRQ5:        
                PUSH r1,r1 TO [sp];
                r1 = 0x0004 	    
      		    test r1,[P_INT_Ctrl] 	//比较是否为2Hz的中断源
    			JNZ	 L_IRQ5_2Hz			//是，则转至对应程序段  
L_IRQ5_4Hz:								//4Hz 中断的处理  
    			r1=0x0008     
			    JMP L_Exit_IRQ5;     
L_IRQ5_2Hz:
				r1=[_ui2HzIntCounter];
				r1+=1;
				[_ui2HzIntCounter]=r1;
				CMP r1,5
				JBE L_Countinue;
				
				r1=0;
				[_ui2HzIntCounter]=r1;
				r1=1
				[_uiTwoSecondTimeFlag]=r1;
L_Countinue:
			    r1 = 0x0004     
L_Exit_IRQ5:   
				[P_INT_Clear]=r1; 
                POP r1,r1 FROM [sp];
                reti;
_IRQ6:        
                PUSH r1,r1 TO [sp];
                POP r1,r1 FROM [sp];
                reti;
_IRQ7:        
                PUSH r1,r1 TO [sp];
                POP r1,r1 FROM [sp];
                reti;
	