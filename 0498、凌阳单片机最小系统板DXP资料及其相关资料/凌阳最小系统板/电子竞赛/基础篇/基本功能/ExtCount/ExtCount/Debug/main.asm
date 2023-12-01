// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\PROGRA~1\Sunplus\UNSPID~3\IDE180\cc1.exe C:\DOCUME~1\李华丽.DOMAIN\LOCALS~1\Temp\ccaEaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\电子竞赛\\基础篇\\基本功能－温\\ExtCount/", 0x64, 0, 3, Ltext0
.stabs "F:/电子竞赛/基础篇/基本功能－温/ExtCount/main.c", 0x64, 0, 3, Ltext0
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
.debug
	.dw '.stabs "g_ucIntFlag:G11",32,0,0,',0,0,offset _g_ucIntFlag,seg _g_ucIntFlag,0x0d,0x0a
.CODE
.public _g_ucIntFlag
.iram
_g_ucIntFlag:
	.dw 0
.debug
	.dw '.stabs "g_uisum:G4",32,0,0,',0,0,offset _g_uisum,seg _g_uisum,0x0d,0x0a
.CODE
.public _g_uisum
.iram
_g_uisum:
	.dw 0
.code
.debug
	.dw '.stabs "main:F1",36,0,0,',0,0,offset _main,seg _main,0x0d,0x0a
.CODE
.public _main
_main:	.proc
.debug
	.dw '.stabn 0x44,0,6,',0,0
	.dd LM1-_main
	.dw 0x0d,0x0a
.code
LM1:
	// total=4, vars=4
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=4
	bp=sp+1

	R1=BP+7
	[bp+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,7,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	R1=0	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,8,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,9,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	call _Init_IOB	// call with return value
.debug
	.dw '.stabn 0x44,0,10,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	call _RunTime2Hz	// call with return value
.debug
	.dw '.stabn 0x44,0,11,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	call _TmbCount	// call with return value
.debug
	.dw '.stabn 0x44,0,12,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
L3:
	pc=L5	// jump
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,14,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
L6:
	R1=[_g_ucIntFlag]	// QImode move
	CMP R1,0	// QImode test
	JZ L9	// QImode NE
	PC=L8
L9:
	pc=L7	// jump
L8:
.debug
	.dw '.stabn 0x44,0,16,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
	R1=[28672]	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,17,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	R1=0	// QImode move
	[_g_ucIntFlag]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,18,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,19,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	R1=BP	// QImode move
	R1=BP+1
	[bp+3]=R1	// QImode move
	R1=[BP]	// QImode move
	R2=1	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __rshu1	// call with return value
	SP=SP+2
	R2=[bp+3]	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,20,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	pc=L6	// jump
L7:
.debug
	.dw '.stabn 0x44,0,21,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
LBE2:
.debug
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
L2:

	sp+=4
	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "g_uifx:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "fx:4",128,0,0,1',0x0d,0x0a
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
.external _TmbCount
.external _RunTime2Hz
.external _Init_IOB
.external __rshu1
	.end
