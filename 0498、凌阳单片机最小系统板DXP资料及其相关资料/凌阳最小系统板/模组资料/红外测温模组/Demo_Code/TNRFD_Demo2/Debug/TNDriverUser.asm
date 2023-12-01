// GCC for SUNPLUS u'nSP version 1.0.23
// Command: F:\ÁèÑôÈí¼þ\toolchain\cc1.exe C:\DOCUME~1\ADMINI~1\LOCALS~1\Temp\ccOQaaaa.i -fkeep-inline-functions -quiet -dumpbase TNDriverUser.c -mglobal-var-iram -gstabs -Wall -o .\Debug/TNDriverUser.asm
	.external __sn_func_ptr_sec

// gcc2_compiled.:

.debug
	.dw '.stabs "E:/µ¥Æ¬»úÕûÀí/ÁèÑôµ¥Æ¬»ú/Ä£×é×ÊÁÏ/ºìÍâ²âÎÂÄ£×é/Demo_Code/TNRFD_Demo2/",0x64,0,3,',0,0,offset Ltext0,seg Ltext0,0x0d,0x0a
.code
.debug
	.dw '.stabs "E:/µ/245Æ/254»/372Õ/373À/355/Á/350Ñ/364µ/245Æ/254»/372/Ä/243×/351×/312Á/317/º/354Í/342²/342Î/302Ä/243×/351/Demo_Code/TNRFD_Demo2/TNDriverUser.c",0x64,0,3,',0,0,offset Ltext0,seg Ltext0,0x0d,0x0a
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
	.dw '.stabs "TN_IR_GetData:F4",36,0,0,',0,0,offset _TN_IR_GetData,seg _TN_IR_GetData,0x0d,0x0a
.CODE
.public _TN_IR_GetData
_TN_IR_GetData:	.proc
.debug
	.dw '.stabn 0x44,0,53,',0,0
	.dd LM1-_TN_IR_GetData
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
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM2-_TN_IR_GetData
	.dw 0x0d,0x0a
.code
LM2:
	R1=BP	// QImode move
	R2=BP+3
	R1=(-21846)	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM3-_TN_IR_GetData
	.dw 0x0d,0x0a
.code
LM3:
	CALL _TN_IRACK_EN	// call without return value
.debug
	.dw '.stabn 0x44,0,59,',0,0
	.dd LM4-_TN_IR_GetData
	.dw 0x0d,0x0a
.code
LM4:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM5-_TN_IR_GetData
	.dw 0x0d,0x0a
.code
LM5:
	CALL _TN_ReadData	// call with return value
.debug
	.dw '.stabn 0x44,0,61,',0,0
	.dd LM6-_TN_IR_GetData
	.dw 0x0d,0x0a
.code
LM6:
	R4=[_TN_Data_Buff]	// QImode move
	R4=R4&255
	[BP]=R4	// QImode move
.debug
	.dw '.stabn 0x44,0,62,',0,0
	.dd LM7-_TN_IR_GetData
	.dw 0x0d,0x0a
.code
LM7:
	R2=[BP+4]	// QImode move
	R1=[R2]	// QImode move
	CMP R1,[BP]	// QImode compare
	NSJNZ L3	//QImode NE
.debug
	.dw '.stabn 0x44,0,64,',0,0
	.dd LM8-_TN_IR_GetData
	.dw 0x0d,0x0a
.code
LM8:
	R1=BP	// QImode move
	R2=BP+1
	R3=[_TN_Data_Buff+1]	// QImode move
	R4=R3&(-256)
	R3=R2	// QImode move
	[R3]=R4	// QImode move
.debug
	.dw '.stabn 0x44,0,65,',0,0
	.dd LM9-_TN_IR_GetData
	.dw 0x0d,0x0a
.code
LM9:
	R1=BP	// QImode move
	R2=BP+2
	R4=[_TN_Data_Buff+1]	// QImode move
	R1=R4&255
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,66,',0,0
	.dd LM10-_TN_IR_GetData
	.dw 0x0d,0x0a
.code
LM10:
	R2=[_TN_Data_Buff+2]	// QImode move
	R1=R2&255
	CMP R1,13	// QImode compare
	NSJNZ L3	//QImode NE
.debug
	.dw '.stabn 0x44,0,68,',0,0
	.dd LM11-_TN_IR_GetData
	.dw 0x0d,0x0a
.code
LM11:
	R2=BP	// QImode move
	R1=BP+1
	R2=BP	// QImode move
	R3=BP+2
	R4=R1	// QImode move
	R1=[R4]
	R4=R3	// QImode move
	R4=[R4]
	R1|=R4
	R3=R1
	R4=0
	PUSH R3,R4 to [SP]	// pushhi
	CALL __cvi2f2	// call with return value
	SP = SP + 2	//SP
	[_iTemp]=R1	// HFmode [Label]=RS
	[_iTemp+1]=R2
.debug
	.dw '.stabn 0x44,0,69,',0,0
	.dd LM12-_TN_IR_GetData
	.dw 0x0d,0x0a
.code
LM12:
	R1=[_iTemp]	// HFmode RD=[Label]
	R2=[_iTemp+1]
	R3=0	// HFmode immediate to register move
	R4=16768
	PUSH R3,R4 to [SP]	// pushhf
	PUSH R1,R2 to [SP]	// pushhf
	CALL __divf2	// call with return value
	SP = SP + 4	//SP
	R3=37683	// HFmode immediate to register move
	R4=17288
	PUSH R3,R4 to [SP]	// pushhf
	PUSH R1,R2 to [SP]	// pushhf
	CALL __subf2	// call with return value
	SP = SP + 4	//SP
	[_iTemp]=R1	// HFmode [Label]=RS
	[_iTemp+1]=R2
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM13-_TN_IR_GetData
	.dw 0x0d,0x0a
.code
LM13:
	R1=BP	// QImode move
	R2=BP+3
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L4:
L3:
.debug
	.dw '.stabn 0x44,0,73,',0,0
	.dd LM14-_TN_IR_GetData
	.dw 0x0d,0x0a
.code
LM14:
	R1=6	// QImode move
	[SP--]=R1	// QImode move
	CALL _Delay	// call without return value
	SP = SP + 1	//SP
.debug
	.dw '.stabn 0x44,0,74,',0,0
	.dd LM15-_TN_IR_GetData
	.dw 0x0d,0x0a
.code
LM15:
	CALL _TN_IRACK_UN	// call without return value
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM16-_TN_IR_GetData
	.dw 0x0d,0x0a
.code
LM16:
// GCC inline ASM start
	IRQ on
// GCC inline ASM end
.debug
	.dw '.stabn 0x44,0,76,',0,0
	.dd LM17-_TN_IR_GetData
	.dw 0x0d,0x0a
.code
LM17:
	R1=BP	// QImode move
	R2=BP+3
	R4=R2	// QImode move
	R3=[R4]	// QImode move
	R1=R3	// QImode move
	PC=L2	// jump
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM18-_TN_IR_GetData
	.dw 0x0d,0x0a
.code
LM18:
LBE2:
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM19-_TN_IR_GetData
	.dw 0x0d,0x0a
.code
LM19:
L2:

	SP+=5
	POP BP from [SP]
	RETF
	.endp	// end of TN_IR_GetData

.debug
	.dw '.stabs "Item:p4",160,0,0,8',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_TN_IR_GetData
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "iItem:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "MSB:4",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "LSB:4",128,0,0,2',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "Back_Data:4",128,0,0,3',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE2-_TN_IR_GetData
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME1-_TN_IR_GetData
	.dw 0x0d,0x0a
.code
LME1:
.code
.debug
	.dw '.stabs "Delay:F19",36,0,0,',0,0,offset _Delay,seg _Delay,0x0d,0x0a
.CODE
.public _Delay
_Delay:	.proc
.debug
	.dw '.stabn 0x44,0,87,',0,0
	.dd LM20-_Delay
	.dw 0x0d,0x0a
.code
LM20:
	// total=3, vars=3
	// frame_pointer_needed: 1
.debug
	.dw '.stabn 0xa6,0,0,3',0x0d, 0x0a
.code
	PUSH BP to [SP]
	SP-=3
	BP=SP+1

	R1=BP+6
LBB3:
.debug
	.dw '.stabn 0x44,0,89,',0,0
	.dd LM21-_Delay
	.dw 0x0d,0x0a
.code
LM21:
	R2=0	// QImode move
	[BP]=R2	// QImode move
L8:
	R2=[BP]	// QImode move
	R3=R1	// QImode move
	CMP R2,[R3]	// QImode compare
	NSJB L11	//QImode LTU
	PC=L9	// jump
L11:
.debug
	.dw '.stabn 0x44,0,90,',0,0
	.dd LM22-_Delay
	.dw 0x0d,0x0a
.code
LM22:
	R2=BP	// QImode move
	R3=BP+1
	R2=0	// QImode move
	R4=R3	// QImode move
	[R4]=R2	// QImode move
L12:
	R2=BP	// QImode move
	R3=BP+1
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	CMP R2,526	// QImode compare
	NSJNA L15	//QImode LEU
	PC=L10	// jump
L15:
.debug
	.dw '.stabn 0x44,0,91,',0,0
	.dd LM23-_Delay
	.dw 0x0d,0x0a
.code
LM23:
	R2=1	// QImode move
	[28690]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,90,',0,0
	.dd LM24-_Delay
	.dw 0x0d,0x0a
.code
LM24:
L14:
	R2=BP	// QImode move
	R3=BP+1
	R4=BP	// QImode move
	R2=BP+1
	R3=BP	// QImode move
	R3=BP+1
	[BP+2]=R3	// QImode move
	R4=[BP+2]	// QImode move
	R3=[R4]	// QImode move
	R4=R3+1
	R3=R2	// QImode move
	[R3]=R4	// QImode move
	PC=L12	// jump
L13:
.debug
	.dw '.stabn 0x44,0,89,',0,0
	.dd LM25-_Delay
	.dw 0x0d,0x0a
.code
LM25:
L10:
	R2=[BP]	// QImode move
	R3=R2+1
	[BP]=R3	// QImode move
	PC=L8	// jump
L9:
.debug
	.dw '.stabn 0x44,0,92,',0,0
	.dd LM26-_Delay
	.dw 0x0d,0x0a
.code
LM26:
LBE3:
.debug
	.dw '.stabn 0x44,0,92,',0,0
	.dd LM27-_Delay
	.dw 0x0d,0x0a
.code
LM27:
L7:

	SP+=3
	POP BP from [SP]
	RETF
	.endp	// end of Delay

.debug
	.dw '.stabs "timers:p4",160,0,0,6',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB3-_Delay
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "i:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "j:4",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE3-_Delay
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME2-_Delay
	.dw 0x0d,0x0a
.code
LME2:
.external _TN_IRACK_UN
.external _iTemp
.external _TN_Data_Buff
.external _TN_ReadData
.external _TN_IRACK_EN
.external __subf2
.external __divf2
.external __cvi2f2
	.end
