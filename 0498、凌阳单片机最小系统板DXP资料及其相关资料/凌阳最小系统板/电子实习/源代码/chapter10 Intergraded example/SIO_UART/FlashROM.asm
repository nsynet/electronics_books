//////////////////////////////////////////////////////////////////
// File: FlashROM.asm    V1.0
// Function: Flash ROM Access testing 
// Writen by: Arthur Shieh
// Platform: SPCE061A, IDE1.631,Windows 2000
// Modify list:
//
//              2002/09/19 : First Version
// Note:
//      1. SPCE061 is a MTP chip featuring its built-in flash
//      2. In order to access its flash ROM, user needs to 
//         erase page first, write an enable signal to the SPCE061 
//         flah ctrl port($7555H) and then write erase/program 
//         instructions to this control port. For reading the flash,
//         just read it as memory access. No extra particular 
//         procedure required for reading.
//      3. This operation can not be intervened by ICE or and other 
//         operations including interrupts.  
//      4  The valid address of flash is 0x8000~0xFFFF. 
//         Page size is 0x100.
//      5. For safty, mass erase function is not open to users.  
//////////////////////////////////////////////////////////////////

.include spce.inc
.TEXT
//--------------------------------------------------------------------
//-- Procedure: _SP_PageErase
//-- Decription: Erase a page in flash
//-- Syntax: SP_PageErase(page addr)
//-- Parameter:
//      R1 = page addr
//-- Return:
//      None
//--------------------------------------------------------------------
.PUBLIC _SP_PageErase
_SP_PageErase: .proc
    PUSH BP,BP TO [SP];
    BP = SP + 1;
    R1 = [BP+3];
    
    call F_PageErase;

    POP BP,BP FROM [SP];
    retf
.endp
//////////////////////////////////////////////////////////////////
// F_PageErase
// Function: Erase a flash page in SPCE061
// R1: page address (0x8000~0xFFFF)
// Used register: r1,r2
//////////////////////////////////////////////////////////////////
.PUBLIC F_PageErase
F_PageErase: .PROC
  PUSH R2,R2 to [SP];
//  INT OFF;
  
  R2 = R1;
  // Enable Write/Erase
  R1 = C_EnableFlashAccess;
  [P_Flash_Ctrl] = R1;
  // Erase instruction
  R1 = C_EraseFlashPage;
  [P_Flash_Ctrl] = R1;
  // Write any value to erase page  
  [R2] = R1;  
   
//  INT FIQ,IRQ;
  POP R2,R2 from [SP]; 
  retf;
.endp

//--------------------------------------------------------------------
//-- Procedure: _SP_WriteWord
//-- Syntax: SP_WriteWord(page addr,data)
//-- Parameter:
//      R1 = page addr
//      R2 = data
//-- Return:
//      None
//--------------------------------------------------------------------

.PUBLIC _SP_WriteWord
_SP_WriteWord: .proc
    PUSH BP,BP TO [SP];
    BP = SP + 1;
    R1 = [BP+3];
    R2 = [BP+4];
    
    call F_WriteWord;

    POP BP,BP FROM [SP];
    retf
.endp
//////////////////////////////////////////////////////////////////
// F_WriteWord
// Function: write a word to the flash of SPCE061
// R1: page address (0x8000~0xFFFF)
// R2: data to write
// Used register: r1,r2,r3
//////////////////////////////////////////////////////////////////
.PUBLIC F_WriteWord
F_WriteWord: .PROC
  PUSH R3,R3 to [SP];
//  INT OFF;
  
  R3 = R1;
  // Enable Write/Erase
  R1 = C_EnableFlashAccess;
  [P_Flash_Ctrl] = R1;
  // Program instruction
  R1 = C_ProgramFlash;
  [P_Flash_Ctrl] = R1;
  // Write Flash
  [R3] = R2;  
   
//  INT FIQ,IRQ;
  POP R3,R3 from [SP]; 
  retf;
.ENDP

//--------------------------------------------------------------------
//-- Procedure: _SP_ReadWord
//-- Syntax: SP_ReadWord(page addr)
//-- Parameter:
//      R1 = page addr
//-- Return:
//      R1 = data
//--------------------------------------------------------------------

.PUBLIC _SP_ReadWord

_SP_ReadWord: .proc
    PUSH BP,BP TO [SP];
    BP = SP + 1;
    R1 = [BP+3];
    
    call F_ReadWord;

    POP BP,BP FROM [SP];
    retf
.endp
//////////////////////////////////////////////////////////////////
// F_ReadWord
// Function: read a word from the flash of SPCE061
// R1: page address (0x8000~0xFFFF)
// return: R1 the data red
// Used register: r1,r2,r3
//////////////////////////////////////////////////////////////////
.PUBLIC F_ReadWord
F_ReadWord: .PROC
  PUSH R2,R2 to [SP];
  // Read data
  R2 = [R1];
  R1 = R2;   
  POP R2,R2 from [SP]; 
  retf;
.ENDP