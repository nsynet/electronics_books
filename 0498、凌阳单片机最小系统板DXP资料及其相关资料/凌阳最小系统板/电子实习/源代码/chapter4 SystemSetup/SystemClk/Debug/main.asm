// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\PROGRA~1\Sunplus\UNSPID~3\IDE180\cc1.exe C:\DOCUME~1\李华丽.DOMAIN\LOCALS~1\Temp\ccsvaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\电子竞赛\\C语言应用篇\\Source Code\\chapter4 SystemSetup\\SystemClk/", 0x64, 0, 3, Ltext0
.stabs "F:/电子竞赛/C语言应用篇/Source Code/chapter4 SystemSetup/SystemClk/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabn 0x44,0,12,',0,0
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
	[bp+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,13,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
.debug
	.dw '.stabn 0x44,0,14,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	R1=[_P_IOA_Dir]	// QImode move
	R2=255	// QImode move
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,15,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R1=[_P_IOA_Attrib]	// QImode move
	R2=255	// QImode move
	R4=R1	// QImode move
	[R4]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,16,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	R1=[_P_IOA_Data]	// QImode move
	R2=0	// QImode move
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,17,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R1=128	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,18,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R1=BP	// QImode move
	R2=BP+1
	R1=1	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,19,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	R1=[_P_SystemClock]	// QImode move
	R3=BP	// QImode move
	R2=BP+1
	R4=[BP]	// QImode move
	R3=R4	// QImode move
	R4=R2	// QImode move
	R3|=[R4]	// iorqi3_r0R
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,21,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
L3:
	pc=L5	// jump
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	R1=[_P_IOA_Data]	// QImode move
	R2=255	// QImode move
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,24,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	call _Delay	// call without return value
.debug
	.dw '.stabn 0x44,0,25,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	R1=[_P_IOA_Data]	// QImode move
	R2=0	// QImode move
	R4=R1	// QImode move
	[R4]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,26,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	call _Delay	// call without return value
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,28,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
LBE2:
.debug
	.dw '.stabn 0x44,0,28,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
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
	.dw '.stabs "Fosc_CLK:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "CPU_CLK:4",128,0,0,1',0x0d,0x0a
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
	.dw '.stabn 0x44,0,31,',0,0
	.dd LM17-_Delay
	.dw 0x0d,0x0a
.code
LM17:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
.debug
	.dw '.stabn 0x44,0,32,',0,0
	.dd LM18-_Delay
	.dw 0x0d,0x0a
.code
LM18:
LBB3:
.debug
	.dw '.stabn 0x44,0,33,',0,0
	.dd LM19-_Delay
	.dw 0x0d,0x0a
.code
LM19:
	R2=32767	// QImode move
	[BP]=R2	// QImode move
L7:
	R2=[BP]	// QImode move
	CMP R2,0	// QImode test
	JZ L11	// QImode NE
	PC=L9
L11:
	pc=L8	// jump
L10:
L9:
	R2=[BP]	// QImode move
	R3=R2+(-1)
	[BP]=R3	// QImode move
	pc=L7	// jump
L8:
.debug
	.dw '.stabn 0x44,0,34,',0,0
	.dd LM20-_Delay
	.dw 0x0d,0x0a
.code
LM20:
	R2=[_P_Watchdog_Clear]	// QImode move
	R3=1	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,35,',0,0
	.dd LM21-_Delay
	.dw 0x0d,0x0a
.code
LM21:
LBE3:
.debug
	.dw '.stabn 0x44,0,35,',0,0
	.dd LM22-_Delay
	.dw 0x0d,0x0a
.code
LM22:
L6:

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
	.dw '.stabs "j:4",128,0,0,0',0x0d,0x0a
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
.external _P_Watchdog_Clear
.external _P_SystemClock
.external _P_IOA_Data
.external _P_IOA_Attrib
.external _P_IOA_Dir
	.end
