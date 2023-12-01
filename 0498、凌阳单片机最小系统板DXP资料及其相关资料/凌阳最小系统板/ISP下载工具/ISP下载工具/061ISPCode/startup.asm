.PUBLIC _RESET,__sn_loop,__sn_loop2 
.EXTERNAL __sn_init_table,_main,__sn_sp_val

unSP_StartUp: .section .text
StartUp: .PROC
_RESET:
        sp = __sn_init_table
        r1 = [sp++]     // item count
        jmp __judge_itcount
__next_item:
        r2 = [sp++]     // dest address (RAM)
        r3 = [sp++]     // DS of src address (ROM)
        r3 = r3 lsl 4
        r3 = r3 lsl 4
        sr = r3 lsl 2
        r3 = [sp++]     // src address (ROM)
        r4 = [sp++]     // block size
        r4 = r4 + r2
        jmp __judge_bksize
__move_data:
        bp = DS:[r3++]
        [r2++] = bp
__judge_bksize:
        cmp r2, r4
        jne __move_data
        r1 = r1 - 1
__judge_itcount:
        cmp r1, 0
        jne __next_item
__no_item:
        sp = __sn_sp_val
        call _main
__sn_loop2:
        jmp __sn_loop2
__sn_loop: 
        reti
        .ENDP
.DEBUG
    .DW '.stabs "startup_code.",0x3c,0,0,0',0x0d,0x0a
.DEBUG
    .DW '.stabs "__sn_main:F15",36,0,0,', 0, 0
    .DW offset _main,seg _main
    .DW 0x0d,0x0a
.DEBUG
    .DW '.stabs "__sn_end:F15",36,0,0,', 0, 0
    .DW offset __sn_loop2,seg __sn_loop2
    .DW 0x0d,0x0a   
.DEBUG
    .DW '.stabs "__sn_exception:F15",36,0,0,', 0, 0
    .DW offset __sn_loop,seg __sn_loop
    .DW 0x0d,0x0a

ISP_CODE: .section .code,	.addr = 0xfc00
.define P_IOA_Data          0x7000
.define P_IOB_Buffer        0x7006
.define P_IOB_Dir           0x7007
.define P_IOB_Attrib        0x7008
.define C_UART_PARITY_EVEN  0x0008		// P_UART_Command1	
.define C_UART_PARITY_ODD   0x0000		// P_UART_Command1	
.define C_UART_PARITY_EN    0x0004		// P_UART_Command1	
.define C_UART_PARITY_DIS   0x0000		// P_UART_Command1	
.DEFINE P_UART_Command1     0x7021
.DEFINE P_UART_Command2     0x7022
.DEFINE P_UART_Data         0x7023
.DEFINE P_UART_BaudScalarLow 0x7024
.DEFINE P_UART_BaudScalarHigh 0x7025
.DEFINE P_Watchdog_Clear    0x7012
	.DEFINE		C_UART_RX_EN			0x0080		// P_UART_Command2
	.DEFINE		C_UART_TX_EN			0x0040		// P_UART_Command2
	.DEFINE		P_Flash_Ctrl			0x7555
	.DEFINE		C_UART_RX_RDY			0x0080		// P_UART_Command2
	.DEFINE		C_UART_TX_RDY			0x0040		// P_UART_Command2

//.define ISP_CLOCK			C_Fosc_49M		// 49M

.define ISP_BAUDSCALAR_L    0xd5		// 57600
.define ISP_BAUDSCALAR_H    0x00

M_Call: .macro FunName
	call FunName
.endm

M_Goto: .macro Label
	PC = Label
.endm

.define R_ERR 1					// 1-UART Verify failed; 2-Block Data CheckSum Error
.define R_Sum 2
.define R_Block 4			// Block Data Buffer

// ============================================================================
_ISP_START:
	r1 = [P_IOA_Data]
	test r1, 0x0003
	jnz ?ISP_Start
	r1 = 0xfff4
	pc = [r1]

?ISP_Start:
	sp = 0x7ff
//	r1 = ISP_CLOCK
//	[P_SystemClock] = r1
	
	r1 = [P_IOB_Buffer]
	r1 |= 0x0400						// IOB8&9
	r1 &= ~0x0080
	[P_IOB_Buffer] = r1
	
	r1 = [P_IOB_Attrib]
	r1 |= 0x0480
	[P_IOB_Attrib] = r1
	
	r1 = [P_IOB_Dir]
	r1 |= 0x0400
	r1 &= ~0x0080
	[P_IOB_Dir] = r1

	r1 = 0
	[R_ERR] = r1
	r1 = C_UART_PARITY_EVEN | C_UART_PARITY_EN
	[P_UART_Command1] = r1
	r1 = C_UART_RX_EN|C_UART_TX_EN
	[P_UART_Command2] = r1
	
	r1 = ISP_BAUDSCALAR_L
	[P_UART_BaudScalarLow] = r1
	r1 = ISP_BAUDSCALAR_H
	[P_UART_BaudScalarHigh] = r1
	r1 = [P_UART_Data]
	r1 = ('S'<<8) + 'I'
	M_Call ISP_UART_SendWord
	r1 = (' '<<8) + 'P'
	M_Call ISP_UART_SendWord
	r1 = ('e'<<8) + 'R'
	M_Call ISP_UART_SendWord
	r1 = ('d'<<8) + 'a'
	M_Call ISP_UART_SendWord
	r1 = (0x0d<<8) + 'y'
	M_Call ISP_UART_SendWord

?L_WaitCmd:	
	r2 = 0
	[R_ERR] = r2
	M_Call ISP_UART_RecvWord
	r2 = [R_ERR]
	jnz ?L_WaitCmd
	cmp r1, 0x5245						// "ER"
	je ?Erase
	cmp r1, 0x454D						// "ME"
	je ?MassErase
	cmp r1, 0x4C44						// "DL"
	je ?Download
	cmp r1, 0x4656						// "VF"
	je ?Verify
	cmp r1, 0x4C55						// "UL"
	je ?Upload
	cmp r1, 0x4750						// "PG"
	je ?Program
	cmp r1, 0x5251						// "QR"
	je ?Query
	jmp ?L_WaitCmd
?Erase:
	M_Call ISP_Erase
	M_Goto ?L_WaitCmd
?MassErase:
	M_Call ISP_MassErase
	M_Goto ?L_WaitCmd
?Download:
	M_Call ISP_Download
	M_Goto ?L_WaitCmd
?Verify:
	M_Call ISP_Verify
	M_Goto ?L_WaitCmd
?Upload:
	M_Call ISP_Upload
	M_Goto ?L_WaitCmd
?Program:
	M_Call ISP_Program
	M_Goto ?L_WaitCmd
?Query:
	M_Call ISP_Query
	M_Goto ?L_WaitCmd
retf


// ============================================================================
// r1: Data
ISP_UART_Send:
?L:
	r2 = 0x01
	[P_Watchdog_Clear] = r2
	r2 = C_UART_TX_RDY
	test r2, [P_UART_Command2]
	jz ?L
	[P_UART_Data] = r1
retf

// ============================================================================
// r1: Data
ISP_UART_SendWord:
	push r1, r2 to [sp]
	M_Call ISP_UART_Send
	r1 = r1 lsr 4
	r1 = r1 lsr 4
	M_Call ISP_UART_Send
	pop r1, r2 from [sp]
retf

// ============================================================================
// r1: Data
ISP_UART_Recv:
//	push r2 to [sp]
//	r2 = 0xffff							// Wait about 30ms, if get no data then reset
//?L:
//	r2 -= 1
//	jz ?Err
?Next:	
	r1 = 0x01
	[P_Watchdog_Clear] = r1
	r1 = C_UART_RX_RDY
	test r1, [P_UART_Command2]
	jz ?Next
	r1 = [P_UART_Data]
//	test r1, 0x0500						// Verify
//	jz ?Exit
//	jmp ?Exit
//?Err:
//	r2 = 1
//	[R_ERR] = r2
//	M_Goto _ISP_START					// Reset
//?Exit:
//	pop r2 from [sp]
retf

// ============================================================================
// r1: Data
ISP_UART_RecvWord:
	push r2 to [sp]
	M_Call ISP_UART_Recv
	r2 = r1 & 0x00ff
	M_Call ISP_UART_Recv
	r1 = r1 lsl 4
	r1 = r1 lsl 4
	r1 |= r2
	pop r2 from [sp]
retf

// ============================================================================
ISP_Erase:
	r1 = 0x4557							// "WE" Wait Erase
	M_Call ISP_UART_SendWord
	M_Call ISP_UART_Recv				// Get Page Number
	r2 = [R_ERR]
	jnz ?PageErr
	cmp r1, 0x80
	jb ?PageErr
	cmp r1, 0xff
	ja ?PageErr

	r2 = 0xAAAA
	[P_Flash_Ctrl] = r2
	r2 = 0x5511
	[P_Flash_Ctrl] = r2
	r1 = r1 lsl 4
	r1 = r1 lsl 4
	[r1] = r1
?Verify:								// Verify
	r2 = [r1++]
	cmp r2, 0xffff
	jne ?CheckPageFF
	test r1, 0xff
	jnz ?Verify
	jmp ?EraseDone
?CheckPageFF:
	cmp r1, 0xFFF0
	jae ?EraseDone
?EraseFail:
	r1 = 0x4645							// "EF"
	jmp ?Response
?PageErr:
	r1 = 0x5045							// "EP"
	jmp ?Response	
?EraseDone:
	r1 = 0x5345							// "ES"
?Response:		
	M_Call ISP_UART_SendWord
retf

// ============================================================================
ISP_MassErase:
	r1 = 0x8000
?Erase:									// Erase 0x8000~0xfbff
	r2 = 0xAAAA
	[P_Flash_Ctrl] = r2
	r2 = 0x5511
	[P_Flash_Ctrl] = r2
	[r1] = r1
	r1 += 0x0100
	cmp r1, 0xfc00
	jb ?Erase
	r1 = 0xff00							// Erase 0xfe00~0xfeff
	r2 = 0xAAAA
	[P_Flash_Ctrl] = r2
	r2 = 0x5511
	[P_Flash_Ctrl] = r2
	[r1] = r1
?Verify:								// Verify
	r1 = 0x8000
?L1:	
	r2 = [r1++]
	cmp r2, 0xffff
	jne ?EraseFail
	cmp r1, 0xFC00
	jb ?L1
	r1 = 0xFE00
?L2:	
	r2 = [r1++]
	cmp r2, 0xffff
	jne ?EraseFail
	cmp r1, 0xFF00
	jb ?L2
?EraseDone:
	r1 = 0x534D							// "MS"
	jmp ?Response
?EraseFail:
	r1 = 0x464D							// "MF"
?Response:		
	M_Call ISP_UART_SendWord	
retf

// ============================================================================
ISP_Download:
	r2 = 0								// Clear ErrFlag and CheckSum
	[R_ERR] = r2
	[R_Sum] = r2
	[R_Sum+1] = r2

	r1 = 0x5244							// "DR"
	M_Call ISP_UART_SendWord

	r2 = R_Block
?L2:	
	M_Call ISP_UART_RecvWord
	[r2++] = r1
	r3 = 0
	r1 += [R_Sum]						// Sum
	[R_Sum] = r1
	r3 += [R_Sum+1], carry
	[R_Sum+1] = r3
	cmp r2, R_Block+256
	jb ?L2
	M_Call ISP_UART_RecvWord 			// Check Sum
	r2 = r1
	M_Call ISP_UART_RecvWord 			// Check Sum
	cmp r1, [R_Sum+1]
	jne ?BlockErr
	cmp r2, [R_Sum]
	jne ?BlockErr
	r1 = [R_ERR]						// Check Verify
	jz ?Done
?BlockErr:
	r1 = 0x4644							// "DF"
	jmp ?Response
?Done:
	r1 = 0x5344							// "DS"
?Response:
	M_Call ISP_UART_SendWord
retf

// ============================================================================
ISP_Program:
	M_Call ISP_UART_Recv				// Get Page Number
	r2 = [R_ERR]
	jnz ?PageErr
	cmp r1, 0x80
	jb ?PageErr
	cmp r1, 0xff
	ja ?PageErr
?Prog:									// Seq Program 256 words
	r1 = r1 lsl 4
	r1 = r1 lsl 4
	r3 = R_Block
	r2 = 0xAAAA
	[P_Flash_Ctrl] = r2
?L1:
	r4 = [r3++]
	r2 = 0x5544
	[P_Flash_Ctrl] = r2
	[r1++] = r4
	test r1, 0x00ff
	jnz ?L1
	r2 = 0xffff							// End Seq Program
	[P_Flash_Ctrl] = r2
?ProgDone:
	r1 = 0x5350							// "PS"	
	jmp ?Response
?PageErr:
	r1 = 0x5050							// "PP"
?Response:
	M_Call ISP_UART_SendWord	
retf

// ============================================================================
ISP_Query:
	r1 = 0x4E43							// "CN"
	M_Call ISP_UART_SendWord
retf 


// ============================================================================
ISP_Verify:
	M_Call ISP_UART_Recv				// Get Page Number
	r2 = [R_ERR]
	jnz ?PageErr
	cmp r1, 0x80
	jb ?PageErr
	cmp r1, 0xff
	ja ?PageErr

	r1 = r1 lsl 4
	r1 = r1 lsl 4
	r3 = R_Block
?Verify:
	r2 = [r1++]
	cmp r2, [r3++] 
	je ?Next
	cmp r1, 0xfff8						// [0xfff7] always 0xfc00
	jne ?VerifyErr
?Next:	
	test r1, 0x00ff
	jnz ?Verify
?VerifyOK:
	r1 = 0x5356							// "VS"	
	jmp ?Response
?VerifyErr:
	r1 = 0x4656							// "VF"
	jmp ?Response
?PageErr:
	r1 = 0x5056							// "VP"
?Response:
	M_Call ISP_UART_SendWord	
retf

// ============================================================================
ISP_Upload:
	r1 = 0
	[R_Sum] = r1
	[R_Sum+1] = r1
	
	M_Call ISP_UART_Recv				// Get Page Number
	r2 = [R_ERR]
	jnz ?PageErr

	r2 = r1
	r1 = 0x5255							// "UR"
	M_Call ISP_UART_SendWord

	r2 = r2 lsl 4
	r2 = r2 lsl 4
?Upload:
	r1 = [r2++]
	M_Call ISP_UART_SendWord
	r3 = 0
	r1 += [R_Sum]
	[R_Sum]	 = r1
	r3 += [R_Sum+1], carry
	[R_Sum+1] = r3
	test r2, 0x00ff
	jnz ?Upload
	r1 = [R_Sum]
	M_Call ISP_UART_SendWord			// checksum
	r1 = [R_Sum+1]
	M_Call ISP_UART_SendWord
	jmp ?Exit
?PageErr:
	r1 = 0x5055							// "UP"
	M_Call ISP_UART_SendWord
?Exit:		
retf
_Default_ISR:
reti
// ============================================================================
// End
_ISP_END:

.END
