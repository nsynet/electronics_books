// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\PROGRA~1\Sunplus\UNSPID~3\IDE180\cc1.exe C:\DOCUME~1\���.DOMAIN\LOCALS~1\Temp\ccsvaaaa.i -fkeep-inline-functions -quiet -dumpbase ISR.c -gstabs -o .\Debug/ISR.asm
// gcc2_compiled.:

.stabs "F:\\���Ӿ���\\C����Ӧ��ƪ\\Source Code\\chapter6 Interrupt\\Capter6_2_TimeBase/", 0x64, 0, 3, Ltext0
.stabs "F:/���Ӿ���/C����Ӧ��ƪ/Source Code/chapter6 Interrupt/Capter6_2_TimeBase/ISR.c", 0x64, 0, 3, Ltext0
.code
Ltext0:
.debug
	.dw '.stabs "int:t1=r1;-32768;32767;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "char:t2=r2;0;127;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "long int:t3=r3;-2147483648;2147483647;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "unsigned int:t4=r4;0;65535;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "long unsigned int:t5=r5;0;4294967295;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "long long int:t6=r6;-2147483648;2147483647;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "long long unsigned int:t7=r7;0;4294967295;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "short int:t8=r8;-32768;32767;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "short unsigned int:t9=r9;0;65535;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "signed char:t10=r10;-32768;32767;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "unsigned char:t11=r11;0;65535;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "float:t12=r1;2;0;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "double:t13=r1;2;0;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "long double:t14=r1;2;0;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "complex int:t15=s2real:1,0,16;imag:1,16,16;;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "complex float:t16=r16;2;0;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "complex double:t17=r17;2;0;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "complex long double:t18=r18;2;0;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "void:t19=19",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "g_uiOutput:G4",32,0,0,',0,0,offset _g_uiOutput,seg _g_uiOutput,0x0d,0x0a
.CODE
.public _g_uiOutput
.iram
_g_uiOutput:
	.dw 0
// ISR ATTRIBUTE FUNCTION, LOCATE in .text SECTION
.text
.debug
	.dw '.stabs "BREAK:F19",36,0,0,',0,0,offset _BREAK,seg _BREAK,0x0d,0x0a
.TEXT
.public _BREAK
_BREAK:	.proc
.debug
	.dw '.stabn 0x44,0,8,',0,0
	.dd LM1-_BREAK
	.dw 0x0d,0x0a
.text
LM1:
	// ISR ATTRIBUTE FUNCTION, PUSH r1,bp
	push r1,bp to [sp]

	// total=0, vars=0
	// frame_pointer_needed: 1
	bp=sp+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,9,',0,0
	.dd LM2-_BREAK
	.dw 0x0d,0x0a
.text
LM2:
L2:

	// ISR ATTRIBUTE FUNCTION, POP r1,bp
	pop r1,bp from [sp]
	reti
	.endp	// end of BREAK

.debug
	.dw '.stabf ',0,0
	.dd LME1-_BREAK
	.dw 0x0d,0x0a
.text
LME1:
// ISR ATTRIBUTE FUNCTION, LOCATE in .text SECTION
.text
.debug
	.dw '.stabs "FIQ:F19",36,0,0,',0,0,offset _FIQ,seg _FIQ,0x0d,0x0a
.TEXT
.public _FIQ
_FIQ:	.proc
.debug
	.dw '.stabn 0x44,0,12,',0,0
	.dd LM3-_FIQ
	.dw 0x0d,0x0a
.text
LM3:
	// ISR ATTRIBUTE FUNCTION, PUSH r1,bp
	push r1,bp to [sp]

	// total=0, vars=0
	// frame_pointer_needed: 1
	bp=sp+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,13,',0,0
	.dd LM4-_FIQ
	.dw 0x0d,0x0a
.text
LM4:
L3:

	// ISR ATTRIBUTE FUNCTION, POP r1,bp
	pop r1,bp from [sp]
	reti
	.endp	// end of FIQ

.debug
	.dw '.stabf ',0,0
	.dd LME2-_FIQ
	.dw 0x0d,0x0a
.text
LME2:
// ISR ATTRIBUTE FUNCTION, LOCATE in .text SECTION
.text
.debug
	.dw '.stabs "IRQ0:F19",36,0,0,',0,0,offset _IRQ0,seg _IRQ0,0x0d,0x0a
.TEXT
.public _IRQ0
_IRQ0:	.proc
.debug
	.dw '.stabn 0x44,0,16,',0,0
	.dd LM5-_IRQ0
	.dw 0x0d,0x0a
.text
LM5:
	// ISR ATTRIBUTE FUNCTION, PUSH r1,bp
	push r1,bp to [sp]

	// total=0, vars=0
	// frame_pointer_needed: 1
	bp=sp+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,17,',0,0
	.dd LM6-_IRQ0
	.dw 0x0d,0x0a
.text
LM6:
L4:

	// ISR ATTRIBUTE FUNCTION, POP r1,bp
	pop r1,bp from [sp]
	reti
	.endp	// end of IRQ0

.debug
	.dw '.stabf ',0,0
	.dd LME3-_IRQ0
	.dw 0x0d,0x0a
.text
LME3:
// ISR ATTRIBUTE FUNCTION, LOCATE in .text SECTION
.text
.debug
	.dw '.stabs "IRQ1:F19",36,0,0,',0,0,offset _IRQ1,seg _IRQ1,0x0d,0x0a
.TEXT
.public _IRQ1
_IRQ1:	.proc
.debug
	.dw '.stabn 0x44,0,20,',0,0
	.dd LM7-_IRQ1
	.dw 0x0d,0x0a
.text
LM7:
	// ISR ATTRIBUTE FUNCTION, PUSH r1,bp
	push r1,bp to [sp]

	// total=0, vars=0
	// frame_pointer_needed: 1
	bp=sp+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,21,',0,0
	.dd LM8-_IRQ1
	.dw 0x0d,0x0a
.text
LM8:
L5:

	// ISR ATTRIBUTE FUNCTION, POP r1,bp
	pop r1,bp from [sp]
	reti
	.endp	// end of IRQ1

.debug
	.dw '.stabf ',0,0
	.dd LME4-_IRQ1
	.dw 0x0d,0x0a
.text
LME4:
// ISR ATTRIBUTE FUNCTION, LOCATE in .text SECTION
.text
.debug
	.dw '.stabs "IRQ2:F19",36,0,0,',0,0,offset _IRQ2,seg _IRQ2,0x0d,0x0a
.TEXT
.public _IRQ2
_IRQ2:	.proc
.debug
	.dw '.stabn 0x44,0,24,',0,0
	.dd LM9-_IRQ2
	.dw 0x0d,0x0a
.text
LM9:
	// ISR ATTRIBUTE FUNCTION, PUSH r1,bp
	push r1,bp to [sp]

	// total=0, vars=0
	// frame_pointer_needed: 1
	bp=sp+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,25,',0,0
	.dd LM10-_IRQ2
	.dw 0x0d,0x0a
.text
LM10:
L6:

	// ISR ATTRIBUTE FUNCTION, POP r1,bp
	pop r1,bp from [sp]
	reti
	.endp	// end of IRQ2

.debug
	.dw '.stabf ',0,0
	.dd LME5-_IRQ2
	.dw 0x0d,0x0a
.text
LME5:
// ISR ATTRIBUTE FUNCTION, LOCATE in .text SECTION
.text
.debug
	.dw '.stabs "IRQ3:F19",36,0,0,',0,0,offset _IRQ3,seg _IRQ3,0x0d,0x0a
.TEXT
.public _IRQ3
_IRQ3:	.proc
.debug
	.dw '.stabn 0x44,0,28,',0,0
	.dd LM11-_IRQ3
	.dw 0x0d,0x0a
.text
LM11:
	// ISR ATTRIBUTE FUNCTION, PUSH r1,bp
	push r1,bp to [sp]

	// total=0, vars=0
	// frame_pointer_needed: 1
	bp=sp+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,29,',0,0
	.dd LM12-_IRQ3
	.dw 0x0d,0x0a
.text
LM12:
L7:

	// ISR ATTRIBUTE FUNCTION, POP r1,bp
	pop r1,bp from [sp]
	reti
	.endp	// end of IRQ3

.debug
	.dw '.stabf ',0,0
	.dd LME6-_IRQ3
	.dw 0x0d,0x0a
.text
LME6:
// ISR ATTRIBUTE FUNCTION, LOCATE in .text SECTION
.text
.debug
	.dw '.stabs "IRQ4:F19",36,0,0,',0,0,offset _IRQ4,seg _IRQ4,0x0d,0x0a
.TEXT
.public _IRQ4
_IRQ4:	.proc
.debug
	.dw '.stabn 0x44,0,32,',0,0
	.dd LM13-_IRQ4
	.dw 0x0d,0x0a
.text
LM13:
	// ISR ATTRIBUTE FUNCTION, PUSH r1,bp
	push r1,bp to [sp]

	// total=0, vars=0
	// frame_pointer_needed: 1
	bp=sp+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,33,',0,0
	.dd LM14-_IRQ4
	.dw 0x0d,0x0a
.text
LM14:
L8:

	// ISR ATTRIBUTE FUNCTION, POP r1,bp
	pop r1,bp from [sp]
	reti
	.endp	// end of IRQ4

.debug
	.dw '.stabf ',0,0
	.dd LME7-_IRQ4
	.dw 0x0d,0x0a
.text
LME7:
// ISR ATTRIBUTE FUNCTION, LOCATE in .text SECTION
.text
.debug
	.dw '.stabs "IRQ5:F19",36,0,0,',0,0,offset _IRQ5,seg _IRQ5,0x0d,0x0a
.TEXT
.public _IRQ5
_IRQ5:	.proc
.debug
	.dw '.stabn 0x44,0,36,',0,0
	.dd LM15-_IRQ5
	.dw 0x0d,0x0a
.text
LM15:
	// ISR ATTRIBUTE FUNCTION, PUSH r1,bp
	push r1,bp to [sp]

	// total=0, vars=0
	// frame_pointer_needed: 1
	bp=sp+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,37,',0,0
	.dd LM16-_IRQ5
	.dw 0x0d,0x0a
.text
LM16:
	R2=[_P_INT_Ctrl]	// QImode move
	R4=R2	// QImode move
	R3=[R4]	// QImode move
	R2=R3&4
	CMP R2,0	// QImode test
	JNZ L12	// QImode EQ
	PC=L10
L12:
.debug
	.dw '.stabn 0x44,0,39,',0,0
	.dd LM17-_IRQ5
	.dw 0x0d,0x0a
.text
LM17:
	R2=[_P_IOA_Data]	// QImode move
	R3=[_g_uiOutput]	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,40,',0,0
	.dd LM18-_IRQ5
	.dw 0x0d,0x0a
.text
LM18:
	R2=[_g_uiOutput]	// QImode move
	R3=R2^0xffff	// one_cmplqi2
	[_g_uiOutput]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM19-_IRQ5
	.dw 0x0d,0x0a
.text
LM19:
	R2=[_P_INT_Clear]	// QImode move
	R3=4	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM20-_IRQ5
	.dw 0x0d,0x0a
.text
LM20:
	pc=L11	// jump
L10:
.debug
	.dw '.stabn 0x44,0,45,',0,0
	.dd LM21-_IRQ5
	.dw 0x0d,0x0a
.text
LM21:
	R2=[_P_INT_Clear]	// QImode move
	R3=8	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
L11:
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM22-_IRQ5
	.dw 0x0d,0x0a
.text
LM22:
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM23-_IRQ5
	.dw 0x0d,0x0a
.text
LM23:
L9:

	// ISR ATTRIBUTE FUNCTION, POP r1,bp
	pop r1,bp from [sp]
	reti
	.endp	// end of IRQ5

.debug
	.dw '.stabf ',0,0
	.dd LME8-_IRQ5
	.dw 0x0d,0x0a
.text
LME8:
// ISR ATTRIBUTE FUNCTION, LOCATE in .text SECTION
.text
.debug
	.dw '.stabs "IRQ6:F19",36,0,0,',0,0,offset _IRQ6,seg _IRQ6,0x0d,0x0a
.TEXT
.public _IRQ6
_IRQ6:	.proc
.debug
	.dw '.stabn 0x44,0,51,',0,0
	.dd LM24-_IRQ6
	.dw 0x0d,0x0a
.text
LM24:
	// ISR ATTRIBUTE FUNCTION, PUSH r1,bp
	push r1,bp to [sp]

	// total=0, vars=0
	// frame_pointer_needed: 1
	bp=sp+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,52,',0,0
	.dd LM25-_IRQ6
	.dw 0x0d,0x0a
.text
LM25:
L13:

	// ISR ATTRIBUTE FUNCTION, POP r1,bp
	pop r1,bp from [sp]
	reti
	.endp	// end of IRQ6

.debug
	.dw '.stabf ',0,0
	.dd LME9-_IRQ6
	.dw 0x0d,0x0a
.text
LME9:
// ISR ATTRIBUTE FUNCTION, LOCATE in .text SECTION
.text
.debug
	.dw '.stabs "IRQ7:F19",36,0,0,',0,0,offset _IRQ7,seg _IRQ7,0x0d,0x0a
.TEXT
.public _IRQ7
_IRQ7:	.proc
.debug
	.dw '.stabn 0x44,0,55,',0,0
	.dd LM26-_IRQ7
	.dw 0x0d,0x0a
.text
LM26:
	// ISR ATTRIBUTE FUNCTION, PUSH r1,bp
	push r1,bp to [sp]

	// total=0, vars=0
	// frame_pointer_needed: 1
	bp=sp+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM27-_IRQ7
	.dw 0x0d,0x0a
.text
LM27:
L14:

	// ISR ATTRIBUTE FUNCTION, POP r1,bp
	pop r1,bp from [sp]
	reti
	.endp	// end of IRQ7

.debug
	.dw '.stabf ',0,0
	.dd LME10-_IRQ7
	.dw 0x0d,0x0a
.text
LME10:
.external _P_INT_Clear
.external _P_IOA_Data
.external _P_INT_Ctrl
	.end
