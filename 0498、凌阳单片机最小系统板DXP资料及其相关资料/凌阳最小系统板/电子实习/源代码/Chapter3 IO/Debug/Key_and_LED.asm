// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\PROGRA~1\Sunplus\UNSPID~3\IDE180\cc1.exe C:\DOCUME~1\李华丽.DOMAIN\LOCALS~1\Temp\ccSyaaaa.i -fkeep-inline-functions -quiet -dumpbase Key_and_LED.c -gstabs -o .\Debug/Key_and_LED.asm
// gcc2_compiled.:

.stabs "F:\\电子竞赛\\C语言应用篇\\Source Code\\Chapter3 IO/", 0x64, 0, 3, Ltext0
.stabs "F:/电子竞赛/C语言应用篇/Source Code/Chapter3 IO/Key_and_LED.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabn 0x44,0,19,',0,0
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
	.dw '.stabn 0x44,0,20,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
.debug
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _Set_IOA_Dir	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,24,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _Set_IOA_Attrib	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,25,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _Set_IOA_Data	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,28,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R1=(-1)	// QImode move
	[SP--]=R1	// QImode move
	call _Set_IOB_Dir	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,29,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R1=(-1)	// QImode move
	[SP--]=R1	// QImode move
	call _Set_IOB_Attrib	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,30,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _Set_IOB_Data	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,32,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
L3:
	pc=L5	// jump
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,34,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	call _Get_IOA_Data	// call with return value
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,35,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	R1=[BP]	// QImode move
	CMP R1,8	// QImode compare
	JNZ L21	// QImode EQ
	PC=L15
L21:
	CMP R1,8	// QImode compare
	JNA L22	// QImode GTU
	PC=L18
L22:
	CMP R1,2	// QImode compare
	JNA L23	// QImode GTU
	PC=L19
L23:
	CMP R1,1	// QImode compare
	JB L24	// QImode GEU
	PC=L15
L24:
	pc=L7	// jump
L19:
	CMP R1,4	// QImode compare
	JNZ L25	// QImode EQ
	PC=L15
L25:
	pc=L16	// jump
L18:
	CMP R1,32	// QImode compare
	JNZ L26	// QImode EQ
	PC=L15
L26:
	CMP R1,32	// QImode compare
	JNA L27	// QImode GTU
	PC=L20
L27:
	CMP R1,16	// QImode compare
	JNZ L28	// QImode EQ
	PC=L15
L28:
	pc=L16	// jump
L20:
	CMP R1,64	// QImode compare
	JNZ L29	// QImode EQ
	PC=L15
L29:
	CMP R1,128	// QImode compare
	JNZ L30	// QImode EQ
	PC=L15
L30:
	pc=L16	// jump
L7:
.debug
	.dw '.stabn 0x44,0,38,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	pc=L6	// jump
L8:
L9:
L10:
L11:
L12:
L13:
L14:
L15:
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	R1=[BP]	// QImode move
	[SP--]=R1	// QImode move
	call _Set_IOB_Buffer	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,48,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	pc=L6	// jump
L16:
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	pc=L6	// jump
L6:
.debug
	.dw '.stabn 0x44,0,52,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,53,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
LBE2:
.debug
	.dw '.stabn 0x44,0,53,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
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
	.dw '.stabs "I_Key:4",128,0,0,0',0x0d,0x0a
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
.external _Set_IOB_Buffer
.external _Get_IOA_Data
.external _Set_IOB_Data
.external _Set_IOB_Attrib
.external _Set_IOB_Dir
.external _Set_IOA_Data
.external _Set_IOA_Attrib
.external _Set_IOA_Dir
	.end
