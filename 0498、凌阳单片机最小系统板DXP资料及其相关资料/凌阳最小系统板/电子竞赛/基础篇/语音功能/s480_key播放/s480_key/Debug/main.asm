// GCC for SUNPLUS u'nSP version 1.0.10
// Command: D:\PROGRA~1\Sunplus\UNSPID~2\IDE180\cc1.exe C:\DOCUME~1\’≈œÚ—ﬁ\LOCALS~1\Temp\ccUtaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "E:\\ele_competition\\voice\\s480_key/", 0x64, 0, 3, Ltext0
.stabs "E:/ele_competition/voice/s480_key/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabn 0x44,0,52,',0,0
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
	.dw '.stabn 0x44,0,53,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	R1=0	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,54,',0,0
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
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R1=BP	// QImode move
	R2=BP+2
	R1=1	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,59,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	call _System_Initial	// call with return value
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R1=BP	// QImode move
	R2=BP+2
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_S480_Initial	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,61,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_S480_Play	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,63,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
L3:
	pc=L5	// jump
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,64,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
LBB3:
	call _SP_GetCh	// call with return value
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,65,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	R1=[BP]	// QImode move
	CMP R1,1	// QImode compare
	JNZ L14	// QImode EQ
	PC=L8
L14:
	CMP R1,1	// QImode compare
	JNG L15	// QImode GT
	PC=L13
L15:
	CMP R1,0	// QImode test
	JNZ L16	// QImode EQ
	PC=L7
L16:
	pc=L11	// jump
L13:
	CMP R1,2	// QImode compare
	JNZ L17	// QImode EQ
	PC=L9
L17:
	CMP R1,4	// QImode compare
	JNZ L18	// QImode EQ
	PC=L10
L18:
	pc=L11	// jump
L7:
.debug
	.dw '.stabn 0x44,0,67,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	pc=L6	// jump
L8:
.debug
	.dw '.stabn 0x44,0,69,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_S480_Play	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	pc=L6	// jump
L9:
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	call _SACM_S480_Stop	// call with return value
.debug
	.dw '.stabn 0x44,0,73,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	pc=L6	// jump
L10:
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	call _SACM_S480_Pause	// call with return value
.debug
	.dw '.stabn 0x44,0,76,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
	pc=L6	// jump
L11:
.debug
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
	pc=L6	// jump
L6:
.debug
	.dw '.stabn 0x44,0,80,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
	call _System_ServiceLoop	// call with return value
.debug
	.dw '.stabn 0x44,0,81,',0,0
	.dd LM20-_main
	.dw 0x0d,0x0a
.code
LM20:
	call _SACM_S480_ServiceLoop	// call with return value
.debug
	.dw '.stabn 0x44,0,83,',0,0
	.dd LM21-_main
	.dw 0x0d,0x0a
.code
LM21:
LBE3:
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,85,',0,0
	.dd LM22-_main
	.dw 0x0d,0x0a
.code
LM22:
LBE2:
.debug
	.dw '.stabn 0x44,0,85,',0,0
	.dd LM23-_main
	.dw 0x0d,0x0a
.code
LM23:
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
	.dw '.stabs "iKey:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "iSpeechIndex:1",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "iMode:1",128,0,0,2',0x0d,0x0a
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
.external _SACM_S480_ServiceLoop
.external _System_ServiceLoop
.external _SACM_S480_Pause
.external _SACM_S480_Stop
.external _SP_GetCh
.external _SACM_S480_Play
.external _SACM_S480_Initial
.external _System_Initial
	.end
