//////////////////////////////////////////////////////////////////
// Function: SRAM access function for SACM_DVR Auto Mode
//////////////////////////////////////////////////////////////////
.include hardware.inc
.RAM 
.public  HighAddr      
.VAR  HighAddr

.CODE
//*********************************************************//
// 写SRAM初始化
//*********************************************************//
.public _SP_InitWriteSRAM
.public F_SP_InitWriteSRAM 
_SP_InitWriteSRAM:         .proc
F_SP_InitWriteSRAM:
		push r1 to [sp]         
        pop r1 from [sp]
        retf 
        .endp

//*********************************************************//
//读SRAM初始化
//*********************************************************//
.public F_SP_InitReadSRAM 
.public _SP_InitReadSRAM 

_SP_InitReadSRAM:          .PROC
F_SP_InitReadSRAM:
		push r1 to [sp]
        pop r1 from [sp]
        retf 
        .ENDP

//*********************************************************//
//主调函数：main.c
//从SRAM中读数据
//*********************************************************//  
.public _SP_ReadSRAM 
_SP_ReadSRAM:              .PROC
        push bp to [sp]     
        pop bp from [sp] 
        retf 
        .ENDP
       
.PUBLIC F_SP_ReadSRAM
F_SP_ReadSRAM:
        push r2,r4 to [sp]
       
      
		pop r2,r4 from [sp]      
        retf 

//*********************************************************//
//向SRAM中写数据
//*********************************************************//  
.public _SP_WriteSRAM 
_SP_WriteSRAM: .PROC
        push bp to [sp] 
      
        pop bp from [sp] 
        retf 
        .ENDP

.PUBLIC F_SP_WriteSRAM
F_SP_WriteSRAM:
        push r1,r3 to [sp]
        
        
        pop r1,r3 from [sp]
        retf 

        

//=============================================================       
// End of sram.asm
//=============================================================
     