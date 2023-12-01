// GCC for SUNPLUS u'nSP version 1.0.10-10
// Command: C:\PROGRA~1\Sunplus\UNSPID~1\unSPIDE\cc1.exe C:\DOCUME~1\Αυ»Τ\LOCALS~1\Temp\ccMzaaaa.i -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "D:\\program\\shiyanjiaocheng_program\\shiyan8\\LED8_c/", 0x64, 0, 3, Ltext0
.stabs "D:/program/shiyanjiaocheng_program/shiyan8/LED8_c/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "DigCode:G20=ar1;0;9;11",32,0,0,',0,0,offset _DigCode,seg _DigCode,0x0d,0x0a
.CODE
.public _DigCode
.text
_DigCode:
	.dw 63
	.dw 6
	.dw 91
	.dw 79
	.dw 102
	.dw 109
	.dw 125
	.dw 7
	.dw 127
	.dw 111
.code
.debug
	.dw '.stabs "GetKey:F4",36,0,0,',0,0,offset _GetKey,seg _GetKey,0x0d,0x0a
.CODE
.public _GetKey
_GetKey:	.proc
.debug
	.dw '.stabn 0x44,0,64,',0,0
	.dd LM1-_GetKey
	.dw 0x0d,0x0a
.code
LM1:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R2=BP+4
.debug
	.dw '.stabn 0x44,0,65,',0,0
	.dd LM2-_GetKey
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
.debug
	.dw '.stabn 0x44,0,68,',0,0
	.dd LM3-_GetKey
	.dw 0x0d,0x0a
.code
LM3:
	R1=[28674]	// QImode move
	R3=R1&255
	[28674]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,69,',0,0
	.dd LM4-_GetKey
	.dw 0x0d,0x0a
.code
LM4:
	R1=[28675]	// QImode move
	R3=R1&255
	[28675]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM5-_GetKey
	.dw 0x0d,0x0a
.code
LM5:
	R1=[28673]	// QImode move
	R3=R1|(-256)
	[28673]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,73,',0,0
	.dd LM6-_GetKey
	.dw 0x0d,0x0a
.code
LM6:
L3:
	R3=[28672]	// QImode move
	R1=R3&(-256)
	CMP R1,(-256)	// QImode compare
	JNZ L9	// QImode EQ
	PC=L5
L9:
	pc=L4	// Indirect jump
L5:
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM7-_GetKey
	.dw 0x0d,0x0a
.code
LM7:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,76,',0,0
	.dd LM8-_GetKey
	.dw 0x0d,0x0a
.code
LM8:
	pc=L3	// Indirect jump
L4:
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM9-_GetKey
	.dw 0x0d,0x0a
.code
LM9:
	R3=[28672]	// QImode move
	R1=R3&(-256)
	R3=R1^(-256)
	[BP]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,79,',0,0
	.dd LM10-_GetKey
	.dw 0x0d,0x0a
.code
LM10:
L6:
	R3=[28672]	// QImode move
	R1=R3&(-256)
	CMP R1,(-256)	// QImode compare
	JZ L10	// QImode NE
	PC=L8
L10:
	pc=L7	// Indirect jump
L8:
.debug
	.dw '.stabn 0x44,0,81,',0,0
	.dd LM11-_GetKey
	.dw 0x0d,0x0a
.code
LM11:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,82,',0,0
	.dd LM12-_GetKey
	.dw 0x0d,0x0a
.code
LM12:
	pc=L6	// Indirect jump
L7:
.debug
	.dw '.stabn 0x44,0,83,',0,0
	.dd LM13-_GetKey
	.dw 0x0d,0x0a
.code
LM13:
	R3=[BP]	// QImode move
	R1=R3	// QImode move
	pc=L2	// Indirect jump
.debug
	.dw '.stabn 0x44,0,84,',0,0
	.dd LM14-_GetKey
	.dw 0x0d,0x0a
.code
LM14:
LBE2:
.debug
	.dw '.stabn 0x44,0,84,',0,0
	.dd LM15-_GetKey
	.dw 0x0d,0x0a
.code
LM15:
L2:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of GetKey

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_GetKey
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "KeyValue:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE2-_GetKey
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME1-_GetKey
	.dw 0x0d,0x0a
.code
LME1:
.code
.debug
	.dw '.stabs "LedDispDig:F19",36,0,0,',0,0,offset _LedDispDig,seg _LedDispDig,0x0d,0x0a
.CODE
.public _LedDispDig
_LedDispDig:	.proc
.debug
	.dw '.stabn 0x44,0,95,',0,0
	.dd LM16-_LedDispDig
	.dw 0x0d,0x0a
.code
LM16:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,96,',0,0
	.dd LM17-_LedDispDig
	.dw 0x0d,0x0a
.code
LM17:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,98,',0,0
	.dd LM18-_LedDispDig
	.dw 0x0d,0x0a
.code
LM18:
	R1=[28679]	// QImode move
	R2=R1|16383
	[28679]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,99,',0,0
	.dd LM19-_LedDispDig
	.dw 0x0d,0x0a
.code
LM19:
	R1=[28680]	// QImode move
	R2=R1|16383
	[28680]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,101,',0,0
	.dd LM20-_LedDispDig
	.dw 0x0d,0x0a
.code
LM20:
	R3=[BP]	// QImode move
	R2=[R3]	// QImode move
	R1=R2+(-1)
	R2=256	// QImode move
	[SP--]=R1	// QImode move
	[SP--]=R2	// QImode move
	call __lshiu1	// call with return value
	SP=SP+2
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,102,',0,0
	.dd LM21-_LedDispDig
	.dw 0x0d,0x0a
.code
LM21:
	R1=[BP]	// QImode move
	R1=[BP]	// QImode move
	R2=R1+1
	R1=_DigCode	// QImode move
	R3=R2	// QImode move
	R2=[R3]	// QImode move
	R1+=R2	// addqi3_r0r
	R3=[28677]	// QImode move
	R2=R3	// QImode move
	R3=R1	// QImode move
	R2|=[R3]	// iorqi3_r0R
	[28677]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,103,',0,0
	.dd LM22-_LedDispDig
	.dw 0x0d,0x0a
.code
LM22:
.debug
	.dw '.stabn 0x44,0,103,',0,0
	.dd LM23-_LedDispDig
	.dw 0x0d,0x0a
.code
LM23:
L11:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of LedDispDig

.debug
	.dw '.stabs "Pos:p1",160,0,0,4',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "Dig:p1",160,0,0,5',0x0d,0x0a
.CODE
.debug
	.dw '.stabf ',0,0
	.dd LME2-_LedDispDig
	.dw 0x0d,0x0a
.code
LME2:
.code
.debug
	.dw '.stabs "main:F1",36,0,0,',0,0,offset _main,seg _main,0x0d,0x0a
.CODE
.public _main
_main:	.proc
.debug
	.dw '.stabn 0x44,0,110,',0,0
	.dd LM24-_main
	.dw 0x0d,0x0a
.code
LM24:
	// total=4, vars=4
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=4
	bp=sp+1

	R1=BP+7
	[bp+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,111,',0,0
	.dd LM25-_main
	.dw 0x0d,0x0a
.code
LM25:
LBB3:
.debug
	.dw '.stabn 0x44,0,112,',0,0
	.dd LM26-_main
	.dw 0x0d,0x0a
.code
LM26:
L13:
	pc=L15	// Indirect jump
	pc=L14	// Indirect jump
L15:
.debug
	.dw '.stabn 0x44,0,114,',0,0
	.dd LM27-_main
	.dw 0x0d,0x0a
.code
LM27:
	call _GetKey	// call with return value
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,117,',0,0
	.dd LM28-_main
	.dw 0x0d,0x0a
.code
LM28:
	R1=BP	// QImode move
	R2=BP+1
	R1=1	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,118,',0,0
	.dd LM29-_main
	.dw 0x0d,0x0a
.code
LM29:
	R1=BP	// QImode move
	R2=BP+2
	R1=256	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,119,',0,0
	.dd LM30-_main
	.dw 0x0d,0x0a
.code
LM30:
L16:
	R1=BP	// QImode move
	R2=BP+2
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	JZ L22	// QImode NE
	PC=L18
L22:
	pc=L17	// Indirect jump
L18:
.debug
	.dw '.stabn 0x44,0,122,',0,0
	.dd LM31-_main
	.dw 0x0d,0x0a
.code
LM31:
	R1=BP	// QImode move
	R2=BP+2
	R1=[BP]	// QImode move
	R4=R2	// QImode move
	CMP R1,[R4]	// QImode compare
	JZ L23	// QImode NE
	PC=L19
L23:
.debug
	.dw '.stabn 0x44,0,124,',0,0
	.dd LM32-_main
	.dw 0x0d,0x0a
.code
LM32:
	pc=L17	// Indirect jump
.debug
	.dw '.stabn 0x44,0,125,',0,0
	.dd LM33-_main
	.dw 0x0d,0x0a
.code
LM33:
	pc=L20	// Indirect jump
L19:
.debug
	.dw '.stabn 0x44,0,128,',0,0
	.dd LM34-_main
	.dw 0x0d,0x0a
.code
LM34:
	R2=BP	// QImode move
	R1=BP+2
	R2=BP	// QImode move
	R3=BP+2
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2 lsl 1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,129,',0,0
	.dd LM35-_main
	.dw 0x0d,0x0a
.code
LM35:
	R1=BP	// QImode move
	R2=BP+1
	R3=BP	// QImode move
	R1=BP+1
	R2=BP	// QImode move
	R3=BP+1
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
L20:
.debug
	.dw '.stabn 0x44,0,131,',0,0
	.dd LM36-_main
	.dw 0x0d,0x0a
.code
LM36:
	pc=L16	// Indirect jump
L17:
.debug
	.dw '.stabn 0x44,0,132,',0,0
	.dd LM37-_main
	.dw 0x0d,0x0a
.code
LM37:
	R1=BP	// QImode move
	R2=BP+2
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	JZ L24	// QImode NE
	PC=L21
L24:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
L21:
.debug
	.dw '.stabn 0x44,0,133,',0,0
	.dd LM38-_main
	.dw 0x0d,0x0a
.code
LM38:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	R1=6	// QImode move
	[SP--]=R1	// QImode move
	call _LedDispDig	// call without return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,134,',0,0
	.dd LM39-_main
	.dw 0x0d,0x0a
.code
LM39:
	pc=L13	// Indirect jump
L14:
.debug
	.dw '.stabn 0x44,0,135,',0,0
	.dd LM40-_main
	.dw 0x0d,0x0a
.code
LM40:
LBE3:
.debug
	.dw '.stabn 0x44,0,135,',0,0
	.dd LM41-_main
	.dw 0x0d,0x0a
.code
LM41:
L12:

	sp+=4
	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB3-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "KeyValue:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "KeyNum:4",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "KeyMask:4",128,0,0,2',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE3-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME3-_main
	.dw 0x0d,0x0a
.code
LME3:
.external __lshiu1
	.end
