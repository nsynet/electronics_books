// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\PROGRA~1\Sunplus\UNSPID~3\IDE180\cc1.exe C:\DOCUME~1\李华丽.DOMAIN\LOCALS~1\Temp\ccsvaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\电子竞赛\\C语言应用篇\\Source Code\\chapter9 Audio\\S240/", 0x64, 0, 3, Ltext0
.stabs "F:/电子竞赛/C语言应用篇/Source Code/chapter9 Audio/S240/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "Ret:G1",32,0,0,',0,0,offset _Ret,seg _Ret,0x0d,0x0a
.CODE
.public _Ret
.iram
_Ret:
	.dw 0
.code
.debug
	.dw '.stabs "main:F1",36,0,0,',0,0,offset _main,seg _main,0x0d,0x0a
.CODE
.public _main
_main:	.proc
.debug
	.dw '.stabn 0x44,0,16,',0,0
	.dd LM1-_main
	.dw 0x0d,0x0a
.code
LM1:
	// total=5, vars=5
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=5
	bp=sp+1

	R1=BP+8
	[bp+4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,17,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	R1=0	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,18,',0,0
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
	.dw '.stabn 0x44,0,19,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R1=BP	// QImode move
	R2=BP+2
	R1=7	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,22,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	R1=BP	// QImode move
	R2=BP+3
	R1=1	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R1=BP	// QImode move
	R2=BP+3
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,1	// QImode compare
	JZ L27	// QImode NE
	PC=L3
L27:
.debug
	.dw '.stabn 0x44,0,24,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_S240_Initial	// call with return value
	SP=SP+1
	[_Ret]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,25,',0,0
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
	call _SACM_S240_Play	// call without return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,26,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
L4:
	pc=L6	// jump
	pc=L3	// jump
L6:
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
LBB3:
	call _SP_GetCh	// call with return value
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,28,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	R1=[BP]	// QImode move
	CMP R1,8	// QImode compare
	JNZ L28	// QImode EQ
	PC=L12
L28:
	CMP R1,8	// QImode compare
	JNG L29	// QImode GT
	PC=L24
L29:
	CMP R1,1	// QImode compare
	JNZ L30	// QImode EQ
	PC=L9
L30:
	CMP R1,1	// QImode compare
	JNG L31	// QImode GT
	PC=L25
L31:
	CMP R1,0	// QImode test
	JNZ L32	// QImode EQ
	PC=L8
L32:
	pc=L22	// jump
L25:
	CMP R1,2	// QImode compare
	JNZ L33	// QImode EQ
	PC=L10
L33:
	CMP R1,4	// QImode compare
	JNZ L34	// QImode EQ
	PC=L11
L34:
	pc=L22	// jump
L24:
	CMP R1,32	// QImode compare
	JNZ L35	// QImode EQ
	PC=L15
L35:
	CMP R1,32	// QImode compare
	JNG L36	// QImode GT
	PC=L26
L36:
	CMP R1,16	// QImode compare
	JNZ L37	// QImode EQ
	PC=L13
L37:
	pc=L22	// jump
L26:
	CMP R1,64	// QImode compare
	JNZ L38	// QImode EQ
	PC=L18
L38:
	CMP R1,128	// QImode compare
	JNZ L39	// QImode EQ
	PC=L20
L39:
	pc=L22	// jump
L8:
.debug
	.dw '.stabn 0x44,0,30,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	pc=L7	// jump
L9:
.debug
	.dw '.stabn 0x44,0,32,',0,0
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
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_S240_Play	// call without return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,33,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	pc=L7	// jump
L10:
.debug
	.dw '.stabn 0x44,0,35,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	call _SACM_S240_Stop	// call without return value
.debug
	.dw '.stabn 0x44,0,36,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	pc=L7	// jump
L11:
.debug
	.dw '.stabn 0x44,0,38,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
	call _SACM_S240_Pause	// call without return value
.debug
	.dw '.stabn 0x44,0,39,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
	pc=L7	// jump
L12:
.debug
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
	call _SACM_S240_Resume	// call without return value
.debug
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM20-_main
	.dw 0x0d,0x0a
.code
LM20:
	pc=L7	// jump
L13:
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM21-_main
	.dw 0x0d,0x0a
.code
LM21:
	R1=BP	// QImode move
	R2=BP+2
	R3=BP	// QImode move
	R1=BP+2
	R2=BP	// QImode move
	R3=BP+2
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,45,',0,0
	.dd LM22-_main
	.dw 0x0d,0x0a
.code
LM22:
	R1=BP	// QImode move
	R2=BP+2
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,15	// QImode compare
	JG L40	// QImode LE
	PC=L14
L40:
.debug
	.dw '.stabn 0x44,0,46,',0,0
	.dd LM23-_main
	.dw 0x0d,0x0a
.code
LM23:
	R1=BP	// QImode move
	R2=BP+2
	R1=15	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
L14:
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM24-_main
	.dw 0x0d,0x0a
.code
LM24:
	R1=BP	// QImode move
	R2=BP+2
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_S240_Volume	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,48,',0,0
	.dd LM25-_main
	.dw 0x0d,0x0a
.code
LM25:
	pc=L7	// jump
L15:
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM26-_main
	.dw 0x0d,0x0a
.code
LM26:
	R1=BP	// QImode move
	R2=BP+2
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,0	// QImode test
	JZ L41	// QImode NE
	PC=L16
L41:
.debug
	.dw '.stabn 0x44,0,51,',0,0
	.dd LM27-_main
	.dw 0x0d,0x0a
.code
LM27:
	R1=BP	// QImode move
	R2=BP+2
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
	pc=L17	// jump
L16:
.debug
	.dw '.stabn 0x44,0,53,',0,0
	.dd LM28-_main
	.dw 0x0d,0x0a
.code
LM28:
	R1=BP	// QImode move
	R2=BP+2
	R3=BP	// QImode move
	R1=BP+2
	R2=BP	// QImode move
	R3=BP+2
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+(-1)
	R2=R1	// QImode move
	[R2]=R3	// QImode move
L17:
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM29-_main
	.dw 0x0d,0x0a
.code
LM29:
	R1=BP	// QImode move
	R2=BP+2
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_S240_Volume	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,55,',0,0
	.dd LM30-_main
	.dw 0x0d,0x0a
.code
LM30:
	pc=L7	// jump
L18:
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM31-_main
	.dw 0x0d,0x0a
.code
LM31:
	R1=BP	// QImode move
	R2=BP+1
	R3=BP	// QImode move
	R1=BP+1
	R2=BP	// QImode move
	R3=BP+1
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,59,',0,0
	.dd LM32-_main
	.dw 0x0d,0x0a
.code
LM32:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,3	// QImode compare
	JZ L42	// QImode NE
	PC=L19
L42:
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM33-_main
	.dw 0x0d,0x0a
.code
LM33:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
L19:
.debug
	.dw '.stabn 0x44,0,61,',0,0
	.dd LM34-_main
	.dw 0x0d,0x0a
.code
LM34:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_S240_Play	// call without return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,62,',0,0
	.dd LM35-_main
	.dw 0x0d,0x0a
.code
LM35:
	pc=L7	// jump
L20:
.debug
	.dw '.stabn 0x44,0,65,',0,0
	.dd LM36-_main
	.dw 0x0d,0x0a
.code
LM36:
	R1=BP	// QImode move
	R2=BP+1
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,0	// QImode test
	JZ L43	// QImode NE
	PC=L21
L43:
.debug
	.dw '.stabn 0x44,0,66,',0,0
	.dd LM37-_main
	.dw 0x0d,0x0a
.code
LM37:
	R1=BP	// QImode move
	R2=BP+1
	R1=3	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L21:
.debug
	.dw '.stabn 0x44,0,67,',0,0
	.dd LM38-_main
	.dw 0x0d,0x0a
.code
LM38:
	R1=BP	// QImode move
	R2=BP+1
	R3=BP	// QImode move
	R1=BP+1
	R2=BP	// QImode move
	R3=BP+1
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+(-1)
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,68,',0,0
	.dd LM39-_main
	.dw 0x0d,0x0a
.code
LM39:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_S240_Play	// call without return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,69,',0,0
	.dd LM40-_main
	.dw 0x0d,0x0a
.code
LM40:
	pc=L7	// jump
L22:
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM41-_main
	.dw 0x0d,0x0a
.code
LM41:
	pc=L7	// jump
L7:
.debug
	.dw '.stabn 0x44,0,74,',0,0
	.dd LM42-_main
	.dw 0x0d,0x0a
.code
LM42:
	call _System_ServiceLoop	// call with return value
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM43-_main
	.dw 0x0d,0x0a
.code
LM43:
	call _SACM_S240_ServiceLoop	// call without return value
.debug
	.dw '.stabn 0x44,0,76,',0,0
	.dd LM44-_main
	.dw 0x0d,0x0a
.code
LM44:
LBE3:
	pc=L4	// jump
L5:
L3:
.debug
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM45-_main
	.dw 0x0d,0x0a
.code
LM45:
	R1=0	// QImode move
	pc=L2	// jump
.debug
	.dw '.stabn 0x44,0,79,',0,0
	.dd LM46-_main
	.dw 0x0d,0x0a
.code
LM46:
LBE2:
.debug
	.dw '.stabn 0x44,0,79,',0,0
	.dd LM47-_main
	.dw 0x0d,0x0a
.code
LM47:
L2:

	sp+=5
	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "Key:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "SpeechIndex:1",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "VolumeIndex:1",128,0,0,2',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "Mode:1",128,0,0,3',0x0d,0x0a
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
.debug
	.dw '.stabs "Addr:G3",32,0,0,',0,0,offset _Addr,seg _Addr,0x0d,0x0a
.CODE
.ram
.public _Addr
_Addr:
	.dw 2 dup(0)
.external _SACM_S240_ServiceLoop
.external _System_ServiceLoop
.external _SACM_S240_Volume
.external _SACM_S240_Resume
.external _SACM_S240_Pause
.external _SACM_S240_Stop
.external _SP_GetCh
.external _SACM_S240_Play
.external _SACM_S240_Initial
	.end
