
//============================================================
// 文件名称：isr.asm
// 实现功能：采用FIQ_TMA(8K)中断实现语音数据队列的填充
// 日期： 2003/7/7
//============================================================

.include a2000.inc                       //包含A2000语音库函数的声明
.INCLUDE hardware.inc
.TEXT

.public _FIQ
 
F_Get_Resource:   
                
_FIQ:		
        push r1,r5 to [sp];
		r1 = 0x0001;
		[P_Watchdog_Clear] = r1;
		r1 = C_FIQ_TMA;						// 
		test r1,[P_INT_Ctrl];				//
		jne	L_FIQ_TimerA;					// Timer A FIQ 入口
		r1 = C_FIQ_TMB;						//
		test r1,[P_INT_Ctrl];				//
		jne L_FIQ_TimerB;						
	
L_FIQ_PWM:										// PWM FIQ 入口
		//------------------------------------------------------------------
		// hook PWM FIQ subroutine here and define it to be external
		//------------------------------------------------------------------
		r1 = C_FIQ_PWM;
        [P_INT_Clear] = r1;
		pop r1,r5 from [sp];
        reti;
		
L_FIQ_TimerA:	
		//------------------------------------------------------------------		
		CALL	F_FIQ_Service_SACM_A2000		// 填充语音队列
		//------------------------------------------------------------------
	
        R1 = C_FIQ_TMA
        [P_INT_Clear] = R1
		POP R1,R5 from [SP]      
	   	reti
        
L_FIQ_TimerB:   
		[P_INT_Clear] = r1;
		//------------------------------------------------------------------
		// hook Timer B FIQ subroutine here and define it to be external
		//------------------------------------------------------------------
		pop r1,r5 from [sp];
        reti;          

//========================================================================================        
// End of isr.asm
//========================================================================================
        