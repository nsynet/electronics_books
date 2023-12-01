// GCC for SUNPLUS u'nSP version 1.0.10-10
// Command: C:\PROGRA~1\Sunplus\UNSPID~1\unSPIDE\cc1.exe C:\DOCUME~1\Αυ»Τ\LOCALS~1\Temp\cc6vaaaa.i -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "D:\\program\\shiyanjiaocheng_program\\shiyan9\\led9_c/", 0x64, 0, 3, Ltext0
.stabs "D:/program/shiyanjiaocheng_program/shiyan9/led9_c/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "DispTbl:G20=ar1;0;9;1",32,0,0,',0,0,offset _DispTbl,seg _DispTbl,0x0d,0x0a
.CODE
.public _DispTbl
.iram
_DispTbl:
	.dw 63
	.dw 6
	.dw 91
	.dw 79
	.dw 102
	.dw 109
	.dw 125
	.dw 7
	.dw 127
	.dw 255
.debug
	.dw '.stabs "LedControl:G4",32,0,0,',0,0,offset _LedControl,seg _LedControl,0x0d,0x0a
.CODE
.public _LedControl
.iram
_LedControl:
	.dw 1
.code
.debug
	.dw '.stabs "main:F1",36,0,0,',0,0,offset _main,seg _main,0x0d,0x0a
.CODE
.public _main
_main:	.proc
.debug
	.dw '.stabn 0x44,0,61,',0,0
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
	.dw '.stabn 0x44,0,62,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	R1=0	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,63,',0,0
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
	.dw '.stabn 0x44,0,65,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R1=255	// QImode move
	[28674]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,66,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	R1=255	// QImode move
	[28675]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,67,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,68,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R1=255	// QImode move
	[28679]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,69,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	R1=255	// QImode move
	[28680]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
	R1=0	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	R1=0	// QImode move
	[BP]=R1	// QImode move
L3:
	R1=[BP]	// QImode move
	CMP R1,5	// QImode compare
	JG L14	// QImode LE
	PC=L6
L14:
	pc=L4	// Indirect jump
L6:
.debug
	.dw '.stabn 0x44,0,74,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	R1=[_LedControl]	// QImode move
	R2=[BP]	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __lshiu1	// call with return value
	SP=SP+2
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	R1=[_DispTbl]	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,76,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
L7:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,7	// QImode compare
	JG L15	// QImode LE
	PC=L10
L15:
	pc=L5	// Indirect jump
L10:
.debug
	.dw '.stabn 0x44,0,80,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	R1=[BP]	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _Led_Disp	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
L9:
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
	pc=L7	// Indirect jump
L8:
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
L5:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L3	// Indirect jump
L4:
.debug
	.dw '.stabn 0x44,0,84,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,85,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
	R1=63	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,86,',0,0
	.dd LM20-_main
	.dw 0x0d,0x0a
.code
LM20:
	R1=[_DispTbl+9]	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,88,',0,0
	.dd LM21-_main
	.dw 0x0d,0x0a
.code
LM21:
L11:
	pc=L13	// Indirect jump
	pc=L12	// Indirect jump
L13:
.debug
	.dw '.stabn 0x44,0,90,',0,0
	.dd LM22-_main
	.dw 0x0d,0x0a
.code
LM22:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,91,',0,0
	.dd LM23-_main
	.dw 0x0d,0x0a
.code
LM23:
	pc=L11	// Indirect jump
L12:
.debug
	.dw '.stabn 0x44,0,92,',0,0
	.dd LM24-_main
	.dw 0x0d,0x0a
.code
LM24:
LBE2:
.debug
	.dw '.stabn 0x44,0,92,',0,0
	.dd LM25-_main
	.dw 0x0d,0x0a
.code
LM25:
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
	.dw '.stabs "Loop_Numb:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "Led_Numb:1",128,0,0,1',0x0d,0x0a
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
	.dw '.stabs "Delay:F1",36,0,0,',0,0,offset _Delay,seg _Delay,0x0d,0x0a
.CODE
.public _Delay
_Delay:	.proc
.debug
	.dw '.stabn 0x44,0,100,',0,0
	.dd LM26-_Delay
	.dw 0x0d,0x0a
.code
LM26:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
.debug
	.dw '.stabn 0x44,0,101,',0,0
	.dd LM27-_Delay
	.dw 0x0d,0x0a
.code
LM27:
LBB3:
	R2=0	// QImode move
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,103,',0,0
	.dd LM28-_Delay
	.dw 0x0d,0x0a
.code
LM28:
	R2=0	// QImode move
	[BP]=R2	// QImode move
L17:
	R2=[BP]	// QImode move
	CMP R2,8191	// QImode compare
	JG L21	// QImode LE
	PC=L20
L21:
	pc=L18	// Indirect jump
L20:
.debug
	.dw '.stabn 0x44,0,104,',0,0
	.dd LM29-_Delay
	.dw 0x0d,0x0a
.code
LM29:
	R2=1	// QImode move
	[28690]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,103,',0,0
	.dd LM30-_Delay
	.dw 0x0d,0x0a
.code
LM30:
L19:
	R2=[BP]	// QImode move
	R3=R2+1
	[BP]=R3	// QImode move
	pc=L17	// Indirect jump
L18:
.debug
	.dw '.stabn 0x44,0,105,',0,0
	.dd LM31-_Delay
	.dw 0x0d,0x0a
.code
LM31:
LBE3:
.debug
	.dw '.stabn 0x44,0,105,',0,0
	.dd LM32-_Delay
	.dw 0x0d,0x0a
.code
LM32:
L16:

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
	.dw '.stabs "DelayValue:1",128,0,0,0',0x0d,0x0a
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
.code
.debug
	.dw '.stabs "Led_Disp:F1",36,0,0,',0,0,offset _Led_Disp,seg _Led_Disp,0x0d,0x0a
.CODE
.public _Led_Disp
_Led_Disp:	.proc
.debug
	.dw '.stabn 0x44,0,113,',0,0
	.dd LM33-_Led_Disp
	.dw 0x0d,0x0a
.code
LM33:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,114,',0,0
	.dd LM34-_Led_Disp
	.dw 0x0d,0x0a
.code
LM34:
	R1=64	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,115,',0,0
	.dd LM35-_Led_Disp
	.dw 0x0d,0x0a
.code
LM35:
	R1=[_LedControl]	// QImode move
	R3=[BP]	// QImode move
	R2=[R3]	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __lshiu1	// call with return value
	SP=SP+2
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,116,',0,0
	.dd LM36-_Led_Disp
	.dw 0x0d,0x0a
.code
LM36:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,118,',0,0
	.dd LM37-_Led_Disp
	.dw 0x0d,0x0a
.code
LM37:
	R1=[BP]	// QImode move
	R1=[BP]	// QImode move
	R2=R1+1
	R1=[_LedControl]	// QImode move
	R3=R2	// QImode move
	R2=[R3]	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __lshiu1	// call with return value
	SP=SP+2
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,119,',0,0
	.dd LM38-_Led_Disp
	.dw 0x0d,0x0a
.code
LM38:
	R1=[BP]	// QImode move
	R2=[R1]	// QImode move
	R1=R2+1
	R3=_DispTbl	// QImode move
	R2=R3	// QImode move
	R2+=R1	// addqi3_r0r
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,120,',0,0
	.dd LM39-_Led_Disp
	.dw 0x0d,0x0a
.code
LM39:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,121,',0,0
	.dd LM40-_Led_Disp
	.dw 0x0d,0x0a
.code
LM40:
.debug
	.dw '.stabn 0x44,0,121,',0,0
	.dd LM41-_Led_Disp
	.dw 0x0d,0x0a
.code
LM41:
L22:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of Led_Disp

.debug
	.dw '.stabs "Led:p1",160,0,0,4',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "Loop:p1",160,0,0,5',0x0d,0x0a
.CODE
.debug
	.dw '.stabf ',0,0
	.dd LME3-_Led_Disp
	.dw 0x0d,0x0a
.code
LME3:
.external __lshiu1
	.end
