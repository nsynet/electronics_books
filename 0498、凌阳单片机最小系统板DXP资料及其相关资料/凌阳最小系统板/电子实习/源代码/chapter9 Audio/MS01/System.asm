//////////////////////////////////////////////////////////////////
// Function: System commander                     
// 	Service for H/W, keyboard scan, watchdog clear
// By Arthur Shieh
// Platform: SPCE061A,unSP IDE 1.642, Windows 2000
// Date: 	2002.11.22		:First version
//
// Input: None
// Output: None

// Functions:
//	call F_System_Initial;
//	call F_WatchdogClear;
// 	call F_System_ServiceLoop;
//  call F_User_Init_IO;
//
// API:
// 	System_Initial();      : Initial system
//  WatchdogClear();       : Clear watchdog
//  System_ServiceLoop();  : Key scan, watchdog clear
//////////////////////////////////////////////////////////////////
.include spce.inc;
.include sp_lib.inc;

.external F_SACM_MS01_SetInstrument;
.external F_SACM_MS01_ChannelOn;
.external F_SACM_MS01_ChannelOff;

.external R_InterruptStatus

.public _System_Initial;
.public	F_System_Initial;

.CODE

//****************************************************************
// Function: System initial setting                    
// Input: None
// Output: None
// Syntax:
// 	call F_System_Initial; (in assembly domain)
//  System_Initial(); (in C domain) 	
//****************************************************************
_System_Initial: .PROC
F_System_Initial:
  		//push	BP to [SP];				//add if some parameters in
  		//BP = SP + 1;
		//r1 = [BP+3];

		call	F_Key_Scan_Initial;			// For keyboard scan
		call	F_User_Init_IO;				// User define IO
		// Add other general initialization here

		R1 = C_FIQ_TMA+C_IRQ2_TMB+C_IRQ4_1KHz		//	Interrupt is controlled by user
		[R_InterruptStatus] = R1			//
		[P_INT_Ctrl] = R1					//

		//r1 =0x0001;						// return value
		//pop		BP from [SP];		
		retf;
		.ENDP;

//****************************************************************
// Function: Main Loop of system                     
// Input: None
// Output: None
// Using:
// 	call F_System_ServiceLoop; (in assembly domain)
//  System_ServiceLoop(); (in C domain) 	
//****************************************************************
.public _System_ServiceLoop;
.public	F_System_ServiceLoop;
_System_ServiceLoop: .PROC                  
F_System_ServiceLoop:
		call	F_Key_DebounceCnt_Down;		// calling debounce subroutine for key scan subroutine
		call    F_Key_Scan_ServiceLoop;		// calling key scan subroutine 
		// Add other general service functions here		
		R1=0x0001;                      // Clear watch dog
		[P_Watchdog_Clear]=R1;       	//
        retf;
        .ENDP;
//****************************************************************
// Function: I/O initial setting                    
// Input: None
// Output: None
// Syntax:
// 	call F_User_Init_IO; (in assembly domain)
//****************************************************************         
F_User_Init_IO:        
		r1 = 0x0000;					// IOA[15..0] input
        [P_IOA_Dir] = r1;				// 
        [P_IOA_Attrib] = r1;
        [P_IOA_Data] = r1;
        
        r1 = 0xFFFF;					// IOB[15..0] output
        [P_IOB_Dir] = r1;				// 
        [P_IOB_Attrib] = r1;			
        [P_IOB_Data] = r1;    
        retf;            