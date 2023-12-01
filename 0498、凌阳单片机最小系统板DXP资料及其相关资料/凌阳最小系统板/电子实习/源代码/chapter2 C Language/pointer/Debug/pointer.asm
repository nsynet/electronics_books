// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\PROGRA~1\Sunplus\UNSPID~3\IDE180\cc1.exe C:\DOCUME~1\李华丽.DOMAIN\LOCALS~1\Temp\ccAvaaaa.i -fkeep-inline-functions -quiet -dumpbase pointer.c -gstabs -o .\Debug/pointer.asm
// gcc2_compiled.:

.stabs "F:\\电子竞赛\\C语言应用篇\\Source Code\\chapter2 C Language\\pointer/", 0x64, 0, 3, Ltext0
.stabs "F:/电子竞赛/C语言应用篇/Source Code/chapter2 C Language/pointer/pointer.c", 0x64, 0, 3, Ltext0
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
.iram
Lname_3:
	.dw LC0
	.dw LC1
	.dw LC2
	.dw LC3
	.dw LC4
.text
LC4:
	.dw 'D','A','D','U','H','E',0
LC3:
	.dw 'Y','A','L','U','J','I','A','N','G',0
LC2:
	.dw 'N','U','J','I','A','N','G',0
LC1:
	.dw 'Y','A','L','U','Z','A','N','G','B','U','J','I','A','N','G'
	.dw 0
LC0:
	.dw 'C','H','A','N','G','J','I','A','N','G',0
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
	// total=2, vars=2
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=2
	bp=sp+1

	R1=BP+5
	[bp+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,4,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
.debug
	.dw '.stabn 0x44,0,7,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	R1=5	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,8,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R1=[BP]	// QImode move
	[SP--]=R1	// QImode move
	R1=Lname_3	// QImode move
	[SP--]=R1	// QImode move
	call _sort	// call without return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,9,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	R1=[BP]	// QImode move
	[SP--]=R1	// QImode move
	R1=Lname_3	// QImode move
	[SP--]=R1	// QImode move
	call _print	// call without return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,10,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
LBE2:
.debug
	.dw '.stabn 0x44,0,10,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
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
	.dw '.stabs "name:V20=ar1;0;4;21=*2",38,0,0,',0,0,offset Lname_3,seg Lname_3,0x0d,0x0a
.CODE
.debug
	.dw '.stabs "n:1",128,0,0,0',0x0d,0x0a
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
	.dw '.stabs "sort:F19",36,0,0,',0,0,offset _sort,seg _sort,0x0d,0x0a
.CODE
.public _sort
_sort:	.proc
.debug
	.dw '.stabn 0x44,0,13,',0,0
	.dd LM8-_sort
	.dw 0x0d,0x0a
.code
LM8:
	// total=6, vars=6
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=6
	bp=sp+1

	R1=BP+9
	[bp+4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,14,',0,0
	.dd LM9-_sort
	.dw 0x0d,0x0a
.code
LM9:
LBB3:
.debug
	.dw '.stabn 0x44,0,16,',0,0
	.dd LM10-_sort
	.dw 0x0d,0x0a
.code
LM10:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L4:
	R2=BP	// QImode move
	R1=BP+1
	R2=[bp+4]	// QImode move
	R4=[bp+4]	// QImode move
	R3=R4+1
	R2=R3	// QImode move
	R4=[R2]	// QImode move
	R2=R4+(-1)
	R3=R1	// QImode move
	R1=[R3]	// QImode move
	CMP R1,R2	// QImode compare
	JNL L14	// QImode LT
	PC=L7
L14:
	pc=L5	// jump
L7:
.debug
	.dw '.stabn 0x44,0,18,',0,0
	.dd LM11-_sort
	.dw 0x0d,0x0a
.code
LM11:
	R2=BP	// QImode move
	R1=BP+3
	R2=BP	// QImode move
	R3=BP+1
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,19,',0,0
	.dd LM12-_sort
	.dw 0x0d,0x0a
.code
LM12:
	R2=BP	// QImode move
	R1=BP+2
	R2=BP	// QImode move
	R3=BP+1
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
L8:
	R2=BP	// QImode move
	R1=BP+2
	R2=[bp+4]	// QImode move
	R4=[bp+4]	// QImode move
	R3=R4+1
	R2=R1	// QImode move
	R1=[R2]	// QImode move
	R4=R3	// QImode move
	CMP R1,[R4]	// QImode compare
	JNL L15	// QImode LT
	PC=L11
L15:
	pc=L9	// jump
L11:
.debug
	.dw '.stabn 0x44,0,20,',0,0
	.dd LM13-_sort
	.dw 0x0d,0x0a
.code
LM13:
	R2=[bp+4]	// QImode move
	R1=[R2]	// QImode move
	R2=BP	// QImode move
	R3=BP+2
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R1+=R2	// addqi3_r0r
	R3=R1	// QImode move
	R2=[R3]	// QImode move
	[SP--]=R2	// QImode move
	R4=[bp+4]	// QImode move
	R1=[R4]	// QImode move
	R2=BP	// QImode move
	R3=BP+3
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R1+=R2	// addqi3_r0r
	R3=R1	// QImode move
	R2=[R3]	// QImode move
	[SP--]=R2	// QImode move
	call _strcmp	// call with return value
	SP=SP+2
	CMP R1,0	// QImode test
	JG L16	// QImode LE
	PC=L10
L16:
	R2=BP	// QImode move
	R1=BP+3
	R2=BP	// QImode move
	R3=BP+2
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R1	// QImode move
	[R3]=R2	// QImode move
L12:
.debug
	.dw '.stabn 0x44,0,19,',0,0
	.dd LM14-_sort
	.dw 0x0d,0x0a
.code
LM14:
L10:
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
	pc=L8	// jump
L9:
.debug
	.dw '.stabn 0x44,0,21,',0,0
	.dd LM15-_sort
	.dw 0x0d,0x0a
.code
LM15:
	R2=BP	// QImode move
	R1=BP+3
	R2=BP	// QImode move
	R3=BP+1
	R4=R1	// QImode move
	R1=[R4]	// QImode move
	R2=R3	// QImode move
	CMP R1,[R2]	// QImode compare
	JNZ L17	// QImode EQ
	PC=L6
L17:
.debug
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM16-_sort
	.dw 0x0d,0x0a
.code
LM16:
	R3=[bp+4]	// QImode move
	R1=[R3]	// QImode move
	R2=BP	// QImode move
	R3=BP+1
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R1+=R2	// addqi3_r0r
	R3=R1	// QImode move
	R2=[R3]	// QImode move
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,24,',0,0
	.dd LM17-_sort
	.dw 0x0d,0x0a
.code
LM17:
	R4=[bp+4]	// QImode move
	R1=[R4]	// QImode move
	R2=BP	// QImode move
	R3=BP+1
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R1+=R2	// addqi3_r0r
	R3=[bp+4]	// QImode move
	R2=[R3]	// QImode move
	R3=BP	// QImode move
	R4=BP+3
	[bp+5]=R4	// QImode move
	R4=[bp+5]	// QImode move
	R3=[R4]	// QImode move
	R2+=R3	// addqi3_r0r
	R4=R2	// QImode move
	R3=[R4]	// QImode move
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,25,',0,0
	.dd LM18-_sort
	.dw 0x0d,0x0a
.code
LM18:
	R3=[bp+4]	// QImode move
	R1=[R3]	// QImode move
	R2=BP	// QImode move
	R3=BP+3
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R1+=R2	// addqi3_r0r
	R2=[BP]	// QImode move
	R3=R1	// QImode move
	[R3]=R2	// QImode move
L13:
.debug
	.dw '.stabn 0x44,0,16,',0,0
	.dd LM19-_sort
	.dw 0x0d,0x0a
.code
LM19:
L6:
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
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,28,',0,0
	.dd LM20-_sort
	.dw 0x0d,0x0a
.code
LM20:
LBE3:
.debug
	.dw '.stabn 0x44,0,28,',0,0
	.dd LM21-_sort
	.dw 0x0d,0x0a
.code
LM21:
L3:

	sp+=6
	pop bp from [sp]
	retf
	.endp	// end of sort

.debug
	.dw '.stabs "name:p22=*21",160,0,0,9',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "n:p1",160,0,0,10',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB3-_sort
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "pt:21",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "i:1",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "j:1",128,0,0,2',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "k:1",128,0,0,3',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE3-_sort
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME2-_sort
	.dw 0x0d,0x0a
.code
LME2:
.text
LC5:
	.dw '%','s',10,0
.code
.debug
	.dw '.stabs "print:F19",36,0,0,',0,0,offset _print,seg _print,0x0d,0x0a
.CODE
.public _print
_print:	.proc
.debug
	.dw '.stabn 0x44,0,31,',0,0
	.dd LM22-_print
	.dw 0x0d,0x0a
.code
LM22:
	// total=2, vars=2
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=2
	bp=sp+1

	R1=BP+5
	[bp+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,32,',0,0
	.dd LM23-_print
	.dw 0x0d,0x0a
.code
LM23:
LBB4:
.debug
	.dw '.stabn 0x44,0,33,',0,0
	.dd LM24-_print
	.dw 0x0d,0x0a
.code
LM24:
	R1=0	// QImode move
	[BP]=R1	// QImode move
L19:
	R1=[bp+1]	// QImode move
	R3=[bp+1]	// QImode move
	R2=R3+1
	R1=[BP]	// QImode move
	R3=R2	// QImode move
	CMP R1,[R3]	// QImode compare
	JNL L23	// QImode LT
	PC=L22
L23:
	pc=L20	// jump
L22:
	R1=[bp+1]	// QImode move
	R2=[R1]	// QImode move
	R1=R2	// QImode move
	R1+=[BP]	// addqi3_r0R
	R3=R1	// QImode move
	R2=[R3]	// QImode move
	[SP--]=R2	// QImode move
	R1=LC5	// QImode move
	[SP--]=R1	// QImode move
	call _printf	// call with return value
	SP=SP+2
L21:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L19	// jump
L20:
.debug
	.dw '.stabn 0x44,0,34,',0,0
	.dd LM25-_print
	.dw 0x0d,0x0a
.code
LM25:
LBE4:
.debug
	.dw '.stabn 0x44,0,34,',0,0
	.dd LM26-_print
	.dw 0x0d,0x0a
.code
LM26:
L18:

	sp+=2
	pop bp from [sp]
	retf
	.endp	// end of print

.debug
	.dw '.stabs "name:p22",160,0,0,5',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "n:p1",160,0,0,6',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB4-_print
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "i:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE4-_print
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME3-_print
	.dw 0x0d,0x0a
.code
LME3:
.external _printf
.external _strcmp
	.end
