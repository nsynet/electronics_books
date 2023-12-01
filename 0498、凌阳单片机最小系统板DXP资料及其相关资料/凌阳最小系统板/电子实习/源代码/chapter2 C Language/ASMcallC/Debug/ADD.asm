// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\PROGRA~1\Sunplus\UNSPID~3\IDE180\cc1.exe C:\DOCUME~1\李华丽.DOMAIN\LOCALS~1\Temp\cccxaaaa.i -fkeep-inline-functions -quiet -dumpbase ADD.c -gstabs -o .\Debug/ADD.asm
// gcc2_compiled.:

.stabs "F:\\电子竞赛\\C语言应用篇\\Source Code\\chapter2 C Language\\ASMcallC/", 0x64, 0, 3, Ltext0
.stabs "F:/电子竞赛/C语言应用篇/Source Code/chapter2 C Language/ASMcallC/ADD.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "ADD:F1",36,0,0,',0,0,offset _ADD,seg _ADD,0x0d,0x0a
.CODE
.public _ADD
_ADD:	.proc
.debug
	.dw '.stabn 0x44,0,2,',0,0
	.dd LM1-_ADD
	.dw 0x0d,0x0a
.code
LM1:
	// total=0, vars=0
	// frame_pointer_needed: 1
	push bp to [sp]
	bp=sp+1

	R2=BP+3
.debug
	.dw '.stabn 0x44,0,3,',0,0
	.dd LM2-_ADD
	.dw 0x0d,0x0a
.code
LM2:
	R3=R2	// QImode move
	R1=R2+1
	R3=R2	// QImode move
	R4=[R3]	// QImode move
	R3=R4	// QImode move
	R4=R1	// QImode move
	R3+=[R4]	// addqi3_r0R
	R1=R2	// QImode move
	[R1]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,4,',0,0
	.dd LM3-_ADD
	.dw 0x0d,0x0a
.code
LM3:
	R4=R2	// QImode move
	R3=[R4]	// QImode move
	R1=R3	// QImode move
	pc=L2	// jump
.debug
	.dw '.stabn 0x44,0,5,',0,0
	.dd LM4-_ADD
	.dw 0x0d,0x0a
.code
LM4:
.debug
	.dw '.stabn 0x44,0,5,',0,0
	.dd LM5-_ADD
	.dw 0x0d,0x0a
.code
LM5:
L2:

	pop bp from [sp]
	retf
	.endp	// end of ADD

.debug
	.dw '.stabs "i:p1",160,0,0,3',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "j:p1",160,0,0,4',0x0d,0x0a
.CODE
.debug
	.dw '.stabf ',0,0
	.dd LME1-_ADD
	.dw 0x0d,0x0a
.code
LME1:
	.end
