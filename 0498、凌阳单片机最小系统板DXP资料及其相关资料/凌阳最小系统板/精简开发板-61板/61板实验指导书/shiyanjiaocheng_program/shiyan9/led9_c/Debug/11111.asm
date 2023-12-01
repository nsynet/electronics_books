// GCC for SUNPLUS u'nSP version 1.0.10-10
// Command: C:\PROGRA~1\Sunplus\UNSPID~1\unSPIDE\cc1.exe C:\DOCUME~1\Αυ»Τ\LOCALS~1\Temp\ccAzaaaa.i -quiet -dumpbase 11111.c -gstabs -o .\Debug/11111.asm
// gcc2_compiled.:

.stabs "D:\\program\\shiyanjiaocheng_program\\shiyan9\\led9_c/", 0x64, 0, 3, Ltext0
.stabs "D:/program/shiyanjiaocheng_program/shiyan9/led9_c/11111.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "LedDispDig:F19",36,0,0,',0,0,offset _LedDispDig,seg _LedDispDig,0x0d,0x0a
.CODE
.public _LedDispDig
_LedDispDig:	.proc
.debug
	.dw '.stabn 0x44,0,55,',0,0
	.dd LM1-_LedDispDig
	.dw 0x0d,0x0a
.code
LM1:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM2-_LedDispDig
	.dw 0x0d,0x0a
.code
LM2:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM3-_LedDispDig
	.dw 0x0d,0x0a
.code
LM3:
	R1=[28679]	// QImode move
	R2=R1|16383
	[28679]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,59,',0,0
	.dd LM4-_LedDispDig
	.dw 0x0d,0x0a
.code
LM4:
	R1=[28680]	// QImode move
	R2=R1|16383
	[28680]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,61,',0,0
	.dd LM5-_LedDispDig
	.dw 0x0d,0x0a
.code
LM5:
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
	.dw '.stabn 0x44,0,62,',0,0
	.dd LM6-_LedDispDig
	.dw 0x0d,0x0a
.code
LM6:
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
	.dw '.stabn 0x44,0,63,',0,0
	.dd LM7-_LedDispDig
	.dw 0x0d,0x0a
.code
LM7:
.debug
	.dw '.stabn 0x44,0,63,',0,0
	.dd LM8-_LedDispDig
	.dw 0x0d,0x0a
.code
LM8:
L2:

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
	.dd LME1-_LedDispDig
	.dw 0x0d,0x0a
.code
LME1:
.code
.debug
	.dw '.stabs "main:F1",36,0,0,',0,0,offset _main,seg _main,0x0d,0x0a
.CODE
.public _main
_main:	.proc
.debug
	.dw '.stabn 0x44,0,69,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
	// total=5, vars=5
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=5
	bp=sp+1

	R1=BP+8
	[bp+4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
LBB2:
.debug
	.dw '.stabn 0x44,0,71,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	R1=BP	// QImode move
	R2=BP+3
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,73,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
L4:
	pc=L6	// Indirect jump
	pc=L5	// Indirect jump
L6:
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
L7:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,9	// QImode compare
	JG L19	// QImode LE
	PC=L10
L19:
	pc=L8	// Indirect jump
L10:
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	R1=BP	// QImode move
	R2=BP+2
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
L11:
	R1=BP	// QImode move
	R2=BP+2
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,999	// QImode compare
	JG L20	// QImode LE
	PC=L14
L20:
	pc=L9	// Indirect jump
L14:
.debug
	.dw '.stabn 0x44,0,79,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	R1=1	// QImode move
	[BP]=R1	// QImode move
L15:
	R1=[BP]	// QImode move
	CMP R1,6	// QImode compare
	JG L21	// QImode LE
	PC=L18
L21:
	pc=L13	// Indirect jump
L18:
.debug
	.dw '.stabn 0x44,0,88,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	R1=BP	// QImode move
	R2=BP+1
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	R1=[BP]	// QImode move
	[SP--]=R1	// QImode move
	call _LedDispDig	// call without return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,79,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
L17:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L15	// Indirect jump
L16:
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
L13:
	R1=BP	// QImode move
	R2=BP+2
	R3=BP	// QImode move
	R1=BP+2
	R2=BP	// QImode move
	R3=BP+2
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
	pc=L11	// Indirect jump
L12:
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
L9:
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
	pc=L7	// Indirect jump
L8:
.debug
	.dw '.stabn 0x44,0,92,',0,0
	.dd LM20-_main
	.dw 0x0d,0x0a
.code
LM20:
	pc=L4	// Indirect jump
L5:
.debug
	.dw '.stabn 0x44,0,93,',0,0
	.dd LM21-_main
	.dw 0x0d,0x0a
.code
LM21:
LBE2:
.debug
	.dw '.stabn 0x44,0,93,',0,0
	.dd LM22-_main
	.dw 0x0d,0x0a
.code
LM22:
L3:

	sp+=5
	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "Pos:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "Dig:1",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "TimerCnt:1",128,0,0,2',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "i:1",128,0,0,3',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE2-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME2-_main
	.dw 0x0d,0x0a
.code
LME2:
.external __lshiu1
	.end
