//========================================================================================
// Progarm: SACM_user.asm for MS01 V32
// By: Arthur Shieh
// Last modified date: 
//      2002/09/29: V32:First release for SACM v32  
//
// Functions:
// F_SACM_MS01_SongEvent	: Call back function for Song Notes events
//
// F_User_InitAdpcmData_Ch0	: Initialize ADPCM Ch0(in Assembly)
// _User_InitAdpcmData_Ch0	: Initialize ADPCM Ch0(in C)
// F_User_InitAdpcmData_Ch1	: Initialize ADPCM Ch1(in Assembly)
// _User_InitAdpcmData_Ch1	: Initialize ADPCM Ch1(in C)
//
// F_USER_MS01_GetAdpcmData_Ch0	: Gets ADPCM data for Ch0 
// F_USER_MS01_GetAdpcmData_Ch1	: Gets ADPCM data for Ch1 
//
// Note:1. In the demo, it shows a way to synchronize the song events with program events 
//         The library calls the F_SACM_MS01_SongEvent when certain event takes place in 
//         song. User can do corresponding actions according to the event type passed in.
//========================================================================================
.include spce.inc

.external T_SACM_MS01_DrumTable

.IRAM
.var	R_AdpcmBankCh0, R_AdpcmAddrCh0 // Used to keep ch0 ADPCM Address
.var	R_AdpcmBankCh1, R_AdpcmAddrCh1 // Used to keep ch1 ADPCM Address

.CODE
.public F_USER_InitAdpcmData_Ch0
.public _USER_InitAdpcmData_Ch0

.public F_USER_InitAdpcmData_Ch1
.public _USER_InitAdpcmData_Ch1

// Library call-back functions
.public F_USER_MS01_GetAdpcmData_Ch0
.public F_USER_MS01_GetAdpcmData_Ch1


.CODE
////////////////////////////////////////////////////////////////////////////////
// Function: F_SACM_MS01_SongEvent	:Call back function for Song Notes events
// Input: R1 = return value 		
//		[b15, b14] = [0, 0] : Note Event 
//		[b15, b14] = [0, 1] : Instrument Event 
//		[b15, b14] = [1, 0] : Command line event
//		[b15, b14] = [1, 1] : Reserved
//
//	if bit[15,14] ={0,0}, Note Event:	
// 			bit[3:0] Note 1-12(1=C,2=C#,3=D,4=D#,5=E,6=F,7=F#,8=G,9=G#,10=A,11=A#,12=B
//		 	bit[6:4] Channel 0-5
//	 		bit[9:7] Octave 0-5
//
//	if bit[15,14]={0,1}: Instrument Event: 	 	
// 			bit[14} = 1: Instrument change event
//			bit[7:0] Instrument/speech index 0-255
//		 	bit[10:8] Channel 0-5
//
//	if bit[15,14] = [1,0] :  *  Event:(user-defined in pop file)
//		bit[3..0] 0-15 Event from Command line in *.pop
//
//	if bit[15,14] =[1,1],  Reserved
//
// Output: user defined
//  
/////////////////////////////////////////////////////////////////////////////////
.public F_SACM_MS01_SongEvent
F_SACM_MS01_SongEvent:
		push	r2,r5 to [sp]
        //-----------------------
        // Event processed by user
        //-----------------------
		[P_IOB_Data]=R1; // Show R1 on LED attached to IOB
		
    	pop		r2,r5 from [sp]
        //-----------------------
        // End of Event processing
        //-----------------------
		retf




///////////////////////////////////////////////////////////////////////////////
// Function: _USER_InitAdpcmData_Ch0
// Syntax : USER_InitAdpcmData_Ch0(DrumIndex)
// Input : DrumIndex (User defined)
// Output: (User defined)
// Note: 1. This C API calls F_USER_InitAdpcmData_Ch1 to initialize ADPCM playback 
//          from user storage.  
//       2. User needs to implement the function body based on the external 
//          storage type.
///////////////////////////////////////////////////////////////////////////////
_USER_InitAdpcmData_Ch0:	.proc
    //-----------------------
    // defined by user
    //-----------------------	
	push bp to [sp]
	bp = sp + 1
	push r1 to [sp]
	r1 = [bp+3]
	
	call F_USER_InitAdpcmData_Ch0
	
	pop r1 from [sp]
	pop bp from [sp]	
    //-----------------------
	// end of user define area
    //-----------------------			
	retf
	.endp

///////////////////////////////////////////////////////////////////////////////
// Function: F_USER_InitAdpcmData_Ch1
// Input : R1=DrumIndex (User defined)
// Output: (User defined)
// Note: 1. This function initializes ADPCM playback from user storage.  
//       2. User needs to implement the function body based on the external 
//          storage type.
///////////////////////////////////////////////////////////////////////////////
F_USER_InitAdpcmData_Ch0:
    //-----------------------
    // defined by user
    //-----------------------	
	push	r1,r3 to [sp]
	 									// r1 = ADPCM speech index
	r3 = r1 + T_SACM_MS01_DrumTable;	// Drum # r1:i/p
    r2 = [r3];
    r3 = r2 + 0x01;
    r2 = [r2];
    [R_AdpcmAddrCh0] = r2					// Got Address
    r3 = [r3];
    r3 = r3 lsl 4;
    r3 = r3 lsl 4;
    r3 = r3 lsl 2;
    [R_AdpcmBankCh0] = r3					// Got Bank
    pop		r1,r3 from [sp]
    //-----------------------
	// end of user define area
    //-----------------------       
		retf

///////////////////////////////////////////////////////////////////////////////
// Function: _User_InitAdpcmData_Ch1
// Syntax : User_InitAdpcmData_Ch1(DrumIndex)
// Input : DrumIndex (User defined)
// Output: (User defined)
// Note: 1. This C API calls F_User_InitAdpcmData_Ch1 to initialize ADPCM playback 
//          from user storage.  
//       2. User needs to implement the function body based on the external 
//          storage type.
///////////////////////////////////////////////////////////////////////////////

_USER_InitAdpcmData_Ch1:	.proc
    //-----------------------
    // defined by user
    //-----------------------	
	push bp to [sp]
	bp = sp + 1
	push r1 to [sp]
	r1 = [bp+3]
	
	call F_USER_InitAdpcmData_Ch1
	
	pop r1 from [sp]	
	pop bp from [sp]	
    //-----------------------
	// end of user define area
    //-----------------------			
	retf
	.endp
		
///////////////////////////////////////////////////////////////////////////////
// Function: F_USER_InitAdpcmData_Ch1
// Input : R1=DrumIndex (User defined)
// Output: (User defined)
// Note: 1. This function initializes ADPCM playback from user storage.  
//       2. User needs to implement the function body based on the external 
//          storage type.
///////////////////////////////////////////////////////////////////////////////
F_USER_InitAdpcmData_Ch1:
    //-----------------------
    // defined by user
    //-----------------------	
		push	r1,r3 to [sp]
		 									// r1 = ADPCM speech index
		r3 = r1 + T_SACM_MS01_DrumTable;	// Drum # r1:i/p
        r2 = [r3];
        r3 = r2 + 0x01;
        r2 = [r2];
        [R_AdpcmAddrCh1] = r2					// Got Address
        r3 = [r3];
        r3 = r3 lsl 4;
        r3 = r3 lsl 4;
        r3 = r3 lsl 2;
        [R_AdpcmBankCh1] = r3					// Got Bank
        pop		r1,r3 from [sp]
    //-----------------------
	// end of user define area
    //-----------------------
    	retf

///////////////////////////////////////////////////////////////////////////////
// Function: F_USER_MS01_GetAdpcmData_Ch0
// Input: None
// Output: R3
// Note: 1. User protect r1,r2,r5 if used.
//       2. This function fetchs data from user storage and returns to 
//          MS01 library for ADPCM Ch0 playback. The returned data is carried 
//          by R3.
//       3. User needs to implement the function body based on the external 
//          storage type.
///////////////////////////////////////////////////////////////////////////////

F_USER_MS01_GetAdpcmData_Ch0:
    //-----------------------
    // defined by user
    //-----------------------	
	push	r1,r2 to [sp]
	r2 = [R_AdpcmAddrCh0]
	r3 = [R_AdpcmBankCh0]
	
    sr &= 0x03f 					// Change Page
    r3 |=sr 						//
    sr = r3 						//
 	r1 = D:[r2] 					// Got data
		  
	//... Adpcm address +1 ...........
    r2 = [R_AdpcmAddrCh0]; 			// 6
    r2+= 1;                 		// 3
    jnz  ?L_NotCrossBankAdpcm;
    r3 = [R_AdpcmBankCh0]      		// 9
    sr = r3 + 0x400;
    [R_AdpcmBankCh0] = sr     	 		// 9
    
    ?L_NotCrossBankAdpcm:
    [R_AdpcmAddrCh0] = r2;   		// 6 -> 36
	r3 = r1								//r3 = ADPCM Data from user	
	pop 	r1,r2 from [sp]
    //-----------------------
	// end of user define area
    //-----------------------		
	retf
	
///////////////////////////////////////////////////////////////////////////////
// Function: F_USER_MS01_GetAdpcmData_Ch1
// Input: None
// Output: R3
// Note: 1. User protect r1,r2,r5 if used.
//       2. This function fetchs data from user storage and returns to 
//          MS01 library for ADPCM Ch1 playback. The returned data is carried 
//          by R3.
//       3. User needs to implement the function body based on the external 
//          storage type.
///////////////////////////////////////////////////////////////////////////////
F_USER_MS01_GetAdpcmData_Ch1:
    //-----------------------
    // defined by user
    //-----------------------
	push	r1,r2 to [sp]

	r2 = [R_AdpcmAddrCh1]
	r3 = [R_AdpcmBankCh1]
	
	sr &= 0x03f 					// Change Page
    r3 |=sr 						//
    sr = r3 						//
	r1 = D:[r2] 					// Got data
	  
 	//... Adpcm address +1 ...........
    r2 = [R_AdpcmAddrCh1]; 			// 6
    r2+= 1;                 		// 3
    jnz ?L_NotCrossBankAdpcm
    r3 = [R_AdpcmBankCh1]      		// 9
    sr = r3 + 0x400;
    [R_AdpcmBankCh1] = sr     	 		// 9
    
    ?L_NotCrossBankAdpcm:
    [R_AdpcmAddrCh1] = r2;   		// 6 -> 36
	r3 = r1								//r3 = ADPCM Data from user
	pop 	r1,r2 from [sp]
    //-----------------------
	// end of user define area
    //-----------------------
	retf		
