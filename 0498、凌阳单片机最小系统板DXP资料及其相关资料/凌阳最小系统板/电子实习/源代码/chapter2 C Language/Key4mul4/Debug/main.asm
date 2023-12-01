// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\PROGRA~1\Sunplus\UNSPID~3\IDE180\cc1.exe C:\DOCUME~1\李华丽.DOMAIN\LOCALS~1\Temp\ccWuaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\电子竞赛\\C语言应用篇\\Source Code\\chapter2 C Language\\Key4mul4/", 0x64, 0, 3, Ltext0
.stabs "F:/电子竞赛/C语言应用篇/Source Code/chapter2 C Language/Key4mul4/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "P_IOA_Data:G20=*4",32,0,0,',0,0,offset _P_IOA_Data,seg _P_IOA_Data,0x0d,0x0a
.CODE
.public _P_IOA_Data
.iram
_P_IOA_Data:
	.dw 28672
.debug
	.dw '.stabs "P_IOA_Dir:G20",32,0,0,',0,0,offset _P_IOA_Dir,seg _P_IOA_Dir,0x0d,0x0a
.CODE
.public _P_IOA_Dir
.iram
_P_IOA_Dir:
	.dw 28674
.debug
	.dw '.stabs "P_P_IOA_Attrib:G20",32,0,0,',0,0,offset _P_P_IOA_Attrib,seg _P_P_IOA_Attrib,0x0d,0x0a
.CODE
.public _P_P_IOA_Attrib
.iram
_P_P_IOA_Attrib:
	.dw 28675
.code
.debug
	.dw '.stabs "key:F19",36,0,0,',0,0,offset _key,seg _key,0x0d,0x0a
.CODE
.public _key
_key:	.proc
.debug
	.dw '.stabn 0x44,0,7,',0,0
	.dd LM1-_key
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
	.dw '.stabn 0x44,0,8,',0,0
	.dd LM2-_key
	.dw 0x0d,0x0a
.code
LM2:
	R2=16	// QImode move
	[_row]=R2	// QImode move
L3:
	R2=[_row]	// QImode move
	CMP R2,255	// QImode compare
	JA L8	// QImode LEU
	PC=L6
L8:
	pc=L4	// jump
L6:
.debug
	.dw '.stabn 0x44,0,10,',0,0
	.dd LM3-_key
	.dw 0x0d,0x0a
.code
LM3:
	R2=[_P_IOA_Data]	// QImode move
	R3=[_P_IOA_Data]	// QImode move
	R4=R3	// QImode move
	R4=[R4]	// QImode move
	[BP]=R4	// QImode move
	R4=[BP]	// QImode move
	R3=R4&[_row]
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,11,',0,0
	.dd LM4-_key
	.dw 0x0d,0x0a
.code
LM4:
	R3=[_new]	// QImode move
	R2=R3 lsl 4
	R3=[_P_IOA_Data]	// QImode move
	R4=R3	// QImode move
	R4=[R4]	// QImode move
	[BP]=R4	// QImode move
	R4=[BP]	// QImode move
	R3=R4&15
	[_new]=R2|R3
.debug
	.dw '.stabn 0x44,0,8,',0,0
	.dd LM5-_key
	.dw 0x0d,0x0a
.code
LM5:
L5:
	R2=[_row]	// QImode move
	R3=R2 lsl 1
	[_row]=R3	// QImode move
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,13,',0,0
	.dd LM6-_key
	.dw 0x0d,0x0a
.code
LM6:
	R3=[_new]	// QImode move
	R2=R3^[_old]
	R3=R2	// QImode move
	[_temp]=R3	// QImode move
	CMP R3,0	// QImode test
	JNZ L9	// QImode EQ
	PC=L7
L9:
.debug
	.dw '.stabn 0x44,0,15,',0,0
	.dd LM7-_key
	.dw 0x0d,0x0a
.code
LM7:
	R2=[_temp]	// QImode move
	R3=[_new]	// QImode move
	[_push]=R2&R3
.debug
	.dw '.stabn 0x44,0,16,',0,0
	.dd LM8-_key
	.dw 0x0d,0x0a
.code
LM8:
	R2=[_temp]	// QImode move
	R3=[_old]	// QImode move
	[_rel]=R2&R3
.debug
	.dw '.stabn 0x44,0,17,',0,0
	.dd LM9-_key
	.dw 0x0d,0x0a
.code
LM9:
	R2=[_new]	// QImode move
	[_old]=R2	// QImode move
L7:
.debug
	.dw '.stabn 0x44,0,19,',0,0
	.dd LM10-_key
	.dw 0x0d,0x0a
.code
LM10:
.debug
	.dw '.stabn 0x44,0,19,',0,0
	.dd LM11-_key
	.dw 0x0d,0x0a
.code
LM11:
L2:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of key

.debug
	.dw '.stabf ',0,0
	.dd LME1-_key
	.dw 0x0d,0x0a
.code
LME1:
.code
.debug
	.dw '.stabs "main:F1",36,0,0,',0,0,offset _main,seg _main,0x0d,0x0a
.CODE
.public _main
_main:	.proc
.debug
	.dw '.stabn 0x44,0,24,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,25,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	R1=[_P_IOA_Dir]	// QImode move
	R2=240	// QImode move
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,26,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	R1=[_P_P_IOA_Attrib]	// QImode move
	R2=0	// QImode move
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	R1=[_P_IOA_Data]	// QImode move
	R2=15	// QImode move
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,28,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	call _key	// call without return value
.debug
	.dw '.stabn 0x44,0,29,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
.debug
	.dw '.stabn 0x44,0,29,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
L10:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabf ',0,0
	.dd LME2-_main
	.dw 0x0d,0x0a
.code
LME2:
.debug
	.dw '.stabs "old:G4",32,0,0,',0,0,offset _old,seg _old,0x0d,0x0a
.CODE
.ram
.public _old
_old:
	.dw 0
.debug
	.dw '.stabs "new:G4",32,0,0,',0,0,offset _new,seg _new,0x0d,0x0a
.CODE
.ram
.public _new
_new:
	.dw 0
.debug
	.dw '.stabs "push:G4",32,0,0,',0,0,offset _push,seg _push,0x0d,0x0a
.CODE
.ram
.public _push
_push:
	.dw 0
.debug
	.dw '.stabs "rel:G4",32,0,0,',0,0,offset _rel,seg _rel,0x0d,0x0a
.CODE
.ram
.public _rel
_rel:
	.dw 0
.debug
	.dw '.stabs "temp:G4",32,0,0,',0,0,offset _temp,seg _temp,0x0d,0x0a
.CODE
.ram
.public _temp
_temp:
	.dw 0
.debug
	.dw '.stabs "row:G4",32,0,0,',0,0,offset _row,seg _row,0x0d,0x0a
.CODE
.ram
.public _row
_row:
	.dw 0
	.end
