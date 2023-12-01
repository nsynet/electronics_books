// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\PROGRA~1\Sunplus\UNSPID~3\IDE180\cc1.exe C:\DOCUME~1\李华丽.DOMAIN\LOCALS~1\Temp\ccwvaaaa.i -fkeep-inline-functions -quiet -dumpbase ISR.c -gstabs -o .\Debug/ISR.asm
// gcc2_compiled.:

.stabs "F:\\电子竞赛\\竞赛光盘\\典型应用篇\\电子竞赛—数字化语音存储与回放\\LineIN_Filter\\LineIN_Filter/", 0x64, 0, 3, Ltext0
.stabs "F:/电子竞赛/竞赛光盘/典型应用篇/电子竞赛—数字化语音存储与回放/LineIN_Filter/LineIN_Filter/ISR.c", 0x64, 0, 3, Ltext0
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
// ISR ATTRIBUTE FUNCTION, LOCATE in .text SECTION
.text
.debug
	.dw '.stabs "BREAK:F19",36,0,0,',0,0,offset _BREAK,seg _BREAK,0x0d,0x0a
.TEXT
.public _BREAK
_BREAK:	.proc
.debug
	.dw '.stabn 0x44,0,22,',0,0
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
	.dw '.stabn 0x44,0,23,',0,0
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
	.dw '.stabn 0x44,0,26,',0,0
	.dd LM3-_FIQ
	.dw 0x0d,0x0a
.text
LM3:
	// ISR ATTRIBUTE FUNCTION, PUSH r1,bp
	push r1,bp to [sp]

	// total=5, vars=5
	// frame_pointer_needed: 1
	sp-=5
	bp=sp+1

	R1=BP+8
	[bp+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM4-_FIQ
	.dw 0x0d,0x0a
.text
LM4:
LBB2:
.debug
	.dw '.stabn 0x44,0,30,',0,0
	.dd LM5-_FIQ
	.dw 0x0d,0x0a
.text
LM5:
	R2=[_g_Flag_Status]	// QImode move
	R1=R2&1
	CMP R1,0	// QImode test
	JNZ L10	// QImode EQ
	PC=L4
L10:
.debug
	.dw '.stabn 0x44,0,32,',0,0
	.dd LM6-_FIQ
	.dw 0x0d,0x0a
.text
LM6:
	R1=[_g_ulAddr]	// HImode RD=[Label]
	R2=[_g_ulAddr+1]
	CMP R2,0	// HImode compare
	JA  L12	// HImode LEU
	JNZ L11
	CMP R1,(-2)
	JA  L12
L11:
	PC=L5
L12:
.debug
	.dw '.stabn 0x44,0,34,',0,0
	.dd LM7-_FIQ
	.dw 0x0d,0x0a
.text
LM7:
	R1=0	// HImode immediate to register move
	R2=0
	[_g_ulAddr]=R1	// HImode [Label]=RS
	[_g_ulAddr+1]=R2
.debug
	.dw '.stabn 0x44,0,35,',0,0
	.dd LM8-_FIQ
	.dw 0x0d,0x0a
.text
LM8:
	R1=2	// QImode move
	[_g_Flag_Status]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,36,',0,0
	.dd LM9-_FIQ
	.dw 0x0d,0x0a
.text
LM9:
	pc=L6	// jump
L5:
.debug
	.dw '.stabn 0x44,0,39,',0,0
	.dd LM10-_FIQ
	.dw 0x0d,0x0a
.text
LM10:
	R1=BP	// QImode move
	R3=BP+1
	[bp+4]=R3	// QImode move
	call _Fir	// call with return value
	R3=R1
	R4=0
	R1=[bp+4]	// QImode move
	[R1++]=R3	// [RD]=RS HImode, RD!=RS+1
	[R1--]=R4
.debug
	.dw '.stabn 0x44,0,40,',0,0
	.dd LM11-_FIQ
	.dw 0x0d,0x0a
.text
LM11:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM12-_FIQ
	.dw 0x0d,0x0a
.text
LM12:
	R1=[BP]	// QImode move
	[SP--]=R1	// QImode move
	R1=[_g_ulAddr]	// HImode RD=[Label]
	R2=[_g_ulAddr+1]
	push R1,R2 to [sp]	// pushhi
	call _SP_SIOSendAWord	// call without return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM13-_FIQ
	.dw 0x0d,0x0a
.text
LM13:
	R1=[_g_ulAddr]	// HImode RD=[Label]
	R2=[_g_ulAddr+1]
	R3=R1+2	// HImode RD=RS+#IMM16
	R4=R2+0, Carry
	[_g_ulAddr]=R3	// HImode [Label]=RS
	[_g_ulAddr+1]=R4
L6:
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM14-_FIQ
	.dw 0x0d,0x0a
.text
LM14:
	pc=L7	// jump
L4:
.debug
	.dw '.stabn 0x44,0,45,',0,0
	.dd LM15-_FIQ
	.dw 0x0d,0x0a
.text
LM15:
	R2=[_g_Flag_Status]	// QImode move
	R1=R2&4
	CMP R1,0	// QImode test
	JNZ L13	// QImode EQ
	PC=L7
L13:
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM16-_FIQ
	.dw 0x0d,0x0a
.text
LM16:
	R1=[_g_ulAddr]	// HImode RD=[Label]
	R2=[_g_ulAddr+1]
	push R1,R2 to [sp]	// pushhi
	call _SP_SIOReadAWord	// call with return value
	SP=SP+2
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,48,',0,0
	.dd LM17-_FIQ
	.dw 0x0d,0x0a
.text
LM17:
	R1=[BP]	// QImode move
	[28695]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,49,',0,0
	.dd LM18-_FIQ
	.dw 0x0d,0x0a
.text
LM18:
	R1=[_g_ulAddr]	// HImode RD=[Label]
	R2=[_g_ulAddr+1]
	R3=R1+2	// HImode RD=RS+#IMM16
	R4=R2+0, Carry
	[_g_ulAddr]=R3	// HImode [Label]=RS
	[_g_ulAddr+1]=R4
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM19-_FIQ
	.dw 0x0d,0x0a
.text
LM19:
	R1=[_g_ulAddr]	// HImode RD=[Label]
	R2=[_g_ulAddr+1]
	CMP R2,0	// HImode compare
	JA  L15	// HImode LEU
	JNZ L14
	CMP R1,(-2)
	JA  L15
L14:
	PC=L7
L15:
.debug
	.dw '.stabn 0x44,0,52,',0,0
	.dd LM20-_FIQ
	.dw 0x0d,0x0a
.text
LM20:
	R1=0	// HImode immediate to register move
	R2=0
	[_g_ulAddr]=R1	// HImode [Label]=RS
	[_g_ulAddr+1]=R2
.debug
	.dw '.stabn 0x44,0,53,',0,0
	.dd LM21-_FIQ
	.dw 0x0d,0x0a
.text
LM21:
	R1=2	// QImode move
	[_g_Flag_Status]=R1	// QImode move
L9:
L8:
L7:
.debug
	.dw '.stabn 0x44,0,57,',0,0
	.dd LM22-_FIQ
	.dw 0x0d,0x0a
.text
LM22:
	R1=8192	// QImode move
	[28689]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM23-_FIQ
	.dw 0x0d,0x0a
.text
LM23:
LBE2:
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM24-_FIQ
	.dw 0x0d,0x0a
.text
LM24:
L3:

	sp+=5
	// ISR ATTRIBUTE FUNCTION, POP r1,bp
	pop r1,bp from [sp]
	reti
	.endp	// end of FIQ

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_FIQ
	.dw 0x0d,0x0a
.text
.debug
	.dw '.stabs "uiData:4",128,0,0,0',0x0d,0x0a
.TEXT
.debug
	.dw '.stabs "lFilterOut:3",128,0,0,1',0x0d,0x0a
.TEXT
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE2-_FIQ
	.dw 0x0d,0x0a
.text
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
	.dw '.stabn 0x44,0,62,',0,0
	.dd LM25-_IRQ0
	.dw 0x0d,0x0a
.text
LM25:
	// ISR ATTRIBUTE FUNCTION, PUSH r1,bp
	push r1,bp to [sp]

	// total=0, vars=0
	// frame_pointer_needed: 1
	bp=sp+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,63,',0,0
	.dd LM26-_IRQ0
	.dw 0x0d,0x0a
.text
LM26:
L16:

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
	.dw '.stabn 0x44,0,66,',0,0
	.dd LM27-_IRQ1
	.dw 0x0d,0x0a
.text
LM27:
	// ISR ATTRIBUTE FUNCTION, PUSH r1,bp
	push r1,bp to [sp]

	// total=0, vars=0
	// frame_pointer_needed: 1
	bp=sp+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,67,',0,0
	.dd LM28-_IRQ1
	.dw 0x0d,0x0a
.text
LM28:
L17:

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
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM29-_IRQ2
	.dw 0x0d,0x0a
.text
LM29:
	// ISR ATTRIBUTE FUNCTION, PUSH r1,bp
	push r1,bp to [sp]

	// total=0, vars=0
	// frame_pointer_needed: 1
	bp=sp+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,71,',0,0
	.dd LM30-_IRQ2
	.dw 0x0d,0x0a
.text
LM30:
L18:

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
	.dw '.stabn 0x44,0,74,',0,0
	.dd LM31-_IRQ3
	.dw 0x0d,0x0a
.text
LM31:
	// ISR ATTRIBUTE FUNCTION, PUSH r1,bp
	push r1,bp to [sp]

	// total=0, vars=0
	// frame_pointer_needed: 1
	bp=sp+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM32-_IRQ3
	.dw 0x0d,0x0a
.text
LM32:
L19:

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
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM33-_IRQ4
	.dw 0x0d,0x0a
.text
LM33:
	// ISR ATTRIBUTE FUNCTION, PUSH r1,bp
	push r1,bp to [sp]

	// total=0, vars=0
	// frame_pointer_needed: 1
	bp=sp+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,79,',0,0
	.dd LM34-_IRQ4
	.dw 0x0d,0x0a
.text
LM34:
L20:

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
	.dw '.stabn 0x44,0,82,',0,0
	.dd LM35-_IRQ5
	.dw 0x0d,0x0a
.text
LM35:
	// ISR ATTRIBUTE FUNCTION, PUSH r1,bp
	push r1,bp to [sp]

	// total=0, vars=0
	// frame_pointer_needed: 1
	bp=sp+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,83,',0,0
	.dd LM36-_IRQ5
	.dw 0x0d,0x0a
.text
LM36:
L21:

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
	.dw '.stabn 0x44,0,86,',0,0
	.dd LM37-_IRQ6
	.dw 0x0d,0x0a
.text
LM37:
	// ISR ATTRIBUTE FUNCTION, PUSH r1,bp
	push r1,bp to [sp]

	// total=0, vars=0
	// frame_pointer_needed: 1
	bp=sp+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,87,',0,0
	.dd LM38-_IRQ6
	.dw 0x0d,0x0a
.text
LM38:
L22:

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
	.dw '.stabn 0x44,0,90,',0,0
	.dd LM39-_IRQ7
	.dw 0x0d,0x0a
.text
LM39:
	// ISR ATTRIBUTE FUNCTION, PUSH r1,bp
	push r1,bp to [sp]

	// total=0, vars=0
	// frame_pointer_needed: 1
	bp=sp+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,91,',0,0
	.dd LM40-_IRQ7
	.dw 0x0d,0x0a
.text
LM40:
L23:

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
.external _SP_SIOReadAWord
.external _SP_SIOSendAWord
.external _Fir
.external _g_ulAddr
.external _g_Flag_Status
	.end
