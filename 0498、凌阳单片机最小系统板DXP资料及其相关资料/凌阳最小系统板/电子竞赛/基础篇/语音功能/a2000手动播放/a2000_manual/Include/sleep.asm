///////////////////////////////////////////////////////////////////////////////
// Program:
//
// _Hardware_Sleep;
//
// F_RampDown_DAC2;
// F_RampUp_DAC2; 
//
// 	F_IRQ3_WakeUp;
//	F_IRQ5_2HzWakeUp;
//
///////////////////////////////////////////////////////////////////////////////
.include hardware.inc;
.include key.inc;
.include system.inc;

.CODE
.public	_Hardware_Sleep;
_Hardware_Sleep:
        
        PUSH R1,R2 TO [SP];
                
      
									
        R1=[P_IOA_Data];				// wait key release first
        R1 &= 0x000f;					//
        jnz     L_DontEnterSleep;		//	

		int     off;	

		R1=0xffff;						//
        [P_INT_Clear]=R1;			//
	
		call	F_RampDown_DAC1;
	    call	F_RampDown_DAC2;
    	//call	F_RampDn;
        
	
        call	F_Sleep_Init_IO;		// set key wake up

		r1 = [P_IOA_Buffer];
		r1 |= 0x0080;					// scan line high
		[P_IOA_Buffer] = r1;

        R1=[P_IOA_Latch];                //latch
        
        R1 = 0x0080;                    //enable IRQ3
        [P_INT_Ctrl] = R1;           //
        
        int     IRQ;					// enable int.

        R1=0x0007;						//
        [P_SystemClock]=R1;          // go into sleep mode

        nop;
        nop;
        nop;

L_DontEnterSleep:
        POP R1,R2 FROM [SP];
        RETF;

//............................................
F_RampDown_DAC1:
		R1=0x0001;                      // Clear watch dog
		[P_Watchdog_Clear]=R1;       	//
L_RD_Loop1:
		r1 = [P_DAC1];
		r1 &= 0xFFC0;
		jz	L_RD_End1;
	
//		r2 = 0x01;
//L_RD_DelayLoop1:	
//		r2 -= 1;
//		jz	L_RD_DelayEnd1;		
//		jmp	L_RD_DelayLoop1;	
//L_RD_DelayEnd1:	

		r1 -= 0x40;
		[P_DAC1] = r1;
			
		jmp L_RD_Loop1;
L_RD_End1:		
		retf;
	
////////////////////////////////////////////		
F_RampUp_DAC1:
		R1=0x0001;                      // Clear watch dog
		[P_Watchdog_Clear]=R1;       	//
L_RU_Loop1:
		r1 = [P_DAC1];
		r1 &= 0xFFC0;
		cmp r1, 0x8000;
		jle	L_RU_End1;
		
//		r2 = 0x01;
//L_RU_DelayLoop1:	
//		r2 -= 1;
//		jz	L_RU_DelayEnd1;		
//		jmp	L_RU_DelayLoop1;	
//L_RU_DelayEnd1:	

		r1 += 0x40;
		[P_DAC1] = r1;
		
		jmp	L_RU_Loop1;
		
L_RU_End1:
		retf;

//............................................
F_RampDown_DAC2:

		R1=0x0001;                      // Clear watch dog
		[P_Watchdog_Clear]=R1;       	//	
L_RD_Loop:
		r1 = [P_DAC2];
		r1 &= 0xFFC0;
		jz	L_RD_End;
	
//		r2 = 0x01;
//L_RD_DelayLoop:	
//		r2 -= 1;
//		jz	L_RD_DelayEnd;		
//		jmp	L_RD_DelayLoop;	
//L_RD_DelayEnd:	

		r1 -= 0x40;
		[P_DAC2] = r1;
		jmp L_RD_Loop;
L_RD_End:		
		retf;
	
////////////////////////////////////////////		
F_RampUp_DAC2:
L_RU_Loop:
		R1=0x0001;                      // Clear watch dog
		[P_Watchdog_Clear]=R1;       	//
		
		r1 = [P_DAC2];
		r1 &= 0xFFC0;
		cmp r1, 0x8000;
		jle	L_RU_End;
		
//		r2 = 0x01;
//L_RU_DelayLoop:	
//		r2 -= 1;
//		jz	L_RU_DelayEnd;		
//		jmp	L_RU_DelayLoop;	
//L_RU_DelayEnd:	

		r1 += 0x40;
		[P_DAC2] = r1;
	
		jmp	L_RU_Loop;		
		
L_RU_End:
		retf;



///////////////////////////////////////////////////////////////////////////////
// Wake Up entrance
///////////////////////////////////////////////////////////////////////////////
.public F_IRQ3_WakeUp;
F_IRQ3_WakeUp:
        
        int     off;                    //wakeup

        R1=0xffff;						//
        [P_INT_Clear]=R1;				//
        
        r1 = 0;
        [P_INT_Ctrl] = r1;
        
        //call	F_User_Init_IO;			//
		call	F_Key_Scan_Initial;		//
		
		call	F_RampUp_DAC1;			//
		call	F_RampUp_DAC2;			//
		//call	F_RampUp;

        //R1=0x0002;
        //[P_DA_Ctrl]=R1;              //
        
        R1=0x0000;                      //
        [P_SystemClock]=R1;          //
        
        //R1=0xffff-0x5ff;                //
        //[P_TimerA_Data]=R1;          //
        //R1=0x0070;                      //                     9876|543|210
        //[P_TimerA_Ctrl]=R1;       	// TimerA Ctrl 0001|110|000

        //int     FIQ,IRQ;

        retf;

///////////////////////////////////////////////////////////////////////////////
// 2Hz Wake Up entrance
///////////////////////////////////////////////////////////////////////////////
.public _WakeUp_Initial;
_WakeUp_Initial:
        PUSH R1,R1 TO [SP];

        POP R1,R1 FROM [SP];
        RETF;


///////////////////////////////////////////////////////////////////////////////
.public F_IRQ5_2HzWakeUp;
F_IRQ5_2HzWakeUp:
        //PUSH R1,R1 TO [SP];
        int     off;                    //wakeup

        R1=0x0016;                      //20MHz, 32K on, Fosc/64
        [P_SystemClock]=R1;

        R1=0xffff;
        [P_INT_Clear]=R1;

        R1=[P_IOB_Buffer];			// use LED to test
        R1^= 0x8000;
        [P_IOB_Buffer]=R1;

        //POP R1,R1 FROM [SP];
        retf;
