// GCC for SUNPLUS u'nSP version 1.0.23
// Command: F:\SPCE061A\IDE\toolchain\cc1.exe C:\DOCUME~1\ADMINI~1\LOCALS~1\Temp\cceAaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -mglobal-var-iram -gstabs -Wall -o .\Debug/main.asm
	.external __sn_func_ptr_sec

// gcc2_compiled.:

.debug
	.dw '.stabs "E:/µ¥Æ¬»úÕûÀí/ÁèÑôµ¥Æ¬»ú/Ä£×é×ÊÁÏ/ºìÍâ²âÎÂÄ£×é/Demo_Code/TNRFD_Demo2/",0x64,0,3,',0,0,offset Ltext0,seg Ltext0,0x0d,0x0a
.code
.debug
	.dw '.stabs "E:/µ/245Æ/254»/372Õ/373À/355/Á/350Ñ/364µ/245Æ/254»/372/Ä/243×/351×/312Á/317/º/354Í/342²/342Î/302Ä/243×/351/Demo_Code/TNRFD_Demo2/main.c",0x64,0,3,',0,0,offset Ltext0,seg Ltext0,0x0d,0x0a
.code
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
	.dw '.stabs "iTemp:G12",32,0,0,',0,0,offset _iTemp,seg _iTemp,0x0d,0x0a
.CODE
.code
.debug
	.dw '.stabs "main:F1",36,0,0,',0,0,offset _main,seg _main,0x0d,0x0a
.CODE
.public _main
_main:	.proc
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM1-_main
	.dw 0x0d,0x0a
.code
LM1:
	// total=3, vars=3
	// frame_pointer_needed: 1
.debug
	.dw '.stabn 0xa6,0,0,3',0x0d, 0x0a
.code
	PUSH BP to [SP]
	SP-=3
	BP=SP+1

	R1=BP+6
	[BP+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,57,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	R1=BP	// QImode move
	R2=BP+1
	R1=1	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	CALL _Key_Init	// call without return value
.debug
	.dw '.stabn 0x44,0,59,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	CALL _TN_InitalIO	// call without return value
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
L3:
	PC=L5	// jump
	PC=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,62,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	CALL _KeyScan	// call with return value
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,64,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R2=[BP]	// QImode move
	R1=R2	// QImode move
	CMP R1,4	// QImode compare
	NSJA L23	//QImode GTU
	R2=L24	// QImode move
	R1 = R1 + R2	//addqi3
	R2=R1	// QImode move
	R1=[R2]	// QImode move
	PC=R1	// tablejump
.text
L24:
	.dw L7
	.dw L8
	.dw L15
	.dw L23
	.dw L19
.code
L7:
.debug
	.dw '.stabn 0x44,0,67,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	PC=L6	// jump
L8:
.debug
	.dw '.stabn 0x44,0,69,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
L9:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	NSJNZ L11	//QImode NE
	PC=L10	// jump
L11:
.debug
	.dw '.stabn 0x44,0,71,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	R1=76	// QImode move
	[SP--]=R1	// QImode move
	CALL _TN_IR_GetData	// call with return value
	SP = SP + 1	//SP
	R2=BP	// QImode move
	R3=BP+1
	R2=R3	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,73,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	PC=L9	// jump
L10:
.debug
	.dw '.stabn 0x44,0,74,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	R1=16	// QImode move
	[SP--]=R1	// QImode move
	CALL _PlaySnd_Auto	// call without return value
	SP = SP + 1	//SP
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	R1=15	// QImode move
	[SP--]=R1	// QImode move
	CALL _PlaySnd_Auto	// call without return value
	SP = SP + 1	//SP
.debug
	.dw '.stabn 0x44,0,76,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	R1=[_iTemp]	// HFmode RD=[Label]
	R2=[_iTemp+1]
	PUSH R1,R2 to [SP]	// pushhf
	CALL _F_TempplayAndShow	// call without return value
	SP = SP + 2	//SP
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	R1=BP	// QImode move
	R2=BP+1
	R1=1	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
L12:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	NSJNZ L14	//QImode NE
	PC=L13	// jump
L14:
.debug
	.dw '.stabn 0x44,0,80,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
	R1=102	// QImode move
	[SP--]=R1	// QImode move
	CALL _TN_IR_GetData	// call with return value
	SP = SP + 1	//SP
	R2=BP	// QImode move
	R3=BP+1
	R2=R3	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,81,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,82,',0,0
	.dd LM20-_main
	.dw 0x0d,0x0a
.code
LM20:
	PC=L12	// jump
L13:
.debug
	.dw '.stabn 0x44,0,83,',0,0
	.dd LM21-_main
	.dw 0x0d,0x0a
.code
LM21:
	R1=14	// QImode move
	[SP--]=R1	// QImode move
	CALL _PlaySnd_Auto	// call without return value
	SP = SP + 1	//SP
.debug
	.dw '.stabn 0x44,0,84,',0,0
	.dd LM22-_main
	.dw 0x0d,0x0a
.code
LM22:
	R1=[_iTemp]	// HFmode RD=[Label]
	R2=[_iTemp+1]
	PUSH R1,R2 to [SP]	// pushhf
	CALL _F_TempplayAndShow	// call without return value
	SP = SP + 2	//SP
.debug
	.dw '.stabn 0x44,0,85,',0,0
	.dd LM23-_main
	.dw 0x0d,0x0a
.code
LM23:
	R1=BP	// QImode move
	R2=BP+1
	R1=1	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,86,',0,0
	.dd LM24-_main
	.dw 0x0d,0x0a
.code
LM24:
	PC=L6	// jump
L15:
.debug
	.dw '.stabn 0x44,0,88,',0,0
	.dd LM25-_main
	.dw 0x0d,0x0a
.code
LM25:
L16:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	NSJNZ L18	//QImode NE
	PC=L17	// jump
L18:
.debug
	.dw '.stabn 0x44,0,90,',0,0
	.dd LM26-_main
	.dw 0x0d,0x0a
.code
LM26:
	R1=76	// QImode move
	[SP--]=R1	// QImode move
	CALL _TN_IR_GetData	// call with return value
	SP = SP + 1	//SP
	R2=BP	// QImode move
	R3=BP+1
	R2=R3	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,91,',0,0
	.dd LM27-_main
	.dw 0x0d,0x0a
.code
LM27:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,92,',0,0
	.dd LM28-_main
	.dw 0x0d,0x0a
.code
LM28:
	PC=L16	// jump
L17:
.debug
	.dw '.stabn 0x44,0,93,',0,0
	.dd LM29-_main
	.dw 0x0d,0x0a
.code
LM29:
	R1=16	// QImode move
	[SP--]=R1	// QImode move
	CALL _PlaySnd_Auto	// call without return value
	SP = SP + 1	//SP
.debug
	.dw '.stabn 0x44,0,94,',0,0
	.dd LM30-_main
	.dw 0x0d,0x0a
.code
LM30:
	R1=15	// QImode move
	[SP--]=R1	// QImode move
	CALL _PlaySnd_Auto	// call without return value
	SP = SP + 1	//SP
.debug
	.dw '.stabn 0x44,0,95,',0,0
	.dd LM31-_main
	.dw 0x0d,0x0a
.code
LM31:
	R1=[_iTemp]	// HFmode RD=[Label]
	R2=[_iTemp+1]
	PUSH R1,R2 to [SP]	// pushhf
	CALL _F_TempplayAndShow	// call without return value
	SP = SP + 2	//SP
.debug
	.dw '.stabn 0x44,0,96,',0,0
	.dd LM32-_main
	.dw 0x0d,0x0a
.code
LM32:
	R1=BP	// QImode move
	R2=BP+1
	R1=1	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,97,',0,0
	.dd LM33-_main
	.dw 0x0d,0x0a
.code
LM33:
	PC=L6	// jump
L19:
.debug
	.dw '.stabn 0x44,0,99,',0,0
	.dd LM34-_main
	.dw 0x0d,0x0a
.code
LM34:
L20:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	NSJNZ L22	//QImode NE
	PC=L21	// jump
L22:
.debug
	.dw '.stabn 0x44,0,101,',0,0
	.dd LM35-_main
	.dw 0x0d,0x0a
.code
LM35:
	R1=102	// QImode move
	[SP--]=R1	// QImode move
	CALL _TN_IR_GetData	// call with return value
	SP = SP + 1	//SP
	R2=BP	// QImode move
	R3=BP+1
	R2=R3	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,102,',0,0
	.dd LM36-_main
	.dw 0x0d,0x0a
.code
LM36:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,103,',0,0
	.dd LM37-_main
	.dw 0x0d,0x0a
.code
LM37:
	PC=L20	// jump
L21:
.debug
	.dw '.stabn 0x44,0,104,',0,0
	.dd LM38-_main
	.dw 0x0d,0x0a
.code
LM38:
	R1=16	// QImode move
	[SP--]=R1	// QImode move
	CALL _PlaySnd_Auto	// call without return value
	SP = SP + 1	//SP
.debug
	.dw '.stabn 0x44,0,105,',0,0
	.dd LM39-_main
	.dw 0x0d,0x0a
.code
LM39:
	R1=14	// QImode move
	[SP--]=R1	// QImode move
	CALL _PlaySnd_Auto	// call without return value
	SP = SP + 1	//SP
.debug
	.dw '.stabn 0x44,0,106,',0,0
	.dd LM40-_main
	.dw 0x0d,0x0a
.code
LM40:
	R1=[_iTemp]	// HFmode RD=[Label]
	R2=[_iTemp+1]
	PUSH R1,R2 to [SP]	// pushhf
	CALL _F_TempplayAndShow	// call without return value
	SP = SP + 2	//SP
.debug
	.dw '.stabn 0x44,0,107,',0,0
	.dd LM41-_main
	.dw 0x0d,0x0a
.code
LM41:
	PC=L6	// jump
L23:
.debug
	.dw '.stabn 0x44,0,109,',0,0
	.dd LM42-_main
	.dw 0x0d,0x0a
.code
LM42:
	PC=L6	// jump
L6:
.debug
	.dw '.stabn 0x44,0,111,',0,0
	.dd LM43-_main
	.dw 0x0d,0x0a
.code
LM43:
	PC=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,112,',0,0
	.dd LM44-_main
	.dw 0x0d,0x0a
.code
LM44:
LBE2:
.debug
	.dw '.stabn 0x44,0,112,',0,0
	.dd LM45-_main
	.dw 0x0d,0x0a
.code
LM45:
L2:

	SP+=3
	POP BP from [SP]
	RETF
	.endp	// end of main

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "Key:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "iFlag:4",128,0,0,1',0x0d,0x0a
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
.iram
.public _iTemp
_iTemp:
	.dw 2 dup(0)
.external _F_TempplayAndShow
.external _PlaySnd_Auto
.external _TN_IR_GetData
.external _KeyScan
.external _TN_InitalIO
.external _Key_Init
	.end
