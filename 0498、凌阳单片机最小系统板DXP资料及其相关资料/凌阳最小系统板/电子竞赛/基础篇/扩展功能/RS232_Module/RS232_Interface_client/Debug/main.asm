// GCC for SUNPLUS u'nSP version 1.0.10
// Command: D:\PROGRA~1\Sunplus\UNSPID~2\IDE180\cc1.exe D:\DOCUME~1\³ÂÐ¢±ò\LOCALS~1\Temp\ccwBaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\DXJH\\e_design\\RS232_module\\RS232_Module\\RS232_Interface_client/", 0x64, 0, 3, Ltext0
.stabs "F:/DXJH/e_design/RS232_module/RS232_Module/RS232_Interface_client/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabn 0x44,0,33,',0,0
	.dd LM1-_main
	.dw 0x0d,0x0a
.code
LM1:
	// total=2, vars=2
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=2
	bp=sp+1

	R1=BP+5
	[bp+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,34,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	R1=0	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,35,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	call _F_System_Initial	// call with return value
.debug
	.dw '.stabn 0x44,0,36,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	call _F_UART_Initial	// call with return value
.debug
	.dw '.stabn 0x44,0,37,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
L3:
	pc=L5	// jump
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,39,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	call _F_UART_Read	// call with return value
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,40,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R1=[BP]	// QImode move
	CMP R1,17	// QImode compare
	JNZ L14	// QImode EQ
	PC=L8
L14:
	CMP R1,17	// QImode compare
	JNA L15	// QImode GTU
	PC=L13
L15:
	CMP R1,0	// QImode test
	JNZ L16	// QImode EQ
	PC=L7
L16:
	pc=L11	// jump
L13:
	CMP R1,34	// QImode compare
	JNZ L17	// QImode EQ
	PC=L9
L17:
	CMP R1,68	// QImode compare
	JNZ L18	// QImode EQ
	PC=L10
L18:
	pc=L11	// jump
L7:
.debug
	.dw '.stabn 0x44,0,43,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	pc=L6	// jump
L8:
.debug
	.dw '.stabn 0x44,0,45,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
	R1=(-2)	// QImode move
	[SP--]=R1	// QImode move
	call _F_LED_On	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,46,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	pc=L6	// jump
L9:
.debug
	.dw '.stabn 0x44,0,48,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	R1=(-3)	// QImode move
	[SP--]=R1	// QImode move
	call _F_LED_On	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,49,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	pc=L6	// jump
L10:
.debug
	.dw '.stabn 0x44,0,51,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	R1=(-5)	// QImode move
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
L11:
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	pc=L6	// jump
L6:
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
LBE2:
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
L2:

	sp+=2
	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "uiUARTCommand:4",128,0,0,0',0x0d,0x0a
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
.external _F_UART_Read
.external _F_UART_Initial
.external _F_System_Initial
	.end
