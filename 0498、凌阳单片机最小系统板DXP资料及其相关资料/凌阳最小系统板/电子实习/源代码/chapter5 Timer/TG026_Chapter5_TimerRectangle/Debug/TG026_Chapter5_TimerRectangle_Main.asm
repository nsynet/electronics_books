// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\PROGRA~1\Sunplus\UNSPID~3\IDE180\cc1.exe C:\DOCUME~1\李华丽.DOMAIN\LOCALS~1\Temp\ccSyaaaa.i -fkeep-inline-functions -quiet -dumpbase TG026_Chapter5_TimerRectangle_Main.c -gstabs -o .\Debug/TG026_Chapter5_TimerRectangle_Main.asm
// gcc2_compiled.:

.stabs "F:\\电子竞赛\\C语言应用篇\\Source Code\\chapter5 Timer\\TG026_Chapter5_TimerRectangle/", 0x64, 0, 3, Ltext0
.stabs "F:/电子竞赛/C语言应用篇/Source Code/chapter5 Timer/TG026_Chapter5_TimerRectangle/TG026_Chapter5_TimerRectangle_Main.c", 0x64, 0, 3, Ltext0
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
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
.debug
	.dw '.stabn 0x44,0,5,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
.debug
	.dw '.stabn 0x44,0,6,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	R2=0	// QImode move
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,8,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R2=[_P_IOB_Dir]	// QImode move
	R3=(-1)	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,9,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	R2=[_P_IOB_Attrib]	// QImode move
	R3=(-1)	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,10,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R2=[_P_IOB_Data]	// QImode move
	R3=0	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,12,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R2=[_P_INT_Ctrl]	// QImode move
	R3=4096	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,13,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
// GCC inline ASM start
	INT OFF
// GCC inline ASM end
.debug
	.dw '.stabn 0x44,0,15,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
	R2=[_P_TimerA_Ctrl]	// QImode move
	R3=13	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,16,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	R2=[_P_TimerA_Data]	// QImode move
	R3=(-513)	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,17,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
L3:
	pc=L5	// jump
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,19,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	R2=[_P_Watchdog_Clear]	// QImode move
	R3=1	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,20,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	R2=[_P_INT_Ctrl]	// QImode move
	R4=R2	// QImode move
	R3=[R4]	// QImode move
	R2=R3&4096
	CMP R2,0	// QImode test
	JNZ L7	// QImode EQ
	PC=L6
L7:
.debug
	.dw '.stabn 0x44,0,22,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	R2=[_P_INT_Clear]	// QImode move
	R3=4096	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	R2=[BP]	// QImode move
	R3=R2^0xffff	// one_cmplqi2
	[BP]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,24,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	R2=[_P_IOB_Data]	// QImode move
	R3=[BP]	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
L6:
.debug
	.dw '.stabn 0x44,0,26,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
LBE2:
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
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
	.dw '.stabs "uiOutput:4",128,0,0,0',0x0d,0x0a
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
.external _P_INT_Clear
.external _P_Watchdog_Clear
.external _P_TimerA_Data
.external _P_TimerA_Ctrl
.external _P_INT_Ctrl
.external _P_IOB_Data
.external _P_IOB_Attrib
.external _P_IOB_Dir
	.end
