// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\PROGRA~1\Sunplus\UNSPID~3\IDE180\cc1.exe C:\DOCUME~1\李华丽.DOMAIN\LOCALS~1\Temp\ccIxaaaa.i -fkeep-inline-functions -quiet -dumpbase EmbedFlashROM.c -gstabs -o .\Debug/EmbedFlashROM.asm
// gcc2_compiled.:

.stabs "F:\\电子竞赛\\C语言应用篇\\Source Code\\chapter10 Intergraded example\\SIO_UART/", 0x64, 0, 3, Ltext0
.stabs "F:/电子竞赛/C语言应用篇/Source Code/chapter10 Intergraded example/SIO_UART/EmbedFlashROM.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "P_Flash_Ctrl:G20=*4",32,0,0,',0,0,offset _P_Flash_Ctrl,seg _P_Flash_Ctrl,0x0d,0x0a
.CODE
.public _P_Flash_Ctrl
.iram
_P_Flash_Ctrl:
	.dw 30037
.code
.debug
	.dw '.stabs "EmbedFlashROM_PageErase:F19",36,0,0,',0,0,offset _EmbedFlashROM_PageErase,seg _EmbedFlashROM_PageErase,0x0d,0x0a
.CODE
.public _EmbedFlashROM_PageErase
_EmbedFlashROM_PageErase:	.proc
.debug
	.dw '.stabn 0x44,0,36,',0,0
	.dd LM1-_EmbedFlashROM_PageErase
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
	.dw '.stabn 0x44,0,37,',0,0
	.dd LM2-_EmbedFlashROM_PageErase
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
.debug
	.dw '.stabn 0x44,0,38,',0,0
	.dd LM3-_EmbedFlashROM_PageErase
	.dw 0x0d,0x0a
.code
LM3:
	R3=R1	// QImode move
	R2=[R3]	// QImode move
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,39,',0,0
	.dd LM4-_EmbedFlashROM_PageErase
	.dw 0x0d,0x0a
.code
LM4:
	R2=[_P_Flash_Ctrl]	// QImode move
	R3=(-21846)	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,40,',0,0
	.dd LM5-_EmbedFlashROM_PageErase
	.dw 0x0d,0x0a
.code
LM5:
	R2=[_P_Flash_Ctrl]	// QImode move
	R3=21777	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM6-_EmbedFlashROM_PageErase
	.dw 0x0d,0x0a
.code
LM6:
	R2=[BP]	// QImode move
	R3=1	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM7-_EmbedFlashROM_PageErase
	.dw 0x0d,0x0a
.code
LM7:
LBE2:
.debug
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM8-_EmbedFlashROM_PageErase
	.dw 0x0d,0x0a
.code
LM8:
L2:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of EmbedFlashROM_PageErase

.debug
	.dw '.stabs "addr:p4",160,0,0,4',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_EmbedFlashROM_PageErase
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "ADDR:21=*4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE2-_EmbedFlashROM_PageErase
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME1-_EmbedFlashROM_PageErase
	.dw 0x0d,0x0a
.code
LME1:
.code
.debug
	.dw '.stabs "EmbedFlashROM_WriteWord:F19",36,0,0,',0,0,offset _EmbedFlashROM_WriteWord,seg _EmbedFlashROM_WriteWord,0x0d,0x0a
.CODE
.public _EmbedFlashROM_WriteWord
_EmbedFlashROM_WriteWord:	.proc
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM9-_EmbedFlashROM_WriteWord
	.dw 0x0d,0x0a
.code
LM9:
	// total=2, vars=2
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=2
	bp=sp+1

	R1=BP+5
.debug
	.dw '.stabn 0x44,0,55,',0,0
	.dd LM10-_EmbedFlashROM_WriteWord
	.dw 0x0d,0x0a
.code
LM10:
LBB3:
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM11-_EmbedFlashROM_WriteWord
	.dw 0x0d,0x0a
.code
LM11:
	R3=R1	// QImode move
	R2=[R3]	// QImode move
	[BP]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,57,',0,0
	.dd LM12-_EmbedFlashROM_WriteWord
	.dw 0x0d,0x0a
.code
LM12:
	R2=[_P_Flash_Ctrl]	// QImode move
	R3=(-21846)	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM13-_EmbedFlashROM_WriteWord
	.dw 0x0d,0x0a
.code
LM13:
	R2=[_P_Flash_Ctrl]	// QImode move
	R3=21811	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,59,',0,0
	.dd LM14-_EmbedFlashROM_WriteWord
	.dw 0x0d,0x0a
.code
LM14:
	R2=[BP]	// QImode move
	R3=R1	// QImode move
	R3=R1+1
	[bp+1]=R3	// QImode move
	R4=[bp+1]	// QImode move
	R3=[R4]	// QImode move
	R4=R2	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM15-_EmbedFlashROM_WriteWord
	.dw 0x0d,0x0a
.code
LM15:
LBE3:
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM16-_EmbedFlashROM_WriteWord
	.dw 0x0d,0x0a
.code
LM16:
L3:

	sp+=2
	pop bp from [sp]
	retf
	.endp	// end of EmbedFlashROM_WriteWord

.debug
	.dw '.stabs "addr:p4",160,0,0,5',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "data:p4",160,0,0,6',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB3-_EmbedFlashROM_WriteWord
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "ADDR:21",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE3-_EmbedFlashROM_WriteWord
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME2-_EmbedFlashROM_WriteWord
	.dw 0x0d,0x0a
.code
LME2:
.code
.debug
	.dw '.stabs "EmbedFlashROM_ReadWord:F4",36,0,0,',0,0,offset _EmbedFlashROM_ReadWord,seg _EmbedFlashROM_ReadWord,0x0d,0x0a
.CODE
.public _EmbedFlashROM_ReadWord
_EmbedFlashROM_ReadWord:	.proc
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM17-_EmbedFlashROM_ReadWord
	.dw 0x0d,0x0a
.code
LM17:
	// total=3, vars=3
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=3
	bp=sp+1

	R2=BP+6
.debug
	.dw '.stabn 0x44,0,73,',0,0
	.dd LM18-_EmbedFlashROM_ReadWord
	.dw 0x0d,0x0a
.code
LM18:
LBB4:
.debug
	.dw '.stabn 0x44,0,74,',0,0
	.dd LM19-_EmbedFlashROM_ReadWord
	.dw 0x0d,0x0a
.code
LM19:
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM20-_EmbedFlashROM_ReadWord
	.dw 0x0d,0x0a
.code
LM20:
	R3=BP	// QImode move
	R1=BP+1
	R3=[BP]	// QImode move
	R4=R3	// QImode move
	R4=[R4]	// QImode move
	[bp+2]=R4	// QImode move
	R3=[bp+2]	// QImode move
	R4=R1	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,76,',0,0
	.dd LM21-_EmbedFlashROM_ReadWord
	.dw 0x0d,0x0a
.code
LM21:
	R1=BP	// QImode move
	R3=BP+1
	R1=R3	// QImode move
	R4=[R1]	// QImode move
	R1=R4	// QImode move
	pc=L4	// jump
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM22-_EmbedFlashROM_ReadWord
	.dw 0x0d,0x0a
.code
LM22:
LBE4:
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM23-_EmbedFlashROM_ReadWord
	.dw 0x0d,0x0a
.code
LM23:
L4:

	sp+=3
	pop bp from [sp]
	retf
	.endp	// end of EmbedFlashROM_ReadWord

.debug
	.dw '.stabs "addr:p4",160,0,0,6',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB4-_EmbedFlashROM_ReadWord
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "ADDR:21",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "data:4",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE4-_EmbedFlashROM_ReadWord
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME3-_EmbedFlashROM_ReadWord
	.dw 0x0d,0x0a
.code
LME3:
	.end
