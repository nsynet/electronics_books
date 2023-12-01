// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\PROGRA~1\Sunplus\UNSPID~3\IDE180\cc1.exe C:\DOCUME~1\李华丽.DOMAIN\LOCALS~1\Temp\ccItaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\电子竞赛\\C语言应用篇\\Source Code\\chapter9 Audio\\MS01/", 0x64, 0, 3, Ltext0
.stabs "F:/电子竞赛/C语言应用篇/Source Code/chapter9 Audio/MS01/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "Key:G1",32,0,0,',0,0,offset _Key,seg _Key,0x0d,0x0a
.CODE
.public _Key
.iram
_Key:
	.dw 0
.debug
	.dw '.stabs "SongIndex:G1",32,0,0,',0,0,offset _SongIndex,seg _SongIndex,0x0d,0x0a
.CODE
.public _SongIndex
.iram
_SongIndex:
	.dw 0
.debug
	.dw '.stabs "VolumeIndex:G1",32,0,0,',0,0,offset _VolumeIndex,seg _VolumeIndex,0x0d,0x0a
.CODE
.public _VolumeIndex
.iram
_VolumeIndex:
	.dw 8
.code
.debug
	.dw '.stabs "main:F1",36,0,0,',0,0,offset _main,seg _main,0x0d,0x0a
.CODE
.public _main
_main:	.proc
.debug
	.dw '.stabn 0x44,0,15,',0,0
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
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,16,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	R1=1	// QImode move
	[_Mode]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,17,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
L3:
	R1=[_Mode]	// QImode move
	CMP R1,1	// QImode compare
	JNZ L29	// QImode EQ
	PC=L5
L29:
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,19,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
LBB3:
	call _System_Initial	// call with return value
.debug
	.dw '.stabn 0x44,0,20,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_MS01_Initial	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,21,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=[_SongIndex]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_MS01_Play	// call without return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
L6:
	pc=L8	// jump
	pc=L7	// jump
L8:
.debug
	.dw '.stabn 0x44,0,24,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
LBB4:
	call _SP_GetCh	// call with return value
	[_Key]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,25,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
	R1=[_Key]	// QImode move
	CMP R1,8	// QImode compare
	JNZ L30	// QImode EQ
	PC=L14
L30:
	CMP R1,8	// QImode compare
	JNG L31	// QImode GT
	PC=L26
L31:
	CMP R1,1	// QImode compare
	JNZ L32	// QImode EQ
	PC=L11
L32:
	CMP R1,1	// QImode compare
	JNG L33	// QImode GT
	PC=L27
L33:
	CMP R1,0	// QImode test
	JNZ L34	// QImode EQ
	PC=L10
L34:
	pc=L24	// jump
L27:
	CMP R1,2	// QImode compare
	JNZ L35	// QImode EQ
	PC=L12
L35:
	CMP R1,4	// QImode compare
	JNZ L36	// QImode EQ
	PC=L13
L36:
	pc=L24	// jump
L26:
	CMP R1,32	// QImode compare
	JNZ L37	// QImode EQ
	PC=L17
L37:
	CMP R1,32	// QImode compare
	JNG L38	// QImode GT
	PC=L28
L38:
	CMP R1,16	// QImode compare
	JNZ L39	// QImode EQ
	PC=L15
L39:
	pc=L24	// jump
L28:
	CMP R1,64	// QImode compare
	JNZ L40	// QImode EQ
	PC=L20
L40:
	CMP R1,128	// QImode compare
	JNZ L41	// QImode EQ
	PC=L22
L41:
	pc=L24	// jump
L10:
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	pc=L9	// jump
L11:
.debug
	.dw '.stabn 0x44,0,29,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=[_SongIndex]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_MS01_Play	// call without return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,30,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	pc=L9	// jump
L12:
.debug
	.dw '.stabn 0x44,0,32,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	call _SACM_MS01_Stop	// call without return value
.debug
	.dw '.stabn 0x44,0,33,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	pc=L9	// jump
L13:
.debug
	.dw '.stabn 0x44,0,35,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	call _SACM_MS01_Pause	// call without return value
.debug
	.dw '.stabn 0x44,0,36,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	pc=L9	// jump
L14:
.debug
	.dw '.stabn 0x44,0,38,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
	call _SACM_MS01_Resume	// call without return value
.debug
	.dw '.stabn 0x44,0,39,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
	pc=L9	// jump
L15:
.debug
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
	R1=[_VolumeIndex]	// QImode move
	R2=1	// QImode move
	[_VolumeIndex]=R1+R2
.debug
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM20-_main
	.dw 0x0d,0x0a
.code
LM20:
	R1=[_VolumeIndex]	// QImode move
	CMP R1,15	// QImode compare
	JG L42	// QImode LE
	PC=L16
L42:
.debug
	.dw '.stabn 0x44,0,43,',0,0
	.dd LM21-_main
	.dw 0x0d,0x0a
.code
LM21:
	R1=15	// QImode move
	[_VolumeIndex]=R1	// QImode move
L16:
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM22-_main
	.dw 0x0d,0x0a
.code
LM22:
	R1=[_VolumeIndex]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_MS01_Volume	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,45,',0,0
	.dd LM23-_main
	.dw 0x0d,0x0a
.code
LM23:
	pc=L9	// jump
L17:
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM24-_main
	.dw 0x0d,0x0a
.code
LM24:
	R1=[_VolumeIndex]	// QImode move
	CMP R1,0	// QImode test
	JZ L43	// QImode NE
	PC=L18
L43:
.debug
	.dw '.stabn 0x44,0,48,',0,0
	.dd LM25-_main
	.dw 0x0d,0x0a
.code
LM25:
	R1=0	// QImode move
	[_VolumeIndex]=R1	// QImode move
	pc=L19	// jump
L18:
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM26-_main
	.dw 0x0d,0x0a
.code
LM26:
	R1=[_VolumeIndex]	// QImode move
	R2=(-1)	// QImode move
	[_VolumeIndex]=R1+R2
L19:
.debug
	.dw '.stabn 0x44,0,51,',0,0
	.dd LM27-_main
	.dw 0x0d,0x0a
.code
LM27:
	R1=[_VolumeIndex]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_MS01_Volume	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,52,',0,0
	.dd LM28-_main
	.dw 0x0d,0x0a
.code
LM28:
	pc=L9	// jump
L20:
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM29-_main
	.dw 0x0d,0x0a
.code
LM29:
	R2=[_SongIndex]	// QImode move
	R1=R2+1
	R2=R1	// QImode move
	[_SongIndex]=R2	// QImode move
	CMP R2,12	// QImode compare
	JZ L44	// QImode NE
	PC=L21
L44:
.debug
	.dw '.stabn 0x44,0,55,',0,0
	.dd LM30-_main
	.dw 0x0d,0x0a
.code
LM30:
	R1=0	// QImode move
	[_SongIndex]=R1	// QImode move
L21:
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM31-_main
	.dw 0x0d,0x0a
.code
LM31:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=[_SongIndex]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_MS01_Play	// call without return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,57,',0,0
	.dd LM32-_main
	.dw 0x0d,0x0a
.code
LM32:
	pc=L9	// jump
L22:
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM33-_main
	.dw 0x0d,0x0a
.code
LM33:
	R2=[_SongIndex]	// QImode move
	R1=R2+(-1)
	R2=R1	// QImode move
	[_SongIndex]=R2	// QImode move
	CMP R2,0	// QImode test
	JL L45	// QImode GE
	PC=L23
L45:
.debug
	.dw '.stabn 0x44,0,61,',0,0
	.dd LM34-_main
	.dw 0x0d,0x0a
.code
LM34:
	R1=11	// QImode move
	[_SongIndex]=R1	// QImode move
L23:
.debug
	.dw '.stabn 0x44,0,62,',0,0
	.dd LM35-_main
	.dw 0x0d,0x0a
.code
LM35:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=[_SongIndex]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_MS01_Play	// call without return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,63,',0,0
	.dd LM36-_main
	.dw 0x0d,0x0a
.code
LM36:
	pc=L9	// jump
L24:
.debug
	.dw '.stabn 0x44,0,65,',0,0
	.dd LM37-_main
	.dw 0x0d,0x0a
.code
LM37:
	pc=L9	// jump
L9:
.debug
	.dw '.stabn 0x44,0,67,',0,0
	.dd LM38-_main
	.dw 0x0d,0x0a
.code
LM38:
	call _System_ServiceLoop	// call with return value
.debug
	.dw '.stabn 0x44,0,68,',0,0
	.dd LM39-_main
	.dw 0x0d,0x0a
.code
LM39:
	call _SACM_MS01_ServiceLoop	// call without return value
.debug
	.dw '.stabn 0x44,0,69,',0,0
	.dd LM40-_main
	.dw 0x0d,0x0a
.code
LM40:
LBE4:
	pc=L6	// jump
L7:
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM41-_main
	.dw 0x0d,0x0a
.code
LM41:
LBE3:
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,71,',0,0
	.dd LM42-_main
	.dw 0x0d,0x0a
.code
LM42:
	R1=0	// QImode move
	pc=L2	// jump
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM43-_main
	.dw 0x0d,0x0a
.code
LM43:
LBE2:
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM44-_main
	.dw 0x0d,0x0a
.code
LM44:
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
.debug
	.dw '.stabs "Mode:G1",32,0,0,',0,0,offset _Mode,seg _Mode,0x0d,0x0a
.CODE
.ram
.public _Mode
_Mode:
	.dw 0
.external _SACM_MS01_ServiceLoop
.external _System_ServiceLoop
.external _SACM_MS01_Volume
.external _SACM_MS01_Resume
.external _SACM_MS01_Pause
.external _SACM_MS01_Stop
.external _SP_GetCh
.external _SACM_MS01_Play
.external _SACM_MS01_Initial
.external _System_Initial
	.end
