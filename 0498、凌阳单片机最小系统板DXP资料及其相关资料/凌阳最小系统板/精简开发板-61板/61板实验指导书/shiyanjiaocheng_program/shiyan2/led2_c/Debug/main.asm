// GCC for SUNPLUS u'nSP version 1.0.10-10
// Command: C:\PROGRA~1\Sunplus\UNSPID~1\unSPIDE\cc1.exe C:\DOCUME~1\Αυ»Τ\LOCALS~1\Temp\ccaCaaaa.i -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "D:\\shiyanjiaocheng_program\\shiyan2\\led2_c/", 0x64, 0, 3, Ltext0
.stabs "D:/shiyanjiaocheng_program/shiyan2/led2_c/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "Delay:F19",36,0,0,',0,0,offset _Delay,seg _Delay,0x0d,0x0a
.CODE
.public _Delay
_Delay:	.proc
.debug
	.dw '.stabn 0x44,0,48,',0,0
	.dd LM1-_Delay
	.dw 0x0d,0x0a
.code
LM1:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
.debug
	.dw '.stabn 0x44,0,49,',0,0
	.dd LM2-_Delay
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM3-_Delay
	.dw 0x0d,0x0a
.code
LM3:
	R2=0	// QImode move
	[BP]=R2	// QImode move
L3:
	R2=[BP]	// QImode move
	CMP R2,0	// QImode test
	JL L7	// QImode GE
	PC=L6
L7:
	pc=L4	// Indirect jump
L6:
.debug
	.dw '.stabn 0x44,0,51,',0,0
	.dd LM4-_Delay
	.dw 0x0d,0x0a
.code
LM4:
	R2=1	// QImode move
	[28690]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM5-_Delay
	.dw 0x0d,0x0a
.code
LM5:
L5:
	R2=[BP]	// QImode move
	R3=R2+1
	[BP]=R3	// QImode move
	pc=L3	// Indirect jump
L4:
.debug
	.dw '.stabn 0x44,0,53,',0,0
	.dd LM6-_Delay
	.dw 0x0d,0x0a
.code
LM6:
LBE2:
.debug
	.dw '.stabn 0x44,0,53,',0,0
	.dd LM7-_Delay
	.dw 0x0d,0x0a
.code
LM7:
L2:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of Delay

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_Delay
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "i:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE2-_Delay
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME1-_Delay
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
	.dw '.stabn 0x44,0,65,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	// total=3, vars=3
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=3
	bp=sp+1

	R1=BP+6
	[bp+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,66,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
LBB3:
	R1=1	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,67,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,68,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	R1=255	// QImode move
	[28674]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,69,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	R1=255	// QImode move
	[28675]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,71,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	R1=64	// QImode move
	[28679]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	R1=64	// QImode move
	[28680]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,73,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	R1=64	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,74,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
L9:
	pc=L11	// Indirect jump
	pc=L10	// Indirect jump
L11:
.debug
	.dw '.stabn 0x44,0,76,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
	R1=[BP]	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,1	// QImode compare
	JZ L16	// QImode NE
	PC=L12
L16:
.debug
	.dw '.stabn 0x44,0,79,',0,0
	.dd LM20-_main
	.dw 0x0d,0x0a
.code
LM20:
	R1=[BP]	// QImode move
	R2=R1 asr 1
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,80,',0,0
	.dd LM21-_main
	.dw 0x0d,0x0a
.code
LM21:
	R1=[BP]	// QImode move
	CMP R1,0	// QImode test
	JZ L17	// QImode NE
	PC=L13
L17:
.debug
	.dw '.stabn 0x44,0,82,',0,0
	.dd LM22-_main
	.dw 0x0d,0x0a
.code
LM22:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,83,',0,0
	.dd LM23-_main
	.dw 0x0d,0x0a
.code
LM23:
	R1=1	// QImode move
	[BP]=R1	// QImode move
L13:
.debug
	.dw '.stabn 0x44,0,85,',0,0
	.dd LM24-_main
	.dw 0x0d,0x0a
.code
LM24:
	pc=L14	// Indirect jump
L12:
.debug
	.dw '.stabn 0x44,0,88,',0,0
	.dd LM25-_main
	.dw 0x0d,0x0a
.code
LM25:
	R1=[BP]	// QImode move
	R2=R1 lsl 1
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,89,',0,0
	.dd LM26-_main
	.dw 0x0d,0x0a
.code
LM26:
	R1=[BP]	// QImode move
	CMP R1,256	// QImode compare
	JZ L18	// QImode NE
	PC=L14
L18:
.debug
	.dw '.stabn 0x44,0,91,',0,0
	.dd LM27-_main
	.dw 0x0d,0x0a
.code
LM27:
	R1=BP	// QImode move
	R2=BP+1
	R1=1	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,92,',0,0
	.dd LM28-_main
	.dw 0x0d,0x0a
.code
LM28:
	R1=[BP]	// QImode move
	R2=R1 asr 1
	[BP]=R2	// QImode move
L15:
L14:
.debug
	.dw '.stabn 0x44,0,96,',0,0
	.dd LM29-_main
	.dw 0x0d,0x0a
.code
LM29:
	call _Delay	// call without return value
.debug
	.dw '.stabn 0x44,0,97,',0,0
	.dd LM30-_main
	.dw 0x0d,0x0a
.code
LM30:
	pc=L9	// Indirect jump
L10:
.debug
	.dw '.stabn 0x44,0,98,',0,0
	.dd LM31-_main
	.dw 0x0d,0x0a
.code
LM31:
LBE3:
.debug
	.dw '.stabn 0x44,0,98,',0,0
	.dd LM32-_main
	.dw 0x0d,0x0a
.code
LM32:
L8:

	sp+=3
	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB3-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "LedControl:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "LedDir:1",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE3-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME2-_main
	.dw 0x0d,0x0a
.code
LME2:
	.end
