// GCC for SUNPLUS u'nSP version 1.0.10-10
// Command: C:\PROGRA~1\Sunplus\UNSPID~1\unSPIDE\cc1.exe C:\DOCUME~1\liuxue\LOCALS~1\Temp\ccuwaaaa.i -quiet -dumpbase main.c -gstabs -Wall -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\2005年7月工作USBUART\\Demo2_UART/", 0x64, 0, 3, Ltext0
.stabs "F:/2005腬\3527診\302筡\244譢\367USBUART/Demo2_UART/main.c", 0x64, 0, 3, Ltext0
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
.code
.debug
	.dw '.stabs "main:F1",36,0,0,',0,0,offset _main,seg _main,0x0d,0x0a
.CODE
.public _main
_main:	.proc
.debug
	.dw '.stabn 0x44,0,7,',0,0
	.dd LM1-_main
	.dw 0x0d,0x0a
.code
LM1:
	// total=2, vars=2
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=2
	bp=sp+1

	R1=BP+5
.debug
	.dw '.stabn 0x44,0,8,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
.debug
	.dw '.stabn 0x44,0,9,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	R2=0	// QImode move
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,10,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R2=BP	// QImode move
	R3=BP+1
	R2=0	// QImode move
	R4=R3	// QImode move
	[R4]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,11,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	R2=0	// QImode move
	[_uiArr]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,12,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R2=0	// QImode move
	[_uiFlag]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,14,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R2=0	// QImode move
	[BP]=R2	// QImode move
L3:
	R2=[BP]	// QImode move
	CMP R2,99	// QImode compare
	JA L16	// QImode LEU
	PC=L6
L16:
	pc=L4	// Indirect jump
L6:
.debug
	.dw '.stabn 0x44,0,15,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	R2=_uiRecBuffer	// QImode move
	R3=[BP]	// QImode move
	R2+=R3	// addqi3_r0r
	R3=0	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,14,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
L5:
	R2=[BP]	// QImode move
	R3=R2+1
	[BP]=R3	// QImode move
	pc=L3	// Indirect jump
L4:
.debug
	.dw '.stabn 0x44,0,17,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
// GCC inline ASM start
	INT OFF
// GCC inline ASM end
.debug
	.dw '.stabn 0x44,0,19,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	R2=1152	// QImode move
	[28680]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,20,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	R2=1024	// QImode move
	[28679]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,21,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	R2=0	// QImode move
	[28677]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	R2=128	// QImode move
	[28708]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,24,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	R2=2	// QImode move
	[28709]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,26,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	R2=128	// QImode move
	[28705]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
	R2=192	// QImode move
	[28706]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,29,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
	R2=BP	// QImode move
	R3=BP+1
	R2=[28707]	// QImode move
	R4=R3	// QImode move
	[R4]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,31,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
// GCC inline ASM start
	INT IRQ
// GCC inline ASM end
.debug
	.dw '.stabn 0x44,0,33,',0,0
	.dd LM20-_main
	.dw 0x0d,0x0a
.code
LM20:
L7:
	R2=[_uiBuffer]	// QImode move
	CMP R2,53	// QImode compare
	JZ L17	// QImode NE
	PC=L9
L17:
	pc=L8	// Indirect jump
L9:
.debug
	.dw '.stabn 0x44,0,35,',0,0
	.dd LM21-_main
	.dw 0x0d,0x0a
.code
LM21:
	R2=1	// QImode move
	[28690]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,36,',0,0
	.dd LM22-_main
	.dw 0x0d,0x0a
.code
LM22:
	pc=L7	// Indirect jump
L8:
.debug
	.dw '.stabn 0x44,0,38,',0,0
	.dd LM23-_main
	.dw 0x0d,0x0a
.code
LM23:
	R2=1	// QImode move
	[_uiFlag]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,39,',0,0
	.dd LM24-_main
	.dw 0x0d,0x0a
.code
LM24:
L10:
	R2=[_uiBuffer]	// QImode move
	CMP R2,48	// QImode compare
	JZ L18	// QImode NE
	PC=L12
L18:
	pc=L11	// Indirect jump
L12:
.debug
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM25-_main
	.dw 0x0d,0x0a
.code
LM25:
	R2=1	// QImode move
	[28690]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM26-_main
	.dw 0x0d,0x0a
.code
LM26:
	R2=_uiRecBuffer	// QImode move
	R3=[_uiArr]	// QImode move
	R2+=R3	// addqi3_r0r
	R3=[_uiBuffer]	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,43,',0,0
	.dd LM27-_main
	.dw 0x0d,0x0a
.code
LM27:
	pc=L10	// Indirect jump
L11:
.debug
	.dw '.stabn 0x44,0,45,',0,0
	.dd LM28-_main
	.dw 0x0d,0x0a
.code
LM28:
	R2=192	// QImode move
	[28705]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,46,',0,0
	.dd LM29-_main
	.dw 0x0d,0x0a
.code
LM29:
	R2=192	// QImode move
	[28706]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM30-_main
	.dw 0x0d,0x0a
.code
LM30:
L13:
	pc=L15	// Indirect jump
	pc=L14	// Indirect jump
L15:
.debug
	.dw '.stabn 0x44,0,49,',0,0
	.dd LM31-_main
	.dw 0x0d,0x0a
.code
LM31:
	R2=1	// QImode move
	[28690]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM32-_main
	.dw 0x0d,0x0a
.code
LM32:
	pc=L13	// Indirect jump
L14:
.debug
	.dw '.stabn 0x44,0,51,',0,0
	.dd LM33-_main
	.dw 0x0d,0x0a
.code
LM33:
LBE2:
.debug
	.dw '.stabn 0x44,0,51,',0,0
	.dd LM34-_main
	.dw 0x0d,0x0a
.code
LM34:
L2:

	sp+=2
	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "i:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "uiTemp:4",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE2-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME1-_main
	.dw 0x0d,0x0a
.code
LME1:
// ISR ATTRIBUTE FUNCTION, LOCATE in .text SECTION
.text
.debug
	.dw '.stabs "IRQ7:F19",36,0,0,',0,0,offset _IRQ7,seg _IRQ7,0x0d,0x0a
.TEXT
.public _IRQ7
_IRQ7:	.proc
.debug
	.dw '.stabn 0x44,0,55,',0,0
	.dd LM35-_IRQ7
	.dw 0x0d,0x0a
.text
LM35:
	// ISR ATTRIBUTE FUNCTION, PUSH r1,bp
	push r1,bp to [sp]

	// total=1, vars=1
	// frame_pointer_needed: 1
	sp-=1
	bp=sp+1

	R1=BP+4
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM36-_IRQ7
	.dw 0x0d,0x0a
.text
LM36:
LBB3:
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM37-_IRQ7
	.dw 0x0d,0x0a
.text
LM37:
	R2=[28706]	// QImode move
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,59,',0,0
	.dd LM38-_IRQ7
	.dw 0x0d,0x0a
.text
LM38:
	R2=[BP]	// QImode move
	R3=R2&128
	[BP]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM39-_IRQ7
	.dw 0x0d,0x0a
.text
LM39:
	R2=[BP]	// QImode move
	CMP R2,128	// QImode compare
	JZ L25	// QImode NE
	PC=L20
L25:
.debug
	.dw '.stabn 0x44,0,62,',0,0
	.dd LM40-_IRQ7
	.dw 0x0d,0x0a
.text
LM40:
	R2=[28707]	// QImode move
	[_uiBuffer]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,63,',0,0
	.dd LM41-_IRQ7
	.dw 0x0d,0x0a
.text
LM41:
	R2=[_uiFlag]	// QImode move
	CMP R2,1	// QImode compare
	JZ L26	// QImode NE
	PC=L21
L26:
.debug
	.dw '.stabn 0x44,0,64,',0,0
	.dd LM42-_IRQ7
	.dw 0x0d,0x0a
.text
LM42:
	R2=[_uiArr]	// QImode move
	R3=1	// QImode move
	[_uiArr]=R2+R3
L21:
.debug
	.dw '.stabn 0x44,0,65,',0,0
	.dd LM43-_IRQ7
	.dw 0x0d,0x0a
.text
LM43:
	pc=L22	// Indirect jump
L20:
.debug
	.dw '.stabn 0x44,0,68,',0,0
	.dd LM44-_IRQ7
	.dw 0x0d,0x0a
.text
LM44:
	R2=[_uiArr]	// QImode move
	CMP R2,0	// QImode test
	JNZ L27	// QImode EQ
	PC=L23
L27:
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM45-_IRQ7
	.dw 0x0d,0x0a
.text
LM45:
	R2=_uiRecBuffer	// QImode move
	R3=[_uiArr]	// QImode move
	R2+=R3	// addqi3_r0r
	R4=R2	// QImode move
	R3=[R4]	// QImode move
	[28707]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,71,',0,0
	.dd LM46-_IRQ7
	.dw 0x0d,0x0a
.text
LM46:
	R2=[_uiArr]	// QImode move
	R3=(-1)	// QImode move
	[_uiArr]=R2+R3
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM47-_IRQ7
	.dw 0x0d,0x0a
.text
LM47:
	pc=L22	// Indirect jump
L23:
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM48-_IRQ7
	.dw 0x0d,0x0a
.text
LM48:
	R2=0	// QImode move
	[28705]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,76,',0,0
	.dd LM49-_IRQ7
	.dw 0x0d,0x0a
.text
LM49:
	R2=0	// QImode move
	[28706]=R2	// QImode move
L24:
L22:
.debug
	.dw '.stabn 0x44,0,79,',0,0
	.dd LM50-_IRQ7
	.dw 0x0d,0x0a
.text
LM50:
LBE3:
.debug
	.dw '.stabn 0x44,0,79,',0,0
	.dd LM51-_IRQ7
	.dw 0x0d,0x0a
.text
LM51:
L19:

	sp+=1
	// ISR ATTRIBUTE FUNCTION, POP r1,bp
	pop r1,bp from [sp]
	reti
	.endp	// end of IRQ7

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB3-_IRQ7
	.dw 0x0d,0x0a
.text
.debug
	.dw '.stabs "uiTemp1:4",128,0,0,0',0x0d,0x0a
.TEXT
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE3-_IRQ7
	.dw 0x0d,0x0a
.text
.debug
	.dw '.stabf ',0,0
	.dd LME2-_IRQ7
	.dw 0x0d,0x0a
.text
LME2:
.debug
	.dw '.stabs "uiRecBuffer:G20=ar1;0;99;4",32,0,0,',0,0,offset _uiRecBuffer,seg _uiRecBuffer,0x0d,0x0a
.CODE
.ram
.public _uiRecBuffer
_uiRecBuffer:
	.dw 100 dup(0)
.debug
	.dw '.stabs "uiBuffer:G4",32,0,0,',0,0,offset _uiBuffer,seg _uiBuffer,0x0d,0x0a
.CODE
.ram
.public _uiBuffer
_uiBuffer:
	.dw 0
.debug
	.dw '.stabs "uiArr:G4",32,0,0,',0,0,offset _uiArr,seg _uiArr,0x0d,0x0a
.CODE
.ram
.public _uiArr
_uiArr:
	.dw 0
.debug
	.dw '.stabs "uiFlag:G4",32,0,0,',0,0,offset _uiFlag,seg _uiFlag,0x0d,0x0a
.CODE
.ram
.public _uiFlag
_uiFlag:
	.dw 0
	.end
