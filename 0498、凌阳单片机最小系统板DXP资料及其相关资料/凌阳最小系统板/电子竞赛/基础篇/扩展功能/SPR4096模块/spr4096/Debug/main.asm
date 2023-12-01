// GCC for SUNPLUS u'nSP version 1.0.10
// Command: D:\PROGRA~1\Sunplus\UNSPID~2\IDE180\cc1.exe C:\DOCUME~1\Œ§π„‘∂\LOCALS~1\Temp\ccGwaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "D:\\TestProgram\\SPR4096/", 0x64, 0, 3, Ltext0
.stabs "D:/TestProgram/SPR4096/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabn 0x44,0,38,',0,0
	.dd LM1-_main
	.dw 0x0d,0x0a
.code
LM1:
	// total=29, vars=29
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=29
	bp=sp+1

	R1=BP+32
	[bp+27]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,39,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
.debug
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	call _SP_SIOInitial	// call without return value
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	call _SP_SIOMassErase	// call without return value
.debug
	.dw '.stabn 0x44,0,45,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	R1=BP	// QImode move
	R2=BP+2
	R3=0	// HImode immediate to register move
	R4=0
	R1=R2	// QImode move
	[R1++]=R3	// [RD]=RS HImode, RD!=RS+1
	[R1--]=R4
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R1=BP	// QImode move
	R2=BP+5
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+2
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	[BP++]=R3	// [RD]=RS HImode, RD!=RS+1
	[BP--]=R4
	R1=BP	// QImode move
	R2=BP+4
	R1=6	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L3:
	R1=BP	// QImode move
	R2=BP+5
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,9	// QImode compare
	JA L22	// QImode LEU
	PC=L6
L22:
	pc=L4	// jump
L6:
.debug
	.dw '.stabn 0x44,0,49,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R1=BP	// QImode move
	R2=BP+4
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	R1=[BP++]	// RD=[RS] HImode, RD!=RS
	R2=[BP--]
	push R1,R2 to [sp]	// pushhi
	call _SP_SIOSendAByte	// call without return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	R1=[BP++]	// RD=[RS] HImode, RD!=RS
	R2=[BP--]
	R3=R1+1	// HImode RD=RS+#IMM16
	R4=R2+0, Carry
	[BP++]=R3	// [RD]=RS HImode, RD!=RS+1
	[BP--]=R4
.debug
	.dw '.stabn 0x44,0,51,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
	R2=BP	// QImode move
	R1=BP+4
	R2=BP	// QImode move
	R3=BP+4
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,52,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
L5:
	R1=BP	// QImode move
	R2=BP+5
	R3=BP	// QImode move
	R1=BP+5
	R2=BP	// QImode move
	R3=BP+5
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	R1=BP	// QImode move
	R2=BP+5
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+2
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	[BP++]=R3	// [RD]=RS HImode, RD!=RS+1
	[BP--]=R4
L7:
	R1=BP	// QImode move
	R2=BP+5
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,9	// QImode compare
	JA L23	// QImode LEU
	PC=L10
L23:
	pc=L8	// jump
L10:
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	R1=[BP++]	// RD=[RS] HImode, RD!=RS
	R2=[BP--]
	push R1,R2 to [sp]	// pushhi
	call _SP_SIOReadAByte	// call with return value
	SP=SP+2
	R3=BP	// QImode move
	R2=BP+7
	R3=BP	// QImode move
	R4=BP+5
	[bp+28]=R4	// QImode move
	R4=[bp+28]	// QImode move
	R3=[R4]	// QImode move
	R2+=R3	// addqi3_r0r
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,57,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	R1=[BP++]	// RD=[RS] HImode, RD!=RS
	R2=[BP--]
	R3=R1+1	// HImode RD=RS+#IMM16
	R4=R2+0, Carry
	[BP++]=R3	// [RD]=RS HImode, RD!=RS+1
	[BP--]=R4
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
L9:
	R1=BP	// QImode move
	R2=BP+5
	R3=BP	// QImode move
	R1=BP+5
	R2=BP	// QImode move
	R3=BP+5
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
	pc=L7	// jump
L8:
.debug
	.dw '.stabn 0x44,0,62,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _SP_SIOSectorErase	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,65,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
	R1=BP	// QImode move
	R2=BP+5
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+2
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	[BP++]=R3	// [RD]=RS HImode, RD!=RS+1
	[BP--]=R4
	R1=BP	// QImode move
	R2=BP+4
	R1=2	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L11:
	R1=BP	// QImode move
	R2=BP+5
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,9	// QImode compare
	JA L24	// QImode LEU
	PC=L14
L24:
	pc=L12	// jump
L14:
.debug
	.dw '.stabn 0x44,0,67,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
	R1=BP	// QImode move
	R2=BP+4
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	R1=[BP++]	// RD=[RS] HImode, RD!=RS
	R2=[BP--]
	push R1,R2 to [sp]	// pushhi
	call _SP_SIOSendAWord	// call without return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,68,',0,0
	.dd LM20-_main
	.dw 0x0d,0x0a
.code
LM20:
	R1=[BP++]	// RD=[RS] HImode, RD!=RS
	R2=[BP--]
	R3=R1+2	// HImode RD=RS+#IMM16
	R4=R2+0, Carry
	[BP++]=R3	// [RD]=RS HImode, RD!=RS+1
	[BP--]=R4
.debug
	.dw '.stabn 0x44,0,69,',0,0
	.dd LM21-_main
	.dw 0x0d,0x0a
.code
LM21:
	R2=BP	// QImode move
	R1=BP+4
	R2=BP	// QImode move
	R3=BP+4
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM22-_main
	.dw 0x0d,0x0a
.code
LM22:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,65,',0,0
	.dd LM23-_main
	.dw 0x0d,0x0a
.code
LM23:
L13:
	R1=BP	// QImode move
	R2=BP+5
	R3=BP	// QImode move
	R1=BP+5
	R2=BP	// QImode move
	R3=BP+5
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
	pc=L11	// jump
L12:
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM24-_main
	.dw 0x0d,0x0a
.code
LM24:
	R1=BP	// QImode move
	R2=BP+5
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+2
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	[BP++]=R3	// [RD]=RS HImode, RD!=RS+1
	[BP--]=R4
L15:
	R1=BP	// QImode move
	R2=BP+5
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,9	// QImode compare
	JA L25	// QImode LEU
	PC=L18
L25:
	pc=L16	// jump
L18:
.debug
	.dw '.stabn 0x44,0,74,',0,0
	.dd LM25-_main
	.dw 0x0d,0x0a
.code
LM25:
	R1=[BP++]	// RD=[RS] HImode, RD!=RS
	R2=[BP--]
	push R1,R2 to [sp]	// pushhi
	call _SP_SIOReadAWord	// call with return value
	SP=SP+2
	R3=BP	// QImode move
	R2=BP+17
	R3=BP	// QImode move
	R4=BP+5
	[bp+28]=R4	// QImode move
	R4=[bp+28]	// QImode move
	R3=[R4]	// QImode move
	R2+=R3	// addqi3_r0r
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM26-_main
	.dw 0x0d,0x0a
.code
LM26:
	R1=[BP++]	// RD=[RS] HImode, RD!=RS
	R2=[BP--]
	R3=R1+2	// HImode RD=RS+#IMM16
	R4=R2+0, Carry
	[BP++]=R3	// [RD]=RS HImode, RD!=RS+1
	[BP--]=R4
.debug
	.dw '.stabn 0x44,0,76,',0,0
	.dd LM27-_main
	.dw 0x0d,0x0a
.code
LM27:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM28-_main
	.dw 0x0d,0x0a
.code
LM28:
L17:
	R1=BP	// QImode move
	R2=BP+5
	R3=BP	// QImode move
	R1=BP+5
	R2=BP	// QImode move
	R3=BP+5
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
	pc=L15	// jump
L16:
.debug
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM29-_main
	.dw 0x0d,0x0a
.code
LM29:
L19:
	pc=L21	// jump
	pc=L20	// jump
L21:
.debug
	.dw '.stabn 0x44,0,80,',0,0
	.dd LM30-_main
	.dw 0x0d,0x0a
.code
LM30:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,81,',0,0
	.dd LM31-_main
	.dw 0x0d,0x0a
.code
LM31:
	pc=L19	// jump
L20:
.debug
	.dw '.stabn 0x44,0,83,',0,0
	.dd LM32-_main
	.dw 0x0d,0x0a
.code
LM32:
LBE2:
.debug
	.dw '.stabn 0x44,0,83,',0,0
	.dd LM33-_main
	.dw 0x0d,0x0a
.code
LM33:
L2:

	sp+=29
	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "ulAddr:5",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "ulStartAddr:5",128,0,0,2',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "uiData:4",128,0,0,4',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "i:4",128,0,0,5',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "j:4",128,0,0,6',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "uiByteBuffer:20=ar1;0;9;4",128,0,0,7',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "uiWordBuffer:21=ar1;0;9;4",128,0,0,17',0x0d,0x0a
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
.external _SP_SIOReadAWord
.external _SP_SIOSendAWord
.external _SP_SIOSectorErase
.external _SP_SIOReadAByte
.external _SP_SIOSendAByte
.external _SP_SIOMassErase
.external _SP_SIOInitial
	.end
