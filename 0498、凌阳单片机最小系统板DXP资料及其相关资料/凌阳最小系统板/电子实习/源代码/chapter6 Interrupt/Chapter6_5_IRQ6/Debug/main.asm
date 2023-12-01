// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\PROGRA~1\Sunplus\UNSPID~3\IDE180\cc1.exe C:\DOCUME~1\李华丽.DOMAIN\LOCALS~1\Temp\ccUvaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\电子竞赛\\C语言应用篇\\Source Code\\chapter6 Interrupt\\Chapter6_5_IRQ6/", 0x64, 0, 3, Ltext0
.stabs "F:/电子竞赛/C语言应用篇/Source Code/chapter6 Interrupt/Chapter6_5_IRQ6/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabn 0x44,0,4,',0,0
	.dd LM1-_main
	.dw 0x0d,0x0a
.code
LM1:
	// total=0, vars=0
	// frame_pointer_needed: 1
	push bp to [sp]
	bp=sp+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,5,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
	R2=[_P_IOA_Dir]	// QImode move
	R3=(-1)	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,6,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	R2=[_P_IOA_Attrib]	// QImode move
	R3=(-1)	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,7,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R2=[_P_IOA_Data]	// QImode move
	R3=0	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,9,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	R2=[_P_IOB_Dir]	// QImode move
	R3=(-1)	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,10,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R2=[_P_IOB_Attrib]	// QImode move
	R3=(-1)	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,11,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R2=[_P_IOB_Data]	// QImode move
	R3=0	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,13,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	R2=[_P_TimeBase_Setup]	// QImode move
	R3=3	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,14,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
	R2=[_P_INT_Ctrl]	// QImode move
	R3=3	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,15,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
// GCC inline ASM start
	int irq
// GCC inline ASM end
.debug
	.dw '.stabn 0x44,0,16,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
L3:
	pc=L5	// jump
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,17,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	R2=[_P_Watchdog_Clear]	// QImode move
	R3=1	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,18,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
.debug
	.dw '.stabn 0x44,0,18,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
L2:

	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabf ',0,0
	.dd LME1-_main
	.dw 0x0d,0x0a
.code
LME1:
.external _P_Watchdog_Clear
.external _P_INT_Ctrl
.external _P_TimeBase_Setup
.external _P_IOB_Data
.external _P_IOB_Attrib
.external _P_IOB_Dir
.external _P_IOA_Data
.external _P_IOA_Attrib
.external _P_IOA_Dir
	.end
