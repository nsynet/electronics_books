// GCC for SUNPLUS u'nSP version 1.0.10
// Command: D:\PROGRA~1\Sunplus\UNSPID~2\IDE180\cc1.exe D:\DOCUME~1\³ÂÐ¢±ò\LOCALS~1\Temp\ccyCaaaa.i -fkeep-inline-functions -quiet -dumpbase SpeechPlay.c -gstabs -o .\Debug/SpeechPlay.asm
// gcc2_compiled.:

.stabs "F:\\DXJH\\e_design\\Data_Sample\\release\\DataCollection_code\\DataCollection_Host/", 0x64, 0, 3, Ltext0
.stabs "F:/DXJH/e_design/Data_Sample/release/DataCollection_code/DataCollection_Host/SpeechPlay.c", 0x64, 0, 3, Ltext0
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
.code
.debug
	.dw '.stabs "F_SpeechPlayChannelData:F19",36,0,0,',0,0,offset _F_SpeechPlayChannelData,seg _F_SpeechPlayChannelData,0x0d,0x0a
.CODE
.public _F_SpeechPlayChannelData
_F_SpeechPlayChannelData:	.proc
.debug
	.dw '.stabn 0x44,0,22,',0,0
	.dd LM1-_F_SpeechPlayChannelData
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
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM2-_F_SpeechPlayChannelData
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	R1=0	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,24,',0,0
	.dd LM3-_F_SpeechPlayChannelData
	.dw 0x0d,0x0a
.code
LM3:
	R2=[_sSysFlags+1]	// QImode move
	R1=R2+11
	[SP--]=R1	// QImode move
	call _F_PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,25,',0,0
	.dd LM4-_F_SpeechPlayChannelData
	.dw 0x0d,0x0a
.code
LM4:
	R1=8	// QImode move
	[SP--]=R1	// QImode move
	call _F_PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,26,',0,0
	.dd LM5-_F_SpeechPlayChannelData
	.dw 0x0d,0x0a
.code
LM5:
	R1=[_sSysFlags+4]	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,27,',0,0
	.dd LM6-_F_SpeechPlayChannelData
	.dw 0x0d,0x0a
.code
LM6:
	R1=[BP]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	R2=R1+11
	[SP--]=R2	// QImode move
	call _F_PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,28,',0,0
	.dd LM7-_F_SpeechPlayChannelData
	.dw 0x0d,0x0a
.code
LM7:
	R1=21	// QImode move
	[SP--]=R1	// QImode move
	call _F_PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,29,',0,0
	.dd LM8-_F_SpeechPlayChannelData
	.dw 0x0d,0x0a
.code
LM8:
	R1=[BP]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	R2=R1+11
	[SP--]=R2	// QImode move
	call _F_PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,30,',0,0
	.dd LM9-_F_SpeechPlayChannelData
	.dw 0x0d,0x0a
.code
LM9:
	R1=9	// QImode move
	[SP--]=R1	// QImode move
	call _F_PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,31,',0,0
	.dd LM10-_F_SpeechPlayChannelData
	.dw 0x0d,0x0a
.code
LM10:
	R1=[_sSysFlags]	// QImode move
	R2=(-17)	// QImode move
	[_sSysFlags]=R1&R2
.debug
	.dw '.stabn 0x44,0,32,',0,0
	.dd LM11-_F_SpeechPlayChannelData
	.dw 0x0d,0x0a
.code
LM11:
LBE2:
.debug
	.dw '.stabn 0x44,0,32,',0,0
	.dd LM12-_F_SpeechPlayChannelData
	.dw 0x0d,0x0a
.code
LM12:
L2:

	sp+=2
	pop bp from [sp]
	retf
	.endp	// end of F_SpeechPlayChannelData

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_F_SpeechPlayChannelData
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "uiVolvageValue:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE2-_F_SpeechPlayChannelData
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME1-_F_SpeechPlayChannelData
	.dw 0x0d,0x0a
.code
LME1:
.code
.debug
	.dw '.stabs "F_PlayRespond:F19",36,0,0,',0,0,offset _F_PlayRespond,seg _F_PlayRespond,0x0d,0x0a
.CODE
.public _F_PlayRespond
_F_PlayRespond:	.proc
.debug
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM13-_F_PlayRespond
	.dw 0x0d,0x0a
.code
LM13:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM14-_F_PlayRespond
	.dw 0x0d,0x0a
.code
LM14:
LBB3:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_S480_Initial	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,43,',0,0
	.dd LM15-_F_PlayRespond
	.dw 0x0d,0x0a
.code
LM15:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R2=[BP]	// QImode move
	R1=[R2]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_S480_Play	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM16-_F_PlayRespond
	.dw 0x0d,0x0a
.code
LM16:
L4:
	call _SACM_S480_Status	// call with return value
	R2=R1&1
	CMP R2,0	// QImode test
	JZ L7	// QImode NE
	PC=L6
L7:
	pc=L5	// jump
L6:
.debug
	.dw '.stabn 0x44,0,46,',0,0
	.dd LM17-_F_PlayRespond
	.dw 0x0d,0x0a
.code
LM17:
LBB4:
	call _SACM_S480_ServiceLoop	// call with return value
.debug
	.dw '.stabn 0x44,0,48,',0,0
	.dd LM18-_F_PlayRespond
	.dw 0x0d,0x0a
.code
LM18:
LBE4:
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,49,',0,0
	.dd LM19-_F_PlayRespond
	.dw 0x0d,0x0a
.code
LM19:
	call _SACM_S480_Stop	// call with return value
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM20-_F_PlayRespond
	.dw 0x0d,0x0a
.code
LM20:
LBE3:
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM21-_F_PlayRespond
	.dw 0x0d,0x0a
.code
LM21:
L3:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of F_PlayRespond

.debug
	.dw '.stabs "Result:p4",160,0,0,4',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB3-_F_PlayRespond
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB4-_F_PlayRespond
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE4-_F_PlayRespond
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE3-_F_PlayRespond
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME2-_F_PlayRespond
	.dw 0x0d,0x0a
.code
LME2:
.external _SACM_S480_Stop
.external _SACM_S480_ServiceLoop
.external _SACM_S480_Status
.external _SACM_S480_Play
.external _SACM_S480_Initial
.external _sSysFlags
.external __modu1
.external __divu1
	.end
