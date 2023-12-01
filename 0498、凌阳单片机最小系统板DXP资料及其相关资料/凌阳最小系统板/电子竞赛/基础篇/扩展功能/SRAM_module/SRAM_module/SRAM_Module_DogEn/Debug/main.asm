// GCC for SUNPLUS u'nSP version 1.0.10
// Command: D:\PROGRA~1\Sunplus\UNSPID~2\IDE180\cc1.exe D:\DOCUME~1\³ÂÐ¢±ò\LOCALS~1\Temp\ccIvaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\DXJH\\e_design\\SRAM_module\\SRAM_Module_DogEn/", 0x64, 0, 3, Ltext0
.stabs "F:/DXJH/e_design/SRAM_module/SRAM_Module_DogEn/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabn 0x44,0,38,',0,0
	.dd LM1-_main
	.dw 0x0d,0x0a
.code
LM1:
	// total=10, vars=10
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=10
	bp=sp+1

	R1=BP+13
	[bp+4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,39,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	R1=0	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,40,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R1=BP	// QImode move
	R2=BP+2
	R3=0	// HImode immediate to register move
	R4=0
	R1=R2	// QImode move
	[R1++]=R3	// [RD]=RS HImode, RD!=RS+1
	[R1--]=R4
.debug
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	call _F_System_Initial	// call without return value
.debug
	.dw '.stabn 0x44,0,43,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R1=23205	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
L3:
	pc=L5	// jump
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,46,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	call _SP_InitWriteSRAM	// call without return value
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
	R1=[BP]	// QImode move
	[SP--]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+2
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	push R3,R4 to [sp]	// pushhi
	call _SP_WriteSRAM	// call without return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,48,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	call _SP_InitReadSRAM	// call without return value
.debug
	.dw '.stabn 0x44,0,49,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	R1=BP	// QImode move
	R2=BP+2
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	push R3,R4 to [sp]	// pushhi
	call _SP_ReadSRAM	// call with return value
	SP=SP+2
	R2=BP	// QImode move
	R3=BP+1
	R2=R3	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,51,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	R2=BP	// QImode move
	R1=BP+2
	R2=BP	// QImode move
	R3=BP+2
	[bp+7]=R3	// QImode move
	R4=[bp+7]	// QImode move
	R3=[R4++]	// RD=[RS] HImode, RD+1=RS
	R4=[R4]
	[bp+5]=R3	// HImode [BP+#IM6]=RS
	[bp+6]=R4
	R3=[bp+5]	// HImode RD=[BP+#IM6]
	R4=[bp+6]
	R3=R3+2	// HImode RD=RS+#IMM16
	R4=R4+0, Carry
	[bp+8]=R3	// HImode [BP+#IM6]=RS
	[bp+9]=R4
	R3=[bp+8]	// HImode RD=[BP+#IM6]
	R4=[bp+9]
	R2=R1	// QImode move
	[R2]=R3	// [RD]=RS HImode, RD=RS+1
	PUSH BP TO [SP]
	BP=R2
	[BP+1]=R4
	POP BP FROM [SP]
.debug
	.dw '.stabn 0x44,0,52,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	R1=BP	// QImode move
	R2=BP+2
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	CMP R4,1	// HImode compare
	JA  L8	// HImode LEU
	JNZ L7
	CMP R3,(-1)
	JA  L8
L7:
	PC=L6
L8:
.debug
	.dw '.stabn 0x44,0,53,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	R1=BP	// QImode move
	R2=BP+2
	R3=0	// HImode immediate to register move
	R4=0
	R1=R2	// QImode move
	[R1++]=R3	// [RD]=RS HImode, RD!=RS+1
	[R1--]=R4
L6:
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	call _F_Clear_WatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,55,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
LBE2:
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
L2:

	sp+=10
	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "uiWriteRamData:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "uiReadRamData:4",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "ulAddr:5",128,0,0,2',0x0d,0x0a
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
.external _F_Clear_WatchDog
.external _SP_ReadSRAM
.external _SP_InitReadSRAM
.external _SP_WriteSRAM
.external _SP_InitWriteSRAM
.external _F_System_Initial
	.end
