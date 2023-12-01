// GCC for SUNPLUS u'nSP version 1.0.10
// Command: D:\PROGRA~1\Sunplus\UNSPID~2\IDE180\cc1.exe C:\DOCUME~1\’≈œÚ—ﬁ\LOCALS~1\Temp\ccmyaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "E:\\ele_competition\\voice\\a2000_key/", 0x64, 0, 3, Ltext0
.stabs "E:/ele_competition/voice/a2000_key/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabn 0x44,0,48,',0,0
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
	.dw '.stabn 0x44,0,49,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	R1=0	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,50,',0,0
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
	.dw '.stabn 0x44,0,54,',0,0
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
	.dw '.stabn 0x44,0,55,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	R1=BP	// QImode move
	R2=BP+2
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,1	// QImode compare
	JZ L15	// QImode NE
	PC=L3
L15:
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
LBB3:
	call _System_Initial	// call with return value
.debug
	.dw '.stabn 0x44,0,57,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R1=BP	// QImode move
	R2=BP+2
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_A2000_Initial	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_A2000_Play	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
L4:
	pc=L6	// jump
	pc=L3	// jump
L6:
.debug
	.dw '.stabn 0x44,0,61,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
LBB4:
	call _SP_GetCh	// call with return value
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,62,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	R1=[BP]	// QImode move
	CMP R1,1	// QImode compare
	JNZ L16	// QImode EQ
	PC=L9
L16:
	CMP R1,1	// QImode compare
	JNG L17	// QImode GT
	PC=L14
L17:
	CMP R1,0	// QImode test
	JNZ L18	// QImode EQ
	PC=L8
L18:
	pc=L12	// jump
L14:
	CMP R1,2	// QImode compare
	JNZ L19	// QImode EQ
	PC=L10
L19:
	CMP R1,4	// QImode compare
	JNZ L20	// QImode EQ
	PC=L11
L20:
	pc=L12	// jump
L8:
.debug
	.dw '.stabn 0x44,0,64,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	pc=L7	// jump
L9:
.debug
	.dw '.stabn 0x44,0,66,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_A2000_Play	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,67,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	pc=L7	// jump
L10:
.debug
	.dw '.stabn 0x44,0,69,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	call _SACM_A2000_Stop	// call with return value
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	pc=L7	// jump
L11:
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
	call _SACM_A2000_Pause	// call with return value
.debug
	.dw '.stabn 0x44,0,73,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
	pc=L7	// jump
L12:
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
	pc=L7	// jump
L7:
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM20-_main
	.dw 0x0d,0x0a
.code
LM20:
	call _System_ServiceLoop	// call with return value
.debug
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM21-_main
	.dw 0x0d,0x0a
.code
LM21:
	call _SACM_A2000_ServiceLoop	// call with return value
.debug
	.dw '.stabn 0x44,0,79,',0,0
	.dd LM22-_main
	.dw 0x0d,0x0a
.code
LM22:
LBE4:
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,80,',0,0
	.dd LM23-_main
	.dw 0x0d,0x0a
.code
LM23:
LBE3:
L3:
.debug
	.dw '.stabn 0x44,0,82,',0,0
	.dd LM24-_main
	.dw 0x0d,0x0a
.code
LM24:
LBE2:
.debug
	.dw '.stabn 0x44,0,82,',0,0
	.dd LM25-_main
	.dw 0x0d,0x0a
.code
LM25:
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
.external _SACM_A2000_ServiceLoop
.external _System_ServiceLoop
.external _SACM_A2000_Pause
.external _SACM_A2000_Stop
.external _SP_GetCh
.external _SACM_A2000_Play
.external _SACM_A2000_Initial
.external _System_Initial
	.end
