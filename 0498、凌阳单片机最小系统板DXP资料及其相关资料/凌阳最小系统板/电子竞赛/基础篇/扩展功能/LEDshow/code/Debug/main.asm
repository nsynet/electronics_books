// GCC for SUNPLUS u'nSP version 1.0.10
// Command: D:\PROGRA~1\Sunplus\UNSPID~1\IDE180\cc1.exe D:\DOCUME~1\刘新颜\LOCALS~1\Temp\ccCYaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\功能扩展\\LEDshowDemo\\LEDshow/", 0x64, 0, 3, Ltext0
.stabs "F:/功能扩展/LEDshowDemo/LEDshow/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "uiDelay:G4",32,0,0,',0,0,offset _uiDelay,seg _uiDelay,0x0d,0x0a
.CODE
.public _uiDelay
.iram
_uiDelay:
	.dw 8
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
	R1=28690	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,6,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	R1=[BP]	// QImode move
	R2=1	// QImode move
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,7,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
L3:
	pc=L5	// jump
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,9,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
L6:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,135	// QImode compare
	JA L22	// QImode LEU
	PC=L9
L22:
	pc=L7	// jump
L9:
.debug
	.dw '.stabn 0x44,0,11,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
LBB3:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,12,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,13,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,14,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,15,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	R1=4	// QImode move
	[SP--]=R1	// QImode move
	R1=4	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,16,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	R1=5	// QImode move
	[SP--]=R1	// QImode move
	R1=5	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,17,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
LBE3:
.debug
	.dw '.stabn 0x44,0,9,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
L8:
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
	pc=L6	// jump
L7:
.debug
	.dw '.stabn 0x44,0,18,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L10:
	R1=BP	// QImode move
	R2=BP+1
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,135	// QImode compare
	JA L23	// QImode LEU
	PC=L13
L23:
	pc=L11	// jump
L13:
.debug
	.dw '.stabn 0x44,0,20,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
LBB4:
	R1=6	// QImode move
	[SP--]=R1	// QImode move
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,21,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	R1=7	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,22,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
	R1=8	// QImode move
	[SP--]=R1	// QImode move
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
	R1=9	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,24,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	R1=4	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,25,',0,0
	.dd LM20-_main
	.dw 0x0d,0x0a
.code
LM20:
LBE4:
.debug
	.dw '.stabn 0x44,0,18,',0,0
	.dd LM21-_main
	.dw 0x0d,0x0a
.code
LM21:
L12:
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
	pc=L10	// jump
L11:
.debug
	.dw '.stabn 0x44,0,26,',0,0
	.dd LM22-_main
	.dw 0x0d,0x0a
.code
LM22:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L14:
	R1=BP	// QImode move
	R2=BP+1
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,135	// QImode compare
	JA L24	// QImode LEU
	PC=L17
L24:
	pc=L15	// jump
L17:
.debug
	.dw '.stabn 0x44,0,28,',0,0
	.dd LM23-_main
	.dw 0x0d,0x0a
.code
LM23:
LBB5:
	R1=10	// QImode move
	[SP--]=R1	// QImode move
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,29,',0,0
	.dd LM24-_main
	.dw 0x0d,0x0a
.code
LM24:
	R1=11	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,30,',0,0
	.dd LM25-_main
	.dw 0x0d,0x0a
.code
LM25:
	R1=12	// QImode move
	[SP--]=R1	// QImode move
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,31,',0,0
	.dd LM26-_main
	.dw 0x0d,0x0a
.code
LM26:
	R1=13	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,32,',0,0
	.dd LM27-_main
	.dw 0x0d,0x0a
.code
LM27:
	R1=14	// QImode move
	[SP--]=R1	// QImode move
	R1=4	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,33,',0,0
	.dd LM28-_main
	.dw 0x0d,0x0a
.code
LM28:
	R1=15	// QImode move
	[SP--]=R1	// QImode move
	R1=5	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,34,',0,0
	.dd LM29-_main
	.dw 0x0d,0x0a
.code
LM29:
LBE5:
.debug
	.dw '.stabn 0x44,0,26,',0,0
	.dd LM30-_main
	.dw 0x0d,0x0a
.code
LM30:
L16:
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
	pc=L14	// jump
L15:
.debug
	.dw '.stabn 0x44,0,35,',0,0
	.dd LM31-_main
	.dw 0x0d,0x0a
.code
LM31:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L18:
	R1=BP	// QImode move
	R2=BP+1
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,135	// QImode compare
	JA L25	// QImode LEU
	PC=L21
L25:
	pc=L19	// jump
L21:
.debug
	.dw '.stabn 0x44,0,37,',0,0
	.dd LM32-_main
	.dw 0x0d,0x0a
.code
LM32:
LBB6:
	R1=16	// QImode move
	[SP--]=R1	// QImode move
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,38,',0,0
	.dd LM33-_main
	.dw 0x0d,0x0a
.code
LM33:
	R1=17	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,39,',0,0
	.dd LM34-_main
	.dw 0x0d,0x0a
.code
LM34:
	R1=18	// QImode move
	[SP--]=R1	// QImode move
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,40,',0,0
	.dd LM35-_main
	.dw 0x0d,0x0a
.code
LM35:
	R1=19	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM36-_main
	.dw 0x0d,0x0a
.code
LM36:
	R1=10	// QImode move
	[SP--]=R1	// QImode move
	R1=4	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM37-_main
	.dw 0x0d,0x0a
.code
LM37:
LBE6:
.debug
	.dw '.stabn 0x44,0,35,',0,0
	.dd LM38-_main
	.dw 0x0d,0x0a
.code
LM38:
L20:
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
	pc=L18	// jump
L19:
.debug
	.dw '.stabn 0x44,0,43,',0,0
	.dd LM39-_main
	.dw 0x0d,0x0a
.code
LM39:
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM40-_main
	.dw 0x0d,0x0a
.code
LM40:
LBE2:
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM41-_main
	.dw 0x0d,0x0a
.code
LM41:
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
	.dw '.stabs "ClearWatchdog:20=*4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "i:4",128,0,0,1',0x0d,0x0a
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
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB5-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE5-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB6-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE6-_main
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
.external _F_SingleLed
	.end
