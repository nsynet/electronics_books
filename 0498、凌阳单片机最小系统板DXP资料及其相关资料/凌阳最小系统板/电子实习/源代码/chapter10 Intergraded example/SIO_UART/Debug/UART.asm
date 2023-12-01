// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\PROGRA~1\Sunplus\UNSPID~3\IDE180\cc1.exe C:\DOCUME~1\李华丽.DOMAIN\LOCALS~1\Temp\ccIxaaaa.i -fkeep-inline-functions -quiet -dumpbase UART.c -gstabs -o .\Debug/UART.asm
// gcc2_compiled.:

.stabs "F:\\电子竞赛\\C语言应用篇\\Source Code\\chapter10 Intergraded example\\SIO_UART/", 0x64, 0, 3, Ltext0
.stabs "F:/电子竞赛/C语言应用篇/Source Code/chapter10 Intergraded example/SIO_UART/UART.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "P_UART_Command1:G20=*4",32,0,0,',0,0,offset _P_UART_Command1,seg _P_UART_Command1,0x0d,0x0a
.CODE
.public _P_UART_Command1
.iram
_P_UART_Command1:
	.dw 28705
.debug
	.dw '.stabs "P_UART_Command2:G20",32,0,0,',0,0,offset _P_UART_Command2,seg _P_UART_Command2,0x0d,0x0a
.CODE
.public _P_UART_Command2
.iram
_P_UART_Command2:
	.dw 28706
.debug
	.dw '.stabs "P_UART_Data:G20",32,0,0,',0,0,offset _P_UART_Data,seg _P_UART_Data,0x0d,0x0a
.CODE
.public _P_UART_Data
.iram
_P_UART_Data:
	.dw 28707
.debug
	.dw '.stabs "P_UART_BaudScalarLow:G20",32,0,0,',0,0,offset _P_UART_BaudScalarLow,seg _P_UART_BaudScalarLow,0x0d,0x0a
.CODE
.public _P_UART_BaudScalarLow
.iram
_P_UART_BaudScalarLow:
	.dw 28708
.debug
	.dw '.stabs "P_UART_BaudScalarHigh:G20",32,0,0,',0,0,offset _P_UART_BaudScalarHigh,seg _P_UART_BaudScalarHigh,0x0d,0x0a
.CODE
.public _P_UART_BaudScalarHigh
.iram
_P_UART_BaudScalarHigh:
	.dw 28709
.code
.debug
	.dw '.stabs "UART_Init:F19",36,0,0,',0,0,offset _UART_Init,seg _UART_Init,0x0d,0x0a
.CODE
.public _UART_Init
_UART_Init:	.proc
.debug
	.dw '.stabn 0x44,0,45,',0,0
	.dd LM1-_UART_Init
	.dw 0x0d,0x0a
.code
LM1:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
.debug
	.dw '.stabn 0x44,0,46,',0,0
	.dd LM2-_UART_Init
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM3-_UART_Init
	.dw 0x0d,0x0a
.code
LM3:
	R2=[_P_UART_Command1]	// QImode move
	R3=32	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,48,',0,0
	.dd LM4-_UART_Init
	.dw 0x0d,0x0a
.code
LM4:
	R2=[_P_UART_Command1]	// QImode move
	R3=0	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM5-_UART_Init
	.dw 0x0d,0x0a
.code
LM5:
	R2=[_P_UART_BaudScalarHigh]	// QImode move
	R3=0	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,51,',0,0
	.dd LM6-_UART_Init
	.dw 0x0d,0x0a
.code
LM6:
	R2=[_P_UART_BaudScalarLow]	// QImode move
	R3=107	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,53,',0,0
	.dd LM7-_UART_Init
	.dw 0x0d,0x0a
.code
LM7:
	R2=[_P_UART_Command1]	// QImode move
	R3=12	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM8-_UART_Init
	.dw 0x0d,0x0a
.code
LM8:
	R2=[_P_UART_Command2]	// QImode move
	R3=192	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM9-_UART_Init
	.dw 0x0d,0x0a
.code
LM9:
	R2=[_P_UART_Data]	// QImode move
	R4=R2	// QImode move
	R3=[R4]	// QImode move
	[BP]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,57,',0,0
	.dd LM10-_UART_Init
	.dw 0x0d,0x0a
.code
LM10:
LBE2:
.debug
	.dw '.stabn 0x44,0,57,',0,0
	.dd LM11-_UART_Init
	.dw 0x0d,0x0a
.code
LM11:
L2:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of UART_Init

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_UART_Init
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "a:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE2-_UART_Init
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME1-_UART_Init
	.dw 0x0d,0x0a
.code
LME1:
.code
.debug
	.dw '.stabs "UartSendByte:F19",36,0,0,',0,0,offset _UartSendByte,seg _UartSendByte,0x0d,0x0a
.CODE
.public _UartSendByte
_UartSendByte:	.proc
.debug
	.dw '.stabn 0x44,0,69,',0,0
	.dd LM12-_UartSendByte
	.dw 0x0d,0x0a
.code
LM12:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM13-_UartSendByte
	.dw 0x0d,0x0a
.code
LM13:
LBB3:
.debug
	.dw '.stabn 0x44,0,71,',0,0
	.dd LM14-_UartSendByte
	.dw 0x0d,0x0a
.code
LM14:
	R2=[_P_UART_Command2]	// QImode move
	R4=R2	// QImode move
	R3=[R4]	// QImode move
	[BP]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM15-_UartSendByte
	.dw 0x0d,0x0a
.code
LM15:
	R2=[BP]	// QImode move
	R3=R2&64
	[BP]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,73,',0,0
	.dd LM16-_UartSendByte
	.dw 0x0d,0x0a
.code
LM16:
L4:
	R2=[BP]	// QImode move
	CMP R2,0	// QImode test
	JNZ L7	// QImode EQ
	PC=L6
L7:
	pc=L5	// jump
L6:
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM17-_UartSendByte
	.dw 0x0d,0x0a
.code
LM17:
	R2=[_P_UART_Command2]	// QImode move
	R4=R2	// QImode move
	R3=[R4]	// QImode move
	[BP]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,76,',0,0
	.dd LM18-_UartSendByte
	.dw 0x0d,0x0a
.code
LM18:
	R2=[BP]	// QImode move
	R3=R2&64
	[BP]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM19-_UartSendByte
	.dw 0x0d,0x0a
.code
LM19:
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM20-_UartSendByte
	.dw 0x0d,0x0a
.code
LM20:
	R2=[_P_UART_Data]	// QImode move
	R4=R1	// QImode move
	R3=[R4]	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,82,',0,0
	.dd LM21-_UartSendByte
	.dw 0x0d,0x0a
.code
LM21:
LBE3:
.debug
	.dw '.stabn 0x44,0,82,',0,0
	.dd LM22-_UartSendByte
	.dw 0x0d,0x0a
.code
LM22:
L3:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of UartSendByte

.debug
	.dw '.stabs "data:p4",160,0,0,4',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB3-_UartSendByte
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "a:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE3-_UartSendByte
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME2-_UartSendByte
	.dw 0x0d,0x0a
.code
LME2:
.code
.debug
	.dw '.stabs "UartReadByte:F4",36,0,0,',0,0,offset _UartReadByte,seg _UartReadByte,0x0d,0x0a
.CODE
.public _UartReadByte
_UartReadByte:	.proc
.debug
	.dw '.stabn 0x44,0,94,',0,0
	.dd LM23-_UartReadByte
	.dw 0x0d,0x0a
.code
LM23:
	// total=3, vars=3
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=3
	bp=sp+1

	R2=BP+6
.debug
	.dw '.stabn 0x44,0,95,',0,0
	.dd LM24-_UartReadByte
	.dw 0x0d,0x0a
.code
LM24:
LBB4:
.debug
	.dw '.stabn 0x44,0,96,',0,0
	.dd LM25-_UartReadByte
	.dw 0x0d,0x0a
.code
LM25:
	R3=BP	// QImode move
	R1=BP+1
	R3=[_P_UART_Command2]	// QImode move
	R4=R3	// QImode move
	R4=[R4]	// QImode move
	[bp+2]=R4	// QImode move
	R3=[bp+2]	// QImode move
	R4=R1	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,97,',0,0
	.dd LM26-_UartReadByte
	.dw 0x0d,0x0a
.code
LM26:
	R3=BP	// QImode move
	R1=BP+1
	R3=BP	// QImode move
	R3=BP+1
	[bp+2]=R3	// QImode move
	R4=[bp+2]	// QImode move
	R3=[R4]	// QImode move
	R4=R3&128
	R3=R1	// QImode move
	[R3]=R4	// QImode move
.debug
	.dw '.stabn 0x44,0,98,',0,0
	.dd LM27-_UartReadByte
	.dw 0x0d,0x0a
.code
LM27:
L9:
	R1=BP	// QImode move
	R3=BP+1
	R4=R3	// QImode move
	R1=[R4]	// QImode move
	CMP R1,0	// QImode test
	JNZ L12	// QImode EQ
	PC=L11
L12:
	pc=L10	// jump
L11:
.debug
	.dw '.stabn 0x44,0,100,',0,0
	.dd LM28-_UartReadByte
	.dw 0x0d,0x0a
.code
LM28:
	R3=BP	// QImode move
	R1=BP+1
	R3=[_P_UART_Command2]	// QImode move
	R4=R3	// QImode move
	R4=[R4]	// QImode move
	[bp+2]=R4	// QImode move
	R3=[bp+2]	// QImode move
	R4=R1	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,101,',0,0
	.dd LM29-_UartReadByte
	.dw 0x0d,0x0a
.code
LM29:
	R3=BP	// QImode move
	R1=BP+1
	R3=BP	// QImode move
	R3=BP+1
	[bp+2]=R3	// QImode move
	R4=[bp+2]	// QImode move
	R3=[R4]	// QImode move
	R4=R3&128
	R3=R1	// QImode move
	[R3]=R4	// QImode move
.debug
	.dw '.stabn 0x44,0,102,',0,0
	.dd LM30-_UartReadByte
	.dw 0x0d,0x0a
.code
LM30:
	pc=L9	// jump
L10:
.debug
	.dw '.stabn 0x44,0,103,',0,0
	.dd LM31-_UartReadByte
	.dw 0x0d,0x0a
.code
LM31:
	R1=[_P_UART_Data]	// QImode move
	R4=R1	// QImode move
	R3=[R4]	// QImode move
	[BP]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,104,',0,0
	.dd LM32-_UartReadByte
	.dw 0x0d,0x0a
.code
LM32:
	R3=[BP]	// QImode move
	R1=R3	// QImode move
	pc=L8	// jump
.debug
	.dw '.stabn 0x44,0,105,',0,0
	.dd LM33-_UartReadByte
	.dw 0x0d,0x0a
.code
LM33:
LBE4:
.debug
	.dw '.stabn 0x44,0,105,',0,0
	.dd LM34-_UartReadByte
	.dw 0x0d,0x0a
.code
LM34:
L8:

	sp+=3
	pop bp from [sp]
	retf
	.endp	// end of UartReadByte

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB4-_UartReadByte
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "data:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "a:4",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE4-_UartReadByte
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME3-_UartReadByte
	.dw 0x0d,0x0a
.code
LME3:
	.end
