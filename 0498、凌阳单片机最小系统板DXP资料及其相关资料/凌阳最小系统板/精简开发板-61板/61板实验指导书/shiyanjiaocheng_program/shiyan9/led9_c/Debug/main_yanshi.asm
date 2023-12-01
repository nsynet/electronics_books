// GCC for SUNPLUS u'nSP version 1.0.10-10
// Command: C:\PROGRA~1\Sunplus\UNSPID~1\unSPIDE\cc1.exe C:\DOCUME~1\Αυ»Τ\LOCALS~1\Temp\cc6vaaaa.i -quiet -dumpbase main_yanshi.c -gstabs -o .\Debug/main_yanshi.asm
// gcc2_compiled.:

.stabs "D:\\program\\shiyanjiaocheng_program\\shiyan9\\led9_c/", 0x64, 0, 3, Ltext0
.stabs "D:/program/shiyanjiaocheng_program/shiyan9/led9_c/main_yanshi.c", 0x64, 0, 3, Ltext0
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
	// total=4, vars=4
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=4
	bp=sp+1

	R1=BP+7
	[bp+3]=R1	// QImode move
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
	.dw '.stabn 0x44,0,64,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R1=BP	// QImode move
	R2=BP+2
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,66,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	R1=255	// QImode move
	[28674]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,67,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R1=255	// QImode move
	[28675]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,68,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,69,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	R1=255	// QImode move
	[28679]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
	R1=255	// QImode move
	[28680]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,71,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	R1=0	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,74,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
L3:
	pc=L5	// Indirect jump
	pc=L4	// Indirect jump
L5:
.debug
	.dw '.stabn 0x44,0,93,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
LBB3:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,94,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	R1=64	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,95,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	R1=3	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,96,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,97,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,98,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,99,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,100,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
	R1=3	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,101,',0,0
	.dd LM20-_main
	.dw 0x0d,0x0a
.code
LM20:
	R1=[_DispTbl+9]	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,102,',0,0
	.dd LM21-_main
	.dw 0x0d,0x0a
.code
LM21:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,103,',0,0
	.dd LM22-_main
	.dw 0x0d,0x0a
.code
LM22:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,104,',0,0
	.dd LM23-_main
	.dw 0x0d,0x0a
.code
LM23:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,106,',0,0
	.dd LM24-_main
	.dw 0x0d,0x0a
.code
LM24:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,107,',0,0
	.dd LM25-_main
	.dw 0x0d,0x0a
.code
LM25:
	R1=64	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,108,',0,0
	.dd LM26-_main
	.dw 0x0d,0x0a
.code
LM26:
	R1=12	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,109,',0,0
	.dd LM27-_main
	.dw 0x0d,0x0a
.code
LM27:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,110,',0,0
	.dd LM28-_main
	.dw 0x0d,0x0a
.code
LM28:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,111,',0,0
	.dd LM29-_main
	.dw 0x0d,0x0a
.code
LM29:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,112,',0,0
	.dd LM30-_main
	.dw 0x0d,0x0a
.code
LM30:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,113,',0,0
	.dd LM31-_main
	.dw 0x0d,0x0a
.code
LM31:
	R1=12	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,114,',0,0
	.dd LM32-_main
	.dw 0x0d,0x0a
.code
LM32:
	R1=[_DispTbl+9]	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,115,',0,0
	.dd LM33-_main
	.dw 0x0d,0x0a
.code
LM33:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,116,',0,0
	.dd LM34-_main
	.dw 0x0d,0x0a
.code
LM34:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,117,',0,0
	.dd LM35-_main
	.dw 0x0d,0x0a
.code
LM35:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,119,',0,0
	.dd LM36-_main
	.dw 0x0d,0x0a
.code
LM36:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,120,',0,0
	.dd LM37-_main
	.dw 0x0d,0x0a
.code
LM37:
	R1=64	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,121,',0,0
	.dd LM38-_main
	.dw 0x0d,0x0a
.code
LM38:
	R1=48	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,122,',0,0
	.dd LM39-_main
	.dw 0x0d,0x0a
.code
LM39:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,123,',0,0
	.dd LM40-_main
	.dw 0x0d,0x0a
.code
LM40:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,124,',0,0
	.dd LM41-_main
	.dw 0x0d,0x0a
.code
LM41:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,125,',0,0
	.dd LM42-_main
	.dw 0x0d,0x0a
.code
LM42:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,126,',0,0
	.dd LM43-_main
	.dw 0x0d,0x0a
.code
LM43:
	R1=48	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,127,',0,0
	.dd LM44-_main
	.dw 0x0d,0x0a
.code
LM44:
	R1=[_DispTbl+9]	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,128,',0,0
	.dd LM45-_main
	.dw 0x0d,0x0a
.code
LM45:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,129,',0,0
	.dd LM46-_main
	.dw 0x0d,0x0a
.code
LM46:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,130,',0,0
	.dd LM47-_main
	.dw 0x0d,0x0a
.code
LM47:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,132,',0,0
	.dd LM48-_main
	.dw 0x0d,0x0a
.code
LM48:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,133,',0,0
	.dd LM49-_main
	.dw 0x0d,0x0a
.code
LM49:
	R1=64	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,134,',0,0
	.dd LM50-_main
	.dw 0x0d,0x0a
.code
LM50:
	R1=192	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,135,',0,0
	.dd LM51-_main
	.dw 0x0d,0x0a
.code
LM51:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,136,',0,0
	.dd LM52-_main
	.dw 0x0d,0x0a
.code
LM52:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,137,',0,0
	.dd LM53-_main
	.dw 0x0d,0x0a
.code
LM53:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,138,',0,0
	.dd LM54-_main
	.dw 0x0d,0x0a
.code
LM54:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,139,',0,0
	.dd LM55-_main
	.dw 0x0d,0x0a
.code
LM55:
	R1=3	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,140,',0,0
	.dd LM56-_main
	.dw 0x0d,0x0a
.code
LM56:
	R1=[_DispTbl+9]	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,141,',0,0
	.dd LM57-_main
	.dw 0x0d,0x0a
.code
LM57:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,142,',0,0
	.dd LM58-_main
	.dw 0x0d,0x0a
.code
LM58:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,143,',0,0
	.dd LM59-_main
	.dw 0x0d,0x0a
.code
LM59:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,145,',0,0
	.dd LM60-_main
	.dw 0x0d,0x0a
.code
LM60:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,146,',0,0
	.dd LM61-_main
	.dw 0x0d,0x0a
.code
LM61:
	R1=64	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,147,',0,0
	.dd LM62-_main
	.dw 0x0d,0x0a
.code
LM62:
	R1=3	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,148,',0,0
	.dd LM63-_main
	.dw 0x0d,0x0a
.code
LM63:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,149,',0,0
	.dd LM64-_main
	.dw 0x0d,0x0a
.code
LM64:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,150,',0,0
	.dd LM65-_main
	.dw 0x0d,0x0a
.code
LM65:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,151,',0,0
	.dd LM66-_main
	.dw 0x0d,0x0a
.code
LM66:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,152,',0,0
	.dd LM67-_main
	.dw 0x0d,0x0a
.code
LM67:
	R1=12	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,153,',0,0
	.dd LM68-_main
	.dw 0x0d,0x0a
.code
LM68:
	R1=[_DispTbl+9]	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,154,',0,0
	.dd LM69-_main
	.dw 0x0d,0x0a
.code
LM69:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,155,',0,0
	.dd LM70-_main
	.dw 0x0d,0x0a
.code
LM70:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,156,',0,0
	.dd LM71-_main
	.dw 0x0d,0x0a
.code
LM71:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,158,',0,0
	.dd LM72-_main
	.dw 0x0d,0x0a
.code
LM72:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,159,',0,0
	.dd LM73-_main
	.dw 0x0d,0x0a
.code
LM73:
	R1=64	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,160,',0,0
	.dd LM74-_main
	.dw 0x0d,0x0a
.code
LM74:
	R1=12	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,161,',0,0
	.dd LM75-_main
	.dw 0x0d,0x0a
.code
LM75:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,162,',0,0
	.dd LM76-_main
	.dw 0x0d,0x0a
.code
LM76:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,163,',0,0
	.dd LM77-_main
	.dw 0x0d,0x0a
.code
LM77:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,164,',0,0
	.dd LM78-_main
	.dw 0x0d,0x0a
.code
LM78:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,165,',0,0
	.dd LM79-_main
	.dw 0x0d,0x0a
.code
LM79:
	R1=48	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,166,',0,0
	.dd LM80-_main
	.dw 0x0d,0x0a
.code
LM80:
	R1=[_DispTbl+9]	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,167,',0,0
	.dd LM81-_main
	.dw 0x0d,0x0a
.code
LM81:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,168,',0,0
	.dd LM82-_main
	.dw 0x0d,0x0a
.code
LM82:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,169,',0,0
	.dd LM83-_main
	.dw 0x0d,0x0a
.code
LM83:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,171,',0,0
	.dd LM84-_main
	.dw 0x0d,0x0a
.code
LM84:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,172,',0,0
	.dd LM85-_main
	.dw 0x0d,0x0a
.code
LM85:
	R1=64	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,173,',0,0
	.dd LM86-_main
	.dw 0x0d,0x0a
.code
LM86:
	R1=48	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,174,',0,0
	.dd LM87-_main
	.dw 0x0d,0x0a
.code
LM87:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,175,',0,0
	.dd LM88-_main
	.dw 0x0d,0x0a
.code
LM88:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,176,',0,0
	.dd LM89-_main
	.dw 0x0d,0x0a
.code
LM89:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,177,',0,0
	.dd LM90-_main
	.dw 0x0d,0x0a
.code
LM90:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,178,',0,0
	.dd LM91-_main
	.dw 0x0d,0x0a
.code
LM91:
	R1=3	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,179,',0,0
	.dd LM92-_main
	.dw 0x0d,0x0a
.code
LM92:
	R1=[_DispTbl+9]	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,180,',0,0
	.dd LM93-_main
	.dw 0x0d,0x0a
.code
LM93:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,181,',0,0
	.dd LM94-_main
	.dw 0x0d,0x0a
.code
LM94:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,182,',0,0
	.dd LM95-_main
	.dw 0x0d,0x0a
.code
LM95:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,184,',0,0
	.dd LM96-_main
	.dw 0x0d,0x0a
.code
LM96:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,185,',0,0
	.dd LM97-_main
	.dw 0x0d,0x0a
.code
LM97:
	R1=64	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,186,',0,0
	.dd LM98-_main
	.dw 0x0d,0x0a
.code
LM98:
	R1=192	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,187,',0,0
	.dd LM99-_main
	.dw 0x0d,0x0a
.code
LM99:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,188,',0,0
	.dd LM100-_main
	.dw 0x0d,0x0a
.code
LM100:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,189,',0,0
	.dd LM101-_main
	.dw 0x0d,0x0a
.code
LM101:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,190,',0,0
	.dd LM102-_main
	.dw 0x0d,0x0a
.code
LM102:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,191,',0,0
	.dd LM103-_main
	.dw 0x0d,0x0a
.code
LM103:
	R1=12	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,192,',0,0
	.dd LM104-_main
	.dw 0x0d,0x0a
.code
LM104:
	R1=[_DispTbl+9]	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,193,',0,0
	.dd LM105-_main
	.dw 0x0d,0x0a
.code
LM105:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,194,',0,0
	.dd LM106-_main
	.dw 0x0d,0x0a
.code
LM106:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,195,',0,0
	.dd LM107-_main
	.dw 0x0d,0x0a
.code
LM107:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,197,',0,0
	.dd LM108-_main
	.dw 0x0d,0x0a
.code
LM108:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,198,',0,0
	.dd LM109-_main
	.dw 0x0d,0x0a
.code
LM109:
	R1=64	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,199,',0,0
	.dd LM110-_main
	.dw 0x0d,0x0a
.code
LM110:
	R1=3	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,200,',0,0
	.dd LM111-_main
	.dw 0x0d,0x0a
.code
LM111:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,201,',0,0
	.dd LM112-_main
	.dw 0x0d,0x0a
.code
LM112:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,202,',0,0
	.dd LM113-_main
	.dw 0x0d,0x0a
.code
LM113:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,203,',0,0
	.dd LM114-_main
	.dw 0x0d,0x0a
.code
LM114:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,204,',0,0
	.dd LM115-_main
	.dw 0x0d,0x0a
.code
LM115:
	R1=48	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,205,',0,0
	.dd LM116-_main
	.dw 0x0d,0x0a
.code
LM116:
	R1=[_DispTbl+9]	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,206,',0,0
	.dd LM117-_main
	.dw 0x0d,0x0a
.code
LM117:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,207,',0,0
	.dd LM118-_main
	.dw 0x0d,0x0a
.code
LM118:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,208,',0,0
	.dd LM119-_main
	.dw 0x0d,0x0a
.code
LM119:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,210,',0,0
	.dd LM120-_main
	.dw 0x0d,0x0a
.code
LM120:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,211,',0,0
	.dd LM121-_main
	.dw 0x0d,0x0a
.code
LM121:
	R1=64	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,212,',0,0
	.dd LM122-_main
	.dw 0x0d,0x0a
.code
LM122:
	R1=12	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,213,',0,0
	.dd LM123-_main
	.dw 0x0d,0x0a
.code
LM123:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,214,',0,0
	.dd LM124-_main
	.dw 0x0d,0x0a
.code
LM124:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,215,',0,0
	.dd LM125-_main
	.dw 0x0d,0x0a
.code
LM125:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,216,',0,0
	.dd LM126-_main
	.dw 0x0d,0x0a
.code
LM126:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,217,',0,0
	.dd LM127-_main
	.dw 0x0d,0x0a
.code
LM127:
	R1=3	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,218,',0,0
	.dd LM128-_main
	.dw 0x0d,0x0a
.code
LM128:
	R1=[_DispTbl+9]	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,219,',0,0
	.dd LM129-_main
	.dw 0x0d,0x0a
.code
LM129:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,220,',0,0
	.dd LM130-_main
	.dw 0x0d,0x0a
.code
LM130:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,221,',0,0
	.dd LM131-_main
	.dw 0x0d,0x0a
.code
LM131:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,223,',0,0
	.dd LM132-_main
	.dw 0x0d,0x0a
.code
LM132:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,224,',0,0
	.dd LM133-_main
	.dw 0x0d,0x0a
.code
LM133:
	R1=64	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,225,',0,0
	.dd LM134-_main
	.dw 0x0d,0x0a
.code
LM134:
	R1=48	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,226,',0,0
	.dd LM135-_main
	.dw 0x0d,0x0a
.code
LM135:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,227,',0,0
	.dd LM136-_main
	.dw 0x0d,0x0a
.code
LM136:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,228,',0,0
	.dd LM137-_main
	.dw 0x0d,0x0a
.code
LM137:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,229,',0,0
	.dd LM138-_main
	.dw 0x0d,0x0a
.code
LM138:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,230,',0,0
	.dd LM139-_main
	.dw 0x0d,0x0a
.code
LM139:
	R1=12	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,231,',0,0
	.dd LM140-_main
	.dw 0x0d,0x0a
.code
LM140:
	R1=[_DispTbl+9]	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,232,',0,0
	.dd LM141-_main
	.dw 0x0d,0x0a
.code
LM141:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,233,',0,0
	.dd LM142-_main
	.dw 0x0d,0x0a
.code
LM142:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,234,',0,0
	.dd LM143-_main
	.dw 0x0d,0x0a
.code
LM143:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,236,',0,0
	.dd LM144-_main
	.dw 0x0d,0x0a
.code
LM144:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,237,',0,0
	.dd LM145-_main
	.dw 0x0d,0x0a
.code
LM145:
	R1=64	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,238,',0,0
	.dd LM146-_main
	.dw 0x0d,0x0a
.code
LM146:
	R1=192	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,239,',0,0
	.dd LM147-_main
	.dw 0x0d,0x0a
.code
LM147:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,240,',0,0
	.dd LM148-_main
	.dw 0x0d,0x0a
.code
LM148:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,241,',0,0
	.dd LM149-_main
	.dw 0x0d,0x0a
.code
LM149:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,242,',0,0
	.dd LM150-_main
	.dw 0x0d,0x0a
.code
LM150:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,243,',0,0
	.dd LM151-_main
	.dw 0x0d,0x0a
.code
LM151:
	R1=48	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,244,',0,0
	.dd LM152-_main
	.dw 0x0d,0x0a
.code
LM152:
	R1=[_DispTbl+9]	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,245,',0,0
	.dd LM153-_main
	.dw 0x0d,0x0a
.code
LM153:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,246,',0,0
	.dd LM154-_main
	.dw 0x0d,0x0a
.code
LM154:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,247,',0,0
	.dd LM155-_main
	.dw 0x0d,0x0a
.code
LM155:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,250,',0,0
	.dd LM156-_main
	.dw 0x0d,0x0a
.code
LM156:
	R1=BP	// QImode move
	R2=BP+2
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L6:
	R1=BP	// QImode move
	R2=BP+2
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,0	// QImode test
	JG L18	// QImode LE
	PC=L9
L18:
	pc=L7	// Indirect jump
L9:
.debug
	.dw '.stabn 0x44,0,252,',0,0
	.dd LM157-_main
	.dw 0x0d,0x0a
.code
LM157:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,253,',0,0
	.dd LM158-_main
	.dw 0x0d,0x0a
.code
LM158:
	R1=64	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,254,',0,0
	.dd LM159-_main
	.dw 0x0d,0x0a
.code
LM159:
	R1=15	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,255,',0,0
	.dd LM160-_main
	.dw 0x0d,0x0a
.code
LM160:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,256,',0,0
	.dd LM161-_main
	.dw 0x0d,0x0a
.code
LM161:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,257,',0,0
	.dd LM162-_main
	.dw 0x0d,0x0a
.code
LM162:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,259,',0,0
	.dd LM163-_main
	.dw 0x0d,0x0a
.code
LM163:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,260,',0,0
	.dd LM164-_main
	.dw 0x0d,0x0a
.code
LM164:
	R1=56	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,261,',0,0
	.dd LM165-_main
	.dw 0x0d,0x0a
.code
LM165:
	R1=[_DispTbl+9]	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,262,',0,0
	.dd LM166-_main
	.dw 0x0d,0x0a
.code
LM166:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,263,',0,0
	.dd LM167-_main
	.dw 0x0d,0x0a
.code
LM167:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,264,',0,0
	.dd LM168-_main
	.dw 0x0d,0x0a
.code
LM168:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,266,',0,0
	.dd LM169-_main
	.dw 0x0d,0x0a
.code
LM169:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,267,',0,0
	.dd LM170-_main
	.dw 0x0d,0x0a
.code
LM170:
	R1=64	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,268,',0,0
	.dd LM171-_main
	.dw 0x0d,0x0a
.code
LM171:
	R1=240	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,269,',0,0
	.dd LM172-_main
	.dw 0x0d,0x0a
.code
LM172:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,270,',0,0
	.dd LM173-_main
	.dw 0x0d,0x0a
.code
LM173:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,271,',0,0
	.dd LM174-_main
	.dw 0x0d,0x0a
.code
LM174:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,273,',0,0
	.dd LM175-_main
	.dw 0x0d,0x0a
.code
LM175:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,274,',0,0
	.dd LM176-_main
	.dw 0x0d,0x0a
.code
LM176:
	R1=7	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,275,',0,0
	.dd LM177-_main
	.dw 0x0d,0x0a
.code
LM177:
	R1=[_DispTbl+9]	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,276,',0,0
	.dd LM178-_main
	.dw 0x0d,0x0a
.code
LM178:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,277,',0,0
	.dd LM179-_main
	.dw 0x0d,0x0a
.code
LM179:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,278,',0,0
	.dd LM180-_main
	.dw 0x0d,0x0a
.code
LM180:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,250,',0,0
	.dd LM181-_main
	.dw 0x0d,0x0a
.code
LM181:
L8:
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
	pc=L6	// Indirect jump
L7:
.debug
	.dw '.stabn 0x44,0,281,',0,0
	.dd LM182-_main
	.dw 0x0d,0x0a
.code
LM182:
	R1=BP	// QImode move
	R2=BP+2
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L10:
	R1=BP	// QImode move
	R2=BP+2
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,0	// QImode test
	JG L19	// QImode LE
	PC=L13
L19:
	pc=L11	// Indirect jump
L13:
.debug
	.dw '.stabn 0x44,0,283,',0,0
	.dd LM183-_main
	.dw 0x0d,0x0a
.code
LM183:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,284,',0,0
	.dd LM184-_main
	.dw 0x0d,0x0a
.code
LM184:
	R1=64	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,285,',0,0
	.dd LM185-_main
	.dw 0x0d,0x0a
.code
LM185:
	R1=15	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,286,',0,0
	.dd LM186-_main
	.dw 0x0d,0x0a
.code
LM186:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,287,',0,0
	.dd LM187-_main
	.dw 0x0d,0x0a
.code
LM187:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,288,',0,0
	.dd LM188-_main
	.dw 0x0d,0x0a
.code
LM188:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,290,',0,0
	.dd LM189-_main
	.dw 0x0d,0x0a
.code
LM189:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,291,',0,0
	.dd LM190-_main
	.dw 0x0d,0x0a
.code
LM190:
	R1=7	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,292,',0,0
	.dd LM191-_main
	.dw 0x0d,0x0a
.code
LM191:
	R1=[_DispTbl+9]	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,293,',0,0
	.dd LM192-_main
	.dw 0x0d,0x0a
.code
LM192:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,294,',0,0
	.dd LM193-_main
	.dw 0x0d,0x0a
.code
LM193:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,295,',0,0
	.dd LM194-_main
	.dw 0x0d,0x0a
.code
LM194:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,297,',0,0
	.dd LM195-_main
	.dw 0x0d,0x0a
.code
LM195:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,298,',0,0
	.dd LM196-_main
	.dw 0x0d,0x0a
.code
LM196:
	R1=64	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,299,',0,0
	.dd LM197-_main
	.dw 0x0d,0x0a
.code
LM197:
	R1=240	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,300,',0,0
	.dd LM198-_main
	.dw 0x0d,0x0a
.code
LM198:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,301,',0,0
	.dd LM199-_main
	.dw 0x0d,0x0a
.code
LM199:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,302,',0,0
	.dd LM200-_main
	.dw 0x0d,0x0a
.code
LM200:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,304,',0,0
	.dd LM201-_main
	.dw 0x0d,0x0a
.code
LM201:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,305,',0,0
	.dd LM202-_main
	.dw 0x0d,0x0a
.code
LM202:
	R1=56	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,306,',0,0
	.dd LM203-_main
	.dw 0x0d,0x0a
.code
LM203:
	R1=[_DispTbl+9]	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,307,',0,0
	.dd LM204-_main
	.dw 0x0d,0x0a
.code
LM204:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,308,',0,0
	.dd LM205-_main
	.dw 0x0d,0x0a
.code
LM205:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,309,',0,0
	.dd LM206-_main
	.dw 0x0d,0x0a
.code
LM206:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,281,',0,0
	.dd LM207-_main
	.dw 0x0d,0x0a
.code
LM207:
L12:
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
	pc=L10	// Indirect jump
L11:
.debug
	.dw '.stabn 0x44,0,312,',0,0
	.dd LM208-_main
	.dw 0x0d,0x0a
.code
LM208:
	R1=BP	// QImode move
	R2=BP+2
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L14:
	R1=BP	// QImode move
	R2=BP+2
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,1	// QImode compare
	JG L20	// QImode LE
	PC=L17
L20:
	pc=L15	// Indirect jump
L17:
.debug
	.dw '.stabn 0x44,0,314,',0,0
	.dd LM209-_main
	.dw 0x0d,0x0a
.code
LM209:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,315,',0,0
	.dd LM210-_main
	.dw 0x0d,0x0a
.code
LM210:
	R1=64	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,316,',0,0
	.dd LM211-_main
	.dw 0x0d,0x0a
.code
LM211:
	R1=255	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,318,',0,0
	.dd LM212-_main
	.dw 0x0d,0x0a
.code
LM212:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,319,',0,0
	.dd LM213-_main
	.dw 0x0d,0x0a
.code
LM213:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,320,',0,0
	.dd LM214-_main
	.dw 0x0d,0x0a
.code
LM214:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,322,',0,0
	.dd LM215-_main
	.dw 0x0d,0x0a
.code
LM215:
	R1=0	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,323,',0,0
	.dd LM216-_main
	.dw 0x0d,0x0a
.code
LM216:
	R1=63	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,324,',0,0
	.dd LM217-_main
	.dw 0x0d,0x0a
.code
LM217:
	R1=[_DispTbl+9]	// QImode move
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,325,',0,0
	.dd LM218-_main
	.dw 0x0d,0x0a
.code
LM218:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,326,',0,0
	.dd LM219-_main
	.dw 0x0d,0x0a
.code
LM219:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,327,',0,0
	.dd LM220-_main
	.dw 0x0d,0x0a
.code
LM220:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,312,',0,0
	.dd LM221-_main
	.dw 0x0d,0x0a
.code
LM221:
L16:
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
	pc=L14	// Indirect jump
L15:
.debug
	.dw '.stabn 0x44,0,333,',0,0
	.dd LM222-_main
	.dw 0x0d,0x0a
.code
LM222:
LBE3:
	pc=L3	// Indirect jump
L4:
.debug
	.dw '.stabn 0x44,0,335,',0,0
	.dd LM223-_main
	.dw 0x0d,0x0a
.code
LM223:
LBE2:
.debug
	.dw '.stabn 0x44,0,335,',0,0
	.dd LM224-_main
	.dw 0x0d,0x0a
.code
LM224:
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
	.dw '.stabs "Loop_Numb:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "Led_Numb:1",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "i:1",128,0,0,2',0x0d,0x0a
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
.code
.debug
	.dw '.stabs "Delay:F1",36,0,0,',0,0,offset _Delay,seg _Delay,0x0d,0x0a
.CODE
.public _Delay
_Delay:	.proc
.debug
	.dw '.stabn 0x44,0,343,',0,0
	.dd LM225-_Delay
	.dw 0x0d,0x0a
.code
LM225:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
.debug
	.dw '.stabn 0x44,0,344,',0,0
	.dd LM226-_Delay
	.dw 0x0d,0x0a
.code
LM226:
LBB4:
	R2=0	// QImode move
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,346,',0,0
	.dd LM227-_Delay
	.dw 0x0d,0x0a
.code
LM227:
	R2=0	// QImode move
	[BP]=R2	// QImode move
L22:
	R2=[BP]	// QImode move
	CMP R2,4095	// QImode compare
	JG L26	// QImode LE
	PC=L25
L26:
	pc=L23	// Indirect jump
L25:
.debug
	.dw '.stabn 0x44,0,347,',0,0
	.dd LM228-_Delay
	.dw 0x0d,0x0a
.code
LM228:
	R2=1	// QImode move
	[28690]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,346,',0,0
	.dd LM229-_Delay
	.dw 0x0d,0x0a
.code
LM229:
L24:
	R2=[BP]	// QImode move
	R3=R2+1
	[BP]=R3	// QImode move
	pc=L22	// Indirect jump
L23:
.debug
	.dw '.stabn 0x44,0,348,',0,0
	.dd LM230-_Delay
	.dw 0x0d,0x0a
.code
LM230:
LBE4:
.debug
	.dw '.stabn 0x44,0,348,',0,0
	.dd LM231-_Delay
	.dw 0x0d,0x0a
.code
LM231:
L21:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of Delay

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB4-_Delay
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "DelayValue:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE4-_Delay
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
	.dw '.stabn 0x44,0,356,',0,0
	.dd LM232-_Led_Disp
	.dw 0x0d,0x0a
.code
LM232:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,357,',0,0
	.dd LM233-_Led_Disp
	.dw 0x0d,0x0a
.code
LM233:
	R1=64	// QImode move
	[28677]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,358,',0,0
	.dd LM234-_Led_Disp
	.dw 0x0d,0x0a
.code
LM234:
	R1=[_LedControl]	// QImode move
	R3=[BP]	// QImode move
	R2=[R3]	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __lshiu1	// call with return value
	SP=SP+2
	[28672]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,359,',0,0
	.dd LM235-_Led_Disp
	.dw 0x0d,0x0a
.code
LM235:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,361,',0,0
	.dd LM236-_Led_Disp
	.dw 0x0d,0x0a
.code
LM236:
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
	.dw '.stabn 0x44,0,362,',0,0
	.dd LM237-_Led_Disp
	.dw 0x0d,0x0a
.code
LM237:
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
	.dw '.stabn 0x44,0,363,',0,0
	.dd LM238-_Led_Disp
	.dw 0x0d,0x0a
.code
LM238:
	call _Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,364,',0,0
	.dd LM239-_Led_Disp
	.dw 0x0d,0x0a
.code
LM239:
.debug
	.dw '.stabn 0x44,0,364,',0,0
	.dd LM240-_Led_Disp
	.dw 0x0d,0x0a
.code
LM240:
L27:

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
