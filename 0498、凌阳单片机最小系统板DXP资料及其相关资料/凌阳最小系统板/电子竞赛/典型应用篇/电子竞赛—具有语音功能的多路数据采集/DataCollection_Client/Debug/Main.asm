// GCC for SUNPLUS u'nSP version 1.0.10
// Command: D:\PROGRA~1\Sunplus\UNSPID~2\IDE180\cc1.exe D:\DOCUME~1\³ÂÐ¢±ò\LOCALS~1\Temp\cc8Aaaaa.i -fkeep-inline-functions -quiet -dumpbase Main.c -gstabs -o .\Debug/Main.asm
// gcc2_compiled.:

.stabs "F:\\DXJH\\e_design\\Data_Sample\\release\\DataCollection_code\\DataCollection_Client/", 0x64, 0, 3, Ltext0
.stabs "F:/DXJH/e_design/Data_Sample/release/DataCollection_code/DataCollection_Client/Main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "uiCircleChannelNumber:G4",32,0,0,',0,0,offset _uiCircleChannelNumber,seg _uiCircleChannelNumber,0x0d,0x0a
.CODE
.public _uiCircleChannelNumber
.iram
_uiCircleChannelNumber:
	.dw 0
.debug
	.dw '.stabs "g_uiUARTCommand:G4",32,0,0,',0,0,offset _g_uiUARTCommand,seg _g_uiUARTCommand,0x0d,0x0a
.CODE
.public _g_uiUARTCommand
.iram
_g_uiUARTCommand:
	.dw 0
.debug
	.dw '.stabs "g_uiChannelNumber:G4",32,0,0,',0,0,offset _g_uiChannelNumber,seg _g_uiChannelNumber,0x0d,0x0a
.CODE
.public _g_uiChannelNumber
.iram
_g_uiChannelNumber:
	.dw 0
.code
.debug
	.dw '.stabs "main:F1",36,0,0,',0,0,offset _main,seg _main,0x0d,0x0a
.CODE
.public _main
_main:	.proc
.debug
	.dw '.stabn 0x44,0,39,',0,0
	.dd LM1-_main
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
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	R1=0	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	call _F_System_Initial	// call without return value
.debug
	.dw '.stabn 0x44,0,43,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	call _F_UART_Initial	// call without return value
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	call _F_AD_Initial	// call without return value
.debug
	.dw '.stabn 0x44,0,45,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R1=1	// QImode move
	[_uiCircleChannelNumber]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,46,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R1=0	// QImode move
	[BP]=R1	// QImode move
L3:
	R1=[BP]	// QImode move
	CMP R1,7	// QImode compare
	JA L18	// QImode LEU
	PC=L6
L18:
	pc=L4	// jump
L6:
.debug
	.dw '.stabn 0x44,0,48,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	R1=_g_aChannelsVoltageValueBuf	// QImode move
	R2=[BP]	// QImode move
	R1+=R2	// addqi3_r0r
	R2=0	// QImode move
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,46,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
L5:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
L7:
	pc=L9	// jump
	pc=L8	// jump
L9:
.debug
	.dw '.stabn 0x44,0,52,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
LBB3:
	R1=[_uiCircleChannelNumber]	// QImode move
	[SP--]=R1	// QImode move
	call _F_ReadAD	// call with return value
	SP=SP+1
	R2=_g_aChannelsVoltageValueBuf	// QImode move
	R3=[_uiCircleChannelNumber]	// QImode move
	R2+=R3	// addqi3_r0r
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,53,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	R1=[_uiCircleChannelNumber]	// QImode move
	R2=1	// QImode move
	[_uiCircleChannelNumber]=R1+R2
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	R1=[_uiCircleChannelNumber]	// QImode move
	CMP R1,8	// QImode compare
	JZ L19	// QImode NE
	PC=L10
L19:
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	R1=1	// QImode move
	[_uiCircleChannelNumber]=R1	// QImode move
L10:
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	R1=[_g_uiUARTCommand]	// QImode move
	CMP R1,0	// QImode test
	JNZ L20	// QImode EQ
	PC=L11
L20:
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	R1=[_g_uiUARTCommand]	// QImode move
	R2=15	// QImode move
	[_g_uiChannelNumber]=R1&R2
.debug
	.dw '.stabn 0x44,0,61,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
	R2=[_g_uiUARTCommand]	// QImode move
	R1=R2&240
	R2=4	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __rshu1	// call with return value
	SP=SP+2
	R2=[_g_uiChannelNumber]	// QImode move
	CMP R2,R1	// QImode compare
	JZ L21	// QImode NE
	PC=L12
L21:
.debug
	.dw '.stabn 0x44,0,63,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
	R1=[_g_uiChannelNumber]	// QImode move
	CMP R1,0	// QImode test
	JNZ L22	// QImode EQ
	PC=L12
L22:
	R1=[_g_uiChannelNumber]	// QImode move
	CMP R1,7	// QImode compare
	JNA L23	// QImode GTU
	PC=L12
L23:
.debug
	.dw '.stabn 0x44,0,66,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
	R1=_g_aChannelsVoltageValueBuf	// QImode move
	R2=[_g_uiChannelNumber]	// QImode move
	R1+=R2	// addqi3_r0r
	R3=R1	// QImode move
	R2=[R3]	// QImode move
	[SP--]=R2	// QImode move
	call _F_UART_WriteByteData	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,67,',0,0
	.dd LM20-_main
	.dw 0x0d,0x0a
.code
LM20:
	R1=0	// QImode move
	[BP]=R1	// QImode move
L14:
	R1=[BP]	// QImode move
	CMP R1,254	// QImode compare
	JA L24	// QImode LEU
	PC=L16
L24:
	pc=L15	// jump
L17:
L16:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L14	// jump
L15:
.debug
	.dw '.stabn 0x44,0,68,',0,0
	.dd LM21-_main
	.dw 0x0d,0x0a
.code
LM21:
	R1=_g_aChannelsVoltageValueBuf	// QImode move
	R3=[_g_uiChannelNumber]	// QImode move
	R2=R1	// QImode move
	R2+=R3	// addqi3_r0r
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=8	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __rshu1	// call with return value
	SP=SP+2
	[SP--]=R1	// QImode move
	call _F_UART_WriteByteData	// call without return value
	SP=SP+1
L13:
L12:
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM22-_main
	.dw 0x0d,0x0a
.code
LM22:
	R1=0	// QImode move
	[_g_uiUARTCommand]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,73,',0,0
	.dd LM23-_main
	.dw 0x0d,0x0a
.code
LM23:
	R1=0	// QImode move
	[_g_uiChannelNumber]=R1	// QImode move
L11:
.debug
	.dw '.stabn 0x44,0,76,',0,0
	.dd LM24-_main
	.dw 0x0d,0x0a
.code
LM24:
LBE3:
	pc=L7	// jump
L8:
.debug
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM25-_main
	.dw 0x0d,0x0a
.code
LM25:
LBE2:
.debug
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM26-_main
	.dw 0x0d,0x0a
.code
LM26:
L2:

	sp+=2
	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "i:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB3-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE3-_main
	.dw 0x0d,0x0a
.code
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
.debug
	.dw '.stabs "g_aChannelsVoltageValueBuf:G20=ar1;0;7;4",32,0,0,',0,0,offset _g_aChannelsVoltageValueBuf,seg _g_aChannelsVoltageValueBuf,0x0d,0x0a
.CODE
.ram
.public _g_aChannelsVoltageValueBuf
_g_aChannelsVoltageValueBuf:
	.dw 8 dup(0)
.external _F_UART_WriteByteData
.external _F_ReadAD
.external _F_AD_Initial
.external _F_UART_Initial
.external _F_System_Initial
.external __rshu1
	.end
