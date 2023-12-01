// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\PROGRA~1\Sunplus\UNSPID~3\IDE180\cc1.exe C:\DOCUME~1\李华丽.DOMAIN\LOCALS~1\Temp\ccItaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\电子竞赛\\C语言应用篇\\Source Code\\chapter9 Audio\\A2000_manual/", 0x64, 0, 3, Ltext0
.stabs "F:/电子竞赛/C语言应用篇/Source Code/chapter9 Audio/A2000_manual/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabn 0x44,0,9,',0,0
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
	[bp+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,10,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
.debug
	.dw '.stabn 0x44,0,12,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	R1=BP	// QImode move
	R2=BP+2
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,14,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R1=[_RES_D1_24K_SA]	// HImode RD=[Label]
	R2=[_RES_D1_24K_SA+1]
	[BP++]=R1	// [RD]=RS HImode, RD!=RS+1
	[BP--]=R2
.debug
	.dw '.stabn 0x44,0,16,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_A2000_Initial	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,18,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_A2000_InitDecoder	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,20,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
L3:
	pc=L5	// jump
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,22,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
LBB3:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
	call _SACM_A2000_TestQueue	// call with return value
	CMP R1,1	// QImode compare
	JNZ L9	// QImode EQ
	PC=L6
L9:
.debug
	.dw '.stabn 0x44,0,25,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
LBB4:
	R1=[BP++]	// RD=[RS] HImode, RD!=RS
	R2=[BP--]
	push R1,R2 to [sp]	// pushhi
	call _SP_GetResource	// call with return value
	SP=SP+2
	R2=BP	// QImode move
	R3=BP+2
	R2=R3	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,26,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	R1=BP	// QImode move
	R2=BP+2
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_A2000_FillQueue	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	R1=[BP++]	// RD=[RS] HImode, RD!=RS
	R2=[BP--]
	R3=R1+1	// HImode RD=RS+#IMM16
	R4=R2+0, Carry
	[BP++]=R3	// [RD]=RS HImode, RD!=RS+1
	[BP--]=R4
.debug
	.dw '.stabn 0x44,0,28,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
LBE4:
L6:
.debug
	.dw '.stabn 0x44,0,30,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	R1=[BP++]	// RD=[RS] HImode, RD!=RS
	R2=[BP--]
	R3=[_RES_D1_24K_EA]	// HImode RD=[Label]
	R4=[_RES_D1_24K_EA+1]
	CMP R2,R4	// HImode compare
	JL  L11	// HImode GE
	JNZ L10
	CMP R1,R3
	JB  L11
L10:
	PC=L7
L11:
.debug
	.dw '.stabn 0x44,0,31,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	call _SACM_A2000_Decoder	// call with return value
	pc=L8	// jump
L7:
.debug
	.dw '.stabn 0x44,0,33,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	call _SACM_A2000_Stop	// call with return value
L8:
.debug
	.dw '.stabn 0x44,0,34,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
LBE3:
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,35,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
LBE2:
.debug
	.dw '.stabn 0x44,0,35,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
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
	.dw '.stabs "Addr:3",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "Ret:1",128,0,0,2',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB3-_main
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
	.dd LBE3-_main
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
.external _SACM_A2000_Stop
.external _SACM_A2000_Decoder
.external _RES_D1_24K_EA
.external _SACM_A2000_FillQueue
.external _SP_GetResource
.external _SACM_A2000_TestQueue
.external _SACM_A2000_InitDecoder
.external _SACM_A2000_Initial
.external _RES_D1_24K_SA
	.end
