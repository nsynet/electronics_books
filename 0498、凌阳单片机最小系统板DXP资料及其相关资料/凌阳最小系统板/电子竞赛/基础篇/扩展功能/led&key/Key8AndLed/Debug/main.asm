// GCC for SUNPLUS u'nSP version 1.0.10
// Command: D:\PROGRA~1\Sunplus\UNSPID~2\IDE180\cc1.exe D:\DOCUME~1\³ÂÐ¢±ò\LOCALS~1\Temp\ccwzaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\DXJH\\e_design\\LED&KEY\\Key8AndLed/", 0x64, 0, 3, Ltext0
.stabs "F:/DXJH/e_design/LED&KEY/Key8AndLed/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabn 0x44,0,34,',0,0
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
	.dw '.stabn 0x44,0,35,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	R1=0	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,36,',0,0
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
	.dw '.stabn 0x44,0,37,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	call _F_System_Initial	// call without return value
.debug
	.dw '.stabn 0x44,0,38,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
L3:
	pc=L5	// jump
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,40,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	call _F_GetKeyValue	// call with return value
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R1=[BP]	// QImode move
	CMP R1,0	// QImode test
	JNZ L21	// QImode EQ
	PC=L6
L21:
.debug
	.dw '.stabn 0x44,0,43,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	R1=[BP]	// QImode move
	CMP R1,8	// QImode compare
	JNZ L22	// QImode EQ
	PC=L11
L22:
	CMP R1,8	// QImode compare
	JNA L23	// QImode GTU
	PC=L18
L23:
	CMP R1,2	// QImode compare
	JNZ L24	// QImode EQ
	PC=L9
L24:
	CMP R1,2	// QImode compare
	JNA L25	// QImode GTU
	PC=L19
L25:
	CMP R1,1	// QImode compare
	JNZ L26	// QImode EQ
	PC=L8
L26:
	pc=L16	// jump
L19:
	CMP R1,4	// QImode compare
	JNZ L27	// QImode EQ
	PC=L10
L27:
	pc=L16	// jump
L18:
	CMP R1,32	// QImode compare
	JNZ L28	// QImode EQ
	PC=L13
L28:
	CMP R1,32	// QImode compare
	JNA L29	// QImode GTU
	PC=L20
L29:
	CMP R1,16	// QImode compare
	JNZ L30	// QImode EQ
	PC=L12
L30:
	pc=L16	// jump
L20:
	CMP R1,64	// QImode compare
	JNZ L31	// QImode EQ
	PC=L14
L31:
	CMP R1,128	// QImode compare
	JNZ L32	// QImode EQ
	PC=L15
L32:
	pc=L16	// jump
L8:
.debug
	.dw '.stabn 0x44,0,46,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
	R1=BP	// QImode move
	R2=BP+1
	R1=1	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _F_LED_On	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,48,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	pc=L6	// jump
L9:
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	R1=BP	// QImode move
	R2=BP+1
	R1=2	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,51,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _F_LED_On	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,52,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	pc=L6	// jump
L10:
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	R1=BP	// QImode move
	R2=BP+1
	R1=4	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,55,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _F_LED_On	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
	pc=L6	// jump
L11:
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
	R1=BP	// QImode move
	R2=BP+1
	R1=8	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,59,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _F_LED_On	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM20-_main
	.dw 0x0d,0x0a
.code
LM20:
	pc=L6	// jump
L12:
.debug
	.dw '.stabn 0x44,0,62,',0,0
	.dd LM21-_main
	.dw 0x0d,0x0a
.code
LM21:
	R1=BP	// QImode move
	R2=BP+1
	R1=16	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,63,',0,0
	.dd LM22-_main
	.dw 0x0d,0x0a
.code
LM22:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _F_LED_On	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,64,',0,0
	.dd LM23-_main
	.dw 0x0d,0x0a
.code
LM23:
	pc=L6	// jump
L13:
.debug
	.dw '.stabn 0x44,0,66,',0,0
	.dd LM24-_main
	.dw 0x0d,0x0a
.code
LM24:
	R1=BP	// QImode move
	R2=BP+1
	R1=32	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,67,',0,0
	.dd LM25-_main
	.dw 0x0d,0x0a
.code
LM25:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _F_LED_On	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,68,',0,0
	.dd LM26-_main
	.dw 0x0d,0x0a
.code
LM26:
	pc=L6	// jump
L14:
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM27-_main
	.dw 0x0d,0x0a
.code
LM27:
	R1=BP	// QImode move
	R2=BP+1
	R1=64	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,71,',0,0
	.dd LM28-_main
	.dw 0x0d,0x0a
.code
LM28:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _F_LED_On	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM29-_main
	.dw 0x0d,0x0a
.code
LM29:
	pc=L6	// jump
L15:
.debug
	.dw '.stabn 0x44,0,74,',0,0
	.dd LM30-_main
	.dw 0x0d,0x0a
.code
LM30:
	R1=BP	// QImode move
	R2=BP+1
	R1=128	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM31-_main
	.dw 0x0d,0x0a
.code
LM31:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _F_LED_On	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,76,',0,0
	.dd LM32-_main
	.dw 0x0d,0x0a
.code
LM32:
	pc=L6	// jump
L16:
.debug
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM33-_main
	.dw 0x0d,0x0a
.code
LM33:
	R1=0	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,79,',0,0
	.dd LM34-_main
	.dw 0x0d,0x0a
.code
LM34:
	pc=L6	// jump
L7:
L6:
.debug
	.dw '.stabn 0x44,0,83,',0,0
	.dd LM35-_main
	.dw 0x0d,0x0a
.code
LM35:
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,84,',0,0
	.dd LM36-_main
	.dw 0x0d,0x0a
.code
LM36:
LBE2:
.debug
	.dw '.stabn 0x44,0,84,',0,0
	.dd LM37-_main
	.dw 0x0d,0x0a
.code
LM37:
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
	.dw '.stabs "uiKeyValue:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "uiLedStatusValue:4",128,0,0,1',0x0d,0x0a
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
.external _F_LED_On
.external _F_GetKeyValue
.external _F_System_Initial
	.end
