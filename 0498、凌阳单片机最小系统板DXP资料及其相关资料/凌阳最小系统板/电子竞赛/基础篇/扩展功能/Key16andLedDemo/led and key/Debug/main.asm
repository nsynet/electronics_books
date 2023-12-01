// GCC for SUNPLUS u'nSP version 1.0.10
// Command: D:\PROGRA~1\Sunplus\UNSPID~1\IDE180\cc1.exe D:\DOCUME~1\刘新颜\LOCALS~1\Temp\ccmcbaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\功能扩展\\Key16angLedDemo\\led and key/", 0x64, 0, 3, Ltext0
.stabs "F:/功能扩展/Key16angLedDemo/led and key/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "KeyFind:F19",36,0,0,',0,0,offset _KeyFind,seg _KeyFind,0x0d,0x0a
.CODE
.public _KeyFind
_KeyFind:	.proc
.debug
	.dw '.stabn 0x44,0,5,',0,0
	.dd LM1-_KeyFind
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
	.dw '.stabn 0x44,0,6,',0,0
	.dd LM2-_KeyFind
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	R1=0	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,8,',0,0
	.dd LM3-_KeyFind
	.dw 0x0d,0x0a
.code
LM3:
	call _key_asm	// call with return value
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,9,',0,0
	.dd LM4-_KeyFind
	.dw 0x0d,0x0a
.code
LM4:
	call _key_asm1	// call with return value
	R2=BP	// QImode move
	R3=BP+1
	R2=R3	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,10,',0,0
	.dd LM5-_KeyFind
	.dw 0x0d,0x0a
.code
LM5:
	R1=15	// QImode move
	[_uiValue]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,11,',0,0
	.dd LM6-_KeyFind
	.dw 0x0d,0x0a
.code
LM6:
	R1=[BP]	// QImode move
	R2=R1&[_uiValue]
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,12,',0,0
	.dd LM7-_KeyFind
	.dw 0x0d,0x0a
.code
LM7:
	R1=240	// QImode move
	[_uiValue]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,13,',0,0
	.dd LM8-_KeyFind
	.dw 0x0d,0x0a
.code
LM8:
	R2=BP	// QImode move
	R1=BP+1
	R3=BP	// QImode move
	R2=BP+1
	R4=[_uiValue]	// QImode move
	R3=R4	// QImode move
	R4=R2	// QImode move
	R3&=[R4]	// andqi3_r0R
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,14,',0,0
	.dd LM9-_KeyFind
	.dw 0x0d,0x0a
.code
LM9:
	R2=BP	// QImode move
	R1=BP+1
	R3=[BP]	// QImode move
	R2=R3	// QImode move
	R3=R1	// QImode move
	R2|=[R3]	// iorqi3_r0R
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,15,',0,0
	.dd LM10-_KeyFind
	.dw 0x0d,0x0a
.code
LM10:
	R1=255	// QImode move
	[_uiValue]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,16,',0,0
	.dd LM11-_KeyFind
	.dw 0x0d,0x0a
.code
LM11:
	R1=[BP]	// QImode move
	R2=R1^[_uiValue]
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,17,',0,0
	.dd LM12-_KeyFind
	.dw 0x0d,0x0a
.code
LM12:
	call _ClearWatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,18,',0,0
	.dd LM13-_KeyFind
	.dw 0x0d,0x0a
.code
LM13:
	R1=[BP]	// QImode move
	CMP R1,190	// QImode compare
	JNZ L32	// QImode EQ
	PC=L7
L32:
	CMP R1,190	// QImode compare
	JNG L33	// QImode GT
	PC=L23
L33:
	CMP R1,125	// QImode compare
	JNZ L34	// QImode EQ
	PC=L12
L34:
	CMP R1,125	// QImode compare
	JNG L35	// QImode GT
	PC=L24
L35:
	CMP R1,119	// QImode compare
	JNZ L36	// QImode EQ
	PC=L20
L36:
	CMP R1,119	// QImode compare
	JNG L37	// QImode GT
	PC=L25
L37:
	CMP R1,0	// QImode test
	JNZ L38	// QImode EQ
	PC=L4
L38:
	pc=L3	// jump
L25:
	CMP R1,123	// QImode compare
	JNZ L39	// QImode EQ
	PC=L16
L39:
	pc=L3	// jump
L24:
	CMP R1,183	// QImode compare
	JNZ L40	// QImode EQ
	PC=L19
L40:
	CMP R1,183	// QImode compare
	JNG L41	// QImode GT
	PC=L26
L41:
	CMP R1,126	// QImode compare
	JNZ L42	// QImode EQ
	PC=L8
L42:
	pc=L3	// jump
L26:
	CMP R1,187	// QImode compare
	JNZ L43	// QImode EQ
	PC=L15
L43:
	CMP R1,189	// QImode compare
	JNZ L44	// QImode EQ
	PC=L11
L44:
	pc=L3	// jump
L23:
	CMP R1,222	// QImode compare
	JNZ L45	// QImode EQ
	PC=L6
L45:
	CMP R1,222	// QImode compare
	JNG L46	// QImode GT
	PC=L27
L46:
	CMP R1,219	// QImode compare
	JNZ L47	// QImode EQ
	PC=L14
L47:
	CMP R1,219	// QImode compare
	JNG L48	// QImode GT
	PC=L28
L48:
	CMP R1,215	// QImode compare
	JNZ L49	// QImode EQ
	PC=L18
L49:
	pc=L3	// jump
L28:
	CMP R1,221	// QImode compare
	JNZ L50	// QImode EQ
	PC=L10
L50:
	pc=L3	// jump
L27:
	CMP R1,235	// QImode compare
	JNZ L51	// QImode EQ
	PC=L13
L51:
	CMP R1,235	// QImode compare
	JNG L52	// QImode GT
	PC=L29
L52:
	CMP R1,231	// QImode compare
	JNZ L53	// QImode EQ
	PC=L17
L53:
	pc=L3	// jump
L29:
	CMP R1,237	// QImode compare
	JNZ L54	// QImode EQ
	PC=L9
L54:
	CMP R1,238	// QImode compare
	JNZ L55	// QImode EQ
	PC=L5
L55:
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,21,',0,0
	.dd LM14-_KeyFind
	.dw 0x0d,0x0a
.code
LM14:
	pc=L3	// jump
L5:
.debug
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM15-_KeyFind
	.dw 0x0d,0x0a
.code
LM15:
	R1=0	// QImode move
	[_uiValue]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,24,',0,0
	.dd LM16-_KeyFind
	.dw 0x0d,0x0a
.code
LM16:
	pc=L3	// jump
L6:
.debug
	.dw '.stabn 0x44,0,26,',0,0
	.dd LM17-_KeyFind
	.dw 0x0d,0x0a
.code
LM17:
	R1=1	// QImode move
	[_uiValue]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM18-_KeyFind
	.dw 0x0d,0x0a
.code
LM18:
	pc=L3	// jump
L7:
.debug
	.dw '.stabn 0x44,0,29,',0,0
	.dd LM19-_KeyFind
	.dw 0x0d,0x0a
.code
LM19:
	R1=2	// QImode move
	[_uiValue]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,30,',0,0
	.dd LM20-_KeyFind
	.dw 0x0d,0x0a
.code
LM20:
	pc=L3	// jump
L8:
.debug
	.dw '.stabn 0x44,0,32,',0,0
	.dd LM21-_KeyFind
	.dw 0x0d,0x0a
.code
LM21:
	R1=3	// QImode move
	[_uiValue]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,33,',0,0
	.dd LM22-_KeyFind
	.dw 0x0d,0x0a
.code
LM22:
	pc=L3	// jump
L9:
.debug
	.dw '.stabn 0x44,0,35,',0,0
	.dd LM23-_KeyFind
	.dw 0x0d,0x0a
.code
LM23:
	R1=4	// QImode move
	[_uiValue]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,36,',0,0
	.dd LM24-_KeyFind
	.dw 0x0d,0x0a
.code
LM24:
	pc=L3	// jump
L10:
.debug
	.dw '.stabn 0x44,0,38,',0,0
	.dd LM25-_KeyFind
	.dw 0x0d,0x0a
.code
LM25:
	R1=5	// QImode move
	[_uiValue]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,39,',0,0
	.dd LM26-_KeyFind
	.dw 0x0d,0x0a
.code
LM26:
	pc=L3	// jump
L11:
.debug
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM27-_KeyFind
	.dw 0x0d,0x0a
.code
LM27:
	R1=6	// QImode move
	[_uiValue]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM28-_KeyFind
	.dw 0x0d,0x0a
.code
LM28:
	pc=L3	// jump
L12:
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM29-_KeyFind
	.dw 0x0d,0x0a
.code
LM29:
	R1=7	// QImode move
	[_uiValue]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,45,',0,0
	.dd LM30-_KeyFind
	.dw 0x0d,0x0a
.code
LM30:
	pc=L3	// jump
L13:
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM31-_KeyFind
	.dw 0x0d,0x0a
.code
LM31:
	R1=8	// QImode move
	[_uiValue]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,48,',0,0
	.dd LM32-_KeyFind
	.dw 0x0d,0x0a
.code
LM32:
	pc=L3	// jump
L14:
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM33-_KeyFind
	.dw 0x0d,0x0a
.code
LM33:
	R1=9	// QImode move
	[_uiValue]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,51,',0,0
	.dd LM34-_KeyFind
	.dw 0x0d,0x0a
.code
LM34:
	pc=L3	// jump
L15:
.debug
	.dw '.stabn 0x44,0,53,',0,0
	.dd LM35-_KeyFind
	.dw 0x0d,0x0a
.code
LM35:
	R1=10	// QImode move
	[_uiValue]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM36-_KeyFind
	.dw 0x0d,0x0a
.code
LM36:
	pc=L3	// jump
L16:
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM37-_KeyFind
	.dw 0x0d,0x0a
.code
LM37:
	R1=11	// QImode move
	[_uiValue]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,57,',0,0
	.dd LM38-_KeyFind
	.dw 0x0d,0x0a
.code
LM38:
	pc=L3	// jump
L17:
.debug
	.dw '.stabn 0x44,0,59,',0,0
	.dd LM39-_KeyFind
	.dw 0x0d,0x0a
.code
LM39:
	R1=12	// QImode move
	[_uiValue]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM40-_KeyFind
	.dw 0x0d,0x0a
.code
LM40:
	pc=L3	// jump
L18:
.debug
	.dw '.stabn 0x44,0,62,',0,0
	.dd LM41-_KeyFind
	.dw 0x0d,0x0a
.code
LM41:
	R1=13	// QImode move
	[_uiValue]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,63,',0,0
	.dd LM42-_KeyFind
	.dw 0x0d,0x0a
.code
LM42:
	pc=L3	// jump
L19:
.debug
	.dw '.stabn 0x44,0,65,',0,0
	.dd LM43-_KeyFind
	.dw 0x0d,0x0a
.code
LM43:
	R1=14	// QImode move
	[_uiValue]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,66,',0,0
	.dd LM44-_KeyFind
	.dw 0x0d,0x0a
.code
LM44:
	pc=L3	// jump
L20:
.debug
	.dw '.stabn 0x44,0,68,',0,0
	.dd LM45-_KeyFind
	.dw 0x0d,0x0a
.code
LM45:
	R1=15	// QImode move
	[_uiValue]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,69,',0,0
	.dd LM46-_KeyFind
	.dw 0x0d,0x0a
.code
LM46:
	pc=L3	// jump
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM47-_KeyFind
	.dw 0x0d,0x0a
.code
LM47:
	pc=L2	// jump
L22:
L3:
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM48-_KeyFind
	.dw 0x0d,0x0a
.code
LM48:
	R1=[_uiValue]	// QImode move
	CMP R1,255	// QImode compare
	JZ L56	// QImode NE
	PC=L30
L56:
	pc=L31	// jump
L30:
.debug
	.dw '.stabn 0x44,0,73,',0,0
	.dd LM49-_KeyFind
	.dw 0x0d,0x0a
.code
LM49:
	R1=[_uiValue]	// QImode move
	[_ko]=R1	// QImode move
L31:
.debug
	.dw '.stabn 0x44,0,74,',0,0
	.dd LM50-_KeyFind
	.dw 0x0d,0x0a
.code
LM50:
LBE2:
.debug
	.dw '.stabn 0x44,0,74,',0,0
	.dd LM51-_KeyFind
	.dw 0x0d,0x0a
.code
LM51:
L2:

	sp+=3
	pop bp from [sp]
	retf
	.endp	// end of KeyFind

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_KeyFind
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "keyfirst:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "keylast:1",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE2-_KeyFind
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME1-_KeyFind
	.dw 0x0d,0x0a
.code
LME1:
.code
.debug
	.dw '.stabs "main:F1",36,0,0,',0,0,offset _main,seg _main,0x0d,0x0a
.CODE
.public _main
_main:	.proc
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM52-_main
	.dw 0x0d,0x0a
.code
LM52:
	// total=6, vars=6
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=6
	bp=sp+1

	R1=BP+9
	[bp+4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM53-_main
	.dw 0x0d,0x0a
.code
LM53:
LBB3:
.debug
	.dw '.stabn 0x44,0,79,',0,0
	.dd LM54-_main
	.dw 0x0d,0x0a
.code
LM54:
	call _Initirq5	// call with return value
L58:
.debug
	.dw '.stabn 0x44,0,82,',0,0
	.dd LM55-_main
	.dw 0x0d,0x0a
.code
LM55:
	R1=[_ko]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,83,',0,0
	.dd LM56-_main
	.dw 0x0d,0x0a
.code
LM56:
	R1=BP	// QImode move
	R2=BP+3
	[bp+5]=R2	// QImode move
	R1=[_ko]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	R3=[bp+5]	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,84,',0,0
	.dd LM57-_main
	.dw 0x0d,0x0a
.code
LM57:
	R1=BP	// QImode move
	R2=BP+3
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	JZ L61	// QImode NE
	PC=L59
L61:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
	pc=L60	// jump
L59:
.debug
	.dw '.stabn 0x44,0,85,',0,0
	.dd LM58-_main
	.dw 0x0d,0x0a
.code
LM58:
	R1=BP	// QImode move
	R2=BP+1
	R1=1	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L60:
.debug
	.dw '.stabn 0x44,0,86,',0,0
	.dd LM59-_main
	.dw 0x0d,0x0a
.code
LM59:
	R1=[BP]	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,87,',0,0
	.dd LM60-_main
	.dw 0x0d,0x0a
.code
LM60:
	call _ClearWatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,88,',0,0
	.dd LM61-_main
	.dw 0x0d,0x0a
.code
LM61:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _F_SingleLed	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,89,',0,0
	.dd LM62-_main
	.dw 0x0d,0x0a
.code
LM62:
	call _ClearWatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,90,',0,0
	.dd LM63-_main
	.dw 0x0d,0x0a
.code
LM63:
	pc=L58	// jump
.debug
	.dw '.stabn 0x44,0,92,',0,0
	.dd LM64-_main
	.dw 0x0d,0x0a
.code
LM64:
LBE3:
.debug
	.dw '.stabn 0x44,0,92,',0,0
	.dd LM65-_main
	.dw 0x0d,0x0a
.code
LM65:
L57:

	sp+=6
	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB3-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "tm0:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "tm1:1",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "i:1",128,0,0,2',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "t:1",128,0,0,3',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE3-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME2-_main
	.dw 0x0d,0x0a
.code
LME2:
.debug
	.dw '.stabs "uiValue:G4",32,0,0,',0,0,offset _uiValue,seg _uiValue,0x0d,0x0a
.CODE
.ram
.public _uiValue
_uiValue:
	.dw 0
.debug
	.dw '.stabs "ko:G4",32,0,0,',0,0,offset _ko,seg _ko,0x0d,0x0a
.CODE
.ram
.public _ko
_ko:
	.dw 0
.external _ClearWatchDog
.external _F_SingleLed
.external _Initirq5
.external _key_asm1
.external _key_asm
.external __divu1
.external __modu1
	.end
