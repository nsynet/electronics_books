// GCC for SUNPLUS u'nSP version 1.0.10-10
// Command: C:\PROGRA~1\Sunplus\UNSPID~1\unSPIDE\cc1.exe C:\DOCUME~1\Αυ»Τ\LOCALS~1\Temp\cc8Aaaaa.i -quiet -dumpbase mian.c -gstabs -o .\Debug/mian.asm
// gcc2_compiled.:

.stabs "D:\\shiyanjiaocheng_program\\shiyan10\\led10_c/", 0x64, 0, 3, Ltext0
.stabs "D:/shiyanjiaocheng_program/shiyan10/led10_c/mian.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabn 0x44,0,59,',0,0
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
	[bp+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	R1=0	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,62,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	R1=(-192)	// QImode move
	[28679]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,63,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R1=(-192)	// QImode move
	[28680]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,64,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	R1=64	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,66,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R1=1	// QImode move
	[28715]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,67,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R1=[28693]	// QImode move
	R2=R1|1
	[28693]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,68,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
L3:
	pc=L5	// Indirect jump
	pc=L4	// Indirect jump
L5:
.debug
	.dw '.stabn 0x44,0,71,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
L6:
	R2=[28715]	// QImode move
	R1=R2&(-32768)
	CMP R1,0	// QImode test
	JNZ L9	// QImode EQ
	PC=L8
L9:
	pc=L7	// Indirect jump
L8:
	pc=L6	// Indirect jump
L7:
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	R1=[28716]	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,73,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	R1=[BP]	// QImode move
	R2=R1 lsl 2
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,74,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	R1=[BP]	// QImode move
	R2=R1|64
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	R1=[BP]	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,76,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	call _Delay	// call without return value
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	pc=L3	// Indirect jump
L4:
.debug
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
LBE2:
.debug
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
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
	.dw '.stabs "ADValue:4",128,0,0,0',0x0d,0x0a
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
.code
.debug
	.dw '.stabs "Delay:F19",36,0,0,',0,0,offset _Delay,seg _Delay,0x0d,0x0a
.CODE
.public _Delay
_Delay:	.proc
.debug
	.dw '.stabn 0x44,0,85,',0,0
	.dd LM18-_Delay
	.dw 0x0d,0x0a
.code
LM18:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
.debug
	.dw '.stabn 0x44,0,86,',0,0
	.dd LM19-_Delay
	.dw 0x0d,0x0a
.code
LM19:
LBB3:
.debug
	.dw '.stabn 0x44,0,87,',0,0
	.dd LM20-_Delay
	.dw 0x0d,0x0a
.code
LM20:
	R2=0	// QImode move
	[BP]=R2	// QImode move
L11:
	R2=[BP]	// QImode move
	CMP R2,79	// QImode compare
	JA L15	// QImode LEU
	PC=L14
L15:
	pc=L12	// Indirect jump
L14:
.debug
	.dw '.stabn 0x44,0,88,',0,0
	.dd LM21-_Delay
	.dw 0x0d,0x0a
.code
LM21:
	R2=1	// QImode move
	[28690]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,87,',0,0
	.dd LM22-_Delay
	.dw 0x0d,0x0a
.code
LM22:
L13:
	R2=[BP]	// QImode move
	R3=R2+1
	[BP]=R3	// QImode move
	pc=L11	// Indirect jump
L12:
.debug
	.dw '.stabn 0x44,0,90,',0,0
	.dd LM23-_Delay
	.dw 0x0d,0x0a
.code
LM23:
LBE3:
.debug
	.dw '.stabn 0x44,0,90,',0,0
	.dd LM24-_Delay
	.dw 0x0d,0x0a
.code
LM24:
L10:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of Delay

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB3-_Delay
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "i:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE3-_Delay
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME2-_Delay
	.dw 0x0d,0x0a
.code
LME2:
	.end
