//============================================================
// 文件名称：sacmV32.asm
// 实现功能：对A3200、A2000、A1600、S530、S480、S240、MS01、DVR等格式的初始化、初始化队列
// 读写队列、声音高低的调节等函数
// 日期： 2003/6/16
//============================================================


.include spce.inc

//== User definition =====================
.define C_RampDelay 80

//---<< System Clock Setting >>----------------------
// Note: Please refer to spce.inc for BODY_TYPE definition.
//       This setting affects the validity of C_SystemClock.
//

.define C_SystemClock C_Fosc_49M
//.define C_SystemClock C_Fosc
//----<< Timer definition >>------------------------
.define C_Timer_Setting_8K_For_24MHz   0xF9FF
.define C_Timer_Setting_9K_For_24MHz   0xFAAA
.define C_Timer_Setting_10K_For_24MHz  0xFB33
.define C_Timer_Setting_11K_For_24MHz  0xFBA2
.define C_Timer_Setting_12K_For_24MHz  0xFBFF
.define C_Timer_Setting_16K_For_24MHz  0xFCFF
.define C_Timer_Setting_20K_For_24MHz  0xFD98
.define C_Timer_Setting_24K_For_24MHz  0xFDFF

.define C_Timer_Setting_8K_For_49MHz   0xF3FF
.define C_Timer_Setting_9K_For_49MHz   0xF555
.define C_Timer_Setting_10K_For_49MHz  0xF666
.define C_Timer_Setting_11K_For_49MHz  0xF745
.define C_Timer_Setting_12K_For_49MHz  0xF7FF
.define C_Timer_Setting_16K_For_49MHz  0xF9FF
.define C_Timer_Setting_20K_For_49MHz  0xFB33
.define C_Timer_Setting_24K_For_49MHz  0xFBFF

//---<< Timer setting >>
.define C_S200_Timer_Setting  C_Timer_Setting_16K_For_49MHz
.define C_S240_Timer_Setting  C_Timer_Setting_20K_For_49MHz
.define C_S480_Timer_Setting  C_Timer_Setting_16K_For_49MHz
.define C_S530_Timer_Setting  C_Timer_Setting_12K_For_49MHz


.define C_A1600_Timer_Setting 		C_Timer_Setting_16K_For_49MHz
.define C_A2000_Timer_Setting 		C_Timer_Setting_16K_For_49MHz

.define C_DVR_Timer_Setting   		C_Timer_Setting_8K_For_49MHz
.define C_DVR_Rec_Timer_Setting 	C_Timer_Setting_24K_For_49MHz
.define C_DVR_Play_Timer_Setting 	C_Timer_Setting_16K_For_49MHz
// For A3200 Timer setting , please go to F_SP_SACM_A3200_Init_, 
//                                        F_SP_SACM_2Ch_A3200_Init_
//                           it is determined by library internally.
// For Ms01 Timer setting , please go to F_SP_SACM_MS01_Init_
//-------------------------------------------------


//================================================== 


.PUBLIC	F_SP_RampUpDAC1 
.PUBLIC	F_SP_RampDnDAC1
.PUBLIC	F_SP_RampUpDAC2
.PUBLIC	F_SP_RampDnDAC2
.PUBLIC	_SP_RampUpDAC1 
.PUBLIC	_SP_RampDnDAC1 
.PUBLIC	_SP_RampUpDAC2 
.PUBLIC	_SP_RampDnDAC2 

.PUBLIC	_SP_InitQueue
.PUBLIC	_SP_InitQueue_A2000
.PUBLIC	_SP_InitQueue_S530
.PUBLIC	_SP_InitQueue_S480
.PUBLIC	_SP_InitQueue_S240
.PUBLIC	_SP_InitQueue_MS01
.PUBLIC	_SP_InitQueue_DVR

.PUBLIC	F_SP_InitQueue
.PUBLIC	F_SP_InitQueue_A2000
.PUBLIC	F_SP_InitQueue_S530
.PUBLIC	F_SP_InitQueue_S480
.PUBLIC	F_SP_InitQueue_S240
.PUBLIC	F_SP_InitQueue_MS01
.PUBLIC	F_SP_InitQueue_DVR

.PUBLIC	F_SP_ReadQueue
.PUBLIC F_SP_ReadQueue_A2000
.PUBLIC F_SP_ReadQueue_S530
.PUBLIC F_SP_ReadQueue_S480
.PUBLIC F_SP_ReadQueue_S240
.PUBLIC F_SP_ReadQueue_MS01
.PUBLIC F_SP_ReadQueue_DVR

.PUBLIC	F_SP_ReadQueue_NIC			// Read Queue with no index change
.PUBLIC	F_SP_ReadQueue_NIC_A2000
.PUBLIC	F_SP_ReadQueue_NIC_S530
.PUBLIC	F_SP_ReadQueue_NIC_S480
.PUBLIC	F_SP_ReadQueue_NIC_S240
.PUBLIC	F_SP_ReadQueue_NIC_MS01
.PUBLIC	F_SP_ReadQueue_NIC_DVR

.PUBLIC	F_SP_WriteQueue
.PUBLIC F_SP_WriteQueue_A2000
.PUBLIC F_SP_WriteQueue_S530
.PUBLIC F_SP_WriteQueue_S480
.PUBLIC F_SP_WriteQueue_S240
.PUBLIC F_SP_WriteQueue_MS01
.PUBLIC F_SP_WriteQueue_DVR

.PUBLIC F_SP_TestQueue
.PUBLIC F_SP_TestQueue_A2000
.PUBLIC F_SP_TestQueue_S530
.PUBLIC F_SP_TestQueue_S480
.PUBLIC F_SP_TestQueue_S240
.PUBLIC F_SP_TestQueue_MS01
.PUBLIC F_SP_TestQueue_DVR


.PUBLIC	_SP_GetResource	

.PUBLIC	F_RampUpDAC1 
.PUBLIC	F_RampDnDAC1 
.PUBLIC	F_RampUpDAC2 
.PUBLIC	F_RampDnDAC2 
.PUBLIC	_STD_RampUpDAC1 
.PUBLIC	_STD_RampDnDAC1 
.PUBLIC	_STD_RampUpDAC2 
.PUBLIC	_STD_RampDnDAC2 


/////////////////////////////////////////////////////////////////
// Note: This register map to the P_INT_Ctrl(0x7010)
// 	User's interrupt setting have to combine with this register 
//	while co-work with SACM library.
//
//  See. following function for example:
//	F_SP_SACM_A2000_Init_:
//	F_SP_SACM_S480_Init_:
//	F_SP_SACM_S240_Init_:
//	F_SP_SACM_MS01_Init_:
//	F_SP_SACM_DVR_Init_: 
//////////////////////////////////////////////////

//.external R_InterruptStatus // declared in spce.asm
//////////////////////////////////////////////////

.define C_QueueSize 50					
.RAM
.VAR 	R_Queue 
.DW		C_QueueSize-1	DUP(0) 
.VAR	R_ReadIndex 
.VAR	R_WriteIndex 

.CODE
//////////////////////////////////////////////////////
// Ramp Functions
//////////////////////////////////////////////////////	
////////////////////////////////////////////////////////
// Function: _SP_RampUpDAC1
// Description: Ramp Up before using DAC to avoid "bow" sound
//              from speaker 
// Syntax  : SP_RampUpDAC1()
// Destory: R1,R2
////////////////////////////////////////////////////////
_SP_RampUpDAC1:	.PROC
F_SP_RampUpDAC1:
		push r1,r2 to [sp] 
        r1=[P_DAC1] 
        r1 &= ~0x003f 
        cmp     r1,0x8000
        jb     	L_RU_NormalUp
        je      L_RU_End
                
L_RU_DownLoop:
        call    F_Delay         
        r2 = 0x0001 
        [P_Watchdog_Clear] = r2 
        r1 -= 0x40 
        [P_DAC1] = r1 
        cmp     r1,0x8000 
        jne     L_RU_DownLoop   
L_RD_DownEnd:
        jmp     L_RU_End 

L_RU_NormalUp:
L_RU_Loop:
        call    F_Delay 
        r2 = 0x0001 
        [P_Watchdog_Clear] = r2 
        r1 += 0x40 
        [P_DAC1] = r1 
        cmp     r1, 0x8000 
        jne     L_RU_Loop 
L_RU_End:
		pop     r1,r2 from [sp] 
  		retf 
    	.ENDP
    
////////////////////////////////////////////////////////
// Function: _SP_RampDnDAC1
// Description: Ramp down after using DAC to avoid "bow" sound
//              from speaker 
// Syntax  : SP_RampDnDAC1()
// Destory: R1,R2
////////////////////////////////////////////////////////
_SP_RampDnDAC1:	.PROC
F_SP_RampDnDAC1:
		push r1,r2 to [sp] 
  		//int off 
    	r1 = [P_DAC1] 
     	r1 &= ~0x003F 
      	jz      L_RD_End 
L_RD_Loop:                
        call    F_Delay         
        r2 = 0x0001 
        [P_Watchdog_Clear] = r2 
        r1 -= 0x40 
        [P_DAC1] = r1   
        jnz     L_RD_Loop 
L_RD_End:       
        pop     r1,r2 from [sp] 
        retf 
		.ENDP

////////////////////////////////////////////////////////
// Function: _SP_RampUpDAC2
// Description: Ramp Up before using DAC to avoid "bow" sound
//              from speaker 
// Syntax  : SP_RampUpDAC2()
// Destory: R1,R2
////////////////////////////////////////////////////////
_SP_RampUpDAC2:	.PROC
F_SP_RampUpDAC2:
		push r1,r2 to [sp] 
  		r1=[P_DAC2] 
    	r1 &= ~0x003f 
     	cmp     r1,0x8000
      	jb     	L_RU_NormalUp_   
       	je      L_RU_End 
                
L_RU_DownLoop_:
        call    F_Delay         
        r2 = 0x0001 
        [P_Watchdog_Clear] = r2 
        r1 -= 0x40 
        [P_DAC2] = r1 
        cmp     r1,0x8000 
        jne     L_RU_DownLoop_   
L_RD_DownEnd_:
        jmp     L_RU_End_ 

L_RU_NormalUp_:
L_RU_Loop_:
		call    F_Delay 
  		r2 = 0x0001 
    	[P_Watchdog_Clear] = r2 
        r1 += 0x40 
        [P_DAC2] = r1 
        cmp     r1, 0x8000 
        jne     L_RU_Loop_ 
L_RU_End_:
   		pop     r1,r2 from [sp] 
     	retf 
      	.ENDP

////////////////////////////////////////////////////////
// Function: _SP_RampDnDAC2
// Description: Ramp down after using DAC to avoid "bow" sound
//              from speaker 
// Syntax  : SP_RampDnDAC2()
// Destory: R1,R2
////////////////////////////////////////////////////////
_SP_RampDnDAC2:	.PROC
F_SP_RampDnDAC2:
		//int off 
		push r1,r2 to [sp] 
                
        r1 = [P_DAC2] 
        r1 &= ~0x003F 
        jz      L_RD_End_ 
L_RD_Loop_:                
        call    F_Delay         
        r2 = 0x0001 
        [P_Watchdog_Clear] = r2 
        r1 -= 0x40 
        [P_DAC2] = r1   
        jnz     L_RD_Loop_ 
L_RD_End_:       
        pop     r1,r2 from [sp] 
        retf 
		.ENDP

	
//-------------------------------------------------------
// Function: F_Delay
// Description: Provide delay for Ramp up/down 
//              The delay time is adjustable by adjusting C_RampDelay
// Destory: R1
//-------------------------------------------------------			
F_Delay:
        push r1 to [sp] 
        r1 = C_RampDelay; 							// Ramp Up/Dn delay per step

L_D_Loop:
        r1 -= 1 
        jnz     L_D_Loop  
        pop     r1 from [sp] 
        RETF	 



//////////////////////////////////////////////////////
// Queue Functions
//////////////////////////////////////////////////////				

////////////////////////////////////////////////////////
// Function: _SP_InitQueue
// Description: Initiate queue for algorism use 
// Syntax  : SP_InitQueue()
// Destory: R1
////////////////////////////////////////////////////////
_SP_InitQueue:	.PROC
_SP_InitQueue_A2000:
_SP_InitQueue_S530:
_SP_InitQueue_S480:
_SP_InitQueue_S240:
_SP_InitQueue_MS01:
_SP_InitQueue_DVR:

F_SP_InitQueue_A2000:
F_SP_InitQueue_S530:
F_SP_InitQueue_S480:
F_SP_InitQueue_S240:
F_SP_InitQueue_MS01:
F_SP_InitQueue_DVR:
F_SP_InitQueue:
		R1 = R_Queue
		R2 = 0 
?L_ClearQueueLoop:		
		[R1++] = R2
		cmp	R1, R_Queue+C_QueueSize
		jne	?L_ClearQueueLoop
			
		R1 = 0
		[R_ReadIndex] = R1
		[R_WriteIndex] = R1
				
		RETF
		.ENDP
		
//-------------------------------------------------------
// Function: F_SP_ReadQueue_Xnnn
// Description Get a data form Queue
// Output:  R1: Data read
// Destory: R1,R2
//-------------------------------------------------------
F_SP_ReadQueue_A2000:
F_SP_ReadQueue_S530:
F_SP_ReadQueue_S480:
F_SP_ReadQueue_S240:
F_SP_ReadQueue_MS01:
F_SP_ReadQueue_DVR:
F_SP_ReadQueue:
		R2 = [R_ReadIndex]
		cmp R2,[R_WriteIndex]
		je	L_RQ_QueueEmpty

		R2 += R_Queue				// get queue data address
		R1 = [R2]
		
		R2 = [R_ReadIndex]
		R2 += 1
		cmp	R2, C_QueueSize
		jne	L_RQ_NotQueueBottom
		R2 = 0
L_RQ_NotQueueBottom:	
		[R_ReadIndex] = R2		
		//r2 = 0x0000 						// get queue data
		retf 
L_RQ_QueueEmpty:
		//r2 = 0x8000 						// queue empty
		retf 

//-------------------------------------------------------
// Function: F_SP_ReadQueue_NIC_Xnnn
// Description: Get a data from Queue but do 
//			not change queue index
// Output:  R1: Data read
// Destory: R1,R2
//-------------------------------------------------------
F_SP_ReadQueue_NIC:
F_SP_ReadQueue_NIC_A2000:
F_SP_ReadQueue_NIC_S530:
F_SP_ReadQueue_NIC_S480:
F_SP_ReadQueue_NIC_S240:
F_SP_ReadQueue_NIC_MS01:
F_SP_ReadQueue_NIC_DVR:
		R2 = [R_ReadIndex]
		cmp R2,[R_WriteIndex]
		je	?L_RQ_QueueEmpty

		R2 += R_Queue				// get queue data index
		R1 = [R2]
?L_RQ_QueueEmpty:
		RETF
		
//-------------------------------------------------------
// Function: F_SP_WriteQueue_Xnnn
// Description: Put a data to Queue
// Input  :  R1 Data to write 
// Destory: R1,R2
//-------------------------------------------------------
F_SP_WriteQueue_A2000:
F_SP_WriteQueue_S530:
F_SP_WriteQueue_S480:
F_SP_WriteQueue_S240:
F_SP_WriteQueue_MS01:
F_SP_WriteQueue_DVR:
F_SP_WriteQueue:
		R2 = [R_WriteIndex] 			// put data to queue
		R2 += R_Queue
		[R2] = R1

		R2 = [R_WriteIndex]
		R2 += 1
		cmp	R2, C_QueueSize
		jne	L_WQ_NotQueueBottom
		R2 = 0
L_WQ_NotQueueBottom:
		[R_WriteIndex] = R2
		RETF

		

//-------------------------------------------------------
// Function: F_SP_ReadQueue_NIC_Xnnn
// Description: Test Queue Status
// Output:  R1: queue status
//	            0: not Full, not empty
//              1: full
//              2: empty 
// Destory: R1
//-------------------------------------------------------
F_SP_TestQueue_A2000:
F_SP_TestQueue_S530:
F_SP_TestQueue_S480:
F_SP_TestQueue_S240:
F_SP_TestQueue_MS01:
F_SP_TestQueue_DVR:
F_SP_TestQueue:
		//... Test Queue Empty ...
		R1 = [R_ReadIndex] 
		cmp R1,[R_WriteIndex] 
		je	L_TQ_QueueEmpty 

		//... Test Queue Full ...
		R1 = [R_ReadIndex] 				// For N Queue Full: 1.R=0 and W=N-1 2. R<>0 and W=R-1 
		jnz	L_TQ_JudgeCond2 
		R1 = [R_WriteIndex] 
		cmp	R1, C_QueueSize-1 			// Cond1
		je	L_TQ_QueueFull 			
L_TQ_JudgeCond2:		
		R1 = [R_ReadIndex] 
		R1 -=1 
		cmp R1,[R_WriteIndex] 
		je	L_TQ_QueueFull 	

		r1 = 0 							// not Full, not empty
		retf 
L_TQ_QueueFull:
		r1 = 1 							// full
		retf 
L_TQ_QueueEmpty:
		r1 = 2 							// empty
		retf 



//////////////////////////////////////////////////////
// SACM_dependent functions 
//////////////////////////////////////////////////////
 
//////////////////////////////////////////////////////////////////  
// Function: _SP_GetResource
// Description: Get data from resource(ROM area)
// Syntax:  int SP_GetResource(int Addr, int Page)
// Output:  R1: data to read
// Destory: R1
//////////////////////////////////////////////////////////////////  
////////////////////////////////////////////////////////////////// 
// Function: Get data from resource(ROM area)
// 	int SP_GetResource(int Addr, int Page)
//////////////////////////////////////////////////////////////////  
_SP_GetResource:	.PROC
		push bp to [sp] 
		bp = sp + 1 
		
		r1 = [bp+3] 					// Address
		r2 = [bp+4] 					// Page
		
		r2 = r2 lsl 4 					// Prepare Page for SR
		r2 = r2 lsl 4 
		r2 = r2 lsl 2 
		
		sr &= 0x03f 					// Change Page
        r2 |=sr 						//
        sr = r2 						//
  
  		r1 = D:[r1] 					// Get data
       
		pop	 bp from [sp] 
		retf 
		.ENDP 
//........................................
F_SP_GetResource:
		r2 = r2 lsl 4 					// Prepare Page for SR
		r2 = r2 lsl 4 
		r2 = r2 lsl 2 
		
		sr &= 0x03f 					// Change Page
        r2 |=sr 						//
        sr = r2 						//
  
  		r1 = D:[r1] 					// Get data
	  	retf


////////////////////////////////////////////////////////////////// 
// Function: Delay
// 	void SP_Delay()
//////////////////////////////////////////////////////////////////  
_SP_Delay:	.PROC
F_SP_Delay:
		// User define
		retf 
		.ENDP



//////////////////////////////////////////////////////
// SACM initial functions
//////////////////////////////////////////////////////	
.public F_SP_SACM_A1600_Init_
.PUBLIC F_SP_SACM_A2000_Init_
.PUBLIC F_SP_SACM_S530_Init_
.PUBLIC F_SP_SACM_S480_Init_
.PUBLIC F_SP_SACM_S240_Init_
.public F_SP_SACM_S200_Init_

.PUBLIC F_SP_SACM_MS01_Init_
.PUBLIC F_SP_PlayMode0_
.PUBLIC F_SP_PlayMode1_    
.PUBLIC F_SP_PlayMode2_  
.PUBLIC F_SP_PlayMode3_   

.PUBLIC F_SP_SACM_DVR_Init_
.PUBLIC F_SP_SACM_DVR_Rec_Init_
.PUBLIC F_SP_SACM_DVR_Play_Init_

//----------------------------------------------------
// A1600
//----------------------------------------------------	
///////////////////////////////////////////////////////////////////////////////
// Function: The partial code of hardware setting of SACM_A1600_Initial() 
//			or F_SACM_A1600_Initial:
// Note: The following functions are the partial code of original
//			initial subroutine. (H/W setting part) 
//
//	Ex: F_SACM_A1600_Initial:
//			...
//			call F_SP_SACM_A1600_Init_	: S480/S240/MS01 is same
//			...
//			retf
////////////////////////////////////////////////////////////////////////////////

F_SP_SACM_A1600_Init_:	
		R1 = C_SystemClock;             // 24MHz, Fcpu=Fosc
        [P_SystemClock]=R1           	//  Frequency 20MHz
        R1 = 0x0030                     // TimerA CKA=Fosc/2 CKB=1 Tout:off
        [P_TimerA_Ctrl] = R1			// Initial Timer A
        R1 = C_A1600_Timer_Setting                  	// 16K
        [P_TimerA_Data] = R1 
        R1 = 0x00A8                     // Set the DAC Ctrl
        [P_DAC_Ctrl] = R1
        R1 = 0xffff
        
        [P_INT_Clear] = R1          	// Clear interrupt occuiped events
        R1 =0x0000						// 
        
        .if BODY_TYPE == SPCE061A
        R1 = [P_INT_Mask]		//
        .endif
       // .if BODY_TYPE == SPCE500A
      //  R1 = [R_InterruptStatus]		//
      //  .endif        
        
        R1 |= C_FIQ_TMA					// Enable Timer A FIQ
        //R1 |= C_IRQ4_1KHz
      //  [R_InterruptStatus] = R1		//
        [P_INT_Ctrl] = R1				//

		RETF
//----------------------------------------------------
// A2000
//----------------------------------------------------	
///////////////////////////////////////////////////////////////////////////////
// Function: The partial code of hardware setting of SACM_A2000_Initial() 
//			or F_SACM_A2000_Initial:
// Note: The following functions are the partial code of original
//			initial subroutine. (H/W setting part) 
//
//	Ex: F_SACM_A2000_Initial:
//			...
//			call F_SP_SACM_A2000_Init_	: S480/S240/MS01 is same
//			...
//			retf
////////////////////////////////////////////////////////////////////////////////
F_SP_SACM_A2000_Init_:	
		R1=C_SystemClock;               // 24MHz, Fcpu=Fosc
        [P_SystemClock]=R1           	//  Frequency 20MHz
        R1 = 0x0030                     // TimerA CKA=Fosc/2 CKB=1 Tout:off
        [P_TimerA_Ctrl] = R1			// Initial Timer A
        R1 = C_A2000_Timer_Setting                   	// 16K
        [P_TimerA_Data] = R1 
        R1 = 0x00A8                     // Set the DAC Ctrl
        [P_DAC_Ctrl] = R1
        R1 = 0xffff
        
        [P_INT_Clear] = R1          	// Clear interrupt occuiped events

        
        .if BODY_TYPE == SPCE061A
        R1 = [P_INT_Mask]		//
        .endif
      //  .if BODY_TYPE == SPCE500A
      //  R1 = [R_InterruptStatus]		//
     //   .endif 
                
        R1 |= C_FIQ_TMA					// Enable Timer A FIQ

     //   [R_InterruptStatus] = R1		//
        [P_INT_Ctrl] = R1				//

		RETF



//----------------------------------------------------
// A3200 1ch
//----------------------------------------------------	
.public F_SP_SACM_A3200_Init_
.public F_SACM_A3200_SetTimerSrc			
.public F_SACM_A3200_SetIntSrc
.public F_SACM_A3200_SendDecodedData
//////////////////////////////////////////////////////////////////
// Function: The partial code of hardware setting of 
//			 SACM_A3200_Initial() or F_SACM_A3200_Initial:
//           Single Channel A3200      
//////////////////////////////////////////////////////////////////
F_SP_SACM_A3200_Init_:	.proc 
//	R1 = 0x0020;		// 20MHz 	
//	R1 = 0x0000;		// 24MHz
//	R1 = 0x0040;		// 32MHz						
//	R1 = 0x0060;		// 40MHz
//	R1 = 0x0080;		// 49MHz
	R1 = C_SystemClock
	[P_SystemClock] = R1;
	
	R1 = 0x00A4; 			// Latch DAR1 data to DAC1 by TimerA
	[P_DAC_Ctrl] = R1;  	// Latch DAR2 data to DAC2 by TimerA	
	
	RETF;
.endp 
//--------------------------------------------------------------------
//-- Function: F_SACM_A3200_SetTimerSrc
//-- Parameter: R1 : TimerData
//-- Return: NONE
//-- Description: This function called by A3200 library to set timer A                 
//--------------------------------------------------------------------
F_SACM_A3200_SetTimerSrc: .proc
	push R2 to [sp];
	R2 = 0x0030;
	[P_TimerA_Ctrl] = R2;	// select Fosc/2 as Timer A clock source 
	[P_TimerA_Data] = R1;
	pop R2 from [sp];
	retf;
.endp	
//--------------------------------------------------------------------
//-- Function: F_SACM_A3200_SetIntSrc
//-- Parameter: NONE
//-- Return: NONE
//-- Description: This function called by A3200 library to set  
//                interrupt 
//--------------------------------------------------------------------
F_SACM_A3200_SetIntSrc: .proc 
	push R1 to [SP];
    .if BODY_TYPE == SPCE061A
     R1 = [P_INT_Mask]		//
    .endif
   // .if BODY_TYPE == SPCE500A
   //  R1 = [R_InterruptStatus]		//
   // .endif 

	R1 |= C_IRQ1_TMA;
//	[R_InterruptStatus] = R1;
	[P_INT_Ctrl] = R1;
	pop R1 from [SP];
	RETF;
.endp
//--------------------------------------------------------------------
//-- Function: F_SACM_A3200_SendDecodedData
//-- Parameter: R1 : decoded sample
//-- Return: NONE
//-- Description: This function called by A3200 library to send  
//                decoded data to DACs
//--------------------------------------------------------------------
F_SACM_A3200_SendDecodedData: .proc
	[P_DAC1] = R1;
	[P_DAC2] = R1;
	RETF;
.endp 		

		

//----------------------------------------------------
// A3200 2ch
//----------------------------------------------------	
.public F_SP_SACM_2Ch_A3200_Init_
.public F_SACM_A3200_Ch1_SetTimerSrc			
.public F_SACM_A3200_Ch1_SetIntSrc
.public F_SACM_A3200_Ch1_SendDecodedData
.public F_SACM_A3200_Ch2_SetTimerSrc			
.public F_SACM_A3200_Ch2_SetIntSrc
.public F_SACM_A3200_Ch2_SendDecodedData
//////////////////////////////////////////////////////////////////
// Function: The partial code of hardware setting of 
//			 SACM_2Ch_A3200_Initial() or F_SACM_2Ch_A3200_Initial:
//           2 Channel A3200  
//////////////////////////////////////////////////////////////////
F_SP_SACM_2Ch_A3200_Init_:	
//		R1 = 0x0020;		// 20MHz 	
//		R1 = 0x0000;		// 24MHz
//		R1 = 0x0040;		// 32MHz						
//		R1 = 0x0060;		// 40MHz
//		R1 = 0x0080;		// 49MHz
		R1 = C_SystemClock

        [P_SystemClock] = R1;           	
         
        R1 = 0x00C4;                     // Latch DAR1 data to DAC1 by TimerA
        [P_DAC_Ctrl] = R1;               // Latch DAR2 data to DAC2 by TimerB
        
        R1 = 0xffff;
        [P_INT_Clear] = R1;
                 
        RETF
//--------------------------------------------------------------------
//-- Function: F_SACM_A3200_Ch1_SetTimerSrc
//-- Parameter: R1 : TimerData
//-- Return: NONE
//-- Description: This function called by 2Ch A3200 library to set timer A 
//                for channel 1
//--------------------------------------------------------------------

F_SACM_A3200_Ch1_SetTimerSrc: .proc
	push R2 to [sp];
	R2 = 0x0030;
	[P_TimerA_Ctrl] = R2;	// select Fosc/2 as Timer A clock source 
	[P_TimerA_Data] = R1;
	pop R2 from [sp];
	retf;
.endp	
//--------------------------------------------------------------------
//-- Function: F_SACM_A3200_Ch1_SetIntSrc
//-- Parameter: NONE
//-- Return: NONE
//-- Description: This function called by 2Ch A3200 library to set  
//                interrupt for channel 1
//--------------------------------------------------------------------
F_SACM_A3200_Ch1_SetIntSrc: .proc 
	push R1 to [SP];
    .if BODY_TYPE == SPCE061A
     R1 = [P_INT_Mask]		//
    .endif
   // .if BODY_TYPE == SPCE500A
   //  R1 = [R_InterruptStatus]		//
   // .endif 

	R1 |= C_IRQ1_TMA;
//	[R_InterruptStatus] = R1;
	[P_INT_Ctrl] = R1;
	pop R1 from [SP];
	RETF;
.endp
//--------------------------------------------------------------------
//-- Function: F_SACM_A3200_Ch1_SendDecodedData
//-- Parameter: R1 : decoded sample
//-- Return: NONE
//-- Description: This function called by 2Ch A3200 library to send  
//                decoded data to DAC1
//--------------------------------------------------------------------
.external _Ch1_Stop
F_SACM_A3200_Ch1_SendDecodedData: .proc
	[P_DAC1] = R1;
	RETF;
.endp 		

//--------------------------------------------------------------------
//-- Function: F_SACM_A3200_Ch2_SetTimerSrc
//-- Parameter: R1 : TimerData
//-- Return: NONE
//-- Description: This function called by 2Ch A3200 library to set  
//                timer B for channel 2
//--------------------------------------------------------------------

F_SACM_A3200_Ch2_SetTimerSrc: .proc
	push R2 to [sp];
	R2 = 0x0000;
	[P_TimerB_Ctrl] = R2;	// select Fosc/2 as Timer B clock source 
	[P_TimerB_Data] = R1;
	pop R2 from [sp];
	retf;
.endp	
//--------------------------------------------------------------------
//-- Function: F_SACM_A3200_Ch2_SetIntSrc
//-- Parameter: NONE
//-- Return: NONE
//-- Description: This function called by 2Ch A3200 library to set  
//                interrupt for channel 2
//--------------------------------------------------------------------
F_SACM_A3200_Ch2_SetIntSrc: .proc 
	push R1 to [SP];
    .if BODY_TYPE == SPCE061A
     R1 = [P_INT_Mask]		//
    .endif
 //   .if BODY_TYPE == SPCE500A
 //    R1 = [R_InterruptStatus]		//
 //   .endif 

	R1 |= C_IRQ2_TMB;
//	[R_InterruptStatus] = R1;
	[P_INT_Ctrl] = R1;
	pop R1 from [SP];
	RETF;
.endp
//--------------------------------------------------------------------
//-- Function: F_SACM_A3200_Ch2_SendDecodedData
//-- Parameter: R1 : decoded sample
//-- Return: NONE
//-- Description: This function called by 2Ch A3200 library to send  
//                decoded data to DAC2
//--------------------------------------------------------------------

F_SACM_A3200_Ch2_SendDecodedData: .proc
	[P_DAC2] = R1;
	RETF;
.endp 		



//----------------------------------------------------
// S530
//----------------------------------------------------	
//////////////////////////////////////////////////////////////////
// Function: The partial code of hardware setting of SACM_S530_Initial() 
//			or F_SACM_S530_Initial:
//////////////////////////////////////////////////////////////////
// Sampling rate   |   data rate   |   TimerA_Data   | CPU(24MHz) % 
// -----------------------------------------------------------------  
//     8K Hz       |   5.3  Kbps   |     0xfa00      |    50 %
//     9K Hz       |   5.96 Kbps   |     0xfaaa      |    56 %  
//    10K Hz       |   6.63 Kbps   |     0xfb33      |    63 %
//    11K Hz       |   7.29 Kbps   |     0xfba2      |    69 %  
//    12K Hz       |   7.95 Kbps   |     0xfc00      |    75 %      

F_SP_SACM_S530_Init_:
        R1 = C_SystemClock;				// system clock 49MHz Fosc,CPU clock 49MHz
        //R1 = 0x0080;					// system clock 24MHz Fosc,CPU clock 24MHz
        [P_SystemClock]=R1          	// Initial System Clock
        R1 = 0x0030                     // TimerA CKA=Fosc/2 CKB=1 Tout:off
        [P_TimerA_Ctrl]=R1				// Initial Timer A
        //R1 = 0xfa00                  	//  8KHz, Using  8KHz to play  8KHz audio data. 
        //R1 = 0xfaaa                  	//  9KHz, Using  9KHz to play  9KHz audio data. 
        //R1 = 0xfb33                  	// 10KHz, Using 10KHz to play 10KHz audio data. 
        //R1 = 0xfba2 					// 11KHz, Using 11KHz to play 11KHz audio data. 
        R1 = C_S530_Timer_Setting      	// 12KHz, Using 12KHz to play 12KHz audio data.
        [P_TimerA_Data]=R1
        R1 = 0x00A8				// 
        [P_DAC_Ctrl] = R1				//
        
        R1 = 0xffff
        [P_INT_Clear] = R1          	// Clear interrupt occuiped events
        
        .if BODY_TYPE == SPCE061A
        R1 = [P_INT_Mask]		//
        .endif
   //     .if BODY_TYPE == SPCE500A
  //      R1 = [R_InterruptStatus]		//
  //      .endif 
        
        R1 |= C_FIQ_TMA					// Enable Timer A FIQ
  
 //       [R_InterruptStatus] = R1		//
        [P_INT_Ctrl] = R1				//	
        INT IRQ,FIQ	      
        RETF
//----------------------------------------------------
// S480
//----------------------------------------------------
//////////////////////////////////////////////////////////////////
// Function: The partial code of hardware setting of SACM_S480_Initial() 
//			or F_SACM_S480_Initial:
//////////////////////////////////////////////////////////////////
F_SP_SACM_S480_Init_:
        R1 = C_SystemClock					// 24MHz Fosc
        [P_SystemClock]=R1          	// Initial System Clock
        R1=0x0030                       // TimerA CKA=Fosc/2 CKB=1 Tout:off
        [P_TimerA_Ctrl]=R1				// Initial Timer A
        R1 = C_S480_Timer_Setting      	// 24K
        //R1 = 0xfd00                  	// 16K
        //R1 = 0xfc00                  	// 12KHz
        [P_TimerA_Data]=R1
        R1 = 0x00A8						// 
        [P_DAC_Ctrl] = R1				//
        
        R1 = 0xffff
        [P_INT_Clear] = R1          	// Clear interrupt occuiped events
        
        .if BODY_TYPE == SPCE061A
        R1 = [P_INT_Mask]		//
        .endif
    //    .if BODY_TYPE == SPCE500A
   //     R1 = [R_InterruptStatus]		//
   //     .endif 
        
        R1 |= C_FIQ_TMA					// Enable Timer A FIQ
   //     [R_InterruptStatus] = R1		//
        [P_INT_Ctrl] = R1				//
        RETF

//----------------------------------------------------
// S240
//----------------------------------------------------
//////////////////////////////////////////////////////////////////
// Function: The partial code of hardware setting of SACM_S240_Initial() 
//			or F_SACM_S240_Initial:
//////////////////////////////////////////////////////////////////
F_SP_SACM_S240_Init_:	
		R1 = C_SystemClock;	
		[P_SystemClock]=R1
		R1 = 0x00A8;					// 
		[P_DAC_Ctrl]= R1
		R1 = 0x0030;               	// TimerA CKA=Fosc/2 CKB=1 Tout:off
        [P_TimerA_Ctrl] = R1;
		R1 = C_S240_Timer_Setting;                    // 24K
    	[P_TimerA_Data] = R1;		
        R1 = 0xffff
        [P_INT_Clear] = R1          	// Clear interrupt occuiped events
        
        .if BODY_TYPE == SPCE061A
        R1 = [P_INT_Mask]		//
        .endif
   //     .if BODY_TYPE == SPCE500A
  //      R1 = [R_InterruptStatus]		//
  //      .endif 
        
        R1 |= C_FIQ_TMA					// Enable Timer A FIQ
    //    [R_InterruptStatus] = R1		//
        [P_INT_Ctrl] = R1				//
        RETF

//----------------------------------------------------
// S200
//----------------------------------------------------
//////////////////////////////////////////////////////////////////
// Function: The partial code of hardware setting of SACM_S200_Initial() 
//			or F_SACM_S200_Initial:
//////////////////////////////////////////////////////////////////       

F_SP_SACM_S200_Init_:

 		//R1 = 0X0098; // Set CPU Clock=Fosc (49Mhz)
 		R1 = C_SystemClock;  // 24.576MHz
 		[P_SystemClock] = R1;
 		R1 = 0X0230; // source =FOSC/2, PWMO 8/16
 		[P_TimerA_Ctrl] = R1;
 		//R1 = 0XFa00; // Sample rate = 32khz
 		R1= C_S200_Timer_Setting; // 24kHz
 		[P_TimerA_Data] = R1;

 		//R1 = 0X2000; // FIQ TMA
 		//[P_INT_Ctrl] = R1;
        .if BODY_TYPE == SPCE061A
        R1 = [P_INT_Mask]		//
        .endif
    //    .if BODY_TYPE == SPCE500A
   //     R1 = [R_InterruptStatus]		//
   //     .endif 
        
        R1 |= C_FIQ_TMA					// Enable Timer A FIQ
   //     [R_InterruptStatus] = R1		//
        [P_INT_Ctrl] = R1				//
        RETF
 RETF;
 
 
//----------------------------------------------------
// MS01
//----------------------------------------------------
//////////////////////////////////////////////////////////////////
// Function: The partial code of hardware setting of SACM_MS01_Initial() 
//			or F_SACM_MS01_Initial:
//
//	Ex: F_SACM_MS01_Initial:
//			...
//			call F_SP_SACM_MS01_Init_
//			call F_SP_Play_Mode0/1/2/3	->0,1,2,3 depending on the para1
//			...
//			retf
//////////////////////////////////////////////////////////////////
F_SP_SACM_MS01_Init_:	
		R1 = C_SystemClock;                    // 24MHz, Fcpu=Fosc
        [P_SystemClock] = R1;        	// Initial System Clock
        R1 = 0x0030;                    // TimerA CKA=Fosc/2 CKB=1 Tout:off
        [P_TimerA_Ctrl] = R1			// Initial Timer A
        R1 = 0x0003
        [P_TimerB_Ctrl] = R1;
        R1 = 0xFFFF 					// Any time for ADPCM channel 0,1
        [P_TimerB_Data] = R1			// Initial Timer B -> 8192	
        
		R1 = 0xffff
        [P_INT_Clear] = R1          	// Clear interrupt occuiped events
        RETF

//........................................
F_SP_PlayMode0_:						// with F_SP_SACM_MS01_Initial
		R1 = 0x0006
        [P_DAC_Ctrl] = R1
        //R1 = 0xFE00
        R1 = C_Timer_Setting_24K_For_49MHz
        [P_TimerA_Data] = R1 			//
        
        .if BODY_TYPE == SPCE061A
        R1 = [P_INT_Mask]		//
        .endif
    //    .if BODY_TYPE == SPCE500A
   //     R1 = [R_InterruptStatus]		//
   //     .endif 
        R1 |= C_FIQ_PWM+C_IRQ2_TMB+C_IRQ4_1KHz
        //R1 = C_FIQ_PWM+C_IRQ2_TMB+C_IRQ4_1KHz
   //     [R_InterruptStatus] = R1 		//
        [P_INT_Ctrl] = R1				//
        RETF

F_SP_PlayMode1_:						// with F_SP_SACM_MS01_Initial
		R1 = 0x00A8
        [P_DAC_Ctrl] = R1
        //R1 = 0xFE00
        R1 = C_Timer_Setting_24K_For_49MHz
        [P_TimerA_Data] = R1 			//
        
        .if BODY_TYPE == SPCE061A
        R1 = [P_INT_Mask]		//
        .endif
  //      .if BODY_TYPE == SPCE500A
   //     R1 = [R_InterruptStatus]		//
  //      .endif 
        
        //R1 = C_FIQ_TMA+C_IRQ2_TMB+C_IRQ4_1KHz
        R1 |= C_FIQ_TMA+C_IRQ2_TMB+C_IRQ4_1KHz        
   //     [R_InterruptStatus] = R1 		//
        [P_INT_Ctrl] = R1				//
        RETF


F_SP_PlayMode2_:	 						// with F_SP_SACM_MS01_Initial
		R1 = 0x00A8
        [P_DAC_Ctrl] = R1
        //R1 = 0xFD9A
        R1=C_Timer_Setting_20K_For_49MHz
        [P_TimerA_Data] = R1 				//
        
        .if BODY_TYPE == SPCE061A
        R1 = [P_INT_Mask]		//
        .endif
  //      .if BODY_TYPE == SPCE500A
  //      R1 = [R_InterruptStatus]		//
  //      .endif 
        
        //R1 = C_FIQ_TMA+C_IRQ2_TMB+C_IRQ4_1KHz
        R1 |= C_FIQ_TMA+C_IRQ2_TMB+C_IRQ4_1KHz        
   //     [R_InterruptStatus] = R1 			//
        [P_INT_Ctrl] = R1					//
        RETF

      
F_SP_PlayMode3_:							// with F_SP_SACM_MS01_Initial
		R1 = 0x00A8
        [P_DAC_Ctrl] = R1
        R1 = C_Timer_Setting_16K_For_49MHz;
        [P_TimerA_Data] = R1 			//
        
        .if BODY_TYPE == SPCE061A
        R1 = [P_INT_Mask]		//
        .endif
  //      .if BODY_TYPE == SPCE500A
  //      R1 = [R_InterruptStatus]		//
  //      .endif 
        
        //R1 = C_FIQ_TMA+C_IRQ2_TMB+C_IRQ4_1KHz
        R1 |= C_FIQ_TMA+C_IRQ2_TMB+C_IRQ4_1KHz        
//	    [R_InterruptStatus] = R1 		//
        [P_INT_Ctrl] = R1				//
        RETF


//--------------------------------------------------------------------
//-- Function: F_SP_IRQ2_ON
//-- Parameter: NONE
//-- Return: NONE
//-- Description: This function called by library to turn on IRQ2 
//--------------------------------------------------------------------
.public F_SP_IRQ2_ON
F_SP_IRQ2_ON:
		//------------------------------------------
		// By Arthur 01/16/2003 (123)
		//------------------------------------------
		.if BODY_TYPE == SPCE061A
        R1 = [P_INT_Mask]		//
        .endif
    //    .if BODY_TYPE == SPCE500A
   //     R1 = [R_InterruptStatus]		//
   //     .endif       
		//------------------------------------------	
        r1 |= C_IRQ2_TMB ;
   //     [R_InterruptStatus] = r1;				//
        [P_INT_Ctrl] = R1
retf
//--------------------------------------------------------------------
//-- Function: F_SP_IRQ2_OFF
//-- Parameter: NONE
//-- Return: NONE
//-- Description: This function called by library to turn off IRQ2 
//--------------------------------------------------------------------
.public F_SP_IRQ2_OFF
F_SP_IRQ2_OFF:
		//------------------------------------------
		// By Arthur 01/16/2003 (123)
		//------------------------------------------
		.if BODY_TYPE == SPCE061A
        R1 = [P_INT_Mask]		//
        .endif
   //     .if BODY_TYPE == SPCE500A
   //     R1 = [R_InterruptStatus]		//
   //     .endif       
		//------------------------------------------	
        r1 &= ~C_IRQ2_TMB ;
   //     [R_InterruptStatus] = r1;				//
        [P_INT_Ctrl] = R1
retf
//--------------------------------------------------------------------
//-- Function: F_SP_Send_DAC1
//-- Parameter: R4 = audio out data
//-- Return: NONE
//-- Description: This function called by library to send audio data to 
//                DAC1
//--------------------------------------------------------------------
.public F_SP_Send_DAC1
F_SP_Send_DAC1:
		[P_DAC1] = R4
		retf
//--------------------------------------------------------------------
//-- Function: F_SP_Send_DAC2
//-- Parameter: R4 = audio out data
//-- Return: NONE
//-- Description: This function called by library to send audio data to 
//                DAC1
//--------------------------------------------------------------------
.public F_SP_Send_DAC2
F_SP_Send_DAC2:
		[P_DAC2] = R4
		retf
/////////////////////////////////////////////////////////


	
//----------------------------------------------------
// DVR
//----------------------------------------------------
///////////////////////////////////////////////////////////////////////////////
// Function: The partial code of hardware setting of SACM_MS01_Initial() 
//			or F_SACM_MS01_Initial:
//
//	Ex: F_SACM_DVR_Initial:
//			...
//			call F_SP_SACM_DVR_Init_
//			call F_SP_Play_Mode0/1/2/3	->0,1,2,3 depending on the para1
//			...
//			retf
//	Ex1:
//		F_SACM_DVR_Record: (or F_SACM_DVR_InitEncoder)
//			...
//			call F_SP_SACM_DVR_Rec_Init
//			...
//			retf
//	Ex2:
//		F_SACM_DVR_Play: (or F_SACM_DVR_InitDecoder)
//			...
//			call F_SP_SACM_DVR_Play_Init_
//			...
//			retf
///////////////////////////////////////////////////////////////////////////////
F_SP_SACM_DVR_Init_:
        r1 = C_SystemClock;             // 24MHz, Fcpu=Fosc
        [P_SystemClock] = r1;           //  Frequency 20MHz
        r1 = 0x0030;                    // TimerA CKA=Fosc/2 CKB=1 Tout:off
        [P_TimerA_Ctrl] = r1;
        r1 = C_DVR_Timer_Setting;       // 8K @ 24.576MHz
        //r1 = 0xfb1d;                  // 8K @ 20MHz
        [P_TimerA_Data] = r1;
       //
       //SPCE500A setting
       // --------------------------
       .if BODY_TYPE == SPCE500A       
		R1=0x0015;	// 500A: MIC IN, Auto,AGC,Enable ADC
//		R1=0x0011;	// 500A: MIC IN, Auto ,Enable ADC
//	    R1=0x0013;	// 500A: LINE IN, Auto,Enable ADC       
        [P_ADC_Ctrl] = r1;
        r1 = 0x00AC;                    // DAC1-TMA, DAC2-TMA, ADC-TMA  
        [P_DAC_Ctrl] = r1;
        
        r1 = 0xffff;
        [P_INT_Clear] = r1;          	// Clear interrupt occuiped events

   //     R1 = [R_InterruptStatus]		//
    
        R1 |= C_FIQ_TMA					// Enable Timer A FIQ
    //    [R_InterruptStatus] = R1		//
        [P_INT_Ctrl] = R1				//
        .endif 
       
       // 
       // SPCE061A Setting   
       // --------------------------
       .if BODY_TYPE == SPCE061A  
        r1 = 0x0115;  // 061A: MIC IN, AGC,Enable ADC 
//      r1 = 0x0101;  // 061A: MIC IN, Enable ADC      
//      r1 = 0x0103;  // 061A: LINE IN, Enable ADC              
     
        [P_ADC_Ctrl] = r1;
        
		R1=0x0000					// Mic
//		R1 = 0x0001      			// Line_in 1
        [P_ADC_MUX_Ctrl] = R1
//      R1=[P_ADC_LINEIN_Data]; 
        
 //      r1 = 0x00A8;                    // 061A: DAC1-TMA, DAC2-TMA, ADC-TMA     
        r1 = 0x00A0;                    // 061A: DAC1-TMA, DAC2-TMA, ADC-Direct   
        [P_DAC_Ctrl] = r1;
        
        r1 = 0xffff;
        [P_INT_Clear] = r1;          	// Clear interrupt occuiped events
 
        R1 = [P_INT_Mask]		//
    
        R1 |= C_FIQ_TMA					// Enable Timer A FIQ
   //     [R_InterruptStatus] = R1		//
        [P_INT_Ctrl] = R1				//
        R1=[P_ADC]
        R1=[P_ADC_LINEIN_Data]  
       .endif       
        RETF




//--------------------------------------------------------------------
//-- Function: F_SP_SACM_DVR_Rec_Init_
//-- Parameter: NONE
//-- Return: NONE
//-- Description: This function called by library to set  
//                ADC and sampling rate for recording. 
//                Uaser would have to modified the function body 
//                based on the need to fulfill this request from 
//                library. 
//--------------------------------------------------------------------
F_SP_SACM_DVR_Rec_Init_:				// call by SACM_DVR_Record / SACM_DVR_InitEncoder
               	
        R1 = C_DVR_Rec_Timer_Setting    //24K @ 24.576/49.152 MHz
        [P_TimerA_Data] = r1 
		RETF
//--------------------------------------------------------------------
//-- Function: F_SP_SACM_DVR_Play_Init_
//-- Parameter: NONE
//-- Return: NONE
//-- Description: This function called by library to set  
//                ADC and sampling rate for playback. 
//                Uaser would have to modified the function body 
//                based on the need to fulfill this request from 
//                library. 
//--------------------------------------------------------------------
F_SP_SACM_DVR_Play_Init_:
	    r1 = 0x0000						// call by SACM_DVR_Stop / SACM_DVR_Play
        [P_ADC_Ctrl] = r1;       		// Disable ADC
        	
        R1 = C_DVR_Play_Timer_Setting   // 16K @ 24.576/49.152 MHz
        [P_TimerA_Data] = r1;
        RETF

//--------------------------------------------------------------------
//-- Function: F_SP_GetADC
//-- Parameter: R1 = ADC Channel
//-- Return: R1 = ADC data
//-- Description: This function called by library to get  
//                ADC data for recording. It can be from either Microphone
//                or line-in.
//                User would have to modified the function body 
//                based on the need to fulfill this request from 
//                library. 
//                User should store the value in register(R2-R5)if use them. 
//--------------------------------------------------------------------
.public F_SP_GetADC
F_SP_GetADC:
        
        cmp R1,0;
        jnz ?L_WaitLinIn;
		//For Mic
		?L_Mic:
		r1 = [P_ADC]  // from 500A/061A microphone or 500A Lin-in
        retf
		
		// For Line in
		?L_WaitLinIn:  // Wait for ADC ready    		
		.if BODY_TYPE == SPCE500A    
		r1 = [P_ADC] ; // from 500A/061A microphone or 500A Lin-in
        .endif		
        		 
		.if BODY_TYPE == SPCE061A    
        R1 = [P_ADC_MUX_Ctrl] 
        R1 &= 0x8000
        jz ?L_WaitLinIn;	
		r1 = [P_ADC_LINEIN_Data]  // from 061A line-in only
        .endif
        retf

//---------------------------------------------------------------
//Function : F_SP_SwitchChannel
//Description: This function switches the A/D channel based on 
//             the parameter. 
//Used register: r1
//Return: none
//---------------------------------------------------------------
.PUBLIC F_SP_SwitchChannel
F_SP_SwitchChannel: .proc
 push R2 to [sp]
 //
 // SPCE500A Setting
 //
  .if BODY_TYPE == SPCE500A
 // Check if microphone selected
 cmp R1,0;
 jnz ?L_LineIn;
 
 // Wait for ADC ready
 ?L_Wait_AD_ready_0:
   R1=0x0015;	// 500A: MIC IN, Auto,AGC,Enable ADC
   [P_ADC_Ctrl] = r1;
    jmp ?L_Done;
 
 // Wait for ADC ready
 ?L_LineIn:	
   R1=0x0013;	// 500A: LINE IN, Auto,Enable ADC       
   [P_ADC_Ctrl] = r1;
 
 ?L_Done:
 .endif
 //
 // SPCE500A Setting
 //
 .if BODY_TYPE == SPCE061A
 // Check if microphone selected
 cmp R1,0;
 jnz ?L_LineIn;
 
 // Wait for ADC ready
 ?L_Wait_AD_ready_0:
 r2 = [P_ADC_Status];
 r2 = r2 & 0x8000;
 jz  ?L_Wait_AD_ready_0
 r2 = 0x0115;  // 061A: Mic, Enable ADC              
 [P_ADC_Ctrl] = r2; 
 [P_ADC_MUX_Ctrl] = R1; // Switch channel to Mic
 R2 = [P_ADC]
 jmp ?L_Done;
 
 // Wait for ADC ready
 ?L_LineIn:	
 ?L_Wait_AD_ready_1:
 r2 = [P_ADC_Status];
 r2 = r2 & 0x8000;
 jz  ?L_Wait_AD_ready_1
   
 r2 = 0x0113;  // 061A: LINE IN, Enable ADC              
 [P_ADC_Ctrl] = r2; 
 
 [P_ADC_MUX_Ctrl] = R1; // Switch channel to Line_in
 R2 = [P_ADC_LINEIN_Data]; 
 
 ?L_Done:
 .endif
 pop R2 from [sp];
 retf;

.ENDP
///////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
// Functions: Reserve old defintion
// Note: Some user who use old library may use the old name
//////////////////////////////////////////////////////////////////
.DEFINE F_RampUpDAC1 F_SP_RampUpDAC1
.DEFINE F_RampDnDAC1 F_SP_RampDnDAC1
.DEFINE F_RampUpDAC2 F_SP_RampUpDAC2
.DEFINE F_RampDnDAC2 F_SP_RampDnDAC2

.DEFINE _STD_RampUpDAC1 _SP_RampUpDAC1
.DEFINE _STD_RampDnDAC1 _SP_RampDnDAC1
.DEFINE _STD_RampUpDAC2 _SP_RampUpDAC2
.DEFINE _STD_RampDnDAC2 _SP_RampDnDAC2
                
//========================================================================================        
// End of sacmv32.asm
//========================================================================================



        
        
        