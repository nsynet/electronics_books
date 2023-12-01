//////////////////////////////////////////////////////////////////
// Function: System commander                     
// 	Service for H/W, keyboard scan
// Input: None
// Output: None

// Functions:
//	(In Assembly view)
// 	call F_System_Initial; 
//	(In C language view)
// 	System_Initial(); 
//////////////////////////////////////////////////////////////////

.include resource.inc;
.include spce.inc;
.include key.inc;
.EXTERNAL	R_InterruptStatus 

.public R_SpeechType;
.RAM
.VAR R_SpeechType;

.CODE
.public _System_Initial;
.public	F_System_Initial;
_System_Initial: .PROC
F_System_Initial:
	call	F_User_Init_IO;				//	
//	R1 = 0							// The interrupt is controlled by user
	R1=C_FIQ_TMA
	[R_InterruptStatus] = R1		//
	[P_INT_Ctrl] = R1				//
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
        
    
F_User_Init_IO:
	r1 = 0xfff0; 						//hi Led, low key      
    [P_IOA_Attrib] = r1;       
    [P_IOA_Dir] = r1;   
    [P_IOA_Data] = r1;

//Set IOB7 as Input Floating, IOB10 as Output Buffer Low
	R1 = 0xFF7F;
	[P_IOB_Dir] = R1;
	R1 = 0xFFFF;		
	[P_IOB_Attrib] = R1;
    R1 = 0x0003;	       
    [P_IOB_Data] = R1;  


 
//	Add by sls
          
    R1 = 0x00C3;
    [P_SIO_Ctrl] = R1;
 
//	R1 = 0x0060;                         //
//  [P_IOA_Buffer] = R1;                 // b7 reserved, *CS=1, *OE=1, *WE=0
    retf;   
    
/////////////////////////////////////////////////////

//**************************************//
//128Hz时基信号中断的初始化函数
//函数名称：   SP_INT_128Hz()
//*************************************//
.public _SP_INT_128Hz;
 _SP_INT_128Hz:
     R1 = 0x0000;
     [P_TimeBase_Setup]=r1              //TMB2选择128HZ	
     r1 = 0x0001 						//开中断IRQ6_TMB2
	 [P_INT_Ctrl]= r1 
	 int IRQ
     retf;
       
//**************************************//
//开中断函数
//函数名称   Open_Interrupt（）
//**************************************//   
.public _Open_Interrupt
 _Open_Interrupt:
     int irq,fiq
     retf
 //***************************************//
 //关中断函数
 //函数名称  Close_Interrupt
 //***************************************//    
.public _Close_Interrupt
_Close_Interrupt:
     int off ;
  retf          