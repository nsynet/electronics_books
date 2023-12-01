//////////////////////////////////////////////////////////////////
// Function: SRAM access function for SACM_DVR Auto Mode
//////////////////////////////////////////////////////////////////
.include spce.inc;

.public _SP_InitWriteSRAM
.public F_SP_InitWriteSRAM 

.CODE
_SP_InitWriteSRAM:         .proc
F_SP_InitWriteSRAM:
		push r1 to [sp]
        pop r1 from [sp]
        retf 
        .endp


.public F_SP_InitReadSRAM 
.public _SP_InitReadSRAM 

_SP_InitReadSRAM:          .PROC
F_SP_InitReadSRAM:
		push r1 to [sp]
        pop r1 from [sp]
        retf 
        .ENDP

//////////////////////////////////////////////////////////////////////////////// 
// Function: Write a byte to SRAM on SACM_DVR Auto mode
// Input:   R1: 16 bits Addr[b15..b0]
//          R2: 16 bits Data
// Used: R1,R2,R3
//////////////////////////////////////////////////////////////////////////////// 
.PUBLIC F_SP_WriteSRAM
F_SP_WriteSRAM:
        push r1,r3 to [sp]
        pop r1,r3 from [sp]
        retf 

        
//////////////////////////////////////////////////////////////////////////////// 
// Function: Read a byte for SRAM on SACM_DVR Auto mode
// Input:    R1: 16 bits addr.
// Output:   R1: 16 bits Data                        
// Used: R1,R2,R3,R4
////////////////////////////////////////////////////////////////////////////////                 
.PUBLIC F_SP_ReadSRAM
F_SP_ReadSRAM:
        push r2,r4 to [sp]
		pop r2,r4 from [sp]     // don't pop r1(return value)   
        retf 

/////////////////////////////////////////////
// Function: Read SRAM for C language
/////////////////////////////////////////////
.public _SP_ReadSRAM 
_SP_ReadSRAM:              .PROC
        push bp to [sp] 
        pop bp from [sp] 
        retf 
        .ENDP

/////////////////////////////////////////////
//  Function: Write SRAM for C language                             
/////////////////////////////////////////////
.public _SP_WriteSRAM 
_SP_WriteSRAM: .PROC
        push bp to [sp] 
        pop r1,r2 from [sp]
        pop bp from [sp] 
        retf 
        .ENDP

//========================================================================================        
// End of sram.asm
//========================================================================================
        