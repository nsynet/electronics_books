// GCC for SUNPLUS u'nSP version 1.0.23
// Command: F:\SPCE061A\IDE\toolchain\cc1.exe C:\DOCUME~1\ADMINI~1\LOCALS~1\Temp\ccMXaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -mglobal-var-iram -gstabs -Wall -o .\Debug/main.asm
	.external __sn_func_ptr_sec

// gcc2_compiled.:

.debug
	.dw '.stabs "E:/��Ƭ������/������Ƭ��/ģ������/�������ģ��/Demo_Code/TNRFD_Demo1/",0x64,0,3,',0,0,offset Ltext0,seg Ltext0,0x0d,0x0a
.code
.debug
	.dw '.stabs "E:/�/245�/254�/372�/373�/355/�/350�/364�/245�/254�/372/�/243�/351�/312�/317/�/354�/342�/342�/302�/243�/351/Demo_Code/TNRFD_Demo1/main.c",0x64,0,3,',0,0,offset Ltext0,seg Ltext0,0x0d,0x0a
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
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM1-_main
	.dw 0x0d,0x0a
.code
LM1:
	// total=5, vars=5
	// frame_pointer_needed: 1
.debug
	.dw '.stabn 0xa6,0,0,5',0x0d, 0x0a
.code
	PUSH BP to [SP]
	SP-=5
	BP=SP+1

	R1=BP+8
	[BP+4]=R1	// QImode move
LBB2:
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
	CALL _TN_InitalIO	// call without return value
.debug
	.dw '.stabn 0x44,0,45,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
L3:
	R1=102	// QImode move
	[SP--]=R1	// QImode move
	CALL _TN_IR_GetData	// call with return value
	SP = SP + 1	//SP
	CMP R1,0	// QImode test
	NSJNZ L5	//QImode NE
	PC=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,48,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	PC=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,49,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R1=[_iTemp]	// HFmode RD=[Label]
	R2=[_iTemp+1]
	[BP++]=R1	// [RD]=RS HFmode, RD!=RS+1
	[BP--]=R2
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
L6:
	R1=76	// QImode move
	[SP--]=R1	// QImode move
	CALL _TN_IR_GetData	// call with return value
	SP = SP + 1	//SP
	CMP R1,0	// QImode test
	NSJNZ L8	//QImode NE
	PC=L7	// jump
L8:
.debug
	.dw '.stabn 0x44,0,52,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,53,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
	PC=L6	// jump
L7:
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	R1=BP	// QImode move
	R2=BP+2
	R3=[_iTemp]	// HFmode RD=[Label]
	R4=[_iTemp+1]
	R1=R2	// QImode move
	[R1++]=R3	// [RD]=RS HFmode, RD!=RS+1
	[R1--]=R4
.debug
	.dw '.stabn 0x44,0,55,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
L9:
	PC=L11	// jump
	PC=L10	// jump
L11:
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,59,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	PC=L9	// jump
L10:
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
LBE2:
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
L2:

	SP+=5
	POP BP from [SP]
	RETF
	.endp	// end of main

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "HJTemp:12",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "MBTemp:12",128,0,0,2',0x0d,0x0a
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
.external _TN_IR_GetData
.external _TN_InitalIO
	.end
