//========================================================================================
// Progarm: Function definition for PC play data transmition
// Writen by: Andy
//
// Last modified date: 
// 		2000/06/23: first definition
//		2000/07/15: modify
//		2000/11/07: eliminate file head(103)
// Functions:
//  (Assembly view)
//  F_PcPlay_Initial							// PcPlay service initialization
//	F_PcPlay_ServiceLoop						// PcPlay service loop
//	F_PcPlay_GetQueue							// Get data from queue 

//  (C language view)
//	_PcPlay_Initial							// PcPlay service initialization called by C
//	_PcPlay_ServiceLoop 						// PcPlay service loop called by C
//	_PcPlay_GetQueue							// Get data from queue

//	F_CheckLPT1DataIn						
//		-F_DataGet0							// call by F_CheckLPT1DataIn:
//========================================================================================

.include hardware.inc;

//.define	CutFileHead	1;					// (103)

.define D_Q_Buffer  0x100;				// for PC play
.define D_BufferTail  D_Q_Buffer;
.public	R_ReadIndex;
.public R_WriteIndex;
.public	R_BufferHead;

//.RAM
PcPlay_Section:	.SECTION	.RAM
.VAR    R_PCPlayFlag;					// for PC play
.VAR    R_ReadIndex;
.VAR    R_WriteIndex;
.VAR    R_ResetCount;
.VAR    R_DataTemp;
.VAR    R_CommandTemp;
.VAR    R_Temp;
.VAR    R_Addr;
.VAR    R_Bank;


.VAR    R_BufferHead;
.DW		D_Q_Buffer-1 DUP(0);

.var	R_ByteCount;
.var	R_HeadCounter;
.var 	R_Lpt1TimeOutCnt;
.var	R_Lpt1TimeOutCnt1;


.CODE
//****************************************************************
// Function: Initialization of LPT1
// Input: None
// Output: None
//****************************************************************
.public	_PcPlay_Initial;
.public F_PcPlay_Initial;
_PcPlay_Initial: .PROC
F_PcPlay_Initial: 		
	 	r1 = 0;
	 	[R_WriteIndex] = r1;
        [R_ReadIndex] = r1;
        r1 = [P_IOB_Data];
        [R_PCPlayFlag] = r1;

		//...............................
		r1 = 0;		
		[R_Lpt1TimeOutCnt] = r1;
		r1 = 20;
		[R_Lpt1TimeOutCnt1] = r1;
		
L_NonPChaveData:
		r1 = [R_Lpt1TimeOutCnt];
		r1 -= 1;
		[R_Lpt1TimeOutCnt] = r1;
		jnz	L_NoCarry;	
		r1 = [R_Lpt1TimeOutCnt1];
		r1 -= 1;
		[R_Lpt1TimeOutCnt1] = r1;
L_NoCarry:	
	
		r1 = [R_Lpt1TimeOutCnt1];

		r1 = [R_Lpt1TimeOutCnt];
		r1 |= [R_Lpt1TimeOutCnt1];
		jnz	L_Lpt1NotTimeOut;
		goto	L_Lpt1TimeOut
		
L_Lpt1NotTimeOut:
		R1=0x0001;                      //clear watch dog
        [P_Watchdog_Clear]=R1;       //
  		r1 = [P_IOB_Data];				//
	  	r2 = r1;
		r3 = [R_PCPlayFlag];
        r1 = r1 xor r3;
        r1 = r1 and 0x0100;
        jz  L_NonPChaveData;
        

                
		//.................................        
        
        
        r3 = r3 xor 0x0300;
        [R_PCPlayFlag] = r3;
        r3 = r3 or 0x01ff;
        [P_IOB_Data] = r3;


		call F_CheckLPT1DataIn;
//		cmp r4, 0xf001;						// 0xf001: SACM-A2000
//		je		L_GoNextInit				// 0xf004: SACM-S480/S720
//		PC = L_Reset;						// 0xf002: SACM-S240/S120
//L_GoNextInit:								// 0xf008: FM4
											// 0xf009: FM6	

		cmp	r4, 0xf001;						//
		je	L_DataIsSACM_A2000				//		
		cmp	r4, 0xf004;						//
		je	L_DataIsSACM_S480				//
		cmp	r4, 0xf002;						//
		je	L_DataIsSACM_S240				//	
		cmp	r4, 0xf008;						//
		je	L_DataIsSACM_MS01				//

		PC = L_WrongData;

L_DataIsSACM_A2000:
		r4 = 256;
		jmp	L_PcPlayTypeSetReady;			//
L_DataIsSACM_S480:
		r4 = 257;
		jmp	L_PcPlayTypeSetReady;			//
L_DataIsSACM_S240:
		r4 = 258;
		jmp	L_PcPlayTypeSetReady;			//
L_DataIsSACM_MS01:
		r4 = 259;
	
L_PcPlayTypeSetReady:
		push	r4 to [sp];					// save return value
	
        r1 = 0;
        [R_CommandTemp] = r1;
        [R_ByteCount] = r1;
        [R_DataTemp] = r1;
        [R_ResetCount] = r1;

		
		r1 = 0;							// reset R_EndCounter
		[R_HeadCounter] = r1;			// (103)	
	
		//...... fill queue up ............		        
        r5 = 0x00;
        [R_Temp] = r5;
L_GetDataLoop0:
        
        call F_PcPlay_ServiceLoop;			//F_CheckDataInAndSave;
        
        //r5 = R_BufferHead; // for test
        	
        r5 = [R_Temp];
        r5 += 0x01;
        [R_Temp] = r5;
        cmp r5, D_BufferTail*100; // use 10 because several times to fill one byte
        //cmp	r5, D_BufferTail-1;
        jcc L_GetDataLoop0;
		//................................

		
		
		//r1 = R_BufferHead;			//for test

		pop r1 from [sp];				// return value
		
L_Lpt1TimeOut:		
		retf;	
		
L_WrongData:
		R1=0x0001;                      //clear watch dog
        [P_Watchdog_Clear]=R1;       //
		nop;
		nop;
		nop;
		retf;	
 		.ENDP;
		
//****************************************************************
// Function: Get data from printer port and put the data to the queue
// Input: Port IOA
// Output: Queue (see [R_QueueHead],[R_ReadIndex] and [R_WriteIndex] in detail
//****************************************************************
.public _PcPlay_ServiceLoop;				// original F_CheckDataInAndSave:
.public F_PcPlay_ServiceLoop;
_PcPlay_ServiceLoop: .PROC
F_PcPlay_ServiceLoop:
		
		R1=0x0001;                      //clear watch dog
        [P_Watchdog_Clear]=R1;       //
        
        r1 = [R_WriteIndex];  			//check buffer Tail 
        r2 = [R_ReadIndex];  			//
        r1 = r1 - r2;
        jpl L_QueueNonFullAndSave;
        cmp  r1, 0xffff;
        jne  L_FillDataAndSave;
L_QueueFullAndSave:
        retf;
L_QueueNonFullAndSave:
        cmp r1, D_BufferTail-1;
        jne  L_FillDataAndSave;
        retf;							// queue full
L_FillDataAndSave:
//----------------------------------------
                			
        r1 = [P_IOB_Data];			//r2 = low byte, r3= high byte
        r2 = r1;
        r3 = [R_PCPlayFlag];
        r1 = r1 xor r3;
        r1 = r1 and 0x0100;
        jne L_PChaveData;
        retf;
L_PChaveData:
		
        r1 = 0x00; //889
        [R_ResetCount] = r1;
        
        r3 = r3 xor 0x0300;
        [R_PCPlayFlag] = r3;
        r3 = r3 or 0x01ff;
        
        [P_IOB_Data] = r3;
        r3 = r2 lsl 4;
        r3 = r3 lsl 4;
        r2 = r2 and 0x00ff;
        r1 = [R_ByteCount];
        r4 = r1 + 1;
        cmp     r4, 0x04;
        jcc     L_UpDataCount;
        r4 = 0;
L_UpDataCount:
		
        [R_ByteCount] = r4;
        cmp r1, 0;
        je L_CommandCheck;
        cmp r1, 1;
        je L_DataCheck;
        cmp r1, 2;
        je L_CommandCheck1;
        r1 = [R_CommandTemp];
        jne L_IsCommand;
        r4 = [R_DataTemp];
        r4 = r4 or r3;
        pc = F_SaveDataToBuffer;

L_DataCheck:
		r4 = [R_CommandTemp];
        jne  L_IsCm2;
        [R_DataTemp] = r2;
        pc = L_ZeroData;
L_IsCm2:
        r4 = r4 or r3;
        pc = F_CommandSet;

L_CommandCheck1:
		
        cmp r3, 0;
        je   L_ZeroData;
        [R_CommandTemp] = r3;
        pc = L_ZeroData;
L_CommandCheck:
		
        cmp r3, 0;
        je  L_ZeroData;
L_IsCommand:
		
        r3 = [R_CommandTemp];
        r3 = r3 or r2;
        [R_CommandTemp] = r3;
        pc = F_CommandSet;
L_ZeroData:
        retf;

F_CommandSet:
        r1 = 0;
        [R_CommandTemp] = r1;
        [R_ByteCount] = r1;
        [R_DataTemp] = r1;
        [R_ResetCount] = r1;
        retf;
//--------------------------------  
F_SaveDataToBuffer:				// Save data to buffer

		//... Check File Head ....(103)
.ifdef CutFileHead;	
        push r1 to [sp];
        
        r1 = [R_HeadCounter];	// 
        cmp	r1, 24;				//
        jcs	L_NotFileHead;		//
        
        r1 = [R_HeadCounter];	//
        r1 += 1;				// counter ++
        [R_HeadCounter] = r1;	//
        
    	pop	r1 from [sp];		//    
		retf;					//
    
L_NotFileHead:        
    	pop	r1 from [sp];    	//	
.endif	    
        //........................
		
	


		r1 = [R_WriteIndex];  
        r3 = r1 + R_BufferHead;
        [r3] = r4;
        r1 += 0x01;
        cmp  r1, D_BufferTail;
        jcc L_NonOverTail;
        r1 = 0x00;
L_NonOverTail:
        [R_WriteIndex] = r1;
        
        
        
        r1 = 0;
        [R_CommandTemp] = r1;
        [R_ByteCount] = r1;
        [R_DataTemp] = r1;
        [R_ResetCount] = r1;
        
        retf;
		.ENDP
	


/////////////////////////////////////////////////////////
// Function: Get data from queue 
// Input: queue
// Output: R4
/////////////////////////////////////////////////////////
.public	_PcPlay_GetQueue;        
.public F_PcPlay_GetQueue;
_PcPlay_GetQueue:
F_PcPlay_GetQueue:
        r3 = [R_ReadIndex];
        r4 = [R_WriteIndex];  		//check buffer Tail
        cmp r3, r4;
        jne L_Bufferhasdata_;
        
        r4 = 0xffff;				// output 0xffff for speech end if queue is no data
        
        retf;
L_Bufferhasdata_:
        r4 = r3 + R_BufferHead;
        r4 = [r4];
        r3 += 0x01;
        cmp  r3, D_BufferTail;
        jcc L_RNonOverTail_;
        r3 = 0x00;
L_RNonOverTail_:
        [R_ReadIndex] = r3;
        retf;        
        

//============================================================================
// Function: 
// Input:
// Output:
// using: 
//  call F_CheckLPT1DataIn;
//  if z=0 data not comming yet, if z=1 data comming.
//============================================================================
F_CheckLPT1DataIn:
        r1 = [R_WriteIndex];  			//check buffer Tail 
        r2 = [R_ReadIndex];  			//
        r1 = r1 - r2;
        jpl L_QueueNonFull;
        cmp  r1, 0xffff;
        jne  L_FillData;
L_QueueFull:
        retf;
L_QueueNonFull:
        cmp r1, D_BufferTail-1;
        je  L_QueueFull;
L_FillData:
        call F_DataGet0;       //get one byte data from PC
        r4 = r3;
        call F_DataGet0;
        r4 = r4 or r2;
               
//        cmp	r4, 0xf001;
//        jne	L_DataNotComming;
//        sr |= 0x0010;			// set z flag
//L_DataNotComming:
//		sr &= 0xFFEF;			// clear z flag        
       	retf;
	   

///////////////////////////////////////////////////////
// get one byte data from LPT1
///////////////////////////////////////////////////////
F_DataGet0:                				//r2 = low byte, r3= high byte
        r5 = 0x00;						// clear time out counter
        [R_ResetCount] = r5;			//889
L_GetDataLoop1:
		R1=0x0001;                      //clear watch dog
        [P_Watchdog_Clear]=R1;       //

        r1 = [P_IOB_Data];
        //call F_STD_GetIOA;
        r2 = r1;
        r3 = [R_PCPlayFlag];
        r1 = r1 xor r3;
        r1 = r1 and 0x0100;
        jne L_PChaveData1;
        
        r1 = [R_ResetCount];			// time out counter++
        r1 += 0x01;						//889	
        [R_ResetCount] = r1;			//
        jne  L_GetDataLoop1;
        r5 += 0x01;
        cmp     r5, 0x0f;
        jcc  L_GetDataLoop1;
        
        //jmp	L_GetDataLoop1;
      	PC = L_WrongData;
        retf;
        
L_PChaveData1:
        r3 = r3 xor 0x0300;
        [R_PCPlayFlag] = r3;
        r3 = r3 or 0x01ff;
        [P_IOB_Data] = r3;
    
    	//push r1,r1 to [sp];	
        //r1 = r3;
        //call F_STD_PutIOA;	
		//pop	r1,r1 from [sp];
        
        r3 = r2 lsl 4;
        r3 = r3 lsl 4;
        r2 = r2 and 0x00ff;
		retf;


		//... For MS01 only .........................
.public F_GetQueueNoChangeAddr;		
F_GetQueueNoChangeAddr:
        r3 = [R_ReadIndex];
        r4 = [R_WriteIndex];  		//check buffer Tail
        cmp r3, r4;
        jne L_Bufferhasdata_1;
        retf;
L_Bufferhasdata_1:
        r4 = r3 + R_BufferHead;
        r4 = [r4];
        retf;
        
.public	F_QueueAddrAdd1;        
F_QueueAddrAdd1:
		r3 = [R_ReadIndex];        
        r3 += 0x01;
        cmp  r3, D_BufferTail;
        jcc L_RNonOverTail_1;
        r3 = 0x00;
L_RNonOverTail_1:
        [R_ReadIndex] = r3;
        retf;               
        //.............................................
        

//============================================================================
// Function: 3 Byte R_Lpt1TimeOutCnt ++
// Input: None
// Output: None
// Used variable: R3
//============================================================================
F_Lpt1TimeOutCntAdd1:
        R3=[R_Lpt1TimeOutCnt];
        R3 +=1;
        [R_Lpt1TimeOutCnt]=R3;
        jz      L_LT_Carry1;
        retf;
L_LT_Carry1:
        R3=[R_Lpt1TimeOutCnt+1];
        R3 +=1;
        [R_Lpt1TimeOutCnt+1]=R3;
        jz      L_LT_Carry2;
        retf;
L_LT_Carry2:
        R3=[R_Lpt1TimeOutCnt+2];
        R3 +=1;
        [R_Lpt1TimeOutCnt+2]=R3;
        retf;
//============================================================================        