// GCC for SUNPLUS u'nSP version 1.0.23
// Command: F:\ÁèÑôÈí¼þ\toolchain\cc1.exe C:\DOCUME~1\ADMINI~1\LOCALS~1\Temp\cc6Raaaa.i -fkeep-inline-functions -quiet -dumpbase Key.c -mglobal-var-iram -gstabs -Wall -o .\Debug/Key.asm
	.external __sn_func_ptr_sec

// gcc2_compiled.:

.debug
	.dw '.stabs "E:/µ¥Æ¬»úÕûÀí/ÁèÑôµ¥Æ¬»ú/Ä£×é×ÊÁÏ/ºìÍâ²âÎÂÄ£×é/Demo_Code/TNRFD_Demo2/",0x64,0,3,',0,0,offset Ltext0,seg Ltext0,0x0d,0x0a
.code
.debug
	.dw '.stabs "E:/µ/245Æ/254»/372Õ/373À/355/Á/350Ñ/364µ/245Æ/254»/372/Ä/243×/351×/312Á/317/º/354Í/342²/342Î/302Ä/243×/351/Demo_Code/TNRFD_Demo2/Key.c",0x64,0,3,',0,0,offset Ltext0,seg Ltext0,0x0d,0x0a
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
.code
.debug
	.dw '.stabs "Key_Init:F19",36,0,0,',0,0,offset _Key_Init,seg _Key_Init,0x0d,0x0a
.CODE
.public _Key_Init
_Key_Init:	.proc
.debug
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM1-_Key_Init
	.dw 0x0d,0x0a
.code
LM1:
	// total=0, vars=0
	// frame_pointer_needed: 1
.debug
	.dw '.stabn 0xa6,0,0,0',0x0d, 0x0a
.code
	PUSH BP to [SP]
	BP=SP+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,24,',0,0
	.dd LM2-_Key_Init
	.dw 0x0d,0x0a
.code
LM2:
	R2=[28674]	// QImode move
	R3=R2&(-256)
	[28674]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,25,',0,0
	.dd LM3-_Key_Init
	.dw 0x0d,0x0a
.code
LM3:
	R2=[28675]	// QImode move
	R3=R2&(-256)
	[28675]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,26,',0,0
	.dd LM4-_Key_Init
	.dw 0x0d,0x0a
.code
LM4:
	R2=[28672]	// QImode move
	R3=R2&(-256)
	[28672]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM5-_Key_Init
	.dw 0x0d,0x0a
.code
LM5:
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM6-_Key_Init
	.dw 0x0d,0x0a
.code
LM6:
L2:

	POP BP from [SP]
	RETF
	.endp	// end of Key_Init

.debug
	.dw '.stabf ',0,0
	.dd LME1-_Key_Init
	.dw 0x0d,0x0a
.code
LME1:
.code
.debug
	.dw '.stabs "delay:F19",36,0,0,',0,0,offset _delay,seg _delay,0x0d,0x0a
.CODE
.public _delay
_delay:	.proc
.debug
	.dw '.stabn 0x44,0,35,',0,0
	.dd LM7-_delay
	.dw 0x0d,0x0a
.code
LM7:
	// total=1, vars=1
	// frame_pointer_needed: 1
.debug
	.dw '.stabn 0xa6,0,0,1',0x0d, 0x0a
.code
	PUSH BP to [SP]
	SP-=1
	BP=SP+1

	R1=BP+4
LBB2:
.debug
	.dw '.stabn 0x44,0,37,',0,0
	.dd LM8-_delay
	.dw 0x0d,0x0a
.code
LM8:
	R2=0	// QImode move
	[BP]=R2	// QImode move
L4:
	R2=[BP]	// QImode move
	CMP R2,3000	// QImode compare
	NSJNA L7	//QImode LEU
	PC=L5	// jump
L7:
.debug
	.dw '.stabn 0x44,0,39,',0,0
	.dd LM9-_delay
	.dw 0x0d,0x0a
.code
LM9:
	R2=1	// QImode move
	[28690]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,37,',0,0
	.dd LM10-_delay
	.dw 0x0d,0x0a
.code
LM10:
L6:
	R2=[BP]	// QImode move
	R3=R2+1
	[BP]=R3	// QImode move
	PC=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM11-_delay
	.dw 0x0d,0x0a
.code
LM11:
LBE2:
.debug
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM12-_delay
	.dw 0x0d,0x0a
.code
LM12:
L3:

	SP+=1
	POP BP from [SP]
	RETF
	.endp	// end of delay

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_delay
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "uiCount:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE2-_delay
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME2-_delay
	.dw 0x0d,0x0a
.code
LME2:
.code
.debug
	.dw '.stabs "KeyScan:F4",36,0,0,',0,0,offset _KeyScan,seg _KeyScan,0x0d,0x0a
.CODE
.public _KeyScan
_KeyScan:	.proc
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM13-_KeyScan
	.dw 0x0d,0x0a
.code
LM13:
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
LBB3:
.debug
	.dw '.stabn 0x44,0,53,',0,0
	.dd LM14-_KeyScan
	.dw 0x0d,0x0a
.code
LM14:
	R1=[28672]	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM15-_KeyScan
	.dw 0x0d,0x0a
.code
LM15:
	R2=[BP]	// QImode move
	R2=R2&255
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,55,',0,0
	.dd LM16-_KeyScan
	.dw 0x0d,0x0a
.code
LM16:
	R1=[BP]	// QImode move
	CMP R1,0	// QImode test
	NSJZ L10	//QImode EQ
.debug
	.dw '.stabn 0x44,0,57,',0,0
	.dd LM17-_KeyScan
	.dw 0x0d,0x0a
.code
LM17:
	CALL _delay	// call without return value
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM18-_KeyScan
	.dw 0x0d,0x0a
.code
LM18:
	R1=BP	// QImode move
	R2=BP+1
	R1=[28672]	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,59,',0,0
	.dd LM19-_KeyScan
	.dw 0x0d,0x0a
.code
LM19:
	R2=BP	// QImode move
	R1=BP+1
	R2=BP	// QImode move
	R3=BP+1
	R4=R3	// QImode move
	R4=[R4]
	R2=R4&255
	R4=R1	// QImode move
	[R4]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM20-_KeyScan
	.dw 0x0d,0x0a
.code
LM20:
	R1=BP	// QImode move
	R2=BP+1
	R1=[BP]	// QImode move
	R3=R2	// QImode move
	CMP R1,[R3]	// QImode compare
	NSJZ L10	//QImode EQ
.debug
	.dw '.stabn 0x44,0,61,',0,0
	.dd LM21-_KeyScan
	.dw 0x0d,0x0a
.code
LM21:
	R1=0	// QImode move
	[BP]=R1	// QImode move
L11:
L10:
.debug
	.dw '.stabn 0x44,0,63,',0,0
	.dd LM22-_KeyScan
	.dw 0x0d,0x0a
.code
LM22:
	R2=[BP]	// QImode move
	R1=R2	// QImode move
	PC=L9	// jump
.debug
	.dw '.stabn 0x44,0,64,',0,0
	.dd LM23-_KeyScan
	.dw 0x0d,0x0a
.code
LM23:
LBE3:
.debug
	.dw '.stabn 0x44,0,64,',0,0
	.dd LM24-_KeyScan
	.dw 0x0d,0x0a
.code
LM24:
L9:

	SP+=3
	POP BP from [SP]
	RETF
	.endp	// end of KeyScan

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB3-_KeyScan
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "uiData:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "uiTemp:4",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE3-_KeyScan
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME3-_KeyScan
	.dw 0x0d,0x0a
.code
LME3:
	.end
