// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\PROGRA~1\Sunplus\UNSPID~3\IDE180\cc1.exe C:\DOCUME~1\Àî»ªÀö.DOMAIN\LOCALS~1\Temp\cccxaaaa.i -fkeep-inline-functions -quiet -dumpbase DISPLAY.c -gstabs -o .\Debug/DISPLAY.asm
// gcc2_compiled.:

.stabs "E:\\RCL-Test/", 0x64, 0, 3, Ltext0
.stabs "E:/RCL-Test/DISPLAY.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "R_display:F19",36,0,0,',0,0,offset _R_display,seg _R_display,0x0d,0x0a
.CODE
.public _R_display
_R_display:	.proc
.debug
	.dw '.stabn 0x44,0,8,',0,0
	.dd LM1-_R_display
	.dw 0x0d,0x0a
.code
LM1:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,9,',0,0
	.dd LM2-_R_display
	.dw 0x0d,0x0a
.code
LM2:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=0	// HFmode immediate to register move
	R4=17096
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JL L13	// QImode GE
	PC=L3
L13:
.debug
	.dw '.stabn 0x44,0,11,',0,0
	.dd LM3-_R_display
	.dw 0x0d,0x0a
.code
LM3:
	R1=5	// QImode move
	[_g_array+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,12,',0,0
	.dd LM4-_R_display
	.dw 0x0d,0x0a
.code
LM4:
	R1=5	// QImode move
	[_g_array+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,13,',0,0
	.dd LM5-_R_display
	.dw 0x0d,0x0a
.code
LM5:
	R1=5	// QImode move
	[_g_array+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,14,',0,0
	.dd LM6-_R_display
	.dw 0x0d,0x0a
.code
LM6:
	R1=5	// QImode move
	[_g_array]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,17,',0,0
	.dd LM7-_R_display
	.dw 0x0d,0x0a
.code
LM7:
	R1=1	// QImode move
	[_g_speechID]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,18,',0,0
	.dd LM8-_R_display
	.dw 0x0d,0x0a
.code
LM8:
	R1=20	// QImode move
	[_g_Speechary]=R1	// QImode move
L3:
.debug
	.dw '.stabn 0x44,0,20,',0,0
	.dd LM9-_R_display
	.dw 0x0d,0x0a
.code
LM9:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=0	// HFmode immediate to register move
	R4=17096
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JNL L14	// QImode LT
	PC=L4
L14:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=49152	// HFmode immediate to register move
	R4=17529
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JNG L15	// QImode GT
	PC=L4
L15:
.debug
	.dw '.stabn 0x44,0,22,',0,0
	.dd LM10-_R_display
	.dw 0x0d,0x0a
.code
LM10:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	push R1,R2 to [sp]	// pushhf
	call __cvf2i1	// call with return value
	SP=SP+2
	[_g_uiAx]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM11-_R_display
	.dw 0x0d,0x0a
.code
LM11:
	R1=[_g_uiAx]	// QImode move
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	[_g_array+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,24,',0,0
	.dd LM12-_R_display
	.dw 0x0d,0x0a
.code
LM12:
	R1=[_g_uiAx]	// QImode move
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	[_g_array+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,25,',0,0
	.dd LM13-_R_display
	.dw 0x0d,0x0a
.code
LM13:
	R1=[_g_uiAx]	// QImode move
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	[_g_array+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,26,',0,0
	.dd LM14-_R_display
	.dw 0x0d,0x0a
.code
LM14:
	R1=0	// QImode move
	[_g_array]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,29,',0,0
	.dd LM15-_R_display
	.dw 0x0d,0x0a
.code
LM15:
	R1=[_g_array+3]	// QImode move
	[_g_Speechary]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,30,',0,0
	.dd LM16-_R_display
	.dw 0x0d,0x0a
.code
LM16:
	R1=12	// QImode move
	[_g_Speechary+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,31,',0,0
	.dd LM17-_R_display
	.dw 0x0d,0x0a
.code
LM17:
	R1=[_g_array+2]	// QImode move
	CMP R1,0	// QImode test
	JZ L16	// QImode NE
	PC=L5
L16:
.debug
	.dw '.stabn 0x44,0,32,',0,0
	.dd LM18-_R_display
	.dw 0x0d,0x0a
.code
LM18:
	R1=3	// QImode move
	[_g_speechID]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,33,',0,0
	.dd LM19-_R_display
	.dw 0x0d,0x0a
.code
LM19:
	R1=16	// QImode move
	[_g_Speechary+2]=R1	// QImode move
L5:
.debug
	.dw '.stabn 0x44,0,35,',0,0
	.dd LM20-_R_display
	.dw 0x0d,0x0a
.code
LM20:
	R1=[_g_array+2]	// QImode move
	[_g_Speechary+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,36,',0,0
	.dd LM21-_R_display
	.dw 0x0d,0x0a
.code
LM21:
	R1=11	// QImode move
	[_g_Speechary+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,37,',0,0
	.dd LM22-_R_display
	.dw 0x0d,0x0a
.code
LM22:
	R1=16	// QImode move
	[_g_Speechary+4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,38,',0,0
	.dd LM23-_R_display
	.dw 0x0d,0x0a
.code
LM23:
	R1=5	// QImode move
	[_g_speechID]=R1	// QImode move
L4:
.debug
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM24-_R_display
	.dw 0x0d,0x0a
.code
LM24:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=0	// HFmode immediate to register move
	R4=17530
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JNL L17	// QImode LT
	PC=L6
L17:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=15360	// HFmode immediate to register move
	R4=17948
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JNG L18	// QImode GT
	PC=L6
L18:
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM25-_R_display
	.dw 0x0d,0x0a
.code
LM25:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	push R1,R2 to [sp]	// pushhf
	call __cvf2i1	// call with return value
	SP=SP+2
	[_g_uiAx]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,45,',0,0
	.dd LM26-_R_display
	.dw 0x0d,0x0a
.code
LM26:
	R1=[_g_uiAx]	// QImode move
	R2=1000	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	[_g_array+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,46,',0,0
	.dd LM27-_R_display
	.dw 0x0d,0x0a
.code
LM27:
	R1=[_g_uiAx]	// QImode move
	R2=1000	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	[_g_array+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM28-_R_display
	.dw 0x0d,0x0a
.code
LM28:
	R1=[_g_uiAx]	// QImode move
	R2=1000	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	[_g_array+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,48,',0,0
	.dd LM29-_R_display
	.dw 0x0d,0x0a
.code
LM29:
	R1=1	// QImode move
	[_g_array]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,51,',0,0
	.dd LM30-_R_display
	.dw 0x0d,0x0a
.code
LM30:
	R1=[_g_array+3]	// QImode move
	[_g_Speechary]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,52,',0,0
	.dd LM31-_R_display
	.dw 0x0d,0x0a
.code
LM31:
	R1=10	// QImode move
	[_g_Speechary+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,53,',0,0
	.dd LM32-_R_display
	.dw 0x0d,0x0a
.code
LM32:
	R1=[_g_array+2]	// QImode move
	[_g_Speechary+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM33-_R_display
	.dw 0x0d,0x0a
.code
LM33:
	R1=13	// QImode move
	[_g_Speechary+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,55,',0,0
	.dd LM34-_R_display
	.dw 0x0d,0x0a
.code
LM34:
	R1=16	// QImode move
	[_g_Speechary+4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM35-_R_display
	.dw 0x0d,0x0a
.code
LM35:
	R1=5	// QImode move
	[_g_speechID]=R1	// QImode move
L6:
.debug
	.dw '.stabn 0x44,0,59,',0,0
	.dd LM36-_R_display
	.dw 0x0d,0x0a
.code
LM36:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=16384	// HFmode immediate to register move
	R4=17948
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JNL L19	// QImode LT
	PC=L7
L19:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=20352	// HFmode immediate to register move
	R4=18371
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JNG L20	// QImode GT
	PC=L7
L20:
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM37-_R_display
	.dw 0x0d,0x0a
.code
LM37:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=0	// HFmode immediate to register move
	R4=17096
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __divf2	// call with return value
	SP=SP+4
	R3=[BP]	// QImode move
	[R3++]=R1	// [RD]=RS HFmode, RD!=RS+1
	[R3--]=R2
.debug
	.dw '.stabn 0x44,0,61,',0,0
	.dd LM38-_R_display
	.dw 0x0d,0x0a
.code
LM38:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	push R1,R2 to [sp]	// pushhf
	call __cvf2i1	// call with return value
	SP=SP+2
	[_g_uiAx]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,62,',0,0
	.dd LM39-_R_display
	.dw 0x0d,0x0a
.code
LM39:
	R1=[_g_uiAx]	// QImode move
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	[_g_array+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,63,',0,0
	.dd LM40-_R_display
	.dw 0x0d,0x0a
.code
LM40:
	R1=[_g_uiAx]	// QImode move
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	[_g_array+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,64,',0,0
	.dd LM41-_R_display
	.dw 0x0d,0x0a
.code
LM41:
	R1=[_g_uiAx]	// QImode move
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	[_g_array+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,65,',0,0
	.dd LM42-_R_display
	.dw 0x0d,0x0a
.code
LM42:
	R1=2	// QImode move
	[_g_array]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,68,',0,0
	.dd LM43-_R_display
	.dw 0x0d,0x0a
.code
LM43:
	R1=[_g_array+3]	// QImode move
	[_g_Speechary]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,69,',0,0
	.dd LM44-_R_display
	.dw 0x0d,0x0a
.code
LM44:
	R1=11	// QImode move
	[_g_Speechary+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM45-_R_display
	.dw 0x0d,0x0a
.code
LM45:
	R1=[_g_array+2]	// QImode move
	[_g_Speechary+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,71,',0,0
	.dd LM46-_R_display
	.dw 0x0d,0x0a
.code
LM46:
	R1=13	// QImode move
	[_g_Speechary+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM47-_R_display
	.dw 0x0d,0x0a
.code
LM47:
	R1=16	// QImode move
	[_g_Speechary+4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,73,',0,0
	.dd LM48-_R_display
	.dw 0x0d,0x0a
.code
LM48:
	R1=5	// QImode move
	[_g_speechID]=R1	// QImode move
L7:
.debug
	.dw '.stabn 0x44,0,76,',0,0
	.dd LM49-_R_display
	.dw 0x0d,0x0a
.code
LM49:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=20480	// HFmode immediate to register move
	R4=18371
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JNL L21	// QImode LT
	PC=L8
L21:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=9200	// HFmode immediate to register move
	R4=18804
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JNG L22	// QImode GT
	PC=L8
L22:
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM50-_R_display
	.dw 0x0d,0x0a
.code
LM50:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=0	// HFmode immediate to register move
	R4=17530
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __divf2	// call with return value
	SP=SP+4
	R3=[BP]	// QImode move
	[R3++]=R1	// [RD]=RS HFmode, RD!=RS+1
	[R3--]=R2
.debug
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM51-_R_display
	.dw 0x0d,0x0a
.code
LM51:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	push R1,R2 to [sp]	// pushhf
	call __cvf2i1	// call with return value
	SP=SP+2
	[_g_uiAx]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,79,',0,0
	.dd LM52-_R_display
	.dw 0x0d,0x0a
.code
LM52:
	R1=[_g_uiAx]	// QImode move
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	[_g_array+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,80,',0,0
	.dd LM53-_R_display
	.dw 0x0d,0x0a
.code
LM53:
	R1=[_g_uiAx]	// QImode move
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	[_g_array+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,81,',0,0
	.dd LM54-_R_display
	.dw 0x0d,0x0a
.code
LM54:
	R1=[_g_uiAx]	// QImode move
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	[_g_array+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,82,',0,0
	.dd LM55-_R_display
	.dw 0x0d,0x0a
.code
LM55:
	R1=3	// QImode move
	[_g_array]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,85,',0,0
	.dd LM56-_R_display
	.dw 0x0d,0x0a
.code
LM56:
	R1=[_g_array+3]	// QImode move
	[_g_Speechary]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,86,',0,0
	.dd LM57-_R_display
	.dw 0x0d,0x0a
.code
LM57:
	R1=12	// QImode move
	[_g_Speechary+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,87,',0,0
	.dd LM58-_R_display
	.dw 0x0d,0x0a
.code
LM58:
	R1=[_g_array+2]	// QImode move
	CMP R1,0	// QImode test
	JZ L23	// QImode NE
	PC=L9
L23:
.debug
	.dw '.stabn 0x44,0,88,',0,0
	.dd LM59-_R_display
	.dw 0x0d,0x0a
.code
LM59:
	R1=13	// QImode move
	[_g_Speechary+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,89,',0,0
	.dd LM60-_R_display
	.dw 0x0d,0x0a
.code
LM60:
	R1=16	// QImode move
	[_g_Speechary+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,90,',0,0
	.dd LM61-_R_display
	.dw 0x0d,0x0a
.code
LM61:
	R1=4	// QImode move
	[_g_speechID]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,91,',0,0
	.dd LM62-_R_display
	.dw 0x0d,0x0a
.code
LM62:
	pc=L8	// jump
L9:
.debug
	.dw '.stabn 0x44,0,94,',0,0
	.dd LM63-_R_display
	.dw 0x0d,0x0a
.code
LM63:
	R1=[_g_array+2]	// QImode move
	[_g_Speechary+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,95,',0,0
	.dd LM64-_R_display
	.dw 0x0d,0x0a
.code
LM64:
	R1=11	// QImode move
	[_g_Speechary+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,96,',0,0
	.dd LM65-_R_display
	.dw 0x0d,0x0a
.code
LM65:
	R1=13	// QImode move
	[_g_Speechary+4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,97,',0,0
	.dd LM66-_R_display
	.dw 0x0d,0x0a
.code
LM66:
	R1=16	// QImode move
	[_g_Speechary+5]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,98,',0,0
	.dd LM67-_R_display
	.dw 0x0d,0x0a
.code
LM67:
	R1=6	// QImode move
	[_g_speechID]=R1	// QImode move
L10:
L8:
.debug
	.dw '.stabn 0x44,0,102,',0,0
	.dd LM68-_R_display
	.dw 0x0d,0x0a
.code
LM68:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=9216	// HFmode immediate to register move
	R4=18804
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JZ L24	// QImode NE
	PC=L11
L24:
.debug
	.dw '.stabn 0x44,0,104,',0,0
	.dd LM69-_R_display
	.dw 0x0d,0x0a
.code
LM69:
	R1=1	// QImode move
	[_g_array+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,105,',0,0
	.dd LM70-_R_display
	.dw 0x0d,0x0a
.code
LM70:
	R1=0	// QImode move
	[_g_array+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,106,',0,0
	.dd LM71-_R_display
	.dw 0x0d,0x0a
.code
LM71:
	R1=0	// QImode move
	[_g_array+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,107,',0,0
	.dd LM72-_R_display
	.dw 0x0d,0x0a
.code
LM72:
	R1=4	// QImode move
	[_g_array]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,110,',0,0
	.dd LM73-_R_display
	.dw 0x0d,0x0a
.code
LM73:
	R1=1	// QImode move
	[_g_Speechary]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,111,',0,0
	.dd LM74-_R_display
	.dw 0x0d,0x0a
.code
LM74:
	R1=15	// QImode move
	[_g_Speechary+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,112,',0,0
	.dd LM75-_R_display
	.dw 0x0d,0x0a
.code
LM75:
	R1=16	// QImode move
	[_g_Speechary+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,113,',0,0
	.dd LM76-_R_display
	.dw 0x0d,0x0a
.code
LM76:
	R1=3	// QImode move
	[_g_speechID]=R1	// QImode move
L11:
.debug
	.dw '.stabn 0x44,0,115,',0,0
	.dd LM77-_R_display
	.dw 0x0d,0x0a
.code
LM77:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=9216	// HFmode immediate to register move
	R4=18804
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JG L25	// QImode LE
	PC=L12
L25:
.debug
	.dw '.stabn 0x44,0,117,',0,0
	.dd LM78-_R_display
	.dw 0x0d,0x0a
.code
LM78:
	R1=0	// QImode move
	[_g_array+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,118,',0,0
	.dd LM79-_R_display
	.dw 0x0d,0x0a
.code
LM79:
	R1=0	// QImode move
	[_g_array+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,119,',0,0
	.dd LM80-_R_display
	.dw 0x0d,0x0a
.code
LM80:
	R1=0	// QImode move
	[_g_array+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,120,',0,0
	.dd LM81-_R_display
	.dw 0x0d,0x0a
.code
LM81:
	R1=0	// QImode move
	[_g_array]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,123,',0,0
	.dd LM82-_R_display
	.dw 0x0d,0x0a
.code
LM82:
	R1=1	// QImode move
	[_g_speechID]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,124,',0,0
	.dd LM83-_R_display
	.dw 0x0d,0x0a
.code
LM83:
	R1=21	// QImode move
	[_g_Speechary]=R1	// QImode move
L12:
.debug
	.dw '.stabn 0x44,0,128,',0,0
	.dd LM84-_R_display
	.dw 0x0d,0x0a
.code
LM84:
.debug
	.dw '.stabn 0x44,0,128,',0,0
	.dd LM85-_R_display
	.dw 0x0d,0x0a
.code
LM85:
L2:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of R_display

.debug
	.dw '.stabs "Rx:p12",160,0,0,4',0x0d,0x0a
.CODE
.debug
	.dw '.stabf ',0,0
	.dd LME1-_R_display
	.dw 0x0d,0x0a
.code
LME1:
.code
.debug
	.dw '.stabs "C_display:F19",36,0,0,',0,0,offset _C_display,seg _C_display,0x0d,0x0a
.CODE
.public _C_display
_C_display:	.proc
.debug
	.dw '.stabn 0x44,0,131,',0,0
	.dd LM86-_C_display
	.dw 0x0d,0x0a
.code
LM86:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,132,',0,0
	.dd LM87-_C_display
	.dw 0x0d,0x0a
.code
LM87:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=0	// HFmode immediate to register move
	R4=17096
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JL L35	// QImode GE
	PC=L27
L35:
.debug
	.dw '.stabn 0x44,0,134,',0,0
	.dd LM88-_C_display
	.dw 0x0d,0x0a
.code
LM88:
	R1=5	// QImode move
	[_g_array+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,135,',0,0
	.dd LM89-_C_display
	.dw 0x0d,0x0a
.code
LM89:
	R1=5	// QImode move
	[_g_array+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,136,',0,0
	.dd LM90-_C_display
	.dw 0x0d,0x0a
.code
LM90:
	R1=5	// QImode move
	[_g_array+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,137,',0,0
	.dd LM91-_C_display
	.dw 0x0d,0x0a
.code
LM91:
	R1=5	// QImode move
	[_g_array]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,139,',0,0
	.dd LM92-_C_display
	.dw 0x0d,0x0a
.code
LM92:
	R1=1	// QImode move
	[_g_speechID]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,140,',0,0
	.dd LM93-_C_display
	.dw 0x0d,0x0a
.code
LM93:
	R1=22	// QImode move
	[_g_Speechary]=R1	// QImode move
L27:
.debug
	.dw '.stabn 0x44,0,142,',0,0
	.dd LM94-_C_display
	.dw 0x0d,0x0a
.code
LM94:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=0	// HFmode immediate to register move
	R4=17096
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JNL L36	// QImode LT
	PC=L28
L36:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=49152	// HFmode immediate to register move
	R4=17529
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JNG L37	// QImode GT
	PC=L28
L37:
.debug
	.dw '.stabn 0x44,0,144,',0,0
	.dd LM95-_C_display
	.dw 0x0d,0x0a
.code
LM95:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	push R1,R2 to [sp]	// pushhf
	call __cvf2i1	// call with return value
	SP=SP+2
	[_g_uiAx]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,145,',0,0
	.dd LM96-_C_display
	.dw 0x0d,0x0a
.code
LM96:
	R1=[_g_uiAx]	// QImode move
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	[_g_array+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,146,',0,0
	.dd LM97-_C_display
	.dw 0x0d,0x0a
.code
LM97:
	R1=[_g_uiAx]	// QImode move
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	[_g_array+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,147,',0,0
	.dd LM98-_C_display
	.dw 0x0d,0x0a
.code
LM98:
	R1=[_g_uiAx]	// QImode move
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	[_g_array+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,148,',0,0
	.dd LM99-_C_display
	.dw 0x0d,0x0a
.code
LM99:
	R1=0	// QImode move
	[_g_array]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,151,',0,0
	.dd LM100-_C_display
	.dw 0x0d,0x0a
.code
LM100:
	R1=[_g_array+3]	// QImode move
	[_g_Speechary]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,152,',0,0
	.dd LM101-_C_display
	.dw 0x0d,0x0a
.code
LM101:
	R1=12	// QImode move
	[_g_Speechary+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,153,',0,0
	.dd LM102-_C_display
	.dw 0x0d,0x0a
.code
LM102:
	R1=[_g_array+2]	// QImode move
	CMP R1,0	// QImode test
	JZ L38	// QImode NE
	PC=L29
L38:
.debug
	.dw '.stabn 0x44,0,154,',0,0
	.dd LM103-_C_display
	.dw 0x0d,0x0a
.code
LM103:
	R1=3	// QImode move
	[_g_speechID]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,155,',0,0
	.dd LM104-_C_display
	.dw 0x0d,0x0a
.code
LM104:
	R1=17	// QImode move
	[_g_Speechary+2]=R1	// QImode move
L29:
.debug
	.dw '.stabn 0x44,0,157,',0,0
	.dd LM105-_C_display
	.dw 0x0d,0x0a
.code
LM105:
	R1=[_g_array+2]	// QImode move
	[_g_Speechary+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,158,',0,0
	.dd LM106-_C_display
	.dw 0x0d,0x0a
.code
LM106:
	R1=11	// QImode move
	[_g_Speechary+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,159,',0,0
	.dd LM107-_C_display
	.dw 0x0d,0x0a
.code
LM107:
	R1=17	// QImode move
	[_g_Speechary+4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,160,',0,0
	.dd LM108-_C_display
	.dw 0x0d,0x0a
.code
LM108:
	R1=5	// QImode move
	[_g_speechID]=R1	// QImode move
L28:
.debug
	.dw '.stabn 0x44,0,162,',0,0
	.dd LM109-_C_display
	.dw 0x0d,0x0a
.code
LM109:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=0	// HFmode immediate to register move
	R4=17530
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JNL L39	// QImode LT
	PC=L30
L39:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=15360	// HFmode immediate to register move
	R4=17948
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JNG L40	// QImode GT
	PC=L30
L40:
.debug
	.dw '.stabn 0x44,0,165,',0,0
	.dd LM110-_C_display
	.dw 0x0d,0x0a
.code
LM110:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	push R1,R2 to [sp]	// pushhf
	call __cvf2i1	// call with return value
	SP=SP+2
	[_g_uiAx]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,166,',0,0
	.dd LM111-_C_display
	.dw 0x0d,0x0a
.code
LM111:
	R1=[_g_uiAx]	// QImode move
	R2=1000	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	[_g_array+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,167,',0,0
	.dd LM112-_C_display
	.dw 0x0d,0x0a
.code
LM112:
	R1=[_g_uiAx]	// QImode move
	R2=1000	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	[_g_array+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,168,',0,0
	.dd LM113-_C_display
	.dw 0x0d,0x0a
.code
LM113:
	R1=[_g_uiAx]	// QImode move
	R2=1000	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	[_g_array+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,169,',0,0
	.dd LM114-_C_display
	.dw 0x0d,0x0a
.code
LM114:
	R1=1	// QImode move
	[_g_array]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,172,',0,0
	.dd LM115-_C_display
	.dw 0x0d,0x0a
.code
LM115:
	R1=[_g_array+3]	// QImode move
	[_g_Speechary]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,173,',0,0
	.dd LM116-_C_display
	.dw 0x0d,0x0a
.code
LM116:
	R1=27	// QImode move
	[_g_Speechary+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,174,',0,0
	.dd LM117-_C_display
	.dw 0x0d,0x0a
.code
LM117:
	R1=[_g_array+2]	// QImode move
	CMP R1,0	// QImode test
	JZ L41	// QImode NE
	PC=L31
L41:
.debug
	.dw '.stabn 0x44,0,175,',0,0
	.dd LM118-_C_display
	.dw 0x0d,0x0a
.code
LM118:
	R1=3	// QImode move
	[_g_speechID]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,176,',0,0
	.dd LM119-_C_display
	.dw 0x0d,0x0a
.code
LM119:
	R1=17	// QImode move
	[_g_Speechary+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,177,',0,0
	.dd LM120-_C_display
	.dw 0x0d,0x0a
.code
LM120:
	pc=L30	// jump
L31:
.debug
	.dw '.stabn 0x44,0,180,',0,0
	.dd LM121-_C_display
	.dw 0x0d,0x0a
.code
LM121:
	R1=[_g_array+2]	// QImode move
	[_g_Speechary+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,181,',0,0
	.dd LM122-_C_display
	.dw 0x0d,0x0a
.code
LM122:
	R1=12	// QImode move
	[_g_Speechary+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,182,',0,0
	.dd LM123-_C_display
	.dw 0x0d,0x0a
.code
LM123:
	R1=17	// QImode move
	[_g_Speechary+4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,183,',0,0
	.dd LM124-_C_display
	.dw 0x0d,0x0a
.code
LM124:
	R1=5	// QImode move
	[_g_speechID]=R1	// QImode move
L32:
L30:
.debug
	.dw '.stabn 0x44,0,187,',0,0
	.dd LM125-_C_display
	.dw 0x0d,0x0a
.code
LM125:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=16384	// HFmode immediate to register move
	R4=17948
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JZ L42	// QImode NE
	PC=L33
L42:
.debug
	.dw '.stabn 0x44,0,189,',0,0
	.dd LM126-_C_display
	.dw 0x0d,0x0a
.code
LM126:
	R1=1	// QImode move
	[_g_array+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,190,',0,0
	.dd LM127-_C_display
	.dw 0x0d,0x0a
.code
LM127:
	R1=0	// QImode move
	[_g_array+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,191,',0,0
	.dd LM128-_C_display
	.dw 0x0d,0x0a
.code
LM128:
	R1=0	// QImode move
	[_g_array+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,192,',0,0
	.dd LM129-_C_display
	.dw 0x0d,0x0a
.code
LM129:
	R1=2	// QImode move
	[_g_array]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,194,',0,0
	.dd LM130-_C_display
	.dw 0x0d,0x0a
.code
LM130:
	R1=1	// QImode move
	[_g_Speechary]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,195,',0,0
	.dd LM131-_C_display
	.dw 0x0d,0x0a
.code
LM131:
	R1=14	// QImode move
	[_g_Speechary+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,196,',0,0
	.dd LM132-_C_display
	.dw 0x0d,0x0a
.code
LM132:
	R1=16	// QImode move
	[_g_Speechary+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,197,',0,0
	.dd LM133-_C_display
	.dw 0x0d,0x0a
.code
LM133:
	R1=3	// QImode move
	[_g_speechID]=R1	// QImode move
L33:
.debug
	.dw '.stabn 0x44,0,199,',0,0
	.dd LM134-_C_display
	.dw 0x0d,0x0a
.code
LM134:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=16384	// HFmode immediate to register move
	R4=17948
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JG L43	// QImode LE
	PC=L34
L43:
.debug
	.dw '.stabn 0x44,0,202,',0,0
	.dd LM135-_C_display
	.dw 0x0d,0x0a
.code
LM135:
	R1=0	// QImode move
	[_g_array+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,203,',0,0
	.dd LM136-_C_display
	.dw 0x0d,0x0a
.code
LM136:
	R1=0	// QImode move
	[_g_array+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,204,',0,0
	.dd LM137-_C_display
	.dw 0x0d,0x0a
.code
LM137:
	R1=0	// QImode move
	[_g_array+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,205,',0,0
	.dd LM138-_C_display
	.dw 0x0d,0x0a
.code
LM138:
	R1=0	// QImode move
	[_g_array]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,208,',0,0
	.dd LM139-_C_display
	.dw 0x0d,0x0a
.code
LM139:
	R1=1	// QImode move
	[_g_speechID]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,209,',0,0
	.dd LM140-_C_display
	.dw 0x0d,0x0a
.code
LM140:
	R1=23	// QImode move
	[_g_Speechary]=R1	// QImode move
L34:
.debug
	.dw '.stabn 0x44,0,212,',0,0
	.dd LM141-_C_display
	.dw 0x0d,0x0a
.code
LM141:
.debug
	.dw '.stabn 0x44,0,212,',0,0
	.dd LM142-_C_display
	.dw 0x0d,0x0a
.code
LM142:
L26:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of C_display

.debug
	.dw '.stabs "Cx:p12",160,0,0,4',0x0d,0x0a
.CODE
.debug
	.dw '.stabf ',0,0
	.dd LME2-_C_display
	.dw 0x0d,0x0a
.code
LME2:
.code
.debug
	.dw '.stabs "L_display:F19",36,0,0,',0,0,offset _L_display,seg _L_display,0x0d,0x0a
.CODE
.public _L_display
_L_display:	.proc
.debug
	.dw '.stabn 0x44,0,215,',0,0
	.dd LM143-_L_display
	.dw 0x0d,0x0a
.code
LM143:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,216,',0,0
	.dd LM144-_L_display
	.dw 0x0d,0x0a
.code
LM144:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=0	// HFmode immediate to register move
	R4=17096
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JL L52	// QImode GE
	PC=L45
L52:
.debug
	.dw '.stabn 0x44,0,218,',0,0
	.dd LM145-_L_display
	.dw 0x0d,0x0a
.code
LM145:
	R1=5	// QImode move
	[_g_array+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,219,',0,0
	.dd LM146-_L_display
	.dw 0x0d,0x0a
.code
LM146:
	R1=5	// QImode move
	[_g_array+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,220,',0,0
	.dd LM147-_L_display
	.dw 0x0d,0x0a
.code
LM147:
	R1=5	// QImode move
	[_g_array+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,221,',0,0
	.dd LM148-_L_display
	.dw 0x0d,0x0a
.code
LM148:
	R1=5	// QImode move
	[_g_array]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,224,',0,0
	.dd LM149-_L_display
	.dw 0x0d,0x0a
.code
LM149:
	R1=1	// QImode move
	[_g_speechID]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,225,',0,0
	.dd LM150-_L_display
	.dw 0x0d,0x0a
.code
LM150:
	R1=24	// QImode move
	[_g_Speechary]=R1	// QImode move
L45:
.debug
	.dw '.stabn 0x44,0,227,',0,0
	.dd LM151-_L_display
	.dw 0x0d,0x0a
.code
LM151:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=0	// HFmode immediate to register move
	R4=17096
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JNL L53	// QImode LT
	PC=L46
L53:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=49152	// HFmode immediate to register move
	R4=17529
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JNG L54	// QImode GT
	PC=L46
L54:
.debug
	.dw '.stabn 0x44,0,229,',0,0
	.dd LM152-_L_display
	.dw 0x0d,0x0a
.code
LM152:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	push R1,R2 to [sp]	// pushhf
	call __cvf2i1	// call with return value
	SP=SP+2
	[_g_uiAx]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,230,',0,0
	.dd LM153-_L_display
	.dw 0x0d,0x0a
.code
LM153:
	R1=[_g_uiAx]	// QImode move
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	[_g_array+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,231,',0,0
	.dd LM154-_L_display
	.dw 0x0d,0x0a
.code
LM154:
	R1=[_g_uiAx]	// QImode move
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	[_g_array+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,232,',0,0
	.dd LM155-_L_display
	.dw 0x0d,0x0a
.code
LM155:
	R1=[_g_uiAx]	// QImode move
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	[_g_array+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,233,',0,0
	.dd LM156-_L_display
	.dw 0x0d,0x0a
.code
LM156:
	R1=0	// QImode move
	[_g_array]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,236,',0,0
	.dd LM157-_L_display
	.dw 0x0d,0x0a
.code
LM157:
	R1=[_g_array+3]	// QImode move
	[_g_Speechary]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,237,',0,0
	.dd LM158-_L_display
	.dw 0x0d,0x0a
.code
LM158:
	R1=12	// QImode move
	[_g_Speechary+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,238,',0,0
	.dd LM159-_L_display
	.dw 0x0d,0x0a
.code
LM159:
	R1=[_g_array+2]	// QImode move
	CMP R1,0	// QImode test
	JZ L55	// QImode NE
	PC=L47
L55:
.debug
	.dw '.stabn 0x44,0,239,',0,0
	.dd LM160-_L_display
	.dw 0x0d,0x0a
.code
LM160:
	R1=3	// QImode move
	[_g_speechID]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,240,',0,0
	.dd LM161-_L_display
	.dw 0x0d,0x0a
.code
LM161:
	R1=18	// QImode move
	[_g_Speechary+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,241,',0,0
	.dd LM162-_L_display
	.dw 0x0d,0x0a
.code
LM162:
	pc=L46	// jump
L47:
.debug
	.dw '.stabn 0x44,0,244,',0,0
	.dd LM163-_L_display
	.dw 0x0d,0x0a
.code
LM163:
	R1=[_g_array+2]	// QImode move
	[_g_Speechary+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,245,',0,0
	.dd LM164-_L_display
	.dw 0x0d,0x0a
.code
LM164:
	R1=11	// QImode move
	[_g_Speechary+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,246,',0,0
	.dd LM165-_L_display
	.dw 0x0d,0x0a
.code
LM165:
	R1=18	// QImode move
	[_g_Speechary+4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,247,',0,0
	.dd LM166-_L_display
	.dw 0x0d,0x0a
.code
LM166:
	R1=5	// QImode move
	[_g_speechID]=R1	// QImode move
L48:
L46:
.debug
	.dw '.stabn 0x44,0,250,',0,0
	.dd LM167-_L_display
	.dw 0x0d,0x0a
.code
LM167:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=0	// HFmode immediate to register move
	R4=17530
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JNL L56	// QImode LT
	PC=L49
L56:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=15360	// HFmode immediate to register move
	R4=17948
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JNG L57	// QImode GT
	PC=L49
L57:
.debug
	.dw '.stabn 0x44,0,253,',0,0
	.dd LM168-_L_display
	.dw 0x0d,0x0a
.code
LM168:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	push R1,R2 to [sp]	// pushhf
	call __cvf2i1	// call with return value
	SP=SP+2
	[_g_uiAx]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,254,',0,0
	.dd LM169-_L_display
	.dw 0x0d,0x0a
.code
LM169:
	R1=[_g_uiAx]	// QImode move
	R2=1000	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	[_g_array+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,255,',0,0
	.dd LM170-_L_display
	.dw 0x0d,0x0a
.code
LM170:
	R1=[_g_uiAx]	// QImode move
	R2=1000	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	[_g_array+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,256,',0,0
	.dd LM171-_L_display
	.dw 0x0d,0x0a
.code
LM171:
	R1=[_g_uiAx]	// QImode move
	R2=1000	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	[_g_array+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,257,',0,0
	.dd LM172-_L_display
	.dw 0x0d,0x0a
.code
LM172:
	R1=1	// QImode move
	[_g_array]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,260,',0,0
	.dd LM173-_L_display
	.dw 0x0d,0x0a
.code
LM173:
	R1=[_g_array+3]	// QImode move
	[_g_Speechary]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,261,',0,0
	.dd LM174-_L_display
	.dw 0x0d,0x0a
.code
LM174:
	R1=10	// QImode move
	[_g_Speechary+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,262,',0,0
	.dd LM175-_L_display
	.dw 0x0d,0x0a
.code
LM175:
	R1=[_g_array+2]	// QImode move
	[_g_Speechary+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,263,',0,0
	.dd LM176-_L_display
	.dw 0x0d,0x0a
.code
LM176:
	R1=19	// QImode move
	[_g_Speechary+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,264,',0,0
	.dd LM177-_L_display
	.dw 0x0d,0x0a
.code
LM177:
	R1=4	// QImode move
	[_g_speechID]=R1	// QImode move
L49:
.debug
	.dw '.stabn 0x44,0,267,',0,0
	.dd LM178-_L_display
	.dw 0x0d,0x0a
.code
LM178:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=16384	// HFmode immediate to register move
	R4=17948
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JZ L58	// QImode NE
	PC=L50
L58:
.debug
	.dw '.stabn 0x44,0,269,',0,0
	.dd LM179-_L_display
	.dw 0x0d,0x0a
.code
LM179:
	R1=1	// QImode move
	[_g_array+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,270,',0,0
	.dd LM180-_L_display
	.dw 0x0d,0x0a
.code
LM180:
	R1=0	// QImode move
	[_g_array+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,271,',0,0
	.dd LM181-_L_display
	.dw 0x0d,0x0a
.code
LM181:
	R1=0	// QImode move
	[_g_array+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,272,',0,0
	.dd LM182-_L_display
	.dw 0x0d,0x0a
.code
LM182:
	R1=2	// QImode move
	[_g_array]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,275,',0,0
	.dd LM183-_L_display
	.dw 0x0d,0x0a
.code
LM183:
	R1=11	// QImode move
	[_g_Speechary]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,276,',0,0
	.dd LM184-_L_display
	.dw 0x0d,0x0a
.code
LM184:
	R1=19	// QImode move
	[_g_Speechary+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,277,',0,0
	.dd LM185-_L_display
	.dw 0x0d,0x0a
.code
LM185:
	R1=2	// QImode move
	[_g_speechID]=R1	// QImode move
L50:
.debug
	.dw '.stabn 0x44,0,279,',0,0
	.dd LM186-_L_display
	.dw 0x0d,0x0a
.code
LM186:
	R3=[BP]	// QImode move
	R1=[R3++]	// RD=[RS] HFmode, RD!=RS
	R2=[R3--]
	R3=16384	// HFmode immediate to register move
	R4=17948
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JG L59	// QImode LE
	PC=L51
L59:
.debug
	.dw '.stabn 0x44,0,282,',0,0
	.dd LM187-_L_display
	.dw 0x0d,0x0a
.code
LM187:
	R1=0	// QImode move
	[_g_array+3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,283,',0,0
	.dd LM188-_L_display
	.dw 0x0d,0x0a
.code
LM188:
	R1=0	// QImode move
	[_g_array+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,284,',0,0
	.dd LM189-_L_display
	.dw 0x0d,0x0a
.code
LM189:
	R1=0	// QImode move
	[_g_array+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,285,',0,0
	.dd LM190-_L_display
	.dw 0x0d,0x0a
.code
LM190:
	R1=0	// QImode move
	[_g_array]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,288,',0,0
	.dd LM191-_L_display
	.dw 0x0d,0x0a
.code
LM191:
	R1=1	// QImode move
	[_g_speechID]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,289,',0,0
	.dd LM192-_L_display
	.dw 0x0d,0x0a
.code
LM192:
	R1=25	// QImode move
	[_g_Speechary]=R1	// QImode move
L51:
.debug
	.dw '.stabn 0x44,0,292,',0,0
	.dd LM193-_L_display
	.dw 0x0d,0x0a
.code
LM193:
.debug
	.dw '.stabn 0x44,0,292,',0,0
	.dd LM194-_L_display
	.dw 0x0d,0x0a
.code
LM194:
L44:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of L_display

.debug
	.dw '.stabs "Lx:p12",160,0,0,4',0x0d,0x0a
.CODE
.debug
	.dw '.stabf ',0,0
	.dd LME3-_L_display
	.dw 0x0d,0x0a
.code
LME3:
.debug
	.dw '.stabs "g_uiAx:G4",32,0,0,',0,0,offset _g_uiAx,seg _g_uiAx,0x0d,0x0a
.CODE
.ram
.public _g_uiAx
_g_uiAx:
	.dw 0
.external _g_Speechary
.external _g_speechID
.external _g_array
.external __cmpf2
.external __divu1
.external __modu1
.external __rshu1
.external __cvf2i1
.external __divf2
	.end
