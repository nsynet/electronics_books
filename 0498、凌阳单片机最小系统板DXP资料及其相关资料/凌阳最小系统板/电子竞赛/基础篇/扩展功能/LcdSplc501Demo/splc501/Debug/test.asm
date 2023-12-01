// GCC for SUNPLUS u'nSP version 1.0.10
// Command: D:\PROGRA~1\Sunplus\UNSPID~1\IDE180\cc1.exe D:\DOCUME~1\刘新颜\LOCALS~1\Temp\ccm4aaaa.i -fkeep-inline-functions -quiet -dumpbase test.c -gstabs -o .\Debug/test.asm
// gcc2_compiled.:

.stabs "F:\\功能扩展\\LcdSplc501Demo\\splc501/", 0x64, 0, 3, Ltext0
.stabs "F:/功能扩展/LcdSplc501Demo/splc501/test.c", 0x64, 0, 3, Ltext0
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
.text
LC0:
	.dw 'I',' ','L','O','V','E',' ','Y','O','U','!',0
LC1:
	.dw 'S','U','N','P','L','U','S',0
LC2:
	.dw 'a',0
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
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,7,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	call _Init_sys	// call with return value
.debug
	.dw '.stabn 0x44,0,8,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	call _FG_InitGraphic	// call with return value
.debug
	.dw '.stabn 0x44,0,9,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,10,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	R1=15	// QImode move
	[SP--]=R1	// QImode move
	R1=15	// QImode move
	[SP--]=R1	// QImode move
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	call _FG_Ellipse	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,11,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R1=60	// QImode move
	[SP--]=R1	// QImode move
	R1=100	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC0	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,12,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R1=20	// QImode move
	[SP--]=R1	// QImode move
	R1=90	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutStr	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,13,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_ClearScreen	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,14,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutPixel	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,15,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _FG_ClearScreen	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,16,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutPixel	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,17,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_ClearScreen	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,18,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutPixel	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,19,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _FG_ClearScreen	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,20,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutPixel	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,21,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_ClearScreen	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,22,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutPixel	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _FG_ClearScreen	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,24,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutPixel	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,26,',0,0
	.dd LM20-_main
	.dw 0x0d,0x0a
.code
LM20:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM21-_main
	.dw 0x0d,0x0a
.code
LM21:
	R1=29	// QImode move
	[SP--]=R1	// QImode move
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutPixel	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,28,',0,0
	.dd LM22-_main
	.dw 0x0d,0x0a
.code
LM22:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetBMPMode	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,29,',0,0
	.dd LM23-_main
	.dw 0x0d,0x0a
.code
LM23:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_ClearScreen	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,30,',0,0
	.dd LM24-_main
	.dw 0x0d,0x0a
.code
LM24:
	R1=64	// QImode move
	[SP--]=R1	// QImode move
	R1=127	// QImode move
	[SP--]=R1	// QImode move
	R1=_mode2	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutBitmap	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,31,',0,0
	.dd LM25-_main
	.dw 0x0d,0x0a
.code
LM25:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _FG_ClearScreen	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,32,',0,0
	.dd LM26-_main
	.dw 0x0d,0x0a
.code
LM26:
	R1=64	// QImode move
	[SP--]=R1	// QImode move
	R1=127	// QImode move
	[SP--]=R1	// QImode move
	R1=_mode2	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutBitmap	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,33,',0,0
	.dd LM27-_main
	.dw 0x0d,0x0a
.code
LM27:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetBMPMode	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,34,',0,0
	.dd LM28-_main
	.dw 0x0d,0x0a
.code
LM28:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_ClearScreen	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,35,',0,0
	.dd LM29-_main
	.dw 0x0d,0x0a
.code
LM29:
	R1=64	// QImode move
	[SP--]=R1	// QImode move
	R1=127	// QImode move
	[SP--]=R1	// QImode move
	R1=_mode2	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutBitmap	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,36,',0,0
	.dd LM30-_main
	.dw 0x0d,0x0a
.code
LM30:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _FG_ClearScreen	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,37,',0,0
	.dd LM31-_main
	.dw 0x0d,0x0a
.code
LM31:
	R1=64	// QImode move
	[SP--]=R1	// QImode move
	R1=127	// QImode move
	[SP--]=R1	// QImode move
	R1=_mode2	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutBitmap	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,38,',0,0
	.dd LM32-_main
	.dw 0x0d,0x0a
.code
LM32:
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetBMPMode	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,39,',0,0
	.dd LM33-_main
	.dw 0x0d,0x0a
.code
LM33:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _FG_ClearScreen	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,40,',0,0
	.dd LM34-_main
	.dw 0x0d,0x0a
.code
LM34:
	R1=64	// QImode move
	[SP--]=R1	// QImode move
	R1=127	// QImode move
	[SP--]=R1	// QImode move
	R1=_mode2	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutBitmap	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM35-_main
	.dw 0x0d,0x0a
.code
LM35:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _FG_ClearScreen	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM36-_main
	.dw 0x0d,0x0a
.code
LM36:
	R1=64	// QImode move
	[SP--]=R1	// QImode move
	R1=127	// QImode move
	[SP--]=R1	// QImode move
	R1=_mode2	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutBitmap	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM37-_main
	.dw 0x0d,0x0a
.code
LM37:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	R1=LC2	// QImode move
	[SP--]=R1	// QImode move
	call _FG_GetCharHeight	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,45,',0,0
	.dd LM38-_main
	.dw 0x0d,0x0a
.code
LM38:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=LC2	// QImode move
	[SP--]=R1	// QImode move
	call _FG_GetCharHeight	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,46,',0,0
	.dd LM39-_main
	.dw 0x0d,0x0a
.code
LM39:
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	R1=LC2	// QImode move
	[SP--]=R1	// QImode move
	call _FG_GetCharHeight	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM40-_main
	.dw 0x0d,0x0a
.code
LM40:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=LC2	// QImode move
	[SP--]=R1	// QImode move
	call _FG_GetCharHeight	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,48,',0,0
	.dd LM41-_main
	.dw 0x0d,0x0a
.code
LM41:
	R1=4	// QImode move
	[SP--]=R1	// QImode move
	R1=LC2	// QImode move
	[SP--]=R1	// QImode move
	call _FG_GetCharHeight	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM42-_main
	.dw 0x0d,0x0a
.code
LM42:
	R1=4	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,51,',0,0
	.dd LM43-_main
	.dw 0x0d,0x0a
.code
LM43:
	R1=40	// QImode move
	[SP--]=R1	// QImode move
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=10	// QImode move
	[SP--]=R1	// QImode move
	R1=10	// QImode move
	[SP--]=R1	// QImode move
	call _FG_Rectangle	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,52,',0,0
	.dd LM44-_main
	.dw 0x0d,0x0a
.code
LM44:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,53,',0,0
	.dd LM45-_main
	.dw 0x0d,0x0a
.code
LM45:
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutPixel	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM46-_main
	.dw 0x0d,0x0a
.code
LM46:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,55,',0,0
	.dd LM47-_main
	.dw 0x0d,0x0a
.code
LM47:
	R1=29	// QImode move
	[SP--]=R1	// QImode move
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	call _FG_PutPixel	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM48-_main
	.dw 0x0d,0x0a
.code
LM48:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _FG_SetLineStyle	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,57,',0,0
	.dd LM49-_main
	.dw 0x0d,0x0a
.code
LM49:
	R1=40	// QImode move
	[SP--]=R1	// QImode move
	R1=30	// QImode move
	[SP--]=R1	// QImode move
	R1=10	// QImode move
	[SP--]=R1	// QImode move
	R1=10	// QImode move
	[SP--]=R1	// QImode move
	call _FG_Rectangle	// call with return value
	SP=SP+4
.debug
	.dw '.stabn 0x44,0,61,',0,0
	.dd LM50-_main
	.dw 0x0d,0x0a
.code
LM50:
LBE2:
.debug
	.dw '.stabn 0x44,0,61,',0,0
	.dd LM51-_main
	.dw 0x0d,0x0a
.code
LM51:
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
.external _FG_Rectangle
.external _FG_GetCharHeight
.external _mode2
.external _FG_PutBitmap
.external _FG_SetBMPMode
.external _FG_PutPixel
.external _FG_ClearScreen
.external _FG_PutStr
.external _FG_Ellipse
.external _FG_SetLineStyle
.external _FG_InitGraphic
.external _Init_sys
	.end
