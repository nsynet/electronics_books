// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\PROGRA~1\Sunplus\UNSPID~3\IDE180\cc1.exe C:\DOCUME~1\李华丽.DOMAIN\LOCALS~1\Temp\ccUvaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\电子竞赛\\C语言应用篇\\Source Code\\chapter7 AD&DA\\Chapter7_1_Linein/", 0x64, 0, 3, Ltext0
.stabs "F:/电子竞赛/C语言应用篇/Source Code/chapter7 AD&DA/Chapter7_1_Linein/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabn 0x44,0,5,',0,0
	.dd LM1-_main
	.dw 0x0d,0x0a
.code
LM1:
	// total=19, vars=19
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=19
	bp=sp+1

	R1=BP+22
	[bp+5]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,6,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
.debug
	.dw '.stabn 0x44,0,9,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	R1=BP	// QImode move
	R2=BP+3
	R3=0	// HFmode immediate to register move
	R4=0
	R1=R2	// QImode move
	[R1++]=R3	// [RD]=RS HFmode, RD!=RS+1
	[R1--]=R4
.debug
	.dw '.stabn 0x44,0,10,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R1=1	// QImode move
	[28715]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,11,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	R1=1	// QImode move
	[28693]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,12,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R1=[28716]	// QImode move
	R3=R1
	R4=0
	[BP++]=R3	// [RD]=RS HImode, RD!=RS+1
	[BP--]=R4
.debug
	.dw '.stabn 0x44,0,13,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R1=0	// HImode immediate to register move
	R2=0
	[BP++]=R1	// [RD]=RS HImode, RD!=RS+1
	[BP--]=R2
.debug
	.dw '.stabn 0x44,0,14,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	R1=BP	// QImode move
	R2=BP+2
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L3:
	R1=BP	// QImode move
	R2=BP+2
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,15	// QImode compare
	JA L10	// QImode LEU
	PC=L6
L10:
	pc=L4	// jump
L6:
.debug
	.dw '.stabn 0x44,0,16,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
	R1=1	// QImode move
	[28690]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,17,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	call _AD	// call with return value
	R3=R1
	R4=0
	[bp+16]=R3	// HImode [BP+#IM6]=RS
	[bp+17]=R4
	R1=[BP++]	// RD=[RS] HImode, RD!=RS
	R2=[BP--]
	[bp+6]=R1	// HImode [BP+#IM6]=RS
	[bp+7]=R2
	R3=[bp+6]	// QImode move
	[bp+8]=R3	// QImode move
	R4=[bp+8]	// QImode move
	R3=[bp+16]	// QImode move
	R4+=R3	// addqi3_r0r
	[bp+8]=R4	// QImode move
	R1=[bp+8]	// QImode move
	R4=1	// QImode move
	[bp+9]=R4	// QImode move
	R3=[bp+8]	// QImode move
	R4=[bp+6]	// QImode move
	CMP R3,R4	// QImode compare
	JNB L11	// QImode LTU
	PC=L7
L11:
	R3=0	// QImode move
	[bp+9]=R3	// QImode move
L7:
	R4=[bp+7]	// QImode move
	[bp+10]=R4	// QImode move
	R3=[bp+10]	// QImode move
	R4=[bp+17]	// QImode move
	R3+=R4	// addqi3_r0r
	[bp+10]=R3	// QImode move
	R2=[bp+10]	// QImode move
	R3=[bp+10]	// QImode move
	R4=[bp+9]	// QImode move
	R3+=R4	// addqi3_r0r
	R2=R3	// QImode move
	[BP++]=R1	// [RD]=RS HImode, RD!=RS+1
	[BP--]=R2
.debug
	.dw '.stabn 0x44,0,14,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
L5:
	R1=BP	// QImode move
	R2=BP+2
	R3=BP	// QImode move
	R1=BP+2
	R2=BP	// QImode move
	R3=BP+2
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,19,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	R1=[BP++]	// RD=[RS] HImode, RD!=RS
	R2=[BP--]
	R3=4	// QImode move
	[SP--]=R3	// QImode move
	push R1,R2 to [sp]	// pushhi
	call __rshu2	// call with return value
	SP=SP+3
	[BP++]=R1	// [RD]=RS HImode, RD!=RS+1
	[BP--]=R2
.debug
	.dw '.stabn 0x44,0,20,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	R1=BP	// QImode move
	R3=BP+3
	[bp+11]=R3	// QImode move
	R1=[BP++]	// RD=[RS] HImode, RD!=RS
	R2=[BP--]
	CMP R2,0	// HImode test
	JL  L12	// HImode LT
	JNZ L13
	CMP R1,0
	JNB L13
L12:
	PC=L9
L13:
	R1=[BP++]	// RD=[RS] HImode, RD!=RS
	R2=[BP--]
	push R1,R2 to [sp]	// pushhi
	call __cvi2f2	// call with return value
	SP=SP+2
	[bp+12]=R1	// HFmode [BP+#IM6]=RS
	[bp+13]=R2
	pc=L8	// jump
L9:
	R1=[BP++]	// RD=[RS] HImode, RD!=RS
	R2=[BP--]
	R3=R1&1	// HImode RD=RS&#IMM16
	R4=R2&0
	[bp+14]=R3	// HImode [BP+#IM6]=RS
	[bp+15]=R4
	R1=[BP++]	// RD=[RS] HImode, RD!=RS
	R2=[BP--]
	R3=1	// QImode move
	[SP--]=R3	// QImode move
	push R1,R2 to [sp]	// pushhi
	call __rshu2	// call with return value
	SP=SP+3
	R4=[bp+14]	// QImode move
	R3=R4	// QImode move
	R3|=R1
	R4=[bp+15]	// QImode move
	[bp+18]=R4	// QImode move
	R4=[bp+18]	// QImode move
	R4|=R2
	[bp+18]=R4	// QImode move
	R1=R3	// QImode move
	R2=[bp+18]	// QImode move
	push R1,R2 to [sp]	// pushhi
	call __cvi2f2	// call with return value
	SP=SP+2
	[bp+12]=R1	// HFmode [BP+#IM6]=RS
	[bp+13]=R2
	R1=[bp+12]	// HFmode RD=[BP+#IM6]
	R2=[bp+13]
	push R1,R2 to [sp]	// pushhf
	R3=[bp+12]	// HFmode RD=[BP+#IM6]
	R4=[bp+13]
	push R3,R4 to [sp]	// pushhf
	call __addf2	// call with return value
	SP=SP+4
	[bp+12]=R1	// HFmode [BP+#IM6]=RS
	[bp+13]=R2
L8:
	R1=49152	// HFmode immediate to register move
	R2=18303
	push R1,R2 to [sp]	// pushhf
	R1=[bp+12]	// HFmode RD=[BP+#IM6]
	R2=[bp+13]
	push R1,R2 to [sp]	// pushhf
	call __divf2	// call with return value
	SP=SP+4
	R3=13107	// HFmode immediate to register move
	R4=16467
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	R3=[bp+11]	// QImode move
	[R3++]=R1	// [RD]=RS HFmode, RD!=RS+1
	[R3--]=R2
.debug
	.dw '.stabn 0x44,0,21,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
LBE2:
.debug
	.dw '.stabn 0x44,0,21,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
L2:

	sp+=19
	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "uiData:5",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "i:4",128,0,0,2',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "fVoltage:12",128,0,0,3',0x0d,0x0a
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
.code
.debug
	.dw '.stabs "AD:F4",36,0,0,',0,0,offset _AD,seg _AD,0x0d,0x0a
.CODE
.public _AD
_AD:	.proc
.debug
	.dw '.stabn 0x44,0,24,',0,0
	.dd LM16-_AD
	.dw 0x0d,0x0a
.code
LM16:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R2=BP+4
.debug
	.dw '.stabn 0x44,0,25,',0,0
	.dd LM17-_AD
	.dw 0x0d,0x0a
.code
LM17:
LBB3:
.debug
	.dw '.stabn 0x44,0,26,',0,0
	.dd LM18-_AD
	.dw 0x0d,0x0a
.code
LM18:
L15:
	R3=[28715]	// QImode move
	R1=R3&(-32768)
	CMP R1,0	// QImode test
	JNZ L18	// QImode EQ
	PC=L17
L18:
	pc=L16	// jump
L17:
	pc=L15	// jump
L16:
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM19-_AD
	.dw 0x0d,0x0a
.code
LM19:
	R1=[28716]	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,28,',0,0
	.dd LM20-_AD
	.dw 0x0d,0x0a
.code
LM20:
	R1=[BP]	// QImode move
	R3=R1&(-64)
	R1=R3	// QImode move
	pc=L14	// jump
.debug
	.dw '.stabn 0x44,0,29,',0,0
	.dd LM21-_AD
	.dw 0x0d,0x0a
.code
LM21:
LBE3:
.debug
	.dw '.stabn 0x44,0,29,',0,0
	.dd LM22-_AD
	.dw 0x0d,0x0a
.code
LM22:
L14:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of AD

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB3-_AD
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "uiData:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE3-_AD
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME2-_AD
	.dw 0x0d,0x0a
.code
LME2:
.external __mulf2
.external __divf2
.external __addf2
.external __cvi2f2
.external __rshu2
	.end
