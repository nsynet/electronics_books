// GCC for SUNPLUS u'nSP version 1.0.10
// Command: D:\PROGRA~1\Sunplus\UNSPID~2\IDE180\cc1.exe D:\DOCUME~1\³ÂÐ¢±ò\LOCALS~1\Temp\cciCaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\DXJH\\e_design\\Data_Sample\\release\\DataCollection_code\\DataCollection_Host/", 0x64, 0, 3, Ltext0
.stabs "F:/DXJH/e_design/Data_Sample/release/DataCollection_code/DataCollection_Host/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "_Sys_Flags:T20=s5uiSelectSample:4,0,1;uiCircleSample:4,1,1;\\",128,0,0,0',0x0d,0x0a
	.DW '.stabs "uiEnterKey:4,2,1;uiCancelKey:4,3,1;uiPlaySpeechKey:4,4,1;\\",128,0,0,0',0x0d,0x0a
	.DW '.stabs "uiSampleOk:4,5,1;uiChannelNumber:4,16,16;\\",128,0,0,0',0x0d,0x0a
	.DW '.stabs "uiSysFaultNumber:4,32,16;uiChannelVoltageValue:4,48,16;\\",128,0,0,0',0x0d,0x0a
	.DW '.stabs "uiDisplayVoltageValue:4,64,16;;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "SYSFLAGS:t21=20",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "g_uiKeyValue:G4",32,0,0,',0,0,offset _g_uiKeyValue,seg _g_uiKeyValue,0x0d,0x0a
.CODE
.public _g_uiKeyValue
.iram
_g_uiKeyValue:
	.dw 0
.debug
	.dw '.stabs "uiTwoSecondTimeFlag:G4",32,0,0,',0,0,offset _uiTwoSecondTimeFlag,seg _uiTwoSecondTimeFlag,0x0d,0x0a
.CODE
.public _uiTwoSecondTimeFlag
.iram
_uiTwoSecondTimeFlag:
	.dw 0
.debug
	.dw '.stabs "ui2HzIntCounter:G4",32,0,0,',0,0,offset _ui2HzIntCounter,seg _ui2HzIntCounter,0x0d,0x0a
.CODE
.public _ui2HzIntCounter
.iram
_ui2HzIntCounter:
	.dw 0
.debug
	.dw '.stabs "uiStartSampleFlag:G4",32,0,0,',0,0,offset _uiStartSampleFlag,seg _uiStartSampleFlag,0x0d,0x0a
.CODE
.public _uiStartSampleFlag
.iram
_uiStartSampleFlag:
	.dw 0
.code
.debug
	.dw '.stabs "main:F1",36,0,0,',0,0,offset _main,seg _main,0x0d,0x0a
.CODE
.public _main
_main:	.proc
.debug
	.dw '.stabn 0x44,0,63,',0,0
	.dd LM1-_main
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
	.dw '.stabn 0x44,0,64,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	R1=0	// QImode move
	[BP]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,65,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	call _F_SPCE061A_Initial	// call without return value
.debug
	.dw '.stabn 0x44,0,66,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	call _F_UART_Initial	// call without return value
.debug
	.dw '.stabn 0x44,0,67,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	call _F_SystemFlag_Initial	// call without return value
.debug
	.dw '.stabn 0x44,0,68,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _F_PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,69,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R1=0	// QImode move
	[BP]=R1	// QImode move
L3:
	R1=[BP]	// QImode move
	CMP R1,(-2)	// QImode compare
	JA L24	// QImode LEU
	PC=L5
L24:
	pc=L4	// jump
L6:
L5:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _F_PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,71,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
L7:
	pc=L9	// jump
	pc=L8	// jump
L9:
.debug
	.dw '.stabn 0x44,0,73,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	call _F_Key_Scan	// call without return value
.debug
	.dw '.stabn 0x44,0,74,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	call _F_Get_KeyValue	// call with return value
	[_g_uiKeyValue]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	R1=[_g_uiKeyValue]	// QImode move
	CMP R1,0	// QImode test
	JNZ L25	// QImode EQ
	PC=L10
L25:
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	call _F_KeyHandle	// call without return value
L10:
.debug
	.dw '.stabn 0x44,0,79,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	R1=[_sSysFlags]	// QImode move
	R2=2	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __rshu1	// call with return value
	SP=SP+2
	R2=R1&1
	CMP R2,1	// QImode compare
	JZ L26	// QImode NE
	PC=L11
L26:
.debug
	.dw '.stabn 0x44,0,81,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	R2=[_sSysFlags]	// QImode move
	R1=R2&1
	CMP R1,0	// QImode test
	JZ L27	// QImode NE
	PC=L12
L27:
	R1=[_sSysFlags]	// QImode move
	R2=1	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __rshu1	// call with return value
	SP=SP+2
	R2=R1&1
	CMP R2,0	// QImode test
	JZ L28	// QImode NE
	PC=L12
L28:
.debug
	.dw '.stabn 0x44,0,83,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	R1=[_sSysFlags]	// QImode move
	R2=(-5)	// QImode move
	[_sSysFlags]=R1&R2
.debug
	.dw '.stabn 0x44,0,84,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
	R1=7	// QImode move
	[SP--]=R1	// QImode move
	call _F_PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,85,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
	pc=L11	// jump
L12:
.debug
	.dw '.stabn 0x44,0,88,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
	R1=[_uiStartSampleFlag]	// QImode move
	CMP R1,0	// QImode test
	JZ L29	// QImode NE
	PC=L14
L29:
.debug
	.dw '.stabn 0x44,0,90,',0,0
	.dd LM20-_main
	.dw 0x0d,0x0a
.code
LM20:
	R1=1	// QImode move
	[_uiStartSampleFlag]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,91,',0,0
	.dd LM21-_main
	.dw 0x0d,0x0a
.code
LM21:
	R1=[_sSysFlags]	// QImode move
	R2=1	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __rshu1	// call with return value
	SP=SP+2
	R2=R1&1
	CMP R2,1	// QImode compare
	JZ L30	// QImode NE
	PC=L15
L30:
.debug
	.dw '.stabn 0x44,0,92,',0,0
	.dd LM22-_main
	.dw 0x0d,0x0a
.code
LM22:
	R1=5	// QImode move
	[SP--]=R1	// QImode move
	call _F_PlayRespond	// call without return value
	SP=SP+1
	pc=L14	// jump
L15:
.debug
	.dw '.stabn 0x44,0,94,',0,0
	.dd LM23-_main
	.dw 0x0d,0x0a
.code
LM23:
	R1=6	// QImode move
	[SP--]=R1	// QImode move
	call _F_PlayRespond	// call without return value
	SP=SP+1
L16:
L14:
.debug
	.dw '.stabn 0x44,0,96,',0,0
	.dd LM24-_main
	.dw 0x0d,0x0a
.code
LM24:
	R1=[_sSysFlags]	// QImode move
	R2=(-5)	// QImode move
	[_sSysFlags]=R1&R2
.debug
	.dw '.stabn 0x44,0,97,',0,0
	.dd LM25-_main
	.dw 0x0d,0x0a
.code
LM25:
	R1=[_sSysFlags]	// QImode move
	R2=1	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __rshu1	// call with return value
	SP=SP+2
	R2=R1&1
	CMP R2,1	// QImode compare
	JZ L31	// QImode NE
	PC=L17
L31:
.debug
	.dw '.stabn 0x44,0,99,',0,0
	.dd LM26-_main
	.dw 0x0d,0x0a
.code
LM26:
	R1=[_sSysFlags]	// QImode move
	R2=4	// QImode move
	[_sSysFlags]=R1|R2
L17:
.debug
	.dw '.stabn 0x44,0,101,',0,0
	.dd LM27-_main
	.dw 0x0d,0x0a
.code
LM27:
	R1=[_uiTwoSecondTimeFlag]	// QImode move
	CMP R1,1	// QImode compare
	JZ L32	// QImode NE
	PC=L11
L32:
.debug
	.dw '.stabn 0x44,0,103,',0,0
	.dd LM28-_main
	.dw 0x0d,0x0a
.code
LM28:
	R1=0	// QImode move
	[_uiTwoSecondTimeFlag]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,104,',0,0
	.dd LM29-_main
	.dw 0x0d,0x0a
.code
LM29:
	call _F_UART_DataSample	// call without return value
L18:
L13:
L11:
.debug
	.dw '.stabn 0x44,0,109,',0,0
	.dd LM30-_main
	.dw 0x0d,0x0a
.code
LM30:
	R1=[_sSysFlags+2]	// QImode move
	CMP R1,1	// QImode compare
	JZ L33	// QImode NE
	PC=L19
L33:
.debug
	.dw '.stabn 0x44,0,111,',0,0
	.dd LM31-_main
	.dw 0x0d,0x0a
.code
LM31:
	call _F_SystemFlag_Initial	// call without return value
.debug
	.dw '.stabn 0x44,0,112,',0,0
	.dd LM32-_main
	.dw 0x0d,0x0a
.code
LM32:
	R1=10	// QImode move
	[SP--]=R1	// QImode move
	call _F_PlayRespond	// call without return value
	SP=SP+1
L19:
.debug
	.dw '.stabn 0x44,0,114,',0,0
	.dd LM33-_main
	.dw 0x0d,0x0a
.code
LM33:
	R1=[_sSysFlags]	// QImode move
	R2=3	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __rshu1	// call with return value
	SP=SP+2
	R2=R1&1
	CMP R2,1	// QImode compare
	JZ L34	// QImode NE
	PC=L20
L34:
.debug
	.dw '.stabn 0x44,0,116,',0,0
	.dd LM34-_main
	.dw 0x0d,0x0a
.code
LM34:
	call _F_SystemFlag_Initial	// call without return value
.debug
	.dw '.stabn 0x44,0,117,',0,0
	.dd LM35-_main
	.dw 0x0d,0x0a
.code
LM35:
	R1=7	// QImode move
	[SP--]=R1	// QImode move
	call _F_PlayRespond	// call without return value
	SP=SP+1
L20:
.debug
	.dw '.stabn 0x44,0,119,',0,0
	.dd LM36-_main
	.dw 0x0d,0x0a
.code
LM36:
	R1=[_sSysFlags]	// QImode move
	R2=5	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __rshu1	// call with return value
	SP=SP+2
	R2=R1&1
	CMP R2,1	// QImode compare
	JZ L35	// QImode NE
	PC=L21
L35:
.debug
	.dw '.stabn 0x44,0,121,',0,0
	.dd LM37-_main
	.dw 0x0d,0x0a
.code
LM37:
	call _F_Led_Show_Handle	// call without return value
L21:
.debug
	.dw '.stabn 0x44,0,123,',0,0
	.dd LM38-_main
	.dw 0x0d,0x0a
.code
LM38:
	R1=[_sSysFlags]	// QImode move
	R2=5	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __rshu1	// call with return value
	SP=SP+2
	R2=R1&1
	CMP R2,0	// QImode test
	JZ L36	// QImode NE
	PC=L22
L36:
.debug
	.dw '.stabn 0x44,0,125,',0,0
	.dd LM39-_main
	.dw 0x0d,0x0a
.code
LM39:
	call _F_Led_Show_NotReady	// call without return value
L22:
.debug
	.dw '.stabn 0x44,0,128,',0,0
	.dd LM40-_main
	.dw 0x0d,0x0a
.code
LM40:
	R1=[_sSysFlags]	// QImode move
	R2=4	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __rshu1	// call with return value
	SP=SP+2
	R2=R1&1
	CMP R2,1	// QImode compare
	JZ L37	// QImode NE
	PC=L23
L37:
.debug
	.dw '.stabn 0x44,0,130,',0,0
	.dd LM41-_main
	.dw 0x0d,0x0a
.code
LM41:
	call _F_Led_Show_NotReady	// call without return value
.debug
	.dw '.stabn 0x44,0,131,',0,0
	.dd LM42-_main
	.dw 0x0d,0x0a
.code
LM42:
	call _F_SpeechPlayChannelData	// call without return value
L23:
.debug
	.dw '.stabn 0x44,0,134,',0,0
	.dd LM43-_main
	.dw 0x0d,0x0a
.code
LM43:
	pc=L7	// jump
L8:
.debug
	.dw '.stabn 0x44,0,135,',0,0
	.dd LM44-_main
	.dw 0x0d,0x0a
.code
LM44:
LBE2:
.debug
	.dw '.stabn 0x44,0,135,',0,0
	.dd LM45-_main
	.dw 0x0d,0x0a
.code
LM45:
L2:

	sp+=3
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
	.dw '.stabs "j:4",128,0,0,1',0x0d,0x0a
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
	.dw '.stabs "F_SystemFlag_Initial:F19",36,0,0,',0,0,offset _F_SystemFlag_Initial,seg _F_SystemFlag_Initial,0x0d,0x0a
.CODE
.public _F_SystemFlag_Initial
_F_SystemFlag_Initial:	.proc
.debug
	.dw '.stabn 0x44,0,137,',0,0
	.dd LM46-_F_SystemFlag_Initial
	.dw 0x0d,0x0a
.code
LM46:
	// total=0, vars=0
	// frame_pointer_needed: 1
	push bp to [sp]
	bp=sp+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,138,',0,0
	.dd LM47-_F_SystemFlag_Initial
	.dw 0x0d,0x0a
.code
LM47:
	R2=1	// QImode move
	[_uiTwoSecondTimeFlag]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,139,',0,0
	.dd LM48-_F_SystemFlag_Initial
	.dw 0x0d,0x0a
.code
LM48:
	R2=0	// QImode move
	[_uiStartSampleFlag]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,140,',0,0
	.dd LM49-_F_SystemFlag_Initial
	.dw 0x0d,0x0a
.code
LM49:
	R2=[_sSysFlags]	// QImode move
	R3=(-2)	// QImode move
	[_sSysFlags]=R2&R3
.debug
	.dw '.stabn 0x44,0,141,',0,0
	.dd LM50-_F_SystemFlag_Initial
	.dw 0x0d,0x0a
.code
LM50:
	R2=[_sSysFlags]	// QImode move
	R3=(-3)	// QImode move
	[_sSysFlags]=R2&R3
.debug
	.dw '.stabn 0x44,0,142,',0,0
	.dd LM51-_F_SystemFlag_Initial
	.dw 0x0d,0x0a
.code
LM51:
	R2=[_sSysFlags]	// QImode move
	R3=(-5)	// QImode move
	[_sSysFlags]=R2&R3
.debug
	.dw '.stabn 0x44,0,143,',0,0
	.dd LM52-_F_SystemFlag_Initial
	.dw 0x0d,0x0a
.code
LM52:
	R2=[_sSysFlags]	// QImode move
	R3=(-9)	// QImode move
	[_sSysFlags]=R2&R3
.debug
	.dw '.stabn 0x44,0,144,',0,0
	.dd LM53-_F_SystemFlag_Initial
	.dw 0x0d,0x0a
.code
LM53:
	R2=0	// QImode move
	[_sSysFlags+1]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,145,',0,0
	.dd LM54-_F_SystemFlag_Initial
	.dw 0x0d,0x0a
.code
LM54:
	R2=0	// QImode move
	[_sSysFlags+2]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,146,',0,0
	.dd LM55-_F_SystemFlag_Initial
	.dw 0x0d,0x0a
.code
LM55:
	R2=0	// QImode move
	[_sSysFlags+3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,147,',0,0
	.dd LM56-_F_SystemFlag_Initial
	.dw 0x0d,0x0a
.code
LM56:
	R2=0	// QImode move
	[_sSysFlags+4]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,148,',0,0
	.dd LM57-_F_SystemFlag_Initial
	.dw 0x0d,0x0a
.code
LM57:
	R2=[_sSysFlags]	// QImode move
	R3=(-17)	// QImode move
	[_sSysFlags]=R2&R3
.debug
	.dw '.stabn 0x44,0,149,',0,0
	.dd LM58-_F_SystemFlag_Initial
	.dw 0x0d,0x0a
.code
LM58:
	R2=[_sSysFlags]	// QImode move
	R3=(-33)	// QImode move
	[_sSysFlags]=R2&R3
.debug
	.dw '.stabn 0x44,0,150,',0,0
	.dd LM59-_F_SystemFlag_Initial
	.dw 0x0d,0x0a
.code
LM59:
.debug
	.dw '.stabn 0x44,0,150,',0,0
	.dd LM60-_F_SystemFlag_Initial
	.dw 0x0d,0x0a
.code
LM60:
L38:

	pop bp from [sp]
	retf
	.endp	// end of F_SystemFlag_Initial

.debug
	.dw '.stabf ',0,0
	.dd LME2-_F_SystemFlag_Initial
	.dw 0x0d,0x0a
.code
LME2:
.debug
	.dw '.stabs "sSysFlags:G21",32,0,0,',0,0,offset _sSysFlags,seg _sSysFlags,0x0d,0x0a
.CODE
.ram
.public _sSysFlags
_sSysFlags:
	.dw 5 dup(0)
.external _F_SpeechPlayChannelData
.external _F_Led_Show_NotReady
.external _F_Led_Show_Handle
.external _F_UART_DataSample
.external _F_KeyHandle
.external _F_Get_KeyValue
.external _F_Key_Scan
.external _F_PlayRespond
.external _F_UART_Initial
.external _F_SPCE061A_Initial
.external __rshu1
	.end
