// GCC for SUNPLUS u'nSP version 1.0.10
// Command: D:\PROGRA~1\Sunplus\UNSPID~1\IDE180\cc1.exe D:\DOCUME~1\刘新颜\LOCALS~1\Temp\ccWQaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\功能扩展\\8255Demo\\8255 For IO/", 0x64, 0, 3, Ltext0
.stabs "F:/功能扩展/8255Demo/8255 For IO/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabn 0x44,0,3,',0,0
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
	.dw '.stabn 0x44,0,4,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	R1=0	// QImode move
	[BP]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,5,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	call _Init_IOB	// call with return value
.debug
	.dw '.stabn 0x44,0,6,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
L3:
	pc=L5	// jump
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,8,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
LBB3:
	call _ClearWatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,9,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	call _Init_WR_InABC	// call with return value
.debug
	.dw '.stabn 0x44,0,10,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	call _ClearWatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,11,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	call _Read_PA	// call with return value
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,12,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
	call _ClearWatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,13,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	call _Read_PB	// call with return value
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,14,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	call _ClearWatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,15,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	call _Read_PC	// call with return value
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,16,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	call _ClearWatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,17,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	call _Init_WR_OutABC	// call with return value
.debug
	.dw '.stabn 0x44,0,18,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	R1=BP	// QImode move
	R2=BP+1
	R1=13107	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,19,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	call _ClearWatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,20,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _Writer_PA	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,21,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
	call _ClearWatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,22,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
	R1=BP	// QImode move
	R2=BP+1
	R1=17476	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM20-_main
	.dw 0x0d,0x0a
.code
LM20:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _Writer_PB	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,24,',0,0
	.dd LM21-_main
	.dw 0x0d,0x0a
.code
LM21:
	call _ClearWatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,25,',0,0
	.dd LM22-_main
	.dw 0x0d,0x0a
.code
LM22:
	R1=BP	// QImode move
	R2=BP+1
	R1=21845	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,26,',0,0
	.dd LM23-_main
	.dw 0x0d,0x0a
.code
LM23:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _Writer_PC	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM24-_main
	.dw 0x0d,0x0a
.code
LM24:
LBE3:
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,28,',0,0
	.dd LM25-_main
	.dw 0x0d,0x0a
.code
LM25:
LBE2:
.debug
	.dw '.stabn 0x44,0,28,',0,0
	.dd LM26-_main
	.dw 0x0d,0x0a
.code
LM26:
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
	.dw '.stabs "iRData:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "iWData:1",128,0,0,1',0x0d,0x0a
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
.external _Writer_PC
.external _Writer_PB
.external _Writer_PA
.external _Init_WR_OutABC
.external _Read_PC
.external _Read_PB
.external _Read_PA
.external _Init_WR_InABC
.external _ClearWatchDog
.external _Init_IOB
	.end
