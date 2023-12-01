//========================================================================================
// Progarm: Standard function definition
// Writen by: Andy
//
// Last modified date: 
// 		2000/06/23: first version
//		2000/07/15: modified
//		2000/07/24: modified
//
// Note: update hardware.inc with hardware.asm synchorously.
//	
//
//========================================================================================

.PUBLIC F_SP_Send_PWM;
.PUBLIC F_SP_Send_DAC1;
.PUBLIC F_SP_Send_DAC2;
.PUBLIC F_SP_Send_Two_DAC;
.PUBLIC F_SP_Send_Out;
.public F_SP_Get_ADC;
.PUBLIC F_SP_Set_P_TimerA_Ctrl	
.PUBLIC F_SP_Set_P_TimerA_Data
.PUBLIC F_SP_Set_P_TimerB_Ctrl	
.PUBLIC F_SP_Set_P_TimerB_Data
.PUBLIC F_SP_Set_P_INT_Ctrl
.PUBLIC F_SP_Set_P_INT_Clear
.PUBLIC F_SP_Set_P_SystemClock
.PUBLIC F_SP_Set_P_DAC_Ctrl
.PUBLIC F_SP_Set_P_ADC_Ctrl
.PUBLIC F_SP_Write_INT_Status;        
.PUBLIC F_SP_Read_INT_Status;				
.public	F_SP_RampUpDAC1;
.public	F_SP_RampDnDAC1;
.public	F_SP_RampUpDAC2;
.public	F_SP_RampDnDAC2;
.public	_SP_RampUpDAC1;
.public	_SP_RampDnDAC1;
.public	_SP_RampUpDAC2;
.public	_SP_RampDnDAC2;
.public F_SP_Delay;
.public	F_SP_InitQueue;
.public	F_SP_ReadQueue;
.public	F_SP_WriteQueue;	
.public F_SP_TestQueue;
.PUBLIC _SP_Export; 
.PUBLIC	_SP_Import;
.PUBLIC _SP_Init_IOB;
.PUBLIC _SP_Init_IOA;

.public	_SP_GetResource	
//////////////////////////////////////////////////////////////////
// Define Area for I/O									
//////////////////////////////////////////////////////////////////
.DEFINE	P_IOA_Data   		0x7000;        // Write Data into data register and read from IOA pad
.DEFINE P_IOA_Buffer        0x7001;        // Write Data into buffer register and read from buffer register
.DEFINE P_IOA_Dir           0x7002;        // Direction vector for IOA
.DEFINE P_IOA_Attrib        0x7003;        // Attribute vector for IOA
.DEFINE P_IOA_Latch         0x7004;        // Latch PortA data for key change wake-up

.DEFINE P_IOB_Data         	0x7005;        // Write Data into the data register and read from IOB pad
.DEFINE P_IOB_Buffer        0x7006;        // Write Data into buffer register and read from buffer register
.DEFINE P_IOB_Dir           0x7007;        // Direction vector for IOB
.DEFINE P_IOB_Attrib        0x7008;        // Attribute vector for IOB

.DEFINE P_FeedBack          0x7009;        // Clock form external R,C
.DEFINE P_TimerA_Data       0x700A;        // Data port for TimerA 
.DEFINE P_TimerA_Ctrl       0x700B;        // Control Port for TimerA
.DEFINE P_TimerB_Data       0x700C;        // Data port for TimerB
.DEFINE P_TimerB_Ctrl       0x700D;        // Control Port for TimerB
.DEFINE P_TimeBase_Setup    0x700E;        // TimerBase Freq. Set
.DEFINE P_TimeBase_Clear	0x700F;		   // Reset Timerbase counter
.DEFINE P_INT_Ctrl          0x7010;        // Control port for interrupt source
.DEFINE P_INT_Clear         0x7011;        // Clear interrupt source
.DEFINE P_Watchdog_Clear    0x7012;        // Watchdog Reset
.DEFINE P_SystemClock       0x7013;        // Change system clock frequency(include go to standby mode)


//... PA6442 New version MC52A (For EC-03)....
.DEFINE P_ADC 	        	0x7014;        	// Data Port for AD
.DEFINE P_ADC_Ctrl          0x7015;        	// Control Port for AD control
.DEFINE P_ADC_Status        0x7015;        	// AD Port Status
.DEFINE P_DAC2              0x7016;        	// Data Port for DAC2
.DEFINE P_PWM               0x7016;        	// Data Port for PWM
.DEFINE P_DAC1	        	0x7017;        	// Data Port for DAC1
.DEFINE P_DAC_Ctrl			0x702A;			// Control Port for two DAC and audio output mode
//............................................

.DEFINE P_IR_Ctrl			0x7018;			// Control Port for IR
.DEFINE P_LVD_Ctrl          0x7019;        	// Control Port for LVD

.DEFINE P_SIO_Addr_Low		0x701B;			// Address Port low
.DEFINE P_SIO_Addr_Mid		0x701C;			// Address Port middle
.DEFINE P_SIO_Addr_High	 	0x701D;			// Address Port high
.DEFINE P_SIO_Ctrl			0x701E;			// Control Port
.DEFINE P_SIO_Start			0x701F;			// Start port for serial interface
.DEFINE P_SIO_Stop			0x7020;			// Stop port for serial interface

.DEFINE P_UART_Command1		 0x7021;		// Command1 Port for UART
.DEFINE P_UART_Command2		 0x7022;		// Command2 Port for UART
.DEFINE P_UART_Data			 0x7023; 		// Data Port for UART
.DEFINE	P_UART_BaudScalarLow 0x7024;		// Set Baud Rate scalar low
.DEFINE	P_UART_BaudScalarHigh 0x7025;		// Set Baud Rate scalar high


// Define for P_INT_Ctrl 
.DEFINE C_IRQ_TMB2              0x0001;        //Timer B IRQ6
.DEFINE C_IRQ_TMB1              0x0002;        //Timer A IRQ6
.DEFINE C_IRQ_2Hz               0x0004;        //2Hz IRQ5
.DEFINE C_IRQ_4Hz               0x0008;        //4Hz IRQ5
.DEFINE C_IRQ_1024Hz            0x0010;        //1024Hz IRQ4
.DEFINE C_IRQ_2048Hz            0x0020;        //2048 IRQ4
.DEFINE C_IRQ_4096Hz            0x0040;        //4096 IRQ4
.DEFINE C_IRQ_KeyChange         0x0080;        //Key Change IRQ3
.DEFINE C_IRQ_Ext1              0x0100;        //Ext1 IRQ3
.DEFINE C_IRQ_Ext2              0x0200;        //Ext2 IRQ3
.DEFINE C_IRQ_TimerB            0x0400;        //Timer B IRQ2
.DEFINE C_FIQ_TimerB            0x0800;        //Timer B FIQ
.DEFINE C_IRQ_TimerA            0x1000;        //Timer A IRQ1
.DEFINE C_FIQ_TimerA            0x2000;        //Timer A FIQ
.DEFINE C_IRQ_PWM               0x4000;        //PWM IRQ0
.DEFINE C_FIQ_PWM               0x8000;        //PWM FIQ

// Define for P_TimerA_Ctrl, P_TimerB_Ctrl                               
.DEFINE	C_Fosc_2				0x0000;			// Timer A
.DEFINE	C_Fosc_256		   	 	0x0001;			//
.DEFINE	C_32768Hz				0x0002;			//
.DEFINE	C_8192Hz				0x0003;			//
.DEFINE	C_4096Hz				0x0004;			//
.DEFINE	C_A1					0x0005;			//
.DEFINE C_A0					0x0006;			//
.DEFINE C_Ext1					0x0007;			//

.DEFINE	C_2048Hz				0x0000;			//
.DEFINE	C_1024Hz				0x0008;			//
.DEFINE	C_256Hz					0x0010;			//
.DEFINE	C_TMB1Hz				0x0018;			//
.DEFINE	C_4Hz					0x0020;			//
.DEFINE	C_2Hz					0x0028;			//
.DEFINE	C_B1					0x0030;			//
.DEFINE	C_Ext2					0x0038;			//

.DEFINE	C_Off					0x0000;			//
.DEFINE C_D1					0x0040;			//
.DEFINE C_D2					0x0080;			//
.DEFINE C_D3					0x00C0;			//
.DEFINE C_D4					0x0100;			//
.DEFINE C_D5					0x0140;			//
.DEFINE C_D6					0x0180;			//
.DEFINE C_D7					0x01C0;			//
.DEFINE C_D8					0x0200;			//
.DEFINE C_D9					0x0240;			//
.DEFINE C_D10					0x0280;			//
.DEFINE C_D11					0x02C0;			//
.DEFINE C_D12					0x0300;			//
.DEFINE C_D13					0x0340;			//
.DEFINE C_D14					0x0380;			//
.DEFINE C_TA_Div_2				0x03C0;			// Timer A

.DEFINE C_TB_Div_2				0x03C0;			// Timer B

// Define for P_SystemClock
.DEFINE C_Fosc					0x0000;			// b3..b0
.DEFINE C_Fosc_Div_2			0x0001;			//
.DEFINE C_Fosc_Div_4			0x0002;			//
.DEFINE C_Fosc_Div_8			0x0003;			// (default)
.DEFINE C_Fosc_Div_16			0x0004;			//
.DEFINE C_Fosc_Div_32			0x0005;			//
.DEFINE C_Fosc_Div_64			0x0006;			//
.DEFINE C_Sleep					0x0007;		 	//

.DEFINE	C_32K_Work				0x0000;			// b4
.DEFINE C_32K_Off				0x0000;			// 
.DEFINE C_StrongMode			0x0000;			// b5
.DEFINE C_AutoMode				0x0000;			//

// Define for P_AD_Ctrl
.DEFINE	C_AD					0x0001;			//
.DEFINE C_DA					0x0000;			//
.DEFINE C_MIC					0x0000;			//
.DEFINE C_LINE					0x0002;			//

// Define for P_DA_Ctrl
.DEFINE C_PushPull				0x0000;			// b0, (default) 
.DEFINE C_DoubleEnd				0x0001;			// b0
.DEFINE	C_DAC_Mode				0x0000;			// b1, (default)
.DEFINE C_PWM_Mode				0x0002;			// b1

.DEFINE	C_D1_Direct				0x0000;			// DAC1 latch
.DEFINE C_D1_LatchA				0x0008;			// 
.DEFINE C_D1_LatchB				0x0010;			//
.DEFINE C_D1_LatchAB			0x0018;			//

.DEFINE	C_D2_Direct				0x0000;			// DAC2 latch
.DEFINE C_D2_LatchA				0x0020;			// 
.DEFINE C_D2_LatchB				0x0040;			//
.DEFINE C_D2_LatchAB			0x00C0;			//

// Define for P_LVD_Ctrl
.DEFINE C_LVD24V				0x0000;			// LVD = 2.4V 
.DEFINE C_LVD28V				0x0001;			// LVD = 2.8V
.DEFINE C_LVD32V				0x0002;			// LVD = 3.2V
.DEFINE C_LVD36V				0x0003;			// LVD = 3.6V


.IRAM
.public	R_InterruptStatus;					//
.VAR	R_InterruptStatus = 0;					// for feature using
.public R_FIQTemp;
.VAR	R_FIQTemp;							// for temparity used in FIQ interrupt routine


.define C_QueueSize 50						// update hardware.inc synchoroneously
.VAR 	R_Queue;
.DW		C_QueueSize-1	DUP(0);
.VAR	R_ReadIndex;
.VAR	R_WriteIndex;

.CODE

//////////////////////////////////////////////////////////////////
// Function: Send data to speech driver(PWM/DAC)                                   
// Destory register: r4                                            
//////////////////////////////////////////////////////////////////        

F_SP_Send_PWM:    							//
       [P_PWM] = r4;						//
       retf;           						//

F_SP_Send_DAC1:								//
		[P_DAC1] = r4;						//
		retf;        						//
F_SP_Send_DAC2:								//
		[P_DAC2] = r4;						//
		retf;        						//
F_SP_Send_Two_DAC:
		[P_DAC1] = r4;						//
		[P_DAC2] = r4;						//
		retf;

//.DEFINE	F_SP_Send_Out  F_SP_Send_PWM;
//.DEFINE	F_SP_Send_Out  F_SP_Send_DAC1;
//.DEFINE	F_SP_Send_Out  F_SP_Send_DAC2;
.DEFINE	F_SP_Send_Out  F_SP_Send_Two_DAC;		// Send to both DAC1 and DAC2


F_SP_Get_ADC:
		R4 = [P_ADC]
		retf


F_SP_Set_P_TimerA_Ctrl:
	[P_TimerA_Ctrl] = R1
	RETF
F_SP_Set_P_TimerA_Data:
	[P_TimerA_Data] = R1
	RETF
F_SP_Set_P_TimerB_Ctrl:
	[P_TimerB_Ctrl] = R1
	RETF
F_SP_Set_P_TimerB_Data:
	[P_TimerB_Data] = R1
	RETF

F_SP_Set_P_INT_Ctrl:
	[P_INT_Ctrl] = R1
	RETF
F_SP_Set_P_INT_Clear:
	[P_INT_Clear] = R1
	RETF

F_SP_Set_P_SystemClock:
	[P_SystemClock] = R1
	RETF

F_SP_Set_P_DAC_Ctrl:
	[P_DAC_Ctrl] = R1
	RETF	

F_SP_Set_P_ADC_Ctrl:
	[P_ADC_Ctrl] = R1
	RETF

//////////////////////////////////////////////////////////////////
// Function: Interrupt vector setting
// Used register: R1                                                                                    
////////////////////////////////////////////////////////////////// 

F_SP_Write_INT_Status:						//write interrupt status
        [R_InterruptStatus] = R1;       	//
        retf;								
        
F_SP_Read_INT_Status:						//read interrupt status
        R1 = [R_InterruptStatus];       	//
        retf;



////////////////////////////////////////////////////////////////// 
//
//////////////////////////////////////////////////////////////////    
_SP_Init_IOA: .PROC
		PUSH BP,BP TO [SP];
        BP = SP + 1;
		PUSH R1,R1 TO [SP];
		R1 = [BP+3];						// Port direction
		[P_IOA_Dir] = R1;
		R1 = [BP+4];
		[P_IOA_Data] = R1;
		R1 = [BP+5];
		[P_IOA_Attrib] = R1;
		
		POP R1,R1 FROM [SP];
        POP BP,BP FROM [SP];
        RETF;
		.ENDP

////////////////////////////////////////////////////////////////// 
// SP_Inti_IOB
//////////////////////////////////////////////////////////////////    

_SP_Init_IOB: .PROC
		PUSH BP,BP TO [SP];
        BP = SP + 1;
		PUSH R1,R1 TO [SP];
		R1 = [BP+3];						// Port direction
		[P_IOB_Dir] = R1;
		R1 = [BP+4];
		[P_IOB_Data] = R1;
		R1 = [BP+5];
		[P_IOB_Attrib] = R1;
		
		POP R1,R1 FROM [SP];
        POP BP,BP FROM [SP];
        RETF;
		.ENDP



_SP_Import: .PROC
        PUSH BP,BP TO [SP];
        BP = SP + 1;
		PUSH R1,R2 TO [SP];
		R1 = [BP+3]; 						// Port Number
		R2 = [BP+4]; 						// Data Buffer Pointer
		R1 = [R1] ;
		[R2] = R1 ;
		POP R1,R2 FROM [SP];
        POP BP,BP FROM [SP];
        RETF;
		.ENDP

_SP_Export: .PROC
        PUSH BP,BP TO [SP];
        BP = SP + 1;
		PUSH R1,R2 TO [SP];
		R1 = [BP+3]; 						// Port Number
		R2 = [BP+4]; 						// Value
		[R1] = R2 ;
		POP R1,R2 FROM [SP];
        POP BP,BP FROM [SP];
        RETF;        
 		.ENDP
		 


	 
///////////////////////////////////////
_SP_RampUpDAC1:	.PROC
F_SP_RampUpDAC1:
                push r1,r2 to [sp];
                r1=[P_DAC1];
                r1 &= ~0x003f;
                cmp     r1,0x8000
                jb     	L_RU_NormalUp;  
                je      L_RU_End;
                
L_RU_DownLoop:
                call    F_Delay;        
                r2 = 0x0001;
                [P_Watchdog_Clear] = r2;
                r1 -= 0x40;
                [P_DAC1] = r1;
                cmp     r1,0x8000;
                jne     L_RU_DownLoop;  
L_RD_DownEnd:
                jmp     L_RU_End;

L_RU_NormalUp:
L_RU_Loop:
                call    F_Delay;
                r2 = 0x0001;
                [P_Watchdog_Clear] = r2;
                r1 += 0x40;
                [P_DAC1] = r1;
                cmp     r1, 0x8000;
                jne     L_RU_Loop;
                

L_RU_End:
                pop     r1,r2 from [sp];
                retf;
                .ENDP
/////////////////////////////////////// 
_SP_RampDnDAC1:	.PROC
F_SP_RampDnDAC1:
				push r1,r2 to [sp];
                //int off;
                r1 = [P_DAC1];
                r1 &= ~0x003F;
                jz      L_RD_End;
L_RD_Loop:                
                call    F_Delay;        
                r2 = 0x0001;
                [P_Watchdog_Clear] = r2;
                r1 -= 0x40;
                [P_DAC1] = r1;  
                jnz     L_RD_Loop;
L_RD_End:       
                
                pop     r1,r2 from [sp];
                retf;
				.ENDP

///////////////////////////////////////
_SP_RampUpDAC2:	.PROC
F_SP_RampUpDAC2:
                push r1,r2 to [sp];
                r1=[P_DAC2];
                r1 &= ~0x003f;
                cmp     r1,0x8000
                jb     	L_RU_NormalUp_;  
                je      L_RU_End;
                
L_RU_DownLoop_:
                call    F_Delay;        
                r2 = 0x0001;
                [P_Watchdog_Clear] = r2;
                r1 -= 0x40;
                [P_DAC2] = r1;
                cmp     r1,0x8000;
                jne     L_RU_DownLoop_;  
L_RD_DownEnd_:
                jmp     L_RU_End_;

L_RU_NormalUp_:
L_RU_Loop_:
                call    F_Delay;
                r2 = 0x0001;
                [P_Watchdog_Clear] = r2;
                r1 += 0x40;
                [P_DAC2] = r1;
                cmp     r1, 0x8000;
                jne     L_RU_Loop_;
                

L_RU_End_:
                pop     r1,r2 from [sp];
                retf;
                .ENDP
/////////////////////////////////////// 
_SP_RampDnDAC2:	.PROC
F_SP_RampDnDAC2:
				//int off;
				push r1,r2 to [sp];
                
                r1 = [P_DAC2];
                r1 &= ~0x003F;
                jz      L_RD_End_;
L_RD_Loop_:                
                call    F_Delay;        
                r2 = 0x0001;
                [P_Watchdog_Clear] = r2;
                r1 -= 0x40;
                [P_DAC2] = r1;  
                jnz     L_RD_Loop_;
L_RD_End_:       
                
                pop     r1,r2 from [sp];
                retf;
				.ENDP
////////////////////////////////////////

F_Delay:
                push r1 to [sp];
                r1 = 8;
L_D_Loop:
                r1 -= 1;
                jnz     L_D_Loop; 
                pop     r1 from [sp];
                retf;	 
                
                
///////////////////////////////////////////
// Function: Initial Queue
// Destory: R1,R2
///////////////////////////////////////////	

F_SP_InitQueue:
		R1 = R_Queue;
		R2 = 0;
L_ClearQueueLoop:		
		[R1++] = R2;
		cmp	R1, R_Queue+C_QueueSize;
		jne	L_ClearQueueLoop;
			
		R1 = 0;
		[R_ReadIndex] = R1;
		[R_WriteIndex] = R1;
				
		retf;
		
///////////////////////////////////////////
// Function: Get a data form Queue
// Output:  R1: Data
//			R2: return value
// Destory: R1,R2
///////////////////////////////////////////		
F_SP_ReadQueue:

		R2 = [R_ReadIndex];
		cmp R2,[R_WriteIndex];
		je	L_RQ_QueueEmpty;

		R2 += R_Queue;				// get queue data address
		R1 = [R2];
		
		R2 = [R_ReadIndex];
		R2 += 1;
		cmp	R2, C_QueueSize;
		jne	L_RQ_NotQueueBottom;
		R2 = 0;
L_RQ_NotQueueBottom:	
		[R_ReadIndex] = R2;			
		//r2 = 0x0000;						// get queue data
		retf;

L_RQ_QueueEmpty:
		//r2 = 0x8000;						// queue empty
		retf;
///////////////////////////////////////////
// Function: Put a data to Queue
// R1: Input
// Destory: R1,R2,R3
///////////////////////////////////////////	
			
F_SP_WriteQueue:
		R2 = [R_WriteIndex];			// put data to queue
		R2 += R_Queue;
		[R2] = R1;

		R2 = [R_WriteIndex];
		R2 += 1;
		cmp	R2, C_QueueSize;
		jne	L_WQ_NotQueueBottom;
		R2 = 0;
L_WQ_NotQueueBottom:
		[R_WriteIndex] = R2;
		retf;
		
//..........................................
F_SP_TestQueue:
		//... Test Queue Empty ...
		R1 = [R_ReadIndex];
		cmp R1,[R_WriteIndex];
		je	L_TQ_QueueEmpty;

		//... Test Queue Full ...
		R1 = [R_ReadIndex];				// For N Queue Full: 1. W=R-1 2.R=0/W=N-1
		jnz	L_TQ_JudgeCond2;
		R1 = [R_WriteIndex];
		cmp	R1, C_QueueSize-1;			// Cond1
		je	L_TQ_QueueFull;			
L_TQ_JudgeCond2:		
		R1 = [R_ReadIndex];
		R1 -=1;
		cmp R1,[R_WriteIndex];
		je	L_TQ_QueueFull;	

		r1 = 0;							// not Full, not empty
		retf;
L_TQ_QueueFull:
		r1 = 1;							// full
		retf;
L_TQ_QueueEmpty:
		r1 = 2;							// empty
		retf;
//.........................................                

//////////////////////////////////////////////////////
// SACM_GetResource(Address,Page,offset);
//////////////////////////////////////////////////////

_SP_GetResource:	.PROC
		push bp to [sp];
		bp = sp + 1;
		//push r2 to [sp];
		r1 = [bp+3];					// address
		r2 = [bp+4];					// bank
		
		r2 = r2 lsl 4;
		r2 = r2 lsl 4;
		r2 = r2 lsl 2;
		
		sr &= 0x03f;
        r2 |=sr;
        sr = r2;
  
  		r1 = D:[r1];
       
		//pop	r2 from [sp];
		pop	 bp from [sp];
		retf;
		.ENDP 

_SP_Delay:	.PROC
F_SP_Delay:


		retf;
		.ENDP
                
//========================================================================================        
// End of hardware.asm
//========================================================================================



        
        
        