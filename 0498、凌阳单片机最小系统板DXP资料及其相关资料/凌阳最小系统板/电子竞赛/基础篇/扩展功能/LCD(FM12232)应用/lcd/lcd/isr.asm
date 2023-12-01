//.include spce.inc				// include io config. information

.include sp_lib.inc;
.EXTERNAL   _gra_No
.EXTERNAL  _graphic_display
.TEXT
.include spce.inc				// include io config. information
.include a2000.inc

//.define F_SACM_A2000_ServiceLoop_ISR 0x89e5
.public _FIQ


// 
F_Get_Resource:   
                
_FIQ:		
        push r1,r5 to [sp];
		
		r1 = C_FIQ_TMA;						// 
		test r1,[P_INT_Ctrl];				//
		jne	L_FIQ_TimerA;						// Timer A FIQ entrence 
		r1 = C_FIQ_TMB;						//
		test r1,[P_INT_Ctrl];				//
		jne L_FIQ_TimerB;						// Timer B FIQ entrence	
	
L_FIQ_PWM:										// PWM FIQ entrence
		//------------------------------------------------------------------
		// hook PWM FIQ subroutine here and define it to be external
		//------------------------------------------------------------------
		
		r1 = C_FIQ_PWM;
        [P_INT_Clear] = r1;
		pop r1,r5 from [sp];
        reti;
		
L_FIQ_TimerA:	
		//------------------------------------------------------------------		
		// hook Timer A FIQ subroutine here and define it to be external
		CALL	F_FIQ_Service_SACM_A2000		// SACM-A2000 Timer A FIQ service
		//------------------------------------------------------------------
	
   
        R1 = F_SACM_A2000_ServiceLoop_ISR;  // background service loop 
                                     
        push R1 to [SP];
        push SR to [SP];
        
        R1 = C_FIQ_TMA
        [P_INT_Clear] = R1         
	   	reti
        
L_FIQ_TimerB:   
		[P_INT_Clear] = r1;
		//------------------------------------------------------------------
		// hook Timer B FIQ subroutine here and define it to be external
		//------------------------------------------------------------------
		//r1 = C_FIQ_TimerB;
        //[P_INT_Clear] = r1;
		pop r1,r5 from [sp];
        reti;          
//===================================================================================
//函数：IRQ5（）
//语法：void IRQ5(void)
//描述：利用2Hz中断定时1秒，1秒钟采样一次温度值
//参数：无
//返回：无
//===================================================================================

      
.PUBLIC  _IRQ6;
_IRQ6:
	PUSH r1,r4 to [sp];
	r1 = 0x0001;
	TEST r1,[P_INT_Ctrl];
	JNZ  _IRQ6_TMB2;
	r1=0x0002;
	[P_INT_Clear]=r1;	
	r1 = 0x0001;
	[P_Watchdog_Clear] = r1
	
    r1 = [_gra_No]
    cmp r1,3;
    je l;
    r1 += 1;    
    [_gra_No] = r1  
	POP r1,r4 FROM [sp];
    RETI;         
_IRQ6_TMB2:   
	[P_INT_Clear]=r1;
		
exit:		
	POP r1,r4 FROM [sp];
    RETI;   
  l:
     r1 = 0
     [_gra_No] = r1 
     jmp exit