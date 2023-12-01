//========================================================================================
// Progarm: SACM user.asm for A2000 V32
// By: Arthur Shieh
// Last modified date: 
//      2002/09/29: V32:First release for SACM v32  
//
// Functions:
//  F_USER_A2000_GetAWord
//  
// I/O APIs:
//  _USER_SetStartAddr
//
// Note:1. In the demo, it shows a way to fetch ROM data to demonstrate 
//         the manual mode operation. It fetchs data from T_SACM_A2000_SpeechTable
//         and feeds back to library for playback. 
//========================================================================================

.public _USER_SetStartAddr
.public F_USER_A2000_GetAWord

.RAM  
.var R_Speech_Addr
.var R_Speech_Page

.CODE
//--------------------------------------------------------------------
//-- Procedure: _USER_SetStartAddr
//-- Syntax: USER_SetStartAddr(int)
//-- Parameter: R1 = PlayIndex 
//-- Return: NONE
//-- Description: This API allows users to set the beginning address 
//                to fetch data. This address can be either a ROM address
//                or a external storage address. User would have to modify
//                the function body based on the application's need.    
//--------------------------------------------------------------------
_USER_SetStartAddr: 
    //-----------------------
    // defined by user
    //-----------------------
	push BP to [sp];
	BP = sp + 1;
	push R1, R2 to [sp];
	r1 = [BP + 3];
	r2 = [BP + 4];
	[R_Speech_Addr] = r1;
	[R_Speech_Page] = r2;
	pop R1, R2 from [sp];	
	pop BP from [sp];
    //-----------------------
	// end of user define area
    //-----------------------
	RETF;	

		

//--------------------------------------------------------------------
//-- Function: F_USER_A2000_GetAWord
//-- Parameter: NONE
//-- Return: R1 = Data
//-- Description: This function called by library to fetch data  
//                for playback. The Library needs a word data  
//                Uaser would have to compose the function body 
//                based on the storage type to fulfill this demand from 
//                library. 
//--------------------------------------------------------------------
F_USER_A2000_GetAWord: 
    //-----------------------
    // defined by user
    //-----------------------
		r1 = [R_Speech_Addr];
		r2 = [R_Speech_Page];
		
		r2 = r2 LSL 4;
		r2 = r2 LSL 4;
		r2 = r2 LSL 2;
		
		SR &= 0x03f; 					// Change Page
        SR |= R2; 						//
          
  		R3 = D:[R1 ++]; 				// Get data
		
		cmp R1 , 0x0;
		JNE ?_update_addr;
		R2 += 1;  
		[R_Speech_Page] = R2;
		
		?_update_addr:
		[R_Speech_Addr] = R1;
		
		?_return_data:
		R1 = R3;
	//-----------------------
	// end of user define area
    //-----------------------		  
	  	RETF;
	  
 .end 