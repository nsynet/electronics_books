//========================================================================================
// Progarm: The asm file for sp_lib.asm in assembly view V1.2
// Arranged by: Arthur Shieh
// Last modified date: 
// 		2000/06/23: first version(Hardware.asm)
//		2000/07/20: V1.1 modified(Hardware.asm)
//      2002/09/29: V1.2 change hardware.asm to spcexxx.inc  
//
// Functions:
//  F_Key_Scan_Initial;
//  F_Key_Scan_ServiceLoop;
//  F_Key_DebounceCnt_Down;
//
//	call F_SP_GetCh;	
//  
//  I/O APIs:
//  SP_Import(Port Number,Data Buffer Pointer);
//  SP_Export(Port Number,value);
//  SP_Init_IOA(Dir,Data,Attrib);
//  SP_Init_IOB(Dir,Data,Attrib);	
//========================================================================================

.include spce.inc
//---------------------------------------------------------- 

// Key APIs
.PUBLIC	F_Key_Scan_Initial;
.PUBLIC F_Key_Scan_ServiceLoop;
.PUBLIC F_Key_Scan_ServiceLoop_2;
.PUBLIC F_Key_DebounceCnt_Down;
.PUBLIC _SP_GetCh;
.PUBLIC	F_SP_GetCh;
.PUBLIC R_KeyStrobe;

// I/O API
.PUBLIC _SP_Export; 
.PUBLIC	_SP_Import;
.PUBLIC _SP_Init_IOB;
.PUBLIC _SP_Init_IOA;
//////////////////////////////////////////////////////////////////
// RAM Define Area								
//////////////////////////////////////////////////////////////////
.RAM
.VAR	R_DebounceReg;						//for keyboard scan
.DEFINE C_DebounceCnt			0x0008;		

.VAR	R_DebounceCnt;						//for keyboard scan
.VAR	R_KeyBuf;							//for keyboard scan
.VAR	R_KeyStrobe;						//for keyboard scan

.CODE
//////////////////////////////////////////////////////////////////
// Function: Initialization for F_Key_Scan_ServiceLoop
//////////////////////////////////////////////////////////////////     
F_Key_Scan_Initial:
		r1 = 0x0000;					//
		[R_DebounceReg] = r1;			//
		[R_KeyBuf] = r1; 				//
		[R_KeyStrobe] = r1;				//
		r1 = C_DebounceCnt;				//
		[R_DebounceCnt] = r1;			//reset debounce counter
		retf;

//////////////////////////////////////////////////////////////////
// Function: Get Key code from key pad(8 x 1 key pad)
// Input: Port IOA b7-b0
// Output: R_KeyStrobe b7-b0
//          | 	  |     |     | 
// +Vcc --- x --- x ... x --- x ---   
//          |     |     |     |
//          IOA.7             IOA.0
// Note: 1)link F_DebounceCntDown is necessary 
// Destory register: r1, r2                                            
////////////////////////////////////////////////////////////////// 
F_Key_Scan_ServiceLoop:
		
     	r1 = [P_IOA_Data];			// get key data from IOA   
    	//r1 = [P_IOB_Data];			// get key data from IOB
	    	
        r1 = r1 and 0xff;				//
        r2 = [R_DebounceReg];			//
        [R_DebounceReg] = r1;			//
        cmp r2,[R_DebounceReg];			//
        je	L_KS_StableTwoSample;		//
        
        r1 = C_DebounceCnt;				//debounce time setting
        [R_DebounceCnt] = r1;			//
        retf;							//
        
L_KS_StableTwoSample:
		r1 = [R_DebounceCnt];			//
		jz	L_KS_StableOverDebounce;	//
		retf;
	
L_KS_StableOverDebounce:        
		[R_DebounceCnt] = r1;			//
		r2 = [R_DebounceReg];			//
		r1 = [R_KeyBuf];				//
		[R_KeyBuf] = r2;				//
		r1 = r1 xor 0x00ff;				//
		r1 = r1 and [R_KeyBuf];			//
		r1 = r1 and 0x00ff;				//
		r1 = r1 or [R_KeyStrobe];		//
		[R_KeyStrobe] = r1;				//save stable key code to R_KeyStrobe
		retf;		
	
//////////////////////////////////////////
// 
//////////////////////////////////////////
F_Key_Scan_ServiceLoop_2:
	
	
		r1 = [P_IOA_Buffer];			// PortA.7 low(scan line +Vcc)
		r1 &= 0xFF7F;		
		[P_IOA_Buffer] = r1;
		
     	r1 = [P_IOA_Data];			// get key data from IOA   
    	//r1 = [P_IOB_Data];			// get key data from IOB
    	r1 &= 0x000F;					//
	    r2 = r1; 						// key from +Vcc
    	r3 = r2 xor 0xffff;				// Be a +Vcc mask
    
    	// delay here
	    nop;
    	nop;
    	nop;
	    
	 	r1 = [P_IOA_Buffer];			// PortA.7 high(scan line)
		r1 |= 0x0080;					//
		[P_IOA_Buffer] = r1;			//	
		   
		r1 = [P_IOA_Data];				//
		//r1 = [P_IOB_Data];			// get key data from IOB
		r1 &= 0x000F;					//
		r1 ^= r2;						// possible bits by scan line
		r1 &= r3;						// do +Vcc mask   
		
		r1 = r1 lsl 4;					//
		r1 |= r2;						//
    	//r2 = r2 lsl 4;				//
		//r1 |= r2;						//	    	
		    
        r1 = r1 and 0xFF;				// mask bit[0..7]
        
        r2 = [R_DebounceReg];			//
        [R_DebounceReg] = r1;			//
        cmp r2,[R_DebounceReg];			//
        je	L_KS_StableTwoSample_2;		//
        
        r1 = C_DebounceCnt;				//debounce time setting
        [R_DebounceCnt] = r1;			//
        retf;							//
        
L_KS_StableTwoSample_2:
		r1 = [R_DebounceCnt];			//
		jz	L_KS_StableOverDebounce_2;	//
		retf;
	
L_KS_StableOverDebounce_2:        
		[R_DebounceCnt] = r1;			//
		r2 = [R_DebounceReg];			//
		r1 = [R_KeyBuf];				//
		[R_KeyBuf] = r2;				//
		r1 = r1 xor 0x00ff;				//
		r1 = r1 and [R_KeyBuf];			//
		r1 = r1 and 0x00ff;				//
		r1 = r1 or [R_KeyStrobe];		//
		[R_KeyStrobe] = r1;				//save stable key code to R_KeyStrobe
		retf;

//////////////////////////////////////////////////////////////////
// Function: debounce counter down count
//////////////////////////////////////////////////////////////////
F_Key_DebounceCnt_Down:
		r1 = [R_DebounceCnt];			// Debounce subroutine for F_IO_Key_Scan:
		jz	L_DebounceCntZero;			// stop count if zero
		r1 -= 0x0001;					//
		[R_DebounceCnt] = r1;			//
L_DebounceCntZero:						//
		retf;  							//	


//****************************************************************
// Function: Get Keycode for I/O Port                                 
// Destory register: r1, r2                          
//****************************************************************
_SP_GetCh:					
F_SP_GetCh:
		//push	BP,BP to [SP];
  		//BP = SP + 1;
		  
		r1 = [R_KeyStrobe];				// Get Key code
        r2 = 0x0000;					// Clear KeyStrobe for next key	
        [R_KeyStrobe] = r2;				//
        //pop		BP,BP from [SP];
        retf;


////////////////////////////////////////////////////////////////// 
// I/O APIs
//////////////////////////////////////////////////////////////////   
//--------------------------------------------------------------------
//-- Procedure: _SP_Init_IOA
//-- Syntax   : SP_Init_IOA(Dir,Data,Attrib)
//-- Description: Initialize IOA setting
//-- Parameter:
//--	Dir     --> P_IOA_Dir,
//--    Data    --> P_IOA_Data,
//--    Attrib  --> P_IOA_Attrib
//-- Return:
//--	None
//-------------------------------------------------------------------- 
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
//--------------------------------------------------------------------
//-- Procedure: _SP_Init_IOB
//-- Syntax   : SP_Init_IOB(Dir,Data,Attrib)
//-- Description: Initialize IOB setting
//-- Parameter:
//--	Dir     --> P_IOB_Dir,
//--    Data    --> P_IOB_Data,
//--    Attrib  --> P_IOB_Attrib
//-- Return:
//--	None
//-------------------------------------------------------------------- 
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

//--------------------------------------------------------------------
//-- Procedure: _SP_Import
//-- Syntax   : SP_Import(Port Number,Data Buffer Pointer)
//-- Description: Import number from IO and save to a memory location
//-- Parameter:
//--	Port Number         --> P_IOB_Dir,
//--    Data Buffer Pointer --> P_IOB_Data,
//-- Return:
//--	None
//-------------------------------------------------------------------- 

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
//--------------------------------------------------------------------
//-- Procedure: _SP_Export
//-- Syntax   : SP_Export(Port Number,value)
//-- Description: Export value to I/O
//-- Parameter:
//--	Port Number         --> Port_IOA_Data,Port_IOB_Data
//--    value
//-- Return:
//--	None
//-------------------------------------------------------------------- 
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
		 

//========================================================================================        
// End of sp_lib.asm
//========================================================================================
