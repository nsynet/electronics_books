// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\PROGRA~1\Sunplus\UNSPID~3\IDE180\cc1.exe C:\DOCUME~1\李华丽.DOMAIN\LOCALS~1\Temp\ccsvaaaa.i -fkeep-inline-functions -quiet -dumpbase Watchdog.c -gstabs -o .\Debug/Watchdog.asm
// gcc2_compiled.:

.stabs "F:\\电子竞赛\\C语言应用篇\\Source Code\\chapter4 SystemSetup\\WatchDog/", 0x64, 0, 3, Ltext0
.stabs "F:/电子竞赛/C语言应用篇/Source Code/chapter4 SystemSetup/WatchDog/Watchdog.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabn 0x44,0,5,',0,0
	.dd LM1-_main
	.dw 0x0d,0x0a
.code
LM1:
	// total=12, vars=12
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=12
	bp=sp+1

	R1=BP+15
.debug
	.dw '.stabn 0x44,0,6,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
.debug
	.dw '.stabn 0x44,0,8,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	R2=[_P_IOA_Dir]	// QImode move
	R3=(-1)	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,9,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R2=[_P_IOA_Attrib]	// QImode move
	R3=(-1)	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,10,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	R2=[_P_IOA_Data]	// QImode move
	R3=0	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,12,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R3=5000	// HImode immediate to register move
	R4=0
	[BP++]=R3	// [RD]=RS HImode, RD!=RS+1
	[BP--]=R4
.debug
	.dw '.stabn 0x44,0,13,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
L3:
	R3=[BP++]	// RD=[RS] HImode, RD!=RS
	R4=[BP--]
	[bp+2]=R3	// HImode [BP+#IM6]=RS
	[bp+3]=R4
	R3=[bp+2]	// HImode RD=[BP+#IM6]
	R4=[bp+3]
	R3=R3+(-1)	// HImode RD=RS+#IMM16
	R4=R4+(-1), Carry
	[bp+10]=R3	// HImode [BP+#IM6]=RS
	[bp+11]=R4
	R3=[bp+10]	// HImode RD=[BP+#IM6]
	R4=[bp+11]
	[bp+4]=R3	// HImode [BP+#IM6]=RS
	[bp+5]=R4
	R3=[bp+4]	// HImode RD=[BP+#IM6]
	R4=[bp+5]
	[BP++]=R3	// [RD]=RS HImode, RD!=RS+1
	[BP--]=R4
	R3=[bp+4]	// HImode RD=[BP+#IM6]
	R4=[bp+5]
	CMP R4,(-1)	// HImode compare
	JNZ L12	// HImode NE
	CMP R3,(-1)
	JZ  L13
L12:
	PC=L5
L13:
	pc=L4	// jump
L5:
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,15,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	R2=[_P_IOA_Data]	// QImode move
	R3=(-1)	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,16,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
L6:
	pc=L8	// jump
	pc=L7	// jump
L8:
.debug
	.dw '.stabn 0x44,0,18,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	R2=[_P_Watchdog_Clear]	// QImode move
	R3=1	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,19,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	R3=(-1)	// HImode immediate to register move
	R4=255
	[BP++]=R3	// [RD]=RS HImode, RD!=RS+1
	[BP--]=R4
.debug
	.dw '.stabn 0x44,0,20,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
L9:
	R3=[BP++]	// RD=[RS] HImode, RD!=RS
	R4=[BP--]
	[bp+6]=R3	// HImode [BP+#IM6]=RS
	[bp+7]=R4
	R3=[bp+6]	// HImode RD=[BP+#IM6]
	R4=[bp+7]
	R3=R3+(-1)	// HImode RD=RS+#IMM16
	R4=R4+(-1), Carry
	[bp+10]=R3	// HImode [BP+#IM6]=RS
	[bp+11]=R4
	R3=[bp+10]	// HImode RD=[BP+#IM6]
	R4=[bp+11]
	[bp+8]=R3	// HImode [BP+#IM6]=RS
	[bp+9]=R4
	R3=[bp+8]	// HImode RD=[BP+#IM6]
	R4=[bp+9]
	[BP++]=R3	// [RD]=RS HImode, RD!=RS+1
	[BP--]=R4
	R3=[bp+8]	// HImode RD=[BP+#IM6]
	R4=[bp+9]
	CMP R4,(-1)	// HImode compare
	JNZ L14	// HImode NE
	CMP R3,(-1)
	JZ  L15
L14:
	PC=L11
L15:
	pc=L10	// jump
L11:
	pc=L9	// jump
L10:
.debug
	.dw '.stabn 0x44,0,21,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	pc=L6	// jump
L7:
.debug
	.dw '.stabn 0x44,0,22,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
LBE2:
.debug
	.dw '.stabn 0x44,0,22,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
L2:

	sp+=12
	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "Delay:5",128,0,0,0',0x0d,0x0a
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
.external _P_Watchdog_Clear
.external _P_IOA_Data
.external _P_IOA_Attrib
.external _P_IOA_Dir
	.end
