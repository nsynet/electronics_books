// GCC for SUNPLUS u'nSP version 1.0.10-10
// Command: C:\PROGRA~1\Sunplus\UNSPID~1\unSPIDE\cc1.exe C:\DOCUME~1\Αυ»Τ\LOCALS~1\Temp\cciwaaaa.i -quiet -dumpbase key.c -gstabs -o .\Debug/key.asm
// gcc2_compiled.:

.stabs "D:\\program\\shiyanjiaocheng_program\\shiyan3\\led3_c/", 0x64, 0, 3, Ltext0
.stabs "D:/program/shiyanjiaocheng_program/shiyan3/led3_c/key.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "GetKey:F4",36,0,0,',0,0,offset _GetKey,seg _GetKey,0x0d,0x0a
.CODE
.public _GetKey
_GetKey:	.proc
.debug
	.dw '.stabn 0x44,0,17,',0,0
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
	.dw '.stabn 0x44,0,19,',0,0
	.dd LM2-_GetKey
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
.debug
	.dw '.stabn 0x44,0,22,',0,0
	.dd LM3-_GetKey
	.dw 0x0d,0x0a
.code
LM3:
	R1=[28674]	// QImode move
	R3=R1&255
	[28674]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM4-_GetKey
	.dw 0x0d,0x0a
.code
LM4:
	R1=[28675]	// QImode move
	R3=R1&255
	[28675]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,24,',0,0
	.dd LM5-_GetKey
	.dw 0x0d,0x0a
.code
LM5:
	R1=[28673]	// QImode move
	R3=R1|(-256)
	[28673]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM6-_GetKey
	.dw 0x0d,0x0a
.code
LM6:
L3:
	R1=[BP]	// QImode move
	CMP R1,0	// QImode test
	JNZ L9	// QImode EQ
	PC=L5
L9:
	pc=L4	// Indirect jump
L5:
.debug
	.dw '.stabn 0x44,0,29,',0,0
	.dd LM7-_GetKey
	.dw 0x0d,0x0a
.code
LM7:
	R3=[28672]	// QImode move
	R1=R3&(-256)
	R3=R1^(-256)
	[BP]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,30,',0,0
	.dd LM8-_GetKey
	.dw 0x0d,0x0a
.code
LM8:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,31,',0,0
	.dd LM9-_GetKey
	.dw 0x0d,0x0a
.code
LM9:
	pc=L3	// Indirect jump
L4:
.debug
	.dw '.stabn 0x44,0,32,',0,0
	.dd LM10-_GetKey
	.dw 0x0d,0x0a
.code
LM10:
	R3=[28672]	// QImode move
	R1=R3&(-256)
	R3=R1^(-256)
	[BP]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,34,',0,0
	.dd LM11-_GetKey
	.dw 0x0d,0x0a
.code
LM11:
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
	.dw '.stabn 0x44,0,36,',0,0
	.dd LM12-_GetKey
	.dw 0x0d,0x0a
.code
LM12:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,37,',0,0
	.dd LM13-_GetKey
	.dw 0x0d,0x0a
.code
LM13:
	pc=L6	// Indirect jump
L7:
.debug
	.dw '.stabn 0x44,0,38,',0,0
	.dd LM14-_GetKey
	.dw 0x0d,0x0a
.code
LM14:
	R3=[BP]	// QImode move
	R1=R3	// QImode move
	pc=L2	// Indirect jump
.debug
	.dw '.stabn 0x44,0,39,',0,0
	.dd LM15-_GetKey
	.dw 0x0d,0x0a
.code
LM15:
LBE2:
.debug
	.dw '.stabn 0x44,0,39,',0,0
	.dd LM16-_GetKey
	.dw 0x0d,0x0a
.code
LM16:
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
	.end
