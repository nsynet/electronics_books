// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\PROGRA~1\Sunplus\UNSPID~3\IDE180\cc1.exe C:\DOCUME~1\李华丽.DOMAIN\LOCALS~1\Temp\ccwvaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\电子竞赛\\竞赛光盘\\典型应用篇\\电子竞赛—数字化语音存储与回放\\LineIN_Filter\\LineIN_Filter/", 0x64, 0, 3, Ltext0
.stabs "F:/电子竞赛/竞赛光盘/典型应用篇/电子竞赛—数字化语音存储与回放/LineIN_Filter/LineIN_Filter/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabn 0x44,0,39,',0,0
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
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
.debug
	.dw '.stabn 0x44,0,43,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	call _System_Initial	// call without return value
.debug
	.dw '.stabn 0x44,0,45,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
L3:
	pc=L5	// jump
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,49,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R1=[28672]	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R1=[BP]	// QImode move
	R2=R1&7
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,52,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	R2=[BP]	// QImode move
	R1=R2&7
	CMP R1,0	// QImode test
	JNZ L11	// QImode EQ
	PC=L6
L11:
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
	R2=[BP]	// QImode move
	R1=R2&1
	CMP R1,0	// QImode test
	JNZ L12	// QImode EQ
	PC=L7
L12:
.debug
	.dw '.stabn 0x44,0,55,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
LBB3:
// GCC inline ASM start
	int	off
// GCC inline ASM end
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	call _SP_SIOMassErase	// call without return value
.debug
	.dw '.stabn 0x44,0,57,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	R1=1	// QImode move
	[_g_Flag_Status]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	R1=0	// HImode immediate to register move
	R2=0
	[_g_ulAddr]=R1	// HImode [Label]=RS
	[_g_ulAddr+1]=R2
.debug
	.dw '.stabn 0x44,0,59,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	call _Timer_for_Record	// call with return value
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
// GCC inline ASM start
	int	fiq
// GCC inline ASM end
.debug
	.dw '.stabn 0x44,0,61,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
LBE3:
	pc=L6	// jump
L7:
.debug
	.dw '.stabn 0x44,0,62,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
	R2=[BP]	// QImode move
	R1=R2&4
	CMP R1,0	// QImode test
	JNZ L13	// QImode EQ
	PC=L9
L13:
.debug
	.dw '.stabn 0x44,0,63,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
LBB4:
// GCC inline ASM start
	int	off
// GCC inline ASM end
.debug
	.dw '.stabn 0x44,0,64,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
	R1=4	// QImode move
	[_g_Flag_Status]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,65,',0,0
	.dd LM20-_main
	.dw 0x0d,0x0a
.code
LM20:
	R1=0	// HImode immediate to register move
	R2=0
	[_g_ulAddr]=R1	// HImode [Label]=RS
	[_g_ulAddr+1]=R2
.debug
	.dw '.stabn 0x44,0,66,',0,0
	.dd LM21-_main
	.dw 0x0d,0x0a
.code
LM21:
	call _Timer_for_Play	// call with return value
.debug
	.dw '.stabn 0x44,0,67,',0,0
	.dd LM22-_main
	.dw 0x0d,0x0a
.code
LM22:
// GCC inline ASM start
	int	fiq
// GCC inline ASM end
.debug
	.dw '.stabn 0x44,0,68,',0,0
	.dd LM23-_main
	.dw 0x0d,0x0a
.code
LM23:
LBE4:
	pc=L6	// jump
L9:
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM24-_main
	.dw 0x0d,0x0a
.code
LM24:
// GCC inline ASM start
	int	off
// GCC inline ASM end
.debug
	.dw '.stabn 0x44,0,71,',0,0
	.dd LM25-_main
	.dw 0x0d,0x0a
.code
LM25:
	R1=2	// QImode move
	[_g_Flag_Status]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM26-_main
	.dw 0x0d,0x0a
.code
LM26:
	R1=0	// HImode immediate to register move
	R2=0
	[_g_ulAddr]=R1	// HImode [Label]=RS
	[_g_ulAddr+1]=R2
.debug
	.dw '.stabn 0x44,0,73,',0,0
	.dd LM27-_main
	.dw 0x0d,0x0a
.code
LM27:
// GCC inline ASM start
	int	fiq
// GCC inline ASM end
L10:
L8:
L6:
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM28-_main
	.dw 0x0d,0x0a
.code
LM28:
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM29-_main
	.dw 0x0d,0x0a
.code
LM29:
LBE2:
.debug
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM30-_main
	.dw 0x0d,0x0a
.code
LM30:
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
	.dw '.stabs "uiKeyValue:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB3-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE3-_main
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
	.dw '.stabs "g_ulAddr:G5",32,0,0,',0,0,offset _g_ulAddr,seg _g_ulAddr,0x0d,0x0a
.CODE
.ram
.public _g_ulAddr
_g_ulAddr:
	.dw 2 dup(0)
.debug
	.dw '.stabs "g_Flag_Status:G4",32,0,0,',0,0,offset _g_Flag_Status,seg _g_Flag_Status,0x0d,0x0a
.CODE
.ram
.public _g_Flag_Status
_g_Flag_Status:
	.dw 0
.external _Timer_for_Play
.external _Timer_for_Record
.external _SP_SIOMassErase
.external _System_Initial
	.end
