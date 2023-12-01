// GCC for SUNPLUS u'nSP version 1.0.10
// Command: D:\PROGRA~1\Sunplus\UNSPID~1\IDE180\cc1.exe D:\DOCUME~1\刘新颜\LOCALS~1\Temp\ccKEaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\功能扩展\\UpDown/", 0x64, 0, 3, Ltext0
.stabs "F:/功能扩展/UpDown/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "complex:T20=s4x:12,0,32;y:12,32,32;;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "exception:T21=s9type:1,0,16;name:22=*2,16,16;\\",128,0,0,0',0x0d,0x0a
	.DW '.stabs "arg1:13,32,32;arg2:13,64,32;retval:13,96,32;\\",128,0,0,0',0x0d,0x0a
	.DW '.stabs "err:1,128,16;;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "ieee_float_shape_type:t23=24=u2value:12,0,32;word:3,0,32;;",128,0,0,0',0x0d,0x0a
.CODE
.code
.debug
	.dw '.stabs "playS480:F19",36,0,0,',0,0,offset _playS480,seg _playS480,0x0d,0x0a
.CODE
.public _playS480
_playS480:	.proc
.debug
	.dw '.stabn 0x44,0,49,',0,0
	.dd LM1-_playS480
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
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM2-_playS480
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
.debug
	.dw '.stabn 0x44,0,51,',0,0
	.dd LM3-_playS480
	.dw 0x0d,0x0a
.code
LM3:
	R1=0	// QImode move
	[BP]=R1	// QImode move
L3:
	R1=[BP]	// QImode move
	CMP R1,0	// QImode test
	JNZ L10	// QImode EQ
	PC=L6
L10:
	pc=L4	// jump
L6:
.debug
	.dw '.stabn 0x44,0,52,',0,0
	.dd LM4-_playS480
	.dw 0x0d,0x0a
.code
LM4:
LBB3:
	call _Turnoff_INT_64Hz	// call with return value
.debug
	.dw '.stabn 0x44,0,53,',0,0
	.dd LM5-_playS480
	.dw 0x0d,0x0a
.code
LM5:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_S480_Initial	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM6-_playS480
	.dw 0x0d,0x0a
.code
LM6:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R2=[bp+1]	// QImode move
	R1=[R2]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_S480_Play	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,55,',0,0
	.dd LM7-_playS480
	.dw 0x0d,0x0a
.code
LM7:
L7:
	call _SACM_S480_Status	// call with return value
	R2=R1&1
	CMP R2,0	// QImode test
	JZ L11	// QImode NE
	PC=L9
L11:
	pc=L5	// jump
L9:
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM8-_playS480
	.dw 0x0d,0x0a
.code
LM8:
	call _SACM_S480_ServiceLoop	// call with return value
	pc=L7	// jump
L8:
.debug
	.dw '.stabn 0x44,0,57,',0,0
	.dd LM9-_playS480
	.dw 0x0d,0x0a
.code
LM9:
LBE3:
.debug
	.dw '.stabn 0x44,0,51,',0,0
	.dd LM10-_playS480
	.dw 0x0d,0x0a
.code
LM10:
L5:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM11-_playS480
	.dw 0x0d,0x0a
.code
LM11:
	call _SP_INT_64Hz	// call with return value
.debug
	.dw '.stabn 0x44,0,59,',0,0
	.dd LM12-_playS480
	.dw 0x0d,0x0a
.code
LM12:
LBE2:
.debug
	.dw '.stabn 0x44,0,59,',0,0
	.dd LM13-_playS480
	.dw 0x0d,0x0a
.code
LM13:
L2:

	sp+=2
	pop bp from [sp]
	retf
	.endp	// end of playS480

.debug
	.dw '.stabs "num:p11",160,0,0,5',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_playS480
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "i:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB3-_playS480
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE3-_playS480
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE2-_playS480
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME1-_playS480
	.dw 0x0d,0x0a
.code
LME1:
.code
.debug
	.dw '.stabs "showled:F19",36,0,0,',0,0,offset _showled,seg _showled,0x0d,0x0a
.CODE
.public _showled
_showled:	.proc
.debug
	.dw '.stabn 0x44,0,62,',0,0
	.dd LM14-_showled
	.dw 0x0d,0x0a
.code
LM14:
	// total=35, vars=35
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=35
	bp=sp+1

	R1=BP+38
	[bp+16]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,63,',0,0
	.dd LM15-_showled
	.dw 0x0d,0x0a
.code
LM15:
LBB4:
.debug
	.dw '.stabn 0x44,0,64,',0,0
	.dd LM16-_showled
	.dw 0x0d,0x0a
.code
LM16:
	R1=BP	// QImode move
	R2=BP+4
	[bp+17]=R2	// QImode move
	R3=[bp+16]	// QImode move
	R1=[R3]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modi1	// call with return value
	SP=SP+2
	R4=[bp+17]	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,65,',0,0
	.dd LM17-_showled
	.dw 0x0d,0x0a
.code
LM17:
	R1=BP	// QImode move
	R1=BP+1
	[bp+18]=R1	// QImode move
	R2=[bp+16]	// QImode move
	R1=[R2]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divi1	// call with return value
	SP=SP+2
	R3=[bp+18]	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,66,',0,0
	.dd LM18-_showled
	.dw 0x0d,0x0a
.code
LM18:
	R1=BP	// QImode move
	R4=BP+5
	[bp+19]=R4	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modi1	// call with return value
	SP=SP+2
	R4=[bp+19]	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,67,',0,0
	.dd LM19-_showled
	.dw 0x0d,0x0a
.code
LM19:
	R1=BP	// QImode move
	R1=BP+1
	[bp+20]=R1	// QImode move
	R2=[bp+16]	// QImode move
	R1=[R2]	// QImode move
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divi1	// call with return value
	SP=SP+2
	R3=[bp+20]	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,68,',0,0
	.dd LM20-_showled
	.dw 0x0d,0x0a
.code
LM20:
	R1=BP	// QImode move
	R4=BP+6
	[bp+21]=R4	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modi1	// call with return value
	SP=SP+2
	R4=[bp+21]	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,69,',0,0
	.dd LM21-_showled
	.dw 0x0d,0x0a
.code
LM21:
	R1=BP	// QImode move
	R1=BP+1
	[bp+22]=R1	// QImode move
	R2=[bp+16]	// QImode move
	R1=[R2]	// QImode move
	R2=1000	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divi1	// call with return value
	SP=SP+2
	R3=[bp+22]	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM22-_showled
	.dw 0x0d,0x0a
.code
LM22:
	R1=BP	// QImode move
	R4=BP+7
	[bp+23]=R4	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modi1	// call with return value
	SP=SP+2
	R4=[bp+23]	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,71,',0,0
	.dd LM23-_showled
	.dw 0x0d,0x0a
.code
LM23:
	R1=BP	// QImode move
	R1=BP+10
	[bp+24]=R1	// QImode move
	R1=[bp+16]	// QImode move
	R3=[bp+16]	// QImode move
	R2=R3+1
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modi1	// call with return value
	SP=SP+2
	R2=[bp+24]	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM24-_showled
	.dw 0x0d,0x0a
.code
LM24:
	R1=BP	// QImode move
	R3=BP+1
	[bp+25]=R3	// QImode move
	R1=[bp+16]	// QImode move
	R4=[bp+16]	// QImode move
	R2=R4+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divi1	// call with return value
	SP=SP+2
	R4=[bp+25]	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,73,',0,0
	.dd LM25-_showled
	.dw 0x0d,0x0a
.code
LM25:
	R1=BP	// QImode move
	R1=BP+11
	[bp+26]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modi1	// call with return value
	SP=SP+2
	R4=[bp+26]	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,74,',0,0
	.dd LM26-_showled
	.dw 0x0d,0x0a
.code
LM26:
	R1=BP	// QImode move
	R1=BP+1
	[bp+27]=R1	// QImode move
	R1=[bp+16]	// QImode move
	R3=[bp+16]	// QImode move
	R2=R3+1
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divi1	// call with return value
	SP=SP+2
	R2=[bp+27]	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM27-_showled
	.dw 0x0d,0x0a
.code
LM27:
	R1=BP	// QImode move
	R3=BP+12
	[bp+28]=R3	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modi1	// call with return value
	SP=SP+2
	R2=[bp+28]	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,76,',0,0
	.dd LM28-_showled
	.dw 0x0d,0x0a
.code
LM28:
	R1=BP	// QImode move
	R3=BP+1
	[bp+29]=R3	// QImode move
	R1=[bp+16]	// QImode move
	R4=[bp+16]	// QImode move
	R2=R4+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=1000	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divi1	// call with return value
	SP=SP+2
	R4=[bp+29]	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM29-_showled
	.dw 0x0d,0x0a
.code
LM29:
	R1=BP	// QImode move
	R1=BP+13
	[bp+30]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modi1	// call with return value
	SP=SP+2
	R4=[bp+30]	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM30-_showled
	.dw 0x0d,0x0a
.code
LM30:
	R1=BP	// QImode move
	R1=BP+1
	[bp+31]=R1	// QImode move
	R1=[bp+16]	// QImode move
	R3=[bp+16]	// QImode move
	R2=R3+1
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	R2=10000	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divi1	// call with return value
	SP=SP+2
	R2=[bp+31]	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,79,',0,0
	.dd LM31-_showled
	.dw 0x0d,0x0a
.code
LM31:
	R1=BP	// QImode move
	R3=BP+14
	[bp+32]=R3	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modi1	// call with return value
	SP=SP+2
	R2=[bp+32]	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,80,',0,0
	.dd LM32-_showled
	.dw 0x0d,0x0a
.code
LM32:
	R1=BP	// QImode move
	R3=BP+1
	[bp+33]=R3	// QImode move
	R1=[bp+16]	// QImode move
	R4=[bp+16]	// QImode move
	R3=R4+1
	R4=R3	// QImode move
	R2=0	// sign extend
	R1=[R4]
	jpl 1
	R2=-1
	R3=(-31072)	// HImode immediate to register move
	R4=1
	push R3,R4 to [sp]	// pushhi
	push R1,R2 to [sp]	// pushhi
	call __divi2	// call with return value
	SP=SP+4
	R3=R1	// QImode move
	R1=[bp+33]	// QImode move
	[R1]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,81,',0,0
	.dd LM33-_showled
	.dw 0x0d,0x0a
.code
LM33:
	R1=BP	// QImode move
	R2=BP+15
	[bp+34]=R2	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modi1	// call with return value
	SP=SP+2
	R4=[bp+34]	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,82,',0,0
	.dd LM34-_showled
	.dw 0x0d,0x0a
.code
LM34:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L13:
.debug
	.dw '.stabn 0x44,0,86,',0,0
	.dd LM35-_showled
	.dw 0x0d,0x0a
.code
LM35:
LBB5:
	R1=BP	// QImode move
	R2=BP+4
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _singleled	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,88,',0,0
	.dd LM36-_showled
	.dw 0x0d,0x0a
.code
LM36:
	R1=1	// QImode move
	[BP]=R1	// QImode move
L16:
	R1=[BP]	// QImode move
	CMP R1,16	// QImode compare
	JG L41	// QImode LE
	PC=L19
L41:
	pc=L17	// jump
L19:
.debug
	.dw '.stabn 0x44,0,89,',0,0
	.dd LM37-_showled
	.dw 0x0d,0x0a
.code
LM37:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,88,',0,0
	.dd LM38-_showled
	.dw 0x0d,0x0a
.code
LM38:
L18:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L16	// jump
L17:
.debug
	.dw '.stabn 0x44,0,90,',0,0
	.dd LM39-_showled
	.dw 0x0d,0x0a
.code
LM39:
	R1=BP	// QImode move
	R2=BP+5
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _singleled	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,91,',0,0
	.dd LM40-_showled
	.dw 0x0d,0x0a
.code
LM40:
	R1=1	// QImode move
	[BP]=R1	// QImode move
L20:
	R1=[BP]	// QImode move
	CMP R1,16	// QImode compare
	JG L42	// QImode LE
	PC=L23
L42:
	pc=L21	// jump
L23:
.debug
	.dw '.stabn 0x44,0,92,',0,0
	.dd LM41-_showled
	.dw 0x0d,0x0a
.code
LM41:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,91,',0,0
	.dd LM42-_showled
	.dw 0x0d,0x0a
.code
LM42:
L22:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L20	// jump
L21:
.debug
	.dw '.stabn 0x44,0,93,',0,0
	.dd LM43-_showled
	.dw 0x0d,0x0a
.code
LM43:
	R1=BP	// QImode move
	R2=BP+10
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	call _singleled	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,94,',0,0
	.dd LM44-_showled
	.dw 0x0d,0x0a
.code
LM44:
	R1=1	// QImode move
	[BP]=R1	// QImode move
L24:
	R1=[BP]	// QImode move
	CMP R1,16	// QImode compare
	JG L43	// QImode LE
	PC=L27
L43:
	pc=L25	// jump
L27:
.debug
	.dw '.stabn 0x44,0,95,',0,0
	.dd LM45-_showled
	.dw 0x0d,0x0a
.code
LM45:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,94,',0,0
	.dd LM46-_showled
	.dw 0x0d,0x0a
.code
LM46:
L26:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L24	// jump
L25:
.debug
	.dw '.stabn 0x44,0,96,',0,0
	.dd LM47-_showled
	.dw 0x0d,0x0a
.code
LM47:
	R1=BP	// QImode move
	R2=BP+11
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _singleled	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,97,',0,0
	.dd LM48-_showled
	.dw 0x0d,0x0a
.code
LM48:
	R1=1	// QImode move
	[BP]=R1	// QImode move
L28:
	R1=[BP]	// QImode move
	CMP R1,16	// QImode compare
	JG L44	// QImode LE
	PC=L31
L44:
	pc=L29	// jump
L31:
.debug
	.dw '.stabn 0x44,0,98,',0,0
	.dd LM49-_showled
	.dw 0x0d,0x0a
.code
LM49:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,97,',0,0
	.dd LM50-_showled
	.dw 0x0d,0x0a
.code
LM50:
L30:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L28	// jump
L29:
.debug
	.dw '.stabn 0x44,0,101,',0,0
	.dd LM51-_showled
	.dw 0x0d,0x0a
.code
LM51:
	R1=BP	// QImode move
	R2=BP+12
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	R1=4	// QImode move
	[SP--]=R1	// QImode move
	call _singleled	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,103,',0,0
	.dd LM52-_showled
	.dw 0x0d,0x0a
.code
LM52:
	R1=1	// QImode move
	[BP]=R1	// QImode move
L32:
	R1=[BP]	// QImode move
	CMP R1,16	// QImode compare
	JG L45	// QImode LE
	PC=L35
L45:
	pc=L33	// jump
L35:
.debug
	.dw '.stabn 0x44,0,104,',0,0
	.dd LM53-_showled
	.dw 0x0d,0x0a
.code
LM53:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,103,',0,0
	.dd LM54-_showled
	.dw 0x0d,0x0a
.code
LM54:
L34:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L32	// jump
L33:
.debug
	.dw '.stabn 0x44,0,106,',0,0
	.dd LM55-_showled
	.dw 0x0d,0x0a
.code
LM55:
	R1=BP	// QImode move
	R2=BP+13
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	R1=5	// QImode move
	[SP--]=R1	// QImode move
	call _singleled	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,107,',0,0
	.dd LM56-_showled
	.dw 0x0d,0x0a
.code
LM56:
	R1=1	// QImode move
	[BP]=R1	// QImode move
L36:
	R1=[BP]	// QImode move
	CMP R1,16	// QImode compare
	JG L46	// QImode LE
	PC=L39
L46:
	pc=L37	// jump
L39:
.debug
	.dw '.stabn 0x44,0,108,',0,0
	.dd LM57-_showled
	.dw 0x0d,0x0a
.code
LM57:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,107,',0,0
	.dd LM58-_showled
	.dw 0x0d,0x0a
.code
LM58:
L38:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L36	// jump
L37:
.debug
	.dw '.stabn 0x44,0,110,',0,0
	.dd LM59-_showled
	.dw 0x0d,0x0a
.code
LM59:
	R1=BP	// QImode move
	R2=BP+1
	R3=BP	// QImode move
	R1=BP+1
	R2=BP	// QImode move
	R3=BP+1
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,111,',0,0
	.dd LM60-_showled
	.dw 0x0d,0x0a
.code
LM60:
LBE5:
L15:
.debug
	.dw '.stabn 0x44,0,112,',0,0
	.dd LM61-_showled
	.dw 0x0d,0x0a
.code
LM61:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,800	// QImode compare
	JG L47	// QImode LE
	PC=L40
L47:
	pc=L14	// jump
L40:
	pc=L13	// jump
L14:
.debug
	.dw '.stabn 0x44,0,113,',0,0
	.dd LM62-_showled
	.dw 0x0d,0x0a
.code
LM62:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_S480_Initial	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,114,',0,0
	.dd LM63-_showled
	.dw 0x0d,0x0a
.code
LM63:
	R1=BP	// QImode move
	R2=BP+5
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,115,',0,0
	.dd LM64-_showled
	.dw 0x0d,0x0a
.code
LM64:
	R1=BP	// QImode move
	R2=BP+4
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,116,',0,0
	.dd LM65-_showled
	.dw 0x0d,0x0a
.code
LM65:
	R1=12	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,117,',0,0
	.dd LM66-_showled
	.dw 0x0d,0x0a
.code
LM66:
	R1=BP	// QImode move
	R2=BP+13
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,118,',0,0
	.dd LM67-_showled
	.dw 0x0d,0x0a
.code
LM67:
	R1=BP	// QImode move
	R2=BP+12
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,119,',0,0
	.dd LM68-_showled
	.dw 0x0d,0x0a
.code
LM68:
	R1=BP	// QImode move
	R2=BP+11
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,120,',0,0
	.dd LM69-_showled
	.dw 0x0d,0x0a
.code
LM69:
	R1=BP	// QImode move
	R2=BP+10
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _playS480	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,121,',0,0
	.dd LM70-_showled
	.dw 0x0d,0x0a
.code
LM70:
	call _K_IRQ	// call with return value
.debug
	.dw '.stabn 0x44,0,122,',0,0
	.dd LM71-_showled
	.dw 0x0d,0x0a
.code
LM71:
LBE4:
.debug
	.dw '.stabn 0x44,0,122,',0,0
	.dd LM72-_showled
	.dw 0x0d,0x0a
.code
LM72:
L12:

	sp+=35
	pop bp from [sp]
	retf
	.endp	// end of showled

.debug
	.dw '.stabs "tim:p1",160,0,0,38',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "pin:p1",160,0,0,39',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB4-_showled
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "kk:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "t:1",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "time:1",128,0,0,2',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "carlong:1",128,0,0,3',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "tm0:1",128,0,0,4',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "tm1:1",128,0,0,5',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "tm2:1",128,0,0,6',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "tm3:1",128,0,0,7',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "second:1",128,0,0,8',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "distance:1",128,0,0,9',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "dst0:1",128,0,0,10',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "dst1:1",128,0,0,11',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "dst2:1",128,0,0,12',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "dst3:1",128,0,0,13',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "dst4:1",128,0,0,14',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "dst5:1",128,0,0,15',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB5-_showled
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE5-_showled
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE4-_showled
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME2-_showled
	.dw 0x0d,0x0a
.code
LME2:
.debug
	.dw '.stabs "pp:G4",32,0,0,',0,0,offset _pp,seg _pp,0x0d,0x0a
.CODE
.public _pp
.iram
_pp:
	.dw 0
.debug
	.dw '.stabs "Mk_Z:G4",32,0,0,',0,0,offset _Mk_Z,seg _Mk_Z,0x0d,0x0a
.CODE
.public _Mk_Z
.iram
_Mk_Z:
	.dw 100
.debug
	.dw '.stabs "Mk_F:G4",32,0,0,',0,0,offset _Mk_F,seg _Mk_F,0x0d,0x0a
.CODE
.public _Mk_F
.iram
_Mk_F:
	.dw 100
.debug
	.dw '.stabs "Mk_Z1:G4",32,0,0,',0,0,offset _Mk_Z1,seg _Mk_Z1,0x0d,0x0a
.CODE
.public _Mk_Z1
.iram
_Mk_Z1:
	.dw 100
.debug
	.dw '.stabs "Mk_F1:G4",32,0,0,',0,0,offset _Mk_F1,seg _Mk_F1,0x0d,0x0a
.CODE
.public _Mk_F1
.iram
_Mk_F1:
	.dw 100
.debug
	.dw '.stabs "Mk_Z2:G4",32,0,0,',0,0,offset _Mk_Z2,seg _Mk_Z2,0x0d,0x0a
.CODE
.public _Mk_Z2
.iram
_Mk_Z2:
	.dw 100
.debug
	.dw '.stabs "Mk_F2:G4",32,0,0,',0,0,offset _Mk_F2,seg _Mk_F2,0x0d,0x0a
.CODE
.public _Mk_F2
.iram
_Mk_F2:
	.dw 100
.debug
	.dw '.stabs "Mk_Z3:G4",32,0,0,',0,0,offset _Mk_Z3,seg _Mk_Z3,0x0d,0x0a
.CODE
.public _Mk_Z3
.iram
_Mk_Z3:
	.dw 100
.debug
	.dw '.stabs "Mk_F3:G4",32,0,0,',0,0,offset _Mk_F3,seg _Mk_F3,0x0d,0x0a
.CODE
.public _Mk_F3
.iram
_Mk_F3:
	.dw 100
.debug
	.dw '.stabs "Mk_Z4:G4",32,0,0,',0,0,offset _Mk_Z4,seg _Mk_Z4,0x0d,0x0a
.CODE
.public _Mk_Z4
.iram
_Mk_Z4:
	.dw 100
.debug
	.dw '.stabs "Mk_F4:G4",32,0,0,',0,0,offset _Mk_F4,seg _Mk_F4,0x0d,0x0a
.CODE
.public _Mk_F4
.iram
_Mk_F4:
	.dw 100
.debug
	.dw '.stabs "Mk_Z5:G4",32,0,0,',0,0,offset _Mk_Z5,seg _Mk_Z5,0x0d,0x0a
.CODE
.public _Mk_Z5
.iram
_Mk_Z5:
	.dw 100
.debug
	.dw '.stabs "Mk_F5:G4",32,0,0,',0,0,offset _Mk_F5,seg _Mk_F5,0x0d,0x0a
.CODE
.public _Mk_F5
.iram
_Mk_F5:
	.dw 100
.debug
	.dw '.stabs "V_GA:G4",32,0,0,',0,0,offset _V_GA,seg _V_GA,0x0d,0x0a
.CODE
.public _V_GA
.iram
_V_GA:
	.dw 100
.debug
	.dw '.stabs "Bianxing:G4",32,0,0,',0,0,offset _Bianxing,seg _Bianxing,0x0d,0x0a
.CODE
.public _Bianxing
.iram
_Bianxing:
	.dw 0
.debug
	.dw '.stabs "Bianxing1:G4",32,0,0,',0,0,offset _Bianxing1,seg _Bianxing1,0x0d,0x0a
.CODE
.public _Bianxing1
.iram
_Bianxing1:
	.dw 0
.debug
	.dw '.stabs "sanju:G4",32,0,0,',0,0,offset _sanju,seg _sanju,0x0d,0x0a
.CODE
.public _sanju
.iram
_sanju:
	.dw 243
.debug
	.dw '.stabs "Mk_Z6:G4",32,0,0,',0,0,offset _Mk_Z6,seg _Mk_Z6,0x0d,0x0a
.CODE
.public _Mk_Z6
.iram
_Mk_Z6:
	.dw 4080
.code
.debug
	.dw '.stabs "main:F1",36,0,0,',0,0,offset _main,seg _main,0x0d,0x0a
.CODE
.public _main
_main:	.proc
.debug
	.dw '.stabn 0x44,0,129,',0,0
	.dd LM73-_main
	.dw 0x0d,0x0a
.code
LM73:
	// total=62, vars=62
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=62
	bp=sp+1

	R1=BP+65
	[bp+29]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,131,',0,0
	.dd LM74-_main
	.dw 0x0d,0x0a
.code
LM74:
LBB6:
	R1=0	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,132,',0,0
	.dd LM75-_main
	.dw 0x0d,0x0a
.code
LM75:
	R1=BP	// QImode move
	R2=BP+19
	R1=1	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+20
	R1=1	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+21
	R1=1	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+22
	R1=1	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+23
	R1=1	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+25
	R1=300	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,133,',0,0
	.dd LM76-_main
	.dw 0x0d,0x0a
.code
LM76:
	R1=BP	// QImode move
	R2=BP+26
	R1=32767	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+27
	R1=243	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,135,',0,0
	.dd LM77-_main
	.dw 0x0d,0x0a
.code
LM77:
	R1=[_pp]	// QImode move
	CMP R1,0	// QImode test
	JNZ L130	// QImode EQ
	PC=L49
L130:
	call _baab	// call with return value
L49:
.debug
	.dw '.stabn 0x44,0,136,',0,0
	.dd LM78-_main
	.dw 0x0d,0x0a
.code
LM78:
	call _K_IRQ	// call with return value
.debug
	.dw '.stabn 0x44,0,138,',0,0
	.dd LM79-_main
	.dw 0x0d,0x0a
.code
LM79:
L50:
	pc=L52	// jump
	pc=L51	// jump
L52:
.debug
	.dw '.stabn 0x44,0,140,',0,0
	.dd LM80-_main
	.dw 0x0d,0x0a
.code
LM80:
LBB7:
	call _key_asm	// call with return value
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,142,',0,0
	.dd LM81-_main
	.dw 0x0d,0x0a
.code
LM81:
	call _key_asm1	// call with return value
	R2=BP	// QImode move
	R3=BP+1
	R2=R3	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,143,',0,0
	.dd LM82-_main
	.dw 0x0d,0x0a
.code
LM82:
	call _key_asm1	// call with return value
	R2=BP	// QImode move
	R3=BP+1
	R4=R3	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,144,',0,0
	.dd LM83-_main
	.dw 0x0d,0x0a
.code
LM83:
	call _key_asm1	// call with return value
	R2=BP	// QImode move
	R3=BP+1
	R2=R3	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,145,',0,0
	.dd LM84-_main
	.dw 0x0d,0x0a
.code
LM84:
	R1=BP	// QImode move
	R2=BP+18
	R1=15	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,147,',0,0
	.dd LM85-_main
	.dw 0x0d,0x0a
.code
LM85:
	R2=BP	// QImode move
	R1=BP+18
	R3=[BP]	// QImode move
	R2=R3	// QImode move
	R4=R1	// QImode move
	R2&=[R4]	// andqi3_r0R
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,148,',0,0
	.dd LM86-_main
	.dw 0x0d,0x0a
.code
LM86:
	R1=BP	// QImode move
	R2=BP+18
	R1=240	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,150,',0,0
	.dd LM87-_main
	.dw 0x0d,0x0a
.code
LM87:
	R2=BP	// QImode move
	R1=BP+1
	R3=BP	// QImode move
	R2=BP+18
	R4=BP	// QImode move
	R3=BP+1
	R4=R2	// QImode move
	R4=[R4]	// QImode move
	[bp+61]=R4	// QImode move
	R2=[bp+61]	// QImode move
	R4=R3	// QImode move
	R2&=[R4]	// andqi3_r0R
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,152,',0,0
	.dd LM88-_main
	.dw 0x0d,0x0a
.code
LM88:
	R2=BP	// QImode move
	R1=BP+1
	R3=[BP]	// QImode move
	R2=R3	// QImode move
	R4=R1	// QImode move
	R2|=[R4]	// iorqi3_r0R
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,153,',0,0
	.dd LM89-_main
	.dw 0x0d,0x0a
.code
LM89:
	R1=BP	// QImode move
	R2=BP+18
	R1=255	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,154,',0,0
	.dd LM90-_main
	.dw 0x0d,0x0a
.code
LM90:
	R2=BP	// QImode move
	R1=BP+18
	R3=[BP]	// QImode move
	R2=R3	// QImode move
	R4=R1	// QImode move
	R2^=[R4]	// xorqi3_r0R
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,156,',0,0
	.dd LM91-_main
	.dw 0x0d,0x0a
.code
LM91:
	R1=[BP]	// QImode move
	CMP R1,190	// QImode compare
	JNZ L131	// QImode EQ
	PC=L57
L131:
	CMP R1,190	// QImode compare
	JNG L132	// QImode GT
	PC=L123
L132:
	CMP R1,125	// QImode compare
	JNZ L133	// QImode EQ
	PC=L78
L133:
	CMP R1,125	// QImode compare
	JNG L134	// QImode GT
	PC=L124
L134:
	CMP R1,119	// QImode compare
	JNZ L135	// QImode EQ
	PC=L120
L135:
	CMP R1,119	// QImode compare
	JNG L136	// QImode GT
	PC=L125
L136:
	CMP R1,0	// QImode test
	JNZ L137	// QImode EQ
	PC=L54
L137:
	pc=L53	// jump
L125:
	CMP R1,123	// QImode compare
	JNZ L138	// QImode EQ
	PC=L100
L138:
	pc=L53	// jump
L124:
	CMP R1,183	// QImode compare
	JNZ L139	// QImode EQ
	PC=L119
L139:
	CMP R1,183	// QImode compare
	JNG L140	// QImode GT
	PC=L126
L140:
	CMP R1,126	// QImode compare
	JNZ L141	// QImode EQ
	PC=L58
L141:
	pc=L53	// jump
L126:
	CMP R1,187	// QImode compare
	JNZ L142	// QImode EQ
	PC=L91
L142:
	CMP R1,189	// QImode compare
	JNZ L143	// QImode EQ
	PC=L75
L143:
	pc=L53	// jump
L123:
	CMP R1,222	// QImode compare
	JNZ L144	// QImode EQ
	PC=L56
L144:
	CMP R1,222	// QImode compare
	JNG L145	// QImode GT
	PC=L127
L145:
	CMP R1,219	// QImode compare
	JNZ L146	// QImode EQ
	PC=L84
L146:
	CMP R1,219	// QImode compare
	JNG L147	// QImode GT
	PC=L128
L147:
	CMP R1,215	// QImode compare
	JNZ L148	// QImode EQ
	PC=L114
L148:
	pc=L53	// jump
L128:
	CMP R1,221	// QImode compare
	JNZ L149	// QImode EQ
	PC=L65
L149:
	pc=L53	// jump
L127:
	CMP R1,235	// QImode compare
	JNZ L150	// QImode EQ
	PC=L81
L150:
	CMP R1,235	// QImode compare
	JNG L151	// QImode GT
	PC=L129
L151:
	CMP R1,231	// QImode compare
	JNZ L152	// QImode EQ
	PC=L107
L152:
	pc=L53	// jump
L129:
	CMP R1,237	// QImode compare
	JNZ L153	// QImode EQ
	PC=L59
L153:
	CMP R1,238	// QImode compare
	JNZ L154	// QImode EQ
	PC=L55
L154:
	pc=L53	// jump
.debug
	.dw '.stabn 0x44,0,158,',0,0
	.dd LM92-_main
	.dw 0x0d,0x0a
.code
LM92:
LBB8:
L54:
.debug
	.dw '.stabn 0x44,0,159,',0,0
	.dd LM93-_main
	.dw 0x0d,0x0a
.code
LM93:
	pc=L53	// jump
L55:
.debug
	.dw '.stabn 0x44,0,162,',0,0
	.dd LM94-_main
	.dw 0x0d,0x0a
.code
LM94:
	R1=BP	// QImode move
	R2=BP+2
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,163,',0,0
	.dd LM95-_main
	.dw 0x0d,0x0a
.code
LM95:
	R1=BP	// QImode move
	R2=BP+18
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,164,',0,0
	.dd LM96-_main
	.dw 0x0d,0x0a
.code
LM96:
	R1=BP	// QImode move
	R2=BP+24
	R1=1	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,165,',0,0
	.dd LM97-_main
	.dw 0x0d,0x0a
.code
LM97:
	R2=BP	// QImode move
	R1=BP+25
	R2=BP	// QImode move
	R3=BP+25
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+10
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,166,',0,0
	.dd LM98-_main
	.dw 0x0d,0x0a
.code
LM98:
	R1=BP	// QImode move
	R2=BP+25
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+24
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _showled	// call without return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,167,',0,0
	.dd LM99-_main
	.dw 0x0d,0x0a
.code
LM99:
	call _L_asin	// call with return value
.debug
	.dw '.stabn 0x44,0,169,',0,0
	.dd LM100-_main
	.dw 0x0d,0x0a
.code
LM100:
	pc=L53	// jump
L56:
.debug
	.dw '.stabn 0x44,0,172,',0,0
	.dd LM101-_main
	.dw 0x0d,0x0a
.code
LM101:
	R1=BP	// QImode move
	R2=BP+3
	R1=1	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,173,',0,0
	.dd LM102-_main
	.dw 0x0d,0x0a
.code
LM102:
	R1=BP	// QImode move
	R2=BP+18
	R1=1	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,174,',0,0
	.dd LM103-_main
	.dw 0x0d,0x0a
.code
LM103:
	R1=BP	// QImode move
	R2=BP+24
	R1=2	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,175,',0,0
	.dd LM104-_main
	.dw 0x0d,0x0a
.code
LM104:
	R2=BP	// QImode move
	R1=BP+25
	R2=BP	// QImode move
	R3=BP+25
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+20
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,176,',0,0
	.dd LM105-_main
	.dw 0x0d,0x0a
.code
LM105:
	R1=BP	// QImode move
	R2=BP+25
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+24
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _showled	// call without return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,177,',0,0
	.dd LM106-_main
	.dw 0x0d,0x0a
.code
LM106:
	call _Sanjiaobo	// call with return value
.debug
	.dw '.stabn 0x44,0,179,',0,0
	.dd LM107-_main
	.dw 0x0d,0x0a
.code
LM107:
	pc=L53	// jump
L57:
.debug
	.dw '.stabn 0x44,0,182,',0,0
	.dd LM108-_main
	.dw 0x0d,0x0a
.code
LM108:
	R1=BP	// QImode move
	R2=BP+4
	R1=2	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,183,',0,0
	.dd LM109-_main
	.dw 0x0d,0x0a
.code
LM109:
	R1=BP	// QImode move
	R2=BP+18
	R1=2	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,184,',0,0
	.dd LM110-_main
	.dw 0x0d,0x0a
.code
LM110:
	R1=BP	// QImode move
	R2=BP+24
	R1=3	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,185,',0,0
	.dd LM111-_main
	.dw 0x0d,0x0a
.code
LM111:
	R2=BP	// QImode move
	R1=BP+25
	R2=BP	// QImode move
	R3=BP+25
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+200
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,186,',0,0
	.dd LM112-_main
	.dw 0x0d,0x0a
.code
LM112:
	R1=BP	// QImode move
	R2=BP+25
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+24
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _showled	// call without return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,187,',0,0
	.dd LM113-_main
	.dw 0x0d,0x0a
.code
LM113:
	call _Juchibo	// call with return value
.debug
	.dw '.stabn 0x44,0,189,',0,0
	.dd LM114-_main
	.dw 0x0d,0x0a
.code
LM114:
	pc=L53	// jump
L58:
.debug
	.dw '.stabn 0x44,0,192,',0,0
	.dd LM115-_main
	.dw 0x0d,0x0a
.code
LM115:
	R1=BP	// QImode move
	R2=BP+5
	R1=3	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,193,',0,0
	.dd LM116-_main
	.dw 0x0d,0x0a
.code
LM116:
	R1=BP	// QImode move
	R2=BP+18
	R1=3	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,194,',0,0
	.dd LM117-_main
	.dw 0x0d,0x0a
.code
LM117:
	R1=BP	// QImode move
	R2=BP+24
	R1=4	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,195,',0,0
	.dd LM118-_main
	.dw 0x0d,0x0a
.code
LM118:
	R2=BP	// QImode move
	R1=BP+25
	R2=BP	// QImode move
	R3=BP+25
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+213
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,196,',0,0
	.dd LM119-_main
	.dw 0x0d,0x0a
.code
LM119:
	R1=BP	// QImode move
	R2=BP+25
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+24
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _showled	// call without return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,197,',0,0
	.dd LM120-_main
	.dw 0x0d,0x0a
.code
LM120:
	call _Fangbo	// call with return value
.debug
	.dw '.stabn 0x44,0,199,',0,0
	.dd LM121-_main
	.dw 0x0d,0x0a
.code
LM121:
	pc=L53	// jump
L59:
.debug
	.dw '.stabn 0x44,0,202,',0,0
	.dd LM122-_main
	.dw 0x0d,0x0a
.code
LM122:
	R1=BP	// QImode move
	R2=BP+6
	R1=4	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,203,',0,0
	.dd LM123-_main
	.dw 0x0d,0x0a
.code
LM123:
	R1=BP	// QImode move
	R2=BP+18
	R1=4	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,204,',0,0
	.dd LM124-_main
	.dw 0x0d,0x0a
.code
LM124:
	R1=BP	// QImode move
	R2=BP+24
	R1=5	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,205,',0,0
	.dd LM125-_main
	.dw 0x0d,0x0a
.code
LM125:
	R1=BP	// QImode move
	R4=BP+25
	[bp+30]=R4	// QImode move
	R1=BP	// QImode move
	R2=BP+25
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divi1	// call with return value
	SP=SP+2
	R4=[bp+30]	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,206,',0,0
	.dd LM126-_main
	.dw 0x0d,0x0a
.code
LM126:
	R1=BP	// QImode move
	R2=BP+25
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+24
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _showled	// call without return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,207,',0,0
	.dd LM127-_main
	.dw 0x0d,0x0a
.code
LM127:
	R1=BP	// QImode move
	R2=BP+18
	R1=6	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,208,',0,0
	.dd LM128-_main
	.dw 0x0d,0x0a
.code
LM128:
	R1=0	// HFmode immediate to register move
	R2=16384
	[_j]=R1	// HFmode [Label]=RS
	[_j+1]=R2
.debug
	.dw '.stabn 0x44,0,209,',0,0
	.dd LM129-_main
	.dw 0x0d,0x0a
.code
LM129:
	R1=0	// HFmode immediate to register move
	R2=16128
	[_h]=R1	// HFmode [Label]=RS
	[_h+1]=R2
.debug
	.dw '.stabn 0x44,0,210,',0,0
	.dd LM130-_main
	.dw 0x0d,0x0a
.code
LM130:
	R1=0	// HFmode immediate to register move
	R2=0
	[_tt]=R1	// HFmode [Label]=RS
	[_tt+1]=R2
L60:
.debug
	.dw '.stabn 0x44,0,212,',0,0
	.dd LM131-_main
	.dw 0x0d,0x0a
.code
LM131:
	R1=[_tt]	// HFmode RD=[Label]
	R2=[_tt+1]
	R3=4058	// HFmode immediate to register move
	R4=16457
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	R3=[_j]	// HFmode RD=[Label]
	R4=[_j+1]
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __divf2	// call with return value
	SP=SP+4
	[_t]=R1	// HFmode [Label]=RS
	[_t+1]=R2
.debug
	.dw '.stabn 0x44,0,213,',0,0
	.dd LM132-_main
	.dw 0x0d,0x0a
.code
LM132:
	R1=BP	// QImode move
	R2=BP+19
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call __cvi1f2	// call with return value
	SP=SP+1
	R3=[_h]	// HFmode RD=[Label]
	R4=[_h+1]
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	[bp+31]=R1	// HFmode [BP+#IM6]=RS
	[bp+32]=R2
	R1=[_t]	// HFmode RD=[Label]
	R2=[_t+1]
	push R1,R2 to [sp]	// pushhf
	call _sinf	// call with return value
	SP=SP+2
	push R1,R2 to [sp]	// pushhf
	R1=[bp+31]	// HFmode RD=[BP+#IM6]
	R2=[bp+32]
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	[bp+33]=R1	// HFmode [BP+#IM6]=RS
	[bp+34]=R2
	R1=BP	// QImode move
	R2=BP+20
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call __cvi1f2	// call with return value
	SP=SP+1
	R3=[_h]	// HFmode RD=[Label]
	R4=[_h+1]
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	[bp+35]=R1	// HFmode [BP+#IM6]=RS
	[bp+36]=R2
	R1=[_t]	// HFmode RD=[Label]
	R2=[_t+1]
	[bp+37]=R1	// HFmode [BP+#IM6]=RS
	[bp+38]=R2
	R3=[bp+37]	// HFmode RD=[BP+#IM6]
	R4=[bp+38]
	push R3,R4 to [sp]	// pushhf
	R1=[bp+37]	// HFmode RD=[BP+#IM6]
	R2=[bp+38]
	push R1,R2 to [sp]	// pushhf
	call __addf2	// call with return value
	SP=SP+4
	push R1,R2 to [sp]	// pushhf
	call _sinf	// call with return value
	SP=SP+2
	push R1,R2 to [sp]	// pushhf
	R3=[bp+35]	// HFmode RD=[BP+#IM6]
	R4=[bp+36]
	push R3,R4 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	push R1,R2 to [sp]	// pushhf
	R1=[bp+33]	// HFmode RD=[BP+#IM6]
	R2=[bp+34]
	push R1,R2 to [sp]	// pushhf
	call __addf2	// call with return value
	SP=SP+4
	[bp+39]=R1	// HFmode [BP+#IM6]=RS
	[bp+40]=R2
	R1=BP	// QImode move
	R2=BP+21
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call __cvi1f2	// call with return value
	SP=SP+1
	R3=[_h]	// HFmode RD=[Label]
	R4=[_h+1]
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	[bp+41]=R1	// HFmode [BP+#IM6]=RS
	[bp+42]=R2
	R1=[_t]	// HFmode RD=[Label]
	R2=[_t+1]
	R3=0	// HFmode immediate to register move
	R4=16448
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	push R1,R2 to [sp]	// pushhf
	call _sinf	// call with return value
	SP=SP+2
	push R1,R2 to [sp]	// pushhf
	R1=[bp+41]	// HFmode RD=[BP+#IM6]
	R2=[bp+42]
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	push R1,R2 to [sp]	// pushhf
	R3=[bp+39]	// HFmode RD=[BP+#IM6]
	R4=[bp+40]
	push R3,R4 to [sp]	// pushhf
	call __addf2	// call with return value
	SP=SP+4
	[bp+43]=R1	// HFmode [BP+#IM6]=RS
	[bp+44]=R2
	R1=BP	// QImode move
	R2=BP+22
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call __cvi1f2	// call with return value
	SP=SP+1
	R3=[_h]	// HFmode RD=[Label]
	R4=[_h+1]
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	[bp+45]=R1	// HFmode [BP+#IM6]=RS
	[bp+46]=R2
	R1=[_t]	// HFmode RD=[Label]
	R2=[_t+1]
	R3=0	// HFmode immediate to register move
	R4=16512
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	push R1,R2 to [sp]	// pushhf
	call _sinf	// call with return value
	SP=SP+2
	push R1,R2 to [sp]	// pushhf
	R1=[bp+45]	// HFmode RD=[BP+#IM6]
	R2=[bp+46]
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	push R1,R2 to [sp]	// pushhf
	R3=[bp+43]	// HFmode RD=[BP+#IM6]
	R4=[bp+44]
	push R3,R4 to [sp]	// pushhf
	call __addf2	// call with return value
	SP=SP+4
	[bp+47]=R1	// HFmode [BP+#IM6]=RS
	[bp+48]=R2
	R1=BP	// QImode move
	R2=BP+23
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call __cvi1f2	// call with return value
	SP=SP+1
	R3=[_h]	// HFmode RD=[Label]
	R4=[_h+1]
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	[bp+49]=R1	// HFmode [BP+#IM6]=RS
	[bp+50]=R2
	R1=[_t]	// HFmode RD=[Label]
	R2=[_t+1]
	R3=0	// HFmode immediate to register move
	R4=16544
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	push R1,R2 to [sp]	// pushhf
	call _sinf	// call with return value
	SP=SP+2
	push R1,R2 to [sp]	// pushhf
	R1=[bp+49]	// HFmode RD=[BP+#IM6]
	R2=[bp+50]
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	push R1,R2 to [sp]	// pushhf
	R3=[bp+47]	// HFmode RD=[BP+#IM6]
	R4=[bp+48]
	push R3,R4 to [sp]	// pushhf
	call __addf2	// call with return value
	SP=SP+4
	[_y]=R1	// HFmode [Label]=RS
	[_y+1]=R2
.debug
	.dw '.stabn 0x44,0,214,',0,0
	.dd LM133-_main
	.dw 0x0d,0x0a
.code
LM133:
	R1=BP	// QImode move
	R4=BP+28
	[bp+51]=R4	// QImode move
	R1=[_y]	// HFmode RD=[Label]
	R2=[_y+1]
	R3=49152	// HFmode immediate to register move
	R4=18175
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	push R1,R2 to [sp]	// pushhf
	call __cvf2i1	// call with return value
	SP=SP+2
	R2=[bp+51]	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,215,',0,0
	.dd LM134-_main
	.dw 0x0d,0x0a
.code
LM134:
	R2=BP	// QImode move
	R1=BP+28
	R2=BP	// QImode move
	R3=BP+28
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2^(-32768)
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,216,',0,0
	.dd LM135-_main
	.dw 0x0d,0x0a
.code
LM135:
	R1=BP	// QImode move
	R2=BP+28
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _DAC_FW	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,217,',0,0
	.dd LM136-_main
	.dw 0x0d,0x0a
.code
LM136:
	R1=[_j]	// HFmode RD=[Label]
	R2=[_j+1]
	R3=0	// HFmode immediate to register move
	R4=17096
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __divf2	// call with return value
	SP=SP+4
	R3=[_tt]	// HFmode RD=[Label]
	R4=[_tt+1]
	push R1,R2 to [sp]	// pushhf
	push R3,R4 to [sp]	// pushhf
	call __addf2	// call with return value
	SP=SP+4
	[_tt]=R1	// HFmode [Label]=RS
	[_tt+1]=R2
.debug
	.dw '.stabn 0x44,0,218,',0,0
	.dd LM137-_main
	.dw 0x0d,0x0a
.code
LM137:
	R1=[_tt]	// HFmode RD=[Label]
	R2=[_tt+1]
	push R1,R2 to [sp]	// pushhf
	call __cvf2i1	// call with return value
	SP=SP+2
	[SP--]=R1	// QImode move
	call __cvi1f2	// call with return value
	SP=SP+1
	[bp+52]=R1	// HFmode [BP+#IM6]=RS
	[bp+53]=R2
	R1=[_j]	// HFmode RD=[Label]
	R2=[_j+1]
	[bp+54]=R1	// HFmode [BP+#IM6]=RS
	[bp+55]=R2
	R3=[bp+54]	// HFmode RD=[BP+#IM6]
	R4=[bp+55]
	push R3,R4 to [sp]	// pushhf
	R1=[bp+54]	// HFmode RD=[BP+#IM6]
	R2=[bp+55]
	push R1,R2 to [sp]	// pushhf
	call __addf2	// call with return value
	SP=SP+4
	push R1,R2 to [sp]	// pushhf
	R3=[bp+52]	// HFmode RD=[BP+#IM6]
	R4=[bp+53]
	push R3,R4 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JZ L155	// QImode NE
	PC=L61
L155:
	R1=0	// HFmode immediate to register move
	R2=0
	[_tt]=R1	// HFmode [Label]=RS
	[_tt+1]=R2
L61:
.debug
	.dw '.stabn 0x44,0,219,',0,0
	.dd LM138-_main
	.dw 0x0d,0x0a
.code
LM138:
	pc=L60	// jump
L62:
.debug
	.dw '.stabn 0x44,0,221,',0,0
	.dd LM139-_main
	.dw 0x0d,0x0a
.code
LM139:
	R2=BP	// QImode move
	R1=BP+27
	R2=BP	// QImode move
	R3=BP+26
	R4=R1	// QImode move
	R1=[R4]	// QImode move
	R2=R3	// QImode move
	CMP R1,[R2]	// QImode compare
	JB L156	// QImode GEU
	PC=L63
L156:
	R2=BP	// QImode move
	R1=BP+27
	R2=BP	// QImode move
	R3=BP+27
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+[_sanju]	// addqi3_r0R
	R2=R1	// QImode move
	[R2]=R3	// QImode move
	pc=L64	// jump
L63:
.debug
	.dw '.stabn 0x44,0,222,',0,0
	.dd LM140-_main
	.dw 0x0d,0x0a
.code
LM140:
	R1=BP	// QImode move
	R2=BP+27
	R1=243	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L64:
.debug
	.dw '.stabn 0x44,0,224,',0,0
	.dd LM141-_main
	.dw 0x0d,0x0a
.code
LM141:
	R1=BP	// QImode move
	R2=BP+27
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _DAC_FW	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,226,',0,0
	.dd LM142-_main
	.dw 0x0d,0x0a
.code
LM142:
	pc=L53	// jump
L65:
.debug
	.dw '.stabn 0x44,0,229,',0,0
	.dd LM143-_main
	.dw 0x0d,0x0a
.code
LM143:
	R1=BP	// QImode move
	R2=BP+7
	R1=5	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,230,',0,0
	.dd LM144-_main
	.dw 0x0d,0x0a
.code
LM144:
	R1=BP	// QImode move
	R2=BP+18
	R1=5	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,231,',0,0
	.dd LM145-_main
	.dw 0x0d,0x0a
.code
LM145:
	R1=BP	// QImode move
	R2=BP+24
	R1=5	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,233,',0,0
	.dd LM146-_main
	.dw 0x0d,0x0a
.code
LM146:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+24
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _showled	// call without return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,234,',0,0
	.dd LM147-_main
	.dw 0x0d,0x0a
.code
LM147:
	call _F_Apwm	// call with return value
L66:
.debug
	.dw '.stabn 0x44,0,237,',0,0
	.dd LM148-_main
	.dw 0x0d,0x0a
.code
LM148:
L67:
	R2=BP	// QImode move
	R1=BP+27
	R2=BP	// QImode move
	R3=BP+27
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+[_sanju]	// addqi3_r0R
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,238,',0,0
	.dd LM149-_main
	.dw 0x0d,0x0a
.code
LM149:
	R1=BP	// QImode move
	R2=BP+27
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _DAC_FW	// call with return value
	SP=SP+1
L69:
.debug
	.dw '.stabn 0x44,0,239,',0,0
	.dd LM150-_main
	.dw 0x0d,0x0a
.code
LM150:
	R2=BP	// QImode move
	R1=BP+27
	R2=BP	// QImode move
	R3=BP+26
	R4=R1	// QImode move
	R1=[R4]	// QImode move
	R2=R3	// QImode move
	CMP R1,[R2]	// QImode compare
	JNB L157	// QImode LTU
	PC=L70
L157:
	pc=L68	// jump
L70:
	pc=L67	// jump
L68:
L71:
.debug
	.dw '.stabn 0x44,0,241,',0,0
	.dd LM151-_main
	.dw 0x0d,0x0a
.code
LM151:
	R2=BP	// QImode move
	R1=BP+27
	R2=BP	// QImode move
	R3=BP+27
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2-[_sanju]
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,242,',0,0
	.dd LM152-_main
	.dw 0x0d,0x0a
.code
LM152:
	R1=BP	// QImode move
	R2=BP+27
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _DAC_FW	// call with return value
	SP=SP+1
L73:
.debug
	.dw '.stabn 0x44,0,243,',0,0
	.dd LM153-_main
	.dw 0x0d,0x0a
.code
LM153:
	R1=BP	// QImode move
	R2=BP+27
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,[_sanju]	// QImode compare
	JZ L158	// QImode NE
	PC=L74
L158:
	pc=L72	// jump
L74:
	pc=L71	// jump
L72:
.debug
	.dw '.stabn 0x44,0,244,',0,0
	.dd LM154-_main
	.dw 0x0d,0x0a
.code
LM154:
	pc=L66	// jump
.debug
	.dw '.stabn 0x44,0,245,',0,0
	.dd LM155-_main
	.dw 0x0d,0x0a
.code
LM155:
	pc=L53	// jump
L75:
.debug
	.dw '.stabn 0x44,0,248,',0,0
	.dd LM156-_main
	.dw 0x0d,0x0a
.code
LM156:
	R1=BP	// QImode move
	R2=BP+8
	R1=6	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,249,',0,0
	.dd LM157-_main
	.dw 0x0d,0x0a
.code
LM157:
	R1=BP	// QImode move
	R2=BP+24
	R1=6	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,251,',0,0
	.dd LM158-_main
	.dw 0x0d,0x0a
.code
LM158:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+24
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _showled	// call without return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,252,',0,0
	.dd LM159-_main
	.dw 0x0d,0x0a
.code
LM159:
	R1=3184	// QImode move
	[_Mk_Z6]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,253,',0,0
	.dd LM160-_main
	.dw 0x0d,0x0a
.code
LM160:
	R1=BP	// QImode move
	R2=BP+18
	R1=6	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,254,',0,0
	.dd LM161-_main
	.dw 0x0d,0x0a
.code
LM161:
	R1=0	// HFmode immediate to register move
	R2=16384
	[_j]=R1	// HFmode [Label]=RS
	[_j+1]=R2
.debug
	.dw '.stabn 0x44,0,255,',0,0
	.dd LM162-_main
	.dw 0x0d,0x0a
.code
LM162:
	R1=0	// HFmode immediate to register move
	R2=16128
	[_h]=R1	// HFmode [Label]=RS
	[_h+1]=R2
.debug
	.dw '.stabn 0x44,0,256,',0,0
	.dd LM163-_main
	.dw 0x0d,0x0a
.code
LM163:
	R1=0	// HFmode immediate to register move
	R2=0
	[_tt]=R1	// HFmode [Label]=RS
	[_tt+1]=R2
L76:
.debug
	.dw '.stabn 0x44,0,258,',0,0
	.dd LM164-_main
	.dw 0x0d,0x0a
.code
LM164:
	R1=[_tt]	// HFmode RD=[Label]
	R2=[_tt+1]
	R3=4058	// HFmode immediate to register move
	R4=16457
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	R3=[_j]	// HFmode RD=[Label]
	R4=[_j+1]
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __divf2	// call with return value
	SP=SP+4
	[_t]=R1	// HFmode [Label]=RS
	[_t+1]=R2
.debug
	.dw '.stabn 0x44,0,259,',0,0
	.dd LM165-_main
	.dw 0x0d,0x0a
.code
LM165:
	R1=[_t]	// HFmode RD=[Label]
	R2=[_t+1]
	push R1,R2 to [sp]	// pushhf
	call _sinf	// call with return value
	SP=SP+2
	R3=[_h]	// HFmode RD=[Label]
	R4=[_h+1]
	push R1,R2 to [sp]	// pushhf
	push R3,R4 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	[_y]=R1	// HFmode [Label]=RS
	[_y+1]=R2
.debug
	.dw '.stabn 0x44,0,260,',0,0
	.dd LM166-_main
	.dw 0x0d,0x0a
.code
LM166:
	R1=BP	// QImode move
	R1=BP+28
	[bp+56]=R1	// QImode move
	R1=[_y]	// HFmode RD=[Label]
	R2=[_y+1]
	R3=49152	// HFmode immediate to register move
	R4=18175
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	push R1,R2 to [sp]	// pushhf
	call __cvf2i1	// call with return value
	SP=SP+2
	R2=[bp+56]	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,261,',0,0
	.dd LM167-_main
	.dw 0x0d,0x0a
.code
LM167:
	R2=BP	// QImode move
	R1=BP+28
	R2=BP	// QImode move
	R3=BP+28
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2^(-32768)
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,262,',0,0
	.dd LM168-_main
	.dw 0x0d,0x0a
.code
LM168:
	R1=BP	// QImode move
	R2=BP+28
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _DAC_FW	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,263,',0,0
	.dd LM169-_main
	.dw 0x0d,0x0a
.code
LM169:
	R1=[_j]	// HFmode RD=[Label]
	R2=[_j+1]
	R3=0	// HFmode immediate to register move
	R4=17096
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __divf2	// call with return value
	SP=SP+4
	R3=[_tt]	// HFmode RD=[Label]
	R4=[_tt+1]
	push R1,R2 to [sp]	// pushhf
	push R3,R4 to [sp]	// pushhf
	call __addf2	// call with return value
	SP=SP+4
	[_tt]=R1	// HFmode [Label]=RS
	[_tt+1]=R2
.debug
	.dw '.stabn 0x44,0,264,',0,0
	.dd LM170-_main
	.dw 0x0d,0x0a
.code
LM170:
	R1=[_tt]	// HFmode RD=[Label]
	R2=[_tt+1]
	push R1,R2 to [sp]	// pushhf
	call __cvf2i1	// call with return value
	SP=SP+2
	[SP--]=R1	// QImode move
	call __cvi1f2	// call with return value
	SP=SP+1
	[bp+57]=R1	// HFmode [BP+#IM6]=RS
	[bp+58]=R2
	R1=[_j]	// HFmode RD=[Label]
	R2=[_j+1]
	[bp+59]=R1	// HFmode [BP+#IM6]=RS
	[bp+60]=R2
	R3=[bp+59]	// HFmode RD=[BP+#IM6]
	R4=[bp+60]
	push R3,R4 to [sp]	// pushhf
	R1=[bp+59]	// HFmode RD=[BP+#IM6]
	R2=[bp+60]
	push R1,R2 to [sp]	// pushhf
	call __addf2	// call with return value
	SP=SP+4
	push R1,R2 to [sp]	// pushhf
	R3=[bp+57]	// HFmode RD=[BP+#IM6]
	R4=[bp+58]
	push R3,R4 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JZ L159	// QImode NE
	PC=L77
L159:
	R1=0	// HFmode immediate to register move
	R2=0
	[_tt]=R1	// HFmode [Label]=RS
	[_tt+1]=R2
L77:
.debug
	.dw '.stabn 0x44,0,265,',0,0
	.dd LM171-_main
	.dw 0x0d,0x0a
.code
LM171:
	pc=L76	// jump
.debug
	.dw '.stabn 0x44,0,266,',0,0
	.dd LM172-_main
	.dw 0x0d,0x0a
.code
LM172:
	pc=L53	// jump
L78:
.debug
	.dw '.stabn 0x44,0,269,',0,0
	.dd LM173-_main
	.dw 0x0d,0x0a
.code
LM173:
	R1=BP	// QImode move
	R2=BP+9
	R1=7	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,270,',0,0
	.dd LM174-_main
	.dw 0x0d,0x0a
.code
LM174:
	R1=BP	// QImode move
	R2=BP+18
	R1=7	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,271,',0,0
	.dd LM175-_main
	.dw 0x0d,0x0a
.code
LM175:
	R1=BP	// QImode move
	R2=BP+8
	R1=6	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,272,',0,0
	.dd LM176-_main
	.dw 0x0d,0x0a
.code
LM176:
	R1=BP	// QImode move
	R2=BP+24
	R1=7	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,274,',0,0
	.dd LM177-_main
	.dw 0x0d,0x0a
.code
LM177:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+24
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _showled	// call without return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,275,',0,0
	.dd LM178-_main
	.dw 0x0d,0x0a
.code
LM178:
	R1=[_Mk_Z]	// QImode move
	CMP R1,1499	// QImode compare
	JNA L160	// QImode GTU
	PC=L79
L160:
	R1=[_Mk_Z]	// QImode move
	R2=100	// QImode move
	[_Mk_Z]=R1+R2
	pc=L80	// jump
L79:
.debug
	.dw '.stabn 0x44,0,276,',0,0
	.dd LM179-_main
	.dw 0x0d,0x0a
.code
LM179:
	R1=0	// QImode move
	[_Mk_Z]=R1	// QImode move
L80:
.debug
	.dw '.stabn 0x44,0,277,',0,0
	.dd LM180-_main
	.dw 0x0d,0x0a
.code
LM180:
	R1=3248	// QImode move
	[_Mk_Z6]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,278,',0,0
	.dd LM181-_main
	.dw 0x0d,0x0a
.code
LM181:
	pc=L53	// jump
L81:
.debug
	.dw '.stabn 0x44,0,281,',0,0
	.dd LM182-_main
	.dw 0x0d,0x0a
.code
LM182:
	R1=BP	// QImode move
	R2=BP+10
	R1=8	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,282,',0,0
	.dd LM183-_main
	.dw 0x0d,0x0a
.code
LM183:
	R1=BP	// QImode move
	R2=BP+18
	R1=8	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,283,',0,0
	.dd LM184-_main
	.dw 0x0d,0x0a
.code
LM184:
	R1=BP	// QImode move
	R2=BP+24
	R1=8	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,285,',0,0
	.dd LM185-_main
	.dw 0x0d,0x0a
.code
LM185:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+24
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _showled	// call without return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,286,',0,0
	.dd LM186-_main
	.dw 0x0d,0x0a
.code
LM186:
	R1=3312	// QImode move
	[_Mk_Z6]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,287,',0,0
	.dd LM187-_main
	.dw 0x0d,0x0a
.code
LM187:
	R1=[_Mk_F5]	// QImode move
	CMP R1,1499	// QImode compare
	JNA L161	// QImode GTU
	PC=L82
L161:
	R1=[_Mk_F5]	// QImode move
	R2=100	// QImode move
	[_Mk_F5]=R1+R2
	pc=L83	// jump
L82:
.debug
	.dw '.stabn 0x44,0,288,',0,0
	.dd LM188-_main
	.dw 0x0d,0x0a
.code
LM188:
	R1=0	// QImode move
	[_Mk_F5]=R1	// QImode move
L83:
.debug
	.dw '.stabn 0x44,0,291,',0,0
	.dd LM189-_main
	.dw 0x0d,0x0a
.code
LM189:
	pc=L53	// jump
L84:
.debug
	.dw '.stabn 0x44,0,294,',0,0
	.dd LM190-_main
	.dw 0x0d,0x0a
.code
LM190:
	R1=BP	// QImode move
	R2=BP+11
	R1=9	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,295,',0,0
	.dd LM191-_main
	.dw 0x0d,0x0a
.code
LM191:
	R1=BP	// QImode move
	R2=BP+18
	R1=9	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,296,',0,0
	.dd LM192-_main
	.dw 0x0d,0x0a
.code
LM192:
	R1=BP	// QImode move
	R2=BP+24
	R1=9	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,298,',0,0
	.dd LM193-_main
	.dw 0x0d,0x0a
.code
LM193:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+24
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _showled	// call without return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,299,',0,0
	.dd LM194-_main
	.dw 0x0d,0x0a
.code
LM194:
	R1=3568	// QImode move
	[_Mk_Z6]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,300,',0,0
	.dd LM195-_main
	.dw 0x0d,0x0a
.code
LM195:
	R1=[_Mk_F4]	// QImode move
	CMP R1,1499	// QImode compare
	JNA L162	// QImode GTU
	PC=L85
L162:
	R1=[_Mk_F4]	// QImode move
	R2=100	// QImode move
	[_Mk_F]=R1+R2
	pc=L86	// jump
L85:
.debug
	.dw '.stabn 0x44,0,301,',0,0
	.dd LM196-_main
	.dw 0x0d,0x0a
.code
LM196:
	R1=0	// QImode move
	[_Mk_F4]=R1	// QImode move
L86:
.debug
	.dw '.stabn 0x44,0,302,',0,0
	.dd LM197-_main
	.dw 0x0d,0x0a
.code
LM197:
	R1=BP	// QImode move
	R2=BP+26
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,(-2)	// QImode compare
	JNA L163	// QImode GTU
	PC=L87
L163:
	R2=BP	// QImode move
	R1=BP+26
	R2=BP	// QImode move
	R3=BP+26
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+4096
	R2=R1	// QImode move
	[R2]=R3	// QImode move
	pc=L88	// jump
L87:
.debug
	.dw '.stabn 0x44,0,303,',0,0
	.dd LM198-_main
	.dw 0x0d,0x0a
.code
LM198:
	R1=BP	// QImode move
	R2=BP+26
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L88:
.debug
	.dw '.stabn 0x44,0,304,',0,0
	.dd LM199-_main
	.dw 0x0d,0x0a
.code
LM199:
	R1=BP	// QImode move
	R2=BP+19
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,0	// QImode test
	JZ L164	// QImode NE
	PC=L89
L164:
	R1=BP	// QImode move
	R2=BP+19
	R1=1	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
	pc=L90	// jump
L89:
.debug
	.dw '.stabn 0x44,0,305,',0,0
	.dd LM200-_main
	.dw 0x0d,0x0a
.code
LM200:
	R1=BP	// QImode move
	R2=BP+19
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
L90:
.debug
	.dw '.stabn 0x44,0,306,',0,0
	.dd LM201-_main
	.dw 0x0d,0x0a
.code
LM201:
	pc=L53	// jump
L91:
.debug
	.dw '.stabn 0x44,0,309,',0,0
	.dd LM202-_main
	.dw 0x0d,0x0a
.code
LM202:
	R1=BP	// QImode move
	R2=BP+12
	R1=10	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,310,',0,0
	.dd LM203-_main
	.dw 0x0d,0x0a
.code
LM203:
	R1=BP	// QImode move
	R2=BP+18
	R1=10	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,311,',0,0
	.dd LM204-_main
	.dw 0x0d,0x0a
.code
LM204:
	R1=BP	// QImode move
	R2=BP+24
	R1=10	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,313,',0,0
	.dd LM205-_main
	.dw 0x0d,0x0a
.code
LM205:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+24
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _showled	// call without return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,314,',0,0
	.dd LM206-_main
	.dw 0x0d,0x0a
.code
LM206:
	R1=3440	// QImode move
	[_Mk_Z6]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,315,',0,0
	.dd LM207-_main
	.dw 0x0d,0x0a
.code
LM207:
	R1=[_Mk_F3]	// QImode move
	CMP R1,1499	// QImode compare
	JNA L165	// QImode GTU
	PC=L92
L165:
	R1=[_Mk_F3]	// QImode move
	R2=100	// QImode move
	[_Mk_F3]=R1+R2
	pc=L93	// jump
L92:
.debug
	.dw '.stabn 0x44,0,316,',0,0
	.dd LM208-_main
	.dw 0x0d,0x0a
.code
LM208:
	R1=0	// QImode move
	[_Mk_F3]=R1	// QImode move
L93:
.debug
	.dw '.stabn 0x44,0,317,',0,0
	.dd LM209-_main
	.dw 0x0d,0x0a
.code
LM209:
	R1=[_Bianxing1]	// QImode move
	CMP R1,99	// QImode compare
	JNA L166	// QImode GTU
	PC=L94
L166:
	R1=[_Bianxing1]	// QImode move
	R2=5	// QImode move
	[_Bianxing1]=R1+R2
	pc=L95	// jump
L94:
.debug
	.dw '.stabn 0x44,0,318,',0,0
	.dd LM210-_main
	.dw 0x0d,0x0a
.code
LM210:
	R1=0	// QImode move
	[_Bianxing1]=R1	// QImode move
L95:
.debug
	.dw '.stabn 0x44,0,319,',0,0
	.dd LM211-_main
	.dw 0x0d,0x0a
.code
LM211:
	R1=BP	// QImode move
	R2=BP+20
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	JZ L167	// QImode NE
	PC=L96
L167:
	R1=BP	// QImode move
	R2=BP+20
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
	pc=L97	// jump
L96:
.debug
	.dw '.stabn 0x44,0,320,',0,0
	.dd LM212-_main
	.dw 0x0d,0x0a
.code
LM212:
	R1=BP	// QImode move
	R2=BP+20
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L97:
.debug
	.dw '.stabn 0x44,0,321,',0,0
	.dd LM213-_main
	.dw 0x0d,0x0a
.code
LM213:
	R1=BP	// QImode move
	R2=BP+26
	R1=[_sanju]	// QImode move
	R4=R2	// QImode move
	CMP R1,[R4]	// QImode compare
	JB L168	// QImode GEU
	PC=L98
L168:
	R1=[_sanju]	// QImode move
	R2=243	// QImode move
	[_sanju]=R1+R2
	pc=L99	// jump
L98:
.debug
	.dw '.stabn 0x44,0,322,',0,0
	.dd LM214-_main
	.dw 0x0d,0x0a
.code
LM214:
	R1=0	// QImode move
	[_sanju]=R1	// QImode move
L99:
.debug
	.dw '.stabn 0x44,0,323,',0,0
	.dd LM215-_main
	.dw 0x0d,0x0a
.code
LM215:
	pc=L53	// jump
L100:
.debug
	.dw '.stabn 0x44,0,326,',0,0
	.dd LM216-_main
	.dw 0x0d,0x0a
.code
LM216:
	R1=BP	// QImode move
	R2=BP+13
	R1=11	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,327,',0,0
	.dd LM217-_main
	.dw 0x0d,0x0a
.code
LM217:
	R1=BP	// QImode move
	R2=BP+18
	R1=11	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,328,',0,0
	.dd LM218-_main
	.dw 0x0d,0x0a
.code
LM218:
	R1=BP	// QImode move
	R2=BP+24
	R1=11	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,330,',0,0
	.dd LM219-_main
	.dw 0x0d,0x0a
.code
LM219:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+24
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _showled	// call without return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,331,',0,0
	.dd LM220-_main
	.dw 0x0d,0x0a
.code
LM220:
	R1=3504	// QImode move
	[_Mk_Z6]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,332,',0,0
	.dd LM221-_main
	.dw 0x0d,0x0a
.code
LM221:
	R1=[_Mk_F2]	// QImode move
	CMP R1,1499	// QImode compare
	JNA L169	// QImode GTU
	PC=L101
L169:
	R1=[_Mk_F2]	// QImode move
	R2=100	// QImode move
	[_Mk_F2]=R1+R2
	pc=L102	// jump
L101:
.debug
	.dw '.stabn 0x44,0,333,',0,0
	.dd LM222-_main
	.dw 0x0d,0x0a
.code
LM222:
	R1=0	// QImode move
	[_Mk_F2]=R1	// QImode move
L102:
.debug
	.dw '.stabn 0x44,0,334,',0,0
	.dd LM223-_main
	.dw 0x0d,0x0a
.code
LM223:
	R1=[_Bianxing]	// QImode move
	CMP R1,99	// QImode compare
	JNA L170	// QImode GTU
	PC=L103
L170:
	R1=[_Bianxing]	// QImode move
	R2=5	// QImode move
	[_Bianxing]=R1+R2
	pc=L104	// jump
L103:
.debug
	.dw '.stabn 0x44,0,335,',0,0
	.dd LM224-_main
	.dw 0x0d,0x0a
.code
LM224:
	R1=0	// QImode move
	[_Bianxing]=R1	// QImode move
L104:
.debug
	.dw '.stabn 0x44,0,336,',0,0
	.dd LM225-_main
	.dw 0x0d,0x0a
.code
LM225:
	R1=BP	// QImode move
	R2=BP+21
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	JZ L171	// QImode NE
	PC=L105
L171:
	R1=BP	// QImode move
	R2=BP+21
	R1=1	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
	pc=L106	// jump
L105:
.debug
	.dw '.stabn 0x44,0,337,',0,0
	.dd LM226-_main
	.dw 0x0d,0x0a
.code
LM226:
	R1=BP	// QImode move
	R2=BP+21
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L106:
.debug
	.dw '.stabn 0x44,0,338,',0,0
	.dd LM227-_main
	.dw 0x0d,0x0a
.code
LM227:
	pc=L53	// jump
L107:
.debug
	.dw '.stabn 0x44,0,341,',0,0
	.dd LM228-_main
	.dw 0x0d,0x0a
.code
LM228:
	R1=BP	// QImode move
	R2=BP+14
	R1=12	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,342,',0,0
	.dd LM229-_main
	.dw 0x0d,0x0a
.code
LM229:
	R1=BP	// QImode move
	R2=BP+18
	R1=12	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,343,',0,0
	.dd LM230-_main
	.dw 0x0d,0x0a
.code
LM230:
	R1=BP	// QImode move
	R2=BP+24
	R1=12	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,345,',0,0
	.dd LM231-_main
	.dw 0x0d,0x0a
.code
LM231:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+24
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _showled	// call without return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,346,',0,0
	.dd LM232-_main
	.dw 0x0d,0x0a
.code
LM232:
	R1=3952	// QImode move
	[_Mk_Z6]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,347,',0,0
	.dd LM233-_main
	.dw 0x0d,0x0a
.code
LM233:
	R1=[_Mk_F1]	// QImode move
	CMP R1,1499	// QImode compare
	JNA L172	// QImode GTU
	PC=L108
L172:
	R1=[_Mk_F1]	// QImode move
	R2=100	// QImode move
	[_Mk_F1]=R1+R2
	pc=L109	// jump
L108:
.debug
	.dw '.stabn 0x44,0,348,',0,0
	.dd LM234-_main
	.dw 0x0d,0x0a
.code
LM234:
	R1=0	// QImode move
	[_Mk_F1]=R1	// QImode move
L109:
.debug
	.dw '.stabn 0x44,0,349,',0,0
	.dd LM235-_main
	.dw 0x0d,0x0a
.code
LM235:
	R1=[_V_GA]	// QImode move
	CMP R1,99	// QImode compare
	JNA L173	// QImode GTU
	PC=L110
L173:
	R1=[_V_GA]	// QImode move
	R2=5	// QImode move
	[_V_GA]=R1+R2
	pc=L111	// jump
L110:
.debug
	.dw '.stabn 0x44,0,350,',0,0
	.dd LM236-_main
	.dw 0x0d,0x0a
.code
LM236:
	R1=0	// QImode move
	[_V_GA]=R1	// QImode move
L111:
.debug
	.dw '.stabn 0x44,0,351,',0,0
	.dd LM237-_main
	.dw 0x0d,0x0a
.code
LM237:
	R1=BP	// QImode move
	R2=BP+22
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,0	// QImode test
	JZ L174	// QImode NE
	PC=L112
L174:
	R1=BP	// QImode move
	R2=BP+22
	R1=1	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
	pc=L113	// jump
L112:
.debug
	.dw '.stabn 0x44,0,352,',0,0
	.dd LM238-_main
	.dw 0x0d,0x0a
.code
LM238:
	R1=BP	// QImode move
	R2=BP+22
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
L113:
.debug
	.dw '.stabn 0x44,0,353,',0,0
	.dd LM239-_main
	.dw 0x0d,0x0a
.code
LM239:
	pc=L53	// jump
L114:
.debug
	.dw '.stabn 0x44,0,356,',0,0
	.dd LM240-_main
	.dw 0x0d,0x0a
.code
LM240:
	R1=BP	// QImode move
	R2=BP+15
	R1=13	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,357,',0,0
	.dd LM241-_main
	.dw 0x0d,0x0a
.code
LM241:
	R1=BP	// QImode move
	R2=BP+18
	R1=13	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,358,',0,0
	.dd LM242-_main
	.dw 0x0d,0x0a
.code
LM242:
	R1=BP	// QImode move
	R2=BP+24
	R1=13	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,360,',0,0
	.dd LM243-_main
	.dw 0x0d,0x0a
.code
LM243:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+24
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _showled	// call without return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,361,',0,0
	.dd LM244-_main
	.dw 0x0d,0x0a
.code
LM244:
	R1=4016	// QImode move
	[_Mk_Z6]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,362,',0,0
	.dd LM245-_main
	.dw 0x0d,0x0a
.code
LM245:
	R1=[_Mk_F]	// QImode move
	CMP R1,1499	// QImode compare
	JNA L175	// QImode GTU
	PC=L115
L175:
	R1=[_Mk_F]	// QImode move
	R2=100	// QImode move
	[_Mk_F]=R1+R2
	pc=L116	// jump
L115:
.debug
	.dw '.stabn 0x44,0,363,',0,0
	.dd LM246-_main
	.dw 0x0d,0x0a
.code
LM246:
	R1=0	// QImode move
	[_Mk_F]=R1	// QImode move
L116:
.debug
	.dw '.stabn 0x44,0,364,',0,0
	.dd LM247-_main
	.dw 0x0d,0x0a
.code
LM247:
	R1=BP	// QImode move
	R2=BP+23
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,0	// QImode test
	JZ L176	// QImode NE
	PC=L117
L176:
	R1=BP	// QImode move
	R2=BP+23
	R1=1	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
	pc=L118	// jump
L117:
.debug
	.dw '.stabn 0x44,0,365,',0,0
	.dd LM248-_main
	.dw 0x0d,0x0a
.code
LM248:
	R1=BP	// QImode move
	R2=BP+23
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L118:
.debug
	.dw '.stabn 0x44,0,366,',0,0
	.dd LM249-_main
	.dw 0x0d,0x0a
.code
LM249:
	pc=L53	// jump
L119:
.debug
	.dw '.stabn 0x44,0,369,',0,0
	.dd LM250-_main
	.dw 0x0d,0x0a
.code
LM250:
	R1=BP	// QImode move
	R2=BP+16
	R1=14	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,370,',0,0
	.dd LM251-_main
	.dw 0x0d,0x0a
.code
LM251:
	R1=BP	// QImode move
	R2=BP+18
	R1=14	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,371,',0,0
	.dd LM252-_main
	.dw 0x0d,0x0a
.code
LM252:
	R1=BP	// QImode move
	R2=BP+24
	R1=14	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,373,',0,0
	.dd LM253-_main
	.dw 0x0d,0x0a
.code
LM253:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+24
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _showled	// call without return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,374,',0,0
	.dd LM254-_main
	.dw 0x0d,0x0a
.code
LM254:
	R1=BP	// QImode move
	R2=BP+25
	R1=7500	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,376,',0,0
	.dd LM255-_main
	.dw 0x0d,0x0a
.code
LM255:
	call _Gaopin	// call with return value
.debug
	.dw '.stabn 0x44,0,377,',0,0
	.dd LM256-_main
	.dw 0x0d,0x0a
.code
LM256:
	pc=L53	// jump
L120:
.debug
	.dw '.stabn 0x44,0,380,',0,0
	.dd LM257-_main
	.dw 0x0d,0x0a
.code
LM257:
	R1=BP	// QImode move
	R2=BP+17
	R1=15	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,381,',0,0
	.dd LM258-_main
	.dw 0x0d,0x0a
.code
LM258:
	R1=BP	// QImode move
	R2=BP+18
	R1=15	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,382,',0,0
	.dd LM259-_main
	.dw 0x0d,0x0a
.code
LM259:
	R1=BP	// QImode move
	R2=BP+24
	R1=15	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,384,',0,0
	.dd LM260-_main
	.dw 0x0d,0x0a
.code
LM260:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+24
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _showled	// call without return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,385,',0,0
	.dd LM261-_main
	.dw 0x0d,0x0a
.code
LM261:
	R1=BP	// QImode move
	R2=BP+25
	R1=10	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,386,',0,0
	.dd LM262-_main
	.dw 0x0d,0x0a
.code
LM262:
	call _Dipin	// call with return value
.debug
	.dw '.stabn 0x44,0,387,',0,0
	.dd LM263-_main
	.dw 0x0d,0x0a
.code
LM263:
	pc=L53	// jump
.debug
	.dw '.stabn 0x44,0,388,',0,0
	.dd LM264-_main
	.dw 0x0d,0x0a
.code
LM264:
LBE8:
L122:
L53:
.debug
	.dw '.stabn 0x44,0,389,',0,0
	.dd LM265-_main
	.dw 0x0d,0x0a
.code
LM265:
LBE7:
	pc=L50	// jump
L51:
.debug
	.dw '.stabn 0x44,0,390,',0,0
	.dd LM266-_main
	.dw 0x0d,0x0a
.code
LM266:
LBE6:
.debug
	.dw '.stabn 0x44,0,390,',0,0
	.dd LM267-_main
	.dw 0x0d,0x0a
.code
LM267:
L48:

	sp+=62
	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB6-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "keyfirst:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "keylast:1",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "xx0:1",128,0,0,2',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "xx1:1",128,0,0,3',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "xx2:1",128,0,0,4',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "xx3:1",128,0,0,5',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "xx4:1",128,0,0,6',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "xx5:1",128,0,0,7',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "xx6:1",128,0,0,8',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "xx7:1",128,0,0,9',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "xx8:1",128,0,0,10',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "xx9:1",128,0,0,11',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "xxA:1",128,0,0,12',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "xxB:1",128,0,0,13',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "xxC:1",128,0,0,14',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "xxD:1",128,0,0,15',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "xxE:1",128,0,0,16',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "xxF:1",128,0,0,17',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "i:1",128,0,0,18',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "aa:1",128,0,0,19',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "bb:1",128,0,0,20',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "cc:1",128,0,0,21',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "dd:1",128,0,0,22',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "ff:1",128,0,0,23',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "kind:1",128,0,0,24',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "frequency:1",128,0,0,25',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "max:4",128,0,0,26',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "m:4",128,0,0,27',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "yy:1",128,0,0,28',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB7-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB8-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE8-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE7-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE6-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME3-_main
	.dw 0x0d,0x0a
.code
LME3:
.debug
	.dw '.stabs "w:G12",32,0,0,',0,0,offset _w,seg _w,0x0d,0x0a
.CODE
.ram
.public _w
_w:
	.dw 2 dup(0)
.debug
	.dw '.stabs "y:G12",32,0,0,',0,0,offset _y,seg _y,0x0d,0x0a
.CODE
.ram
.public _y
_y:
	.dw 2 dup(0)
.debug
	.dw '.stabs "t:G12",32,0,0,',0,0,offset _t,seg _t,0x0d,0x0a
.CODE
.ram
.public _t
_t:
	.dw 2 dup(0)
.debug
	.dw '.stabs "tt:G12",32,0,0,',0,0,offset _tt,seg _tt,0x0d,0x0a
.CODE
.ram
.public _tt
_tt:
	.dw 2 dup(0)
.debug
	.dw '.stabs "h:G12",32,0,0,',0,0,offset _h,seg _h,0x0d,0x0a
.CODE
.ram
.public _h
_h:
	.dw 2 dup(0)
.debug
	.dw '.stabs "j:G12",32,0,0,',0,0,offset _j,seg _j,0x0d,0x0a
.CODE
.ram
.public _j
_j:
	.dw 2 dup(0)
.external _Dipin
.external _Gaopin
.external _F_Apwm
.external _DAC_FW
.external _sinf
.external _Fangbo
.external _Juchibo
.external _Sanjiaobo
.external _L_asin
.external _key_asm1
.external _key_asm
.external _K_IRQ
.external _baab
.external _delay
.external _singleled
.external _SP_INT_64Hz
.external _SACM_S480_ServiceLoop
.external _SACM_S480_Status
.external _SACM_S480_Play
.external _SACM_S480_Initial
.external _Turnoff_INT_64Hz
.external __cmpf2
.external __addf2
.external __cvi1f2
.external __cvf2i1
.external __divf2
.external __mulf2
.external __divi1
.external __modi1
.external __divi2
	.end
