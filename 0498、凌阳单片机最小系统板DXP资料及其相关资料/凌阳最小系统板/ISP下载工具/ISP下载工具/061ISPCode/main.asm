.include spce061a.inc

.external _ISP_START
.external _ISP_END

.TEXT

.public _main


_main:
	// Erase blocks
	r1 = 0xfc00
	call F_Flash_Erase     
	r1 = 0xfd00
	call F_Flash_Erase
	r1 = 0xff00
	call F_Flash_Erase
	// Write the ISP Code to the 0xFC00 block
	r1 = 0xfc00
	r3 = _ISP_START
?L0:
	r2 = [r3++]
	call F_Flash_WriteWord
	r1 += 1
	cmp r3, _ISP_END
	jnz ?L0
	// Get Default_ISR Function entry
	r2 = _ISP_END
	r2 -= _ISP_START
	r2 += 0xfc00 - 1
	// Write Default_ISR Function entry to the interrupt vector
	r1 = 0xfff5
	call F_Flash_WriteWord
	r1 = 0xfff6
	call F_Flash_WriteWord
	r1 = 0xfff8
	call F_Flash_WriteWord
	r1 = 0xfff9
	call F_Flash_WriteWord
	r1 = 0xfffa
	call F_Flash_WriteWord
	r1 = 0xfffb
	call F_Flash_WriteWord
	r1 = 0xfffc
	call F_Flash_WriteWord
	r1 = 0xfffd
	call F_Flash_WriteWord
	r1 = 0xfffe
	call F_Flash_WriteWord
	r1 = 0xffff
	call F_Flash_WriteWord
	// Write the reset vector
	r1 = 0xfff7
	r2 = 0xfc00
	call F_Flash_WriteWord
	r1 = 0xfff4
	call F_Flash_WriteWord
	// Beep to tell user that finished
	r1 = 0xff
	r2 = 0x7f
	call F_Beep
?L:
	r1 = 0x0001
	[P_Watchdog_Clear] = r1
	jmp ?L	
	retf
// r1: Freqency, r2: Length
F_Beep:
	r3 = 0
	[P_DAC_Ctrl] = r3
?BL:
	r3 = 0xffff
	[P_DAC1] = r3
	[P_DAC2] = r3
	call F_Delay
	r3 = 0x0000
	[P_DAC1] = r3
	[P_DAC2] = r3
	call F_Delay
	r2 -= 1
	cmp r2, 0
	jne ?BL
	retf
// r1: delay count
F_Delay:
	push r1 to [sp]
?DL:
	nop
	r1 -= 1
	cmp r1, 0
	jne ?DL
	pop r1 from [sp]
	retf
// r1:Addr, r2:Data
F_Flash_WriteWord:
	push r1, r3 to [sp]
	r3 = 0xaaaa
	[P_Flash_Ctrl] = r3
	r3 = 0x5533
	[P_Flash_Ctrl] = r3
	[r1] = r2
	pop r1, r3 from [sp]
retf
// r1:Addr
F_Flash_Erase:
	push r1, r2 to [sp]
	r2 = 0xaaaa
	[P_Flash_Ctrl] = r2
	r2 = 0x5511
	[P_Flash_Ctrl] = r2
	[r1] = r1
	pop r1, r2 from [sp]
retf	

