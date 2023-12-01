// GCC for SUNPLUS u'nSP version 1.0.8
// Command: E:\PROGRA~1\Sunplus\UNSPID~1\IDE162\cc1.exe C:\DOCUME~1\ÁõÐÂÑÕ\LOCALS~1\Temp\cc0Eaaaa.i -fkeep-inline-functions -quiet -dumpbase keyfind.c -gstabs -o .\Debug/keyfind.asm
// gcc2_compiled.:

.stabs "E:\\0Ïä×Ó\\led and key test/", 0x64, 0, 3, Ltext0
.stabs "E:/0Ïä×Ó/led and key test/keyfind.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "keyfind:F19",36,0,0,',0,0,offset _keyfind,seg _keyfind,0x0d,0x0a
.CODE
.public _keyfind
_keyfind:	.proc
.debug
	.dw '.stabn 0x44,0,3,',0,0
	.dd LM1-_keyfind
	.dw 0x0d,0x0a
.code
LM1:
	// total=3, vars=3
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=3
	bp=sp+1

	R1=BP+6
	[bp+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,4,',0,0
	.dd LM2-_keyfind
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	R1=0	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,6,',0,0
	.dd LM3-_keyfind
	.dw 0x0d,0x0a
.code
LM3:
	call _key_asm	// call with return value
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,7,',0,0
	.dd LM4-_keyfind
	.dw 0x0d,0x0a
.code
LM4:
	call _key_asm1	// call with return value
	R2=BP	// QImode move
	R3=BP+1
	R2=R3	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,8,',0,0
	.dd LM5-_keyfind
	.dw 0x0d,0x0a
.code
LM5:
	R1=15	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,9,',0,0
	.dd LM6-_keyfind
	.dw 0x0d,0x0a
.code
LM6:
	R1=[BP]	// QImode move
	R2=R1&[_value]
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,10,',0,0
	.dd LM7-_keyfind
	.dw 0x0d,0x0a
.code
LM7:
	R1=240	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,11,',0,0
	.dd LM8-_keyfind
	.dw 0x0d,0x0a
.code
LM8:
	R2=BP	// QImode move
	R1=BP+1
	R3=BP	// QImode move
	R2=BP+1
	R4=[_value]	// QImode move
	R3=R4	// QImode move
	R4=R2	// QImode move
	R3&=[R4]	// andqi3_r0R
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,12,',0,0
	.dd LM9-_keyfind
	.dw 0x0d,0x0a
.code
LM9:
	R2=BP	// QImode move
	R1=BP+1
	R3=[BP]	// QImode move
	R2=R3	// QImode move
	R3=R1	// QImode move
	R2|=[R3]	// iorqi3_r0R
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,13,',0,0
	.dd LM10-_keyfind
	.dw 0x0d,0x0a
.code
LM10:
	R1=255	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,14,',0,0
	.dd LM11-_keyfind
	.dw 0x0d,0x0a
.code
LM11:
	R1=[BP]	// QImode move
	R2=R1^[_value]
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,15,',0,0
	.dd LM12-_keyfind
	.dw 0x0d,0x0a
.code
LM12:
	R1=[BP]	// QImode move
	CMP R1,190	// QImode compare
	JNZ L30	// QImode EQ
	PC=L7
L30:
	CMP R1,190	// QImode compare
	JNG L31	// QImode GT
	PC=L23
L31:
	CMP R1,125	// QImode compare
	JNZ L32	// QImode EQ
	PC=L12
L32:
	CMP R1,125	// QImode compare
	JNG L33	// QImode GT
	PC=L24
L33:
	CMP R1,119	// QImode compare
	JNZ L34	// QImode EQ
	PC=L20
L34:
	CMP R1,119	// QImode compare
	JNG L35	// QImode GT
	PC=L25
L35:
	CMP R1,0	// QImode test
	JNZ L36	// QImode EQ
	PC=L4
L36:
	pc=L3	// Indirect jump
L25:
	CMP R1,123	// QImode compare
	JNZ L37	// QImode EQ
	PC=L16
L37:
	pc=L3	// Indirect jump
L24:
	CMP R1,183	// QImode compare
	JNZ L38	// QImode EQ
	PC=L19
L38:
	CMP R1,183	// QImode compare
	JNG L39	// QImode GT
	PC=L26
L39:
	CMP R1,126	// QImode compare
	JNZ L40	// QImode EQ
	PC=L8
L40:
	pc=L3	// Indirect jump
L26:
	CMP R1,187	// QImode compare
	JNZ L41	// QImode EQ
	PC=L15
L41:
	CMP R1,189	// QImode compare
	JNZ L42	// QImode EQ
	PC=L11
L42:
	pc=L3	// Indirect jump
L23:
	CMP R1,222	// QImode compare
	JNZ L43	// QImode EQ
	PC=L6
L43:
	CMP R1,222	// QImode compare
	JNG L44	// QImode GT
	PC=L27
L44:
	CMP R1,219	// QImode compare
	JNZ L45	// QImode EQ
	PC=L14
L45:
	CMP R1,219	// QImode compare
	JNG L46	// QImode GT
	PC=L28
L46:
	CMP R1,215	// QImode compare
	JNZ L47	// QImode EQ
	PC=L18
L47:
	pc=L3	// Indirect jump
L28:
	CMP R1,221	// QImode compare
	JNZ L48	// QImode EQ
	PC=L10
L48:
	pc=L3	// Indirect jump
L27:
	CMP R1,235	// QImode compare
	JNZ L49	// QImode EQ
	PC=L13
L49:
	CMP R1,235	// QImode compare
	JNG L50	// QImode GT
	PC=L29
L50:
	CMP R1,231	// QImode compare
	JNZ L51	// QImode EQ
	PC=L17
L51:
	pc=L3	// Indirect jump
L29:
	CMP R1,237	// QImode compare
	JNZ L52	// QImode EQ
	PC=L9
L52:
	CMP R1,238	// QImode compare
	JNZ L53	// QImode EQ
	PC=L5
L53:
	pc=L3	// Indirect jump
L4:
.debug
	.dw '.stabn 0x44,0,18,',0,0
	.dd LM13-_keyfind
	.dw 0x0d,0x0a
.code
LM13:
	pc=L3	// Indirect jump
L5:
.debug
	.dw '.stabn 0x44,0,20,',0,0
	.dd LM14-_keyfind
	.dw 0x0d,0x0a
.code
LM14:
	R1=0	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,21,',0,0
	.dd LM15-_keyfind
	.dw 0x0d,0x0a
.code
LM15:
	pc=L3	// Indirect jump
L6:
.debug
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM16-_keyfind
	.dw 0x0d,0x0a
.code
LM16:
	R1=1	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,24,',0,0
	.dd LM17-_keyfind
	.dw 0x0d,0x0a
.code
LM17:
	pc=L3	// Indirect jump
L7:
.debug
	.dw '.stabn 0x44,0,26,',0,0
	.dd LM18-_keyfind
	.dw 0x0d,0x0a
.code
LM18:
	R1=2	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM19-_keyfind
	.dw 0x0d,0x0a
.code
LM19:
	pc=L3	// Indirect jump
L8:
.debug
	.dw '.stabn 0x44,0,29,',0,0
	.dd LM20-_keyfind
	.dw 0x0d,0x0a
.code
LM20:
	R1=3	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,30,',0,0
	.dd LM21-_keyfind
	.dw 0x0d,0x0a
.code
LM21:
	pc=L3	// Indirect jump
L9:
.debug
	.dw '.stabn 0x44,0,32,',0,0
	.dd LM22-_keyfind
	.dw 0x0d,0x0a
.code
LM22:
	R1=4	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,33,',0,0
	.dd LM23-_keyfind
	.dw 0x0d,0x0a
.code
LM23:
	pc=L3	// Indirect jump
L10:
.debug
	.dw '.stabn 0x44,0,35,',0,0
	.dd LM24-_keyfind
	.dw 0x0d,0x0a
.code
LM24:
	R1=5	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,36,',0,0
	.dd LM25-_keyfind
	.dw 0x0d,0x0a
.code
LM25:
	pc=L3	// Indirect jump
L11:
.debug
	.dw '.stabn 0x44,0,38,',0,0
	.dd LM26-_keyfind
	.dw 0x0d,0x0a
.code
LM26:
	R1=6	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,39,',0,0
	.dd LM27-_keyfind
	.dw 0x0d,0x0a
.code
LM27:
	pc=L3	// Indirect jump
L12:
.debug
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM28-_keyfind
	.dw 0x0d,0x0a
.code
LM28:
	R1=7	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM29-_keyfind
	.dw 0x0d,0x0a
.code
LM29:
	pc=L3	// Indirect jump
L13:
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM30-_keyfind
	.dw 0x0d,0x0a
.code
LM30:
	R1=8	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,45,',0,0
	.dd LM31-_keyfind
	.dw 0x0d,0x0a
.code
LM31:
	pc=L3	// Indirect jump
L14:
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM32-_keyfind
	.dw 0x0d,0x0a
.code
LM32:
	R1=9	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,48,',0,0
	.dd LM33-_keyfind
	.dw 0x0d,0x0a
.code
LM33:
	pc=L3	// Indirect jump
L15:
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM34-_keyfind
	.dw 0x0d,0x0a
.code
LM34:
	R1=10	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,51,',0,0
	.dd LM35-_keyfind
	.dw 0x0d,0x0a
.code
LM35:
	pc=L3	// Indirect jump
L16:
.debug
	.dw '.stabn 0x44,0,53,',0,0
	.dd LM36-_keyfind
	.dw 0x0d,0x0a
.code
LM36:
	R1=11	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM37-_keyfind
	.dw 0x0d,0x0a
.code
LM37:
	pc=L3	// Indirect jump
L17:
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM38-_keyfind
	.dw 0x0d,0x0a
.code
LM38:
	R1=12	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,57,',0,0
	.dd LM39-_keyfind
	.dw 0x0d,0x0a
.code
LM39:
	pc=L3	// Indirect jump
L18:
.debug
	.dw '.stabn 0x44,0,59,',0,0
	.dd LM40-_keyfind
	.dw 0x0d,0x0a
.code
LM40:
	R1=13	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM41-_keyfind
	.dw 0x0d,0x0a
.code
LM41:
	pc=L3	// Indirect jump
L19:
.debug
	.dw '.stabn 0x44,0,62,',0,0
	.dd LM42-_keyfind
	.dw 0x0d,0x0a
.code
LM42:
	R1=14	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,63,',0,0
	.dd LM43-_keyfind
	.dw 0x0d,0x0a
.code
LM43:
	pc=L3	// Indirect jump
L20:
.debug
	.dw '.stabn 0x44,0,65,',0,0
	.dd LM44-_keyfind
	.dw 0x0d,0x0a
.code
LM44:
	R1=15	// QImode move
	[_value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,66,',0,0
	.dd LM45-_keyfind
	.dw 0x0d,0x0a
.code
LM45:
	pc=L3	// Indirect jump
.debug
	.dw '.stabn 0x44,0,67,',0,0
	.dd LM46-_keyfind
	.dw 0x0d,0x0a
.code
LM46:
	pc=L2	// Indirect jump
L22:
L3:
.debug
	.dw '.stabn 0x44,0,69,',0,0
	.dd LM47-_keyfind
	.dw 0x0d,0x0a
.code
LM47:
LBE2:
.debug
	.dw '.stabn 0x44,0,69,',0,0
	.dd LM48-_keyfind
	.dw 0x0d,0x0a
.code
LM48:
L2:

	sp+=3
	pop bp from [sp]
	retf
	.endp	// end of keyfind

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_keyfind
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "keyfirst:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "keylast:1",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE2-_keyfind
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME1-_keyfind
	.dw 0x0d,0x0a
.code
LME1:
.external _value
.external _key_asm1
.external _key_asm
	.end
