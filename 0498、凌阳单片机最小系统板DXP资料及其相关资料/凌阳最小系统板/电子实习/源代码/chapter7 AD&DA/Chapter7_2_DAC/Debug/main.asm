// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\PROGRA~1\Sunplus\UNSPID~3\IDE180\cc1.exe C:\DOCUME~1\李华丽.DOMAIN\LOCALS~1\Temp\ccUvaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\电子竞赛\\C语言应用篇\\Source Code\\chapter7 AD&DA\\Chapter7_2_DAC/", 0x64, 0, 3, Ltext0
.stabs "F:/电子竞赛/C语言应用篇/Source Code/chapter7 AD&DA/Chapter7_2_DAC/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabn 0x44,0,3,',0,0
	.dd LM1-_main
	.dw 0x0d,0x0a
.code
LM1:
	// total=3, vars=3
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=3
	bp=sp+1

	R1=BP+6
.debug
	.dw '.stabn 0x44,0,4,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
.debug
	.dw '.stabn 0x44,0,5,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
// GCC inline ASM start
	int off
// GCC inline ASM end
.debug
	.dw '.stabn 0x44,0,6,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R2=0	// QImode move
	[28714]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,7,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	R2=0	// QImode move
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,8,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
L3:
	pc=L5	// jump
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,10,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R2=1	// QImode move
	[28690]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,11,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	R2=[BP]	// QImode move
	[28695]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,12,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
	R2=BP	// QImode move
	R3=BP+1
	R2=32	// QImode move
	R4=R3	// QImode move
	[R4]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,13,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
L6:
	R2=BP	// QImode move
	R3=BP+1
	R4=BP	// QImode move
	R2=BP+1
	R3=BP	// QImode move
	R4=BP+1
	R3=R4	// QImode move
	R3=[R3]	// QImode move
	[bp+2]=R3	// QImode move
	R4=[bp+2]	// QImode move
	R3=R4+(-1)
	R4=R3	// QImode move
	R3=R2	// QImode move
	[R3]=R4	// QImode move
	CMP R4,(-1)	// QImode compare
	JZ L9	// QImode NE
	PC=L8
L9:
	pc=L7	// jump
L8:
	pc=L6	// jump
L7:
.debug
	.dw '.stabn 0x44,0,14,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	R2=[BP]	// QImode move
	R3=R2+64
	[BP]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,15,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,16,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
LBE2:
.debug
	.dw '.stabn 0x44,0,16,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
L2:

	sp+=3
	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "uiData:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "i:4",128,0,0,1',0x0d,0x0a
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
	.end
