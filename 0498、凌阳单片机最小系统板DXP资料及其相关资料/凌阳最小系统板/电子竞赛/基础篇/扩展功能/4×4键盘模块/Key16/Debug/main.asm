// GCC for SUNPLUS u'nSP version 1.0.10
// Command: C:\PROGRA~1\SUNPLUS\UNSPID~1\IDE180\cc1.exe C:\WINDOWS\TEMP\ccRh5hgb.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\功能扩展\\Key16/", 0x64, 0, 3, Ltext0
.stabs "F:/功能扩展/Key16/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabn 0x44,0,11,',0,0
	.dd LM1-_main
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
	.dw '.stabn 0x44,0,12,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	call _SP_Init_IOA	// call with return value
.debug
	.dw '.stabn 0x44,0,14,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	R1=0	// QImode move
	[_KeyDownTimes]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,15,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R1=0	// QImode move
	[_KeyFlag]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,16,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
L3:
	pc=L5	// jump
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,18,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
LBB3:
	call _F_Key_Scan	// call with return value
.debug
	.dw '.stabn 0x44,0,19,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
L6:
	R1=[_KeyFlag]	// QImode move
	CMP R1,1	// QImode compare
	JNZ L9	// QImode EQ
	PC=L8
L9:
	pc=L7	// jump
L8:
.debug
	.dw '.stabn 0x44,0,21,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
LBB4:
	call _F_Get_Key	// call with return value
	[_KeyVal]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,22,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
	R1=0	// QImode move
	[_KeyFlag]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,25,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
LBE4:
	pc=L6	// jump
L7:
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
LBE3:
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,28,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
LBE2:
.debug
	.dw '.stabn 0x44,0,28,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
L2:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB3-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB4-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE4-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE3-_main
	.dw 0x0d,0x0a
.code
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
.debug
	.dw '.stabs "KeyVal:G4",32,0,0,',0,0,offset _KeyVal,seg _KeyVal,0x0d,0x0a
.CODE
.ram
.public _KeyVal
_KeyVal:
	.dw 0
.debug
	.dw '.stabs "KeyDownTimes:G4",32,0,0,',0,0,offset _KeyDownTimes,seg _KeyDownTimes,0x0d,0x0a
.CODE
.ram
.public _KeyDownTimes
_KeyDownTimes:
	.dw 0
.debug
	.dw '.stabs "KeyFlag:G4",32,0,0,',0,0,offset _KeyFlag,seg _KeyFlag,0x0d,0x0a
.CODE
.ram
.public _KeyFlag
_KeyFlag:
	.dw 0
.external _F_Get_Key
.external _F_Key_Scan
.external _SP_Init_IOA
	.end
