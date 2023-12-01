// GCC for SUNPLUS u'nSP version 1.0.23
// Command: F:\ÁèÑôÈí¼þ\toolchain\cc1.exe C:\DOCUME~1\ADMINI~1\LOCALS~1\Temp\ccUBaaaa.i -fkeep-inline-functions -quiet -dumpbase PlayData.c -mglobal-var-iram -gstabs -Wall -o .\Debug/PlayData.asm
	.external __sn_func_ptr_sec

// gcc2_compiled.:

.debug
	.dw '.stabs "E:/µ¥Æ¬»úÕûÀí/ÁèÑôµ¥Æ¬»ú/Ä£×é×ÊÁÏ/ºìÍâ²âÎÂÄ£×é/Demo_Code/TNRFD_Demo2/",0x64,0,3,',0,0,offset Ltext0,seg Ltext0,0x0d,0x0a
.code
.debug
	.dw '.stabs "E:/µ/245Æ/254»/372Õ/373À/355/Á/350Ñ/364µ/245Æ/254»/372/Ä/243×/351×/312Á/317/º/354Í/342²/342Î/302Ä/243×/351/Demo_Code/TNRFD_Demo2/PlayData.c",0x64,0,3,',0,0,offset Ltext0,seg Ltext0,0x0d,0x0a
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
	.dw '.stabs "PlaySnd_Auto:F19",36,0,0,',0,0,offset _PlaySnd_Auto,seg _PlaySnd_Auto,0x0d,0x0a
.CODE
.public _PlaySnd_Auto
_PlaySnd_Auto:	.proc
.debug
	.dw '.stabn 0x44,0,18,',0,0
	.dd LM1-_PlaySnd_Auto
	.dw 0x0d,0x0a
.code
LM1:
	// total=1, vars=1
	// frame_pointer_needed: 1
.debug
	.dw '.stabn 0xa6,0,0,1',0x0d, 0x0a
.code
	PUSH BP to [SP]
	SP-=1
	BP=SP+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,19,',0,0
	.dd LM2-_PlaySnd_Auto
	.dw 0x0d,0x0a
.code
LM2:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	CALL _SACM_S480_Initial	// call with return value
	SP = SP + 1	//SP
.debug
	.dw '.stabn 0x44,0,20,',0,0
	.dd LM3-_PlaySnd_Auto
	.dw 0x0d,0x0a
.code
LM3:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R2=[BP]	// QImode move
	R1=[R2]	// QImode move
	[SP--]=R1	// QImode move
	CALL _SACM_S480_Play	// call without return value
	SP = SP + 3	//SP
.debug
	.dw '.stabn 0x44,0,21,',0,0
	.dd LM4-_PlaySnd_Auto
	.dw 0x0d,0x0a
.code
LM4:
L3:
	CALL _SACM_S480_Status	// call with return value
	R2=R1&1
	CMP R2,0	// QImode test
	NSJNZ L5	//QImode NE
	PC=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM5-_PlaySnd_Auto
	.dw 0x0d,0x0a
.code
LM5:
	CALL _SACM_S480_ServiceLoop	// call without return value
.debug
	.dw '.stabn 0x44,0,24,',0,0
	.dd LM6-_PlaySnd_Auto
	.dw 0x0d,0x0a
.code
LM6:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,25,',0,0
	.dd LM7-_PlaySnd_Auto
	.dw 0x0d,0x0a
.code
LM7:
	PC=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,26,',0,0
	.dd LM8-_PlaySnd_Auto
	.dw 0x0d,0x0a
.code
LM8:
	CALL _SACM_S480_Stop	// call without return value
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM9-_PlaySnd_Auto
	.dw 0x0d,0x0a
.code
LM9:
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM10-_PlaySnd_Auto
	.dw 0x0d,0x0a
.code
LM10:
L2:

	SP+=1
	POP BP from [SP]
	RETF
	.endp	// end of PlaySnd_Auto

.debug
	.dw '.stabs "uiSndIndex:p4",160,0,0,4',0x0d,0x0a
.CODE
.debug
	.dw '.stabf ',0,0
	.dd LME1-_PlaySnd_Auto
	.dw 0x0d,0x0a
.code
LME1:
.code
.debug
	.dw '.stabs "F_TempplayAndShow:F19",36,0,0,',0,0,offset _F_TempplayAndShow,seg _F_TempplayAndShow,0x0d,0x0a
.CODE
.public _F_TempplayAndShow
_F_TempplayAndShow:	.proc
.debug
	.dw '.stabn 0x44,0,36,',0,0
	.dd LM11-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM11:
	// total=16, vars=16
	// frame_pointer_needed: 1
.debug
	.dw '.stabn 0xa6,0,0,16',0x0d, 0x0a
.code
	PUSH BP to [SP]
	SP-=16
	BP=SP+1

	R1=BP+19
	[BP+6]=R1	// QImode move
LBB2:
.debug
	.dw '.stabn 0x44,0,38,',0,0
	.dd LM12-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM12:
	R3=[BP+6]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=0	// HFmode immediate to register move
	R4=17096
	PUSH R3,R4 to [SP]	// pushhf
	PUSH R1,R2 to [SP]	// pushhf
	CALL __mulf2	// call with return value
	SP = SP + 4	//SP
	R3=[BP+6]	// QImode move
	[R3++]=R1	// [RD]=RS HFmode, RD!=RS+1
	[R3--]=R2
.debug
	.dw '.stabn 0x44,0,39,',0,0
	.dd LM13-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM13:
	R1=BP	// QImode move
	R1=BP+5
	[BP+7]=R1	// QImode move
	R3=[BP+6]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=16384	// HFmode immediate to register move
	R4=17948
	PUSH R3,R4 to [SP]	// pushhf
	PUSH R1,R2 to [SP]	// pushhf
	CALL __divf2	// call with return value
	SP = SP + 4	//SP
	PUSH R1,R2 to [SP]	// pushhf
	CALL __cvf2i1	// call with return value
	SP = SP + 2	//SP
	R2=[BP+7]	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,40,',0,0
	.dd LM14-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM14:
	R1=BP	// QImode move
	R3=BP+4
	[BP+8]=R3	// QImode move
	R3=[BP+6]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=0	// HFmode immediate to register move
	R4=17530
	PUSH R3,R4 to [SP]	// pushhf
	PUSH R1,R2 to [SP]	// pushhf
	CALL __divf2	// call with return value
	SP = SP + 4	//SP
	PUSH R1,R2 to [SP]	// pushhf
	CALL __cvf2i1	// call with return value
	SP = SP + 2	//SP
	R2=[BP+8]	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM15-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM15:
	R1=BP	// QImode move
	R3=BP+4
	[BP+9]=R3	// QImode move
	R1=BP	// QImode move
	R2=BP+4
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	CALL __modi1	// call with return value
	SP = SP + 2	//SP
	R2=[BP+9]	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM16-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM16:
	R1=BP	// QImode move
	R3=BP+3
	[BP+10]=R3	// QImode move
	R3=[BP+6]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=0	// HFmode immediate to register move
	R4=17096
	PUSH R3,R4 to [SP]	// pushhf
	PUSH R1,R2 to [SP]	// pushhf
	CALL __divf2	// call with return value
	SP = SP + 4	//SP
	PUSH R1,R2 to [SP]	// pushhf
	CALL __cvf2i1	// call with return value
	SP = SP + 2	//SP
	R2=[BP+10]	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,43,',0,0
	.dd LM17-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM17:
	R1=BP	// QImode move
	R3=BP+3
	[BP+11]=R3	// QImode move
	R1=BP	// QImode move
	R2=BP+3
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	CALL __modi1	// call with return value
	SP = SP + 2	//SP
	R2=[BP+11]	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM18-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM18:
	R1=BP	// QImode move
	R3=BP+2
	[BP+12]=R3	// QImode move
	R3=[BP+6]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=0	// HFmode immediate to register move
	R4=16672
	PUSH R3,R4 to [SP]	// pushhf
	PUSH R1,R2 to [SP]	// pushhf
	CALL __divf2	// call with return value
	SP = SP + 4	//SP
	PUSH R1,R2 to [SP]	// pushhf
	CALL __cvf2i1	// call with return value
	SP = SP + 2	//SP
	R2=[BP+12]	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,45,',0,0
	.dd LM19-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM19:
	R1=BP	// QImode move
	R3=BP+2
	[BP+13]=R3	// QImode move
	R1=BP	// QImode move
	R2=BP+2
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	CALL __modi1	// call with return value
	SP = SP + 2	//SP
	R2=[BP+13]	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,46,',0,0
	.dd LM20-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM20:
	R1=BP	// QImode move
	R3=BP+1
	[BP+14]=R3	// QImode move
	R3=[BP+6]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	PUSH R1,R2 to [SP]	// pushhf
	CALL __cvf2i1	// call with return value
	SP = SP + 2	//SP
	R2=[BP+14]	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM21-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM21:
	R1=BP	// QImode move
	R3=BP+1
	[BP+15]=R3	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	CALL __modi1	// call with return value
	SP = SP + 2	//SP
	R2=[BP+15]	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,48,',0,0
	.dd LM22-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM22:
	R1=BP	// QImode move
	R2=BP+5
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	NSJZ L8	//QImode EQ
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM23-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM23:
	R1=BP	// QImode move
	R2=BP+5
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	CALL _PlaySnd_Auto	// call without return value
	SP = SP + 1	//SP
.debug
	.dw '.stabn 0x44,0,51,',0,0
	.dd LM24-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM24:
	R1=10	// QImode move
	[SP--]=R1	// QImode move
	CALL _PlaySnd_Auto	// call without return value
	SP = SP + 1	//SP
L8:
.debug
	.dw '.stabn 0x44,0,53,',0,0
	.dd LM25-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM25:
	R1=BP	// QImode move
	R2=BP+5
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	NSJZ L9	//QImode EQ
	R1=BP	// QImode move
	R2=BP+4
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	NSJNZ L9	//QImode NE
	R1=BP	// QImode move
	R2=BP+3
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	NSJZ L9	//QImode EQ
.debug
	.dw '.stabn 0x44,0,55,',0,0
	.dd LM26-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM26:
	R1=BP	// QImode move
	R2=BP+4
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	CALL _PlaySnd_Auto	// call without return value
	SP = SP + 1	//SP
L9:
.debug
	.dw '.stabn 0x44,0,57,',0,0
	.dd LM27-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM27:
	R1=BP	// QImode move
	R2=BP+4
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	NSJZ L10	//QImode EQ
.debug
	.dw '.stabn 0x44,0,59,',0,0
	.dd LM28-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM28:
	R1=BP	// QImode move
	R2=BP+4
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	CALL _PlaySnd_Auto	// call without return value
	SP = SP + 1	//SP
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM29-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM29:
	R1=11	// QImode move
	[SP--]=R1	// QImode move
	CALL _PlaySnd_Auto	// call without return value
	SP = SP + 1	//SP
L10:
.debug
	.dw '.stabn 0x44,0,62,',0,0
	.dd LM30-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM30:
	R1=BP	// QImode move
	R2=BP+4
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	NSJNZ L11	//QImode NE
	R1=BP	// QImode move
	R2=BP+5
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	NSJNZ L11	//QImode NE
	R1=BP	// QImode move
	R2=BP+3
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	NSJNZ L11	//QImode NE
.debug
	.dw '.stabn 0x44,0,64,',0,0
	.dd LM31-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM31:
	R1=BP	// QImode move
	R2=BP+3
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	CALL _PlaySnd_Auto	// call without return value
	SP = SP + 1	//SP
L11:
.debug
	.dw '.stabn 0x44,0,66,',0,0
	.dd LM32-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM32:
	R1=BP	// QImode move
	R2=BP+3
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	NSJZ L12	//QImode EQ
.debug
	.dw '.stabn 0x44,0,68,',0,0
	.dd LM33-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM33:
	R1=BP	// QImode move
	R2=BP+3
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	CALL _PlaySnd_Auto	// call without return value
	SP = SP + 1	//SP
L12:
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM34-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM34:
	R1=12	// QImode move
	[SP--]=R1	// QImode move
	CALL _PlaySnd_Auto	// call without return value
	SP = SP + 1	//SP
.debug
	.dw '.stabn 0x44,0,71,',0,0
	.dd LM35-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM35:
	R1=BP	// QImode move
	R2=BP+2
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	CALL _PlaySnd_Auto	// call without return value
	SP = SP + 1	//SP
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM36-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM36:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	CALL _PlaySnd_Auto	// call without return value
	SP = SP + 1	//SP
.debug
	.dw '.stabn 0x44,0,73,',0,0
	.dd LM37-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM37:
	R1=13	// QImode move
	[SP--]=R1	// QImode move
	CALL _PlaySnd_Auto	// call without return value
	SP = SP + 1	//SP
.debug
	.dw '.stabn 0x44,0,74,',0,0
	.dd LM38-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM38:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM39-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM39:
LBE2:
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM40-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LM40:
L7:

	SP+=16
	POP BP from [SP]
	RETF
	.endp	// end of F_TempplayAndShow

.debug
	.dw '.stabs "temp:p12",160,0,0,19',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "iShow:20=ar1;0;5;1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE2-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME2-_F_TempplayAndShow
	.dw 0x0d,0x0a
.code
LME2:
.external _SACM_S480_Stop
.external _SACM_S480_ServiceLoop
.external _SACM_S480_Status
.external _SACM_S480_Play
.external _SACM_S480_Initial
.external __modi1
.external __cvf2i1
.external __divf2
.external __mulf2
	.end
