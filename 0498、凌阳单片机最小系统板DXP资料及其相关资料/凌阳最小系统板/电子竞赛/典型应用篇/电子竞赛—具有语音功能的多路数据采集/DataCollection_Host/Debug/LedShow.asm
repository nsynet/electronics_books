// GCC for SUNPLUS u'nSP version 1.0.10
// Command: D:\PROGRA~1\Sunplus\UNSPID~2\IDE180\cc1.exe D:\DOCUME~1\³ÂÐ¢±ò\LOCALS~1\Temp\ccyCaaaa.i -fkeep-inline-functions -quiet -dumpbase LedShow.c -gstabs -o .\Debug/LedShow.asm
// gcc2_compiled.:

.stabs "F:\\DXJH\\e_design\\Data_Sample\\release\\DataCollection_code\\DataCollection_Host/", 0x64, 0, 3, Ltext0
.stabs "F:/DXJH/e_design/Data_Sample/release/DataCollection_code/DataCollection_Host/LedShow.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "F_Led_Show_Handle:F19",36,0,0,',0,0,offset _F_Led_Show_Handle,seg _F_Led_Show_Handle,0x0d,0x0a
.CODE
.public _F_Led_Show_Handle
_F_Led_Show_Handle:	.proc
.debug
	.dw '.stabn 0x44,0,19,',0,0
	.dd LM1-_F_Led_Show_Handle
	.dw 0x0d,0x0a
.code
LM1:
	// total=4, vars=4
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=4
	bp=sp+1

	R1=BP+7
	[bp+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,20,',0,0
	.dd LM2-_F_Led_Show_Handle
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	R1=0	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,22,',0,0
	.dd LM3-_F_Led_Show_Handle
	.dw 0x0d,0x0a
.code
LM3:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,23,',0,0
	.dd LM4-_F_Led_Show_Handle
	.dw 0x0d,0x0a
.code
LM4:
	R1=[_sSysFlags+1]	// QImode move
	[SP--]=R1	// QImode move
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _F_Led_Show	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,24,',0,0
	.dd LM5-_F_Led_Show_Handle
	.dw 0x0d,0x0a
.code
LM5:
	R1=BP	// QImode move
	R2=BP+1
	R1=[_sSysFlags+3]	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,25,',0,0
	.dd LM6-_F_Led_Show_Handle
	.dw 0x0d,0x0a
.code
LM6:
	R1=BP	// QImode move
	R1=BP+1
	[bp+3]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=50	// QImode move
	mr=R1*R2	// r3=R1*R2 16bit=16bit*16bit
	R1=1023	// QImode move
	[SP--]=R1	// QImode move
	[SP--]=R3	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	R2=[bp+3]	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,26,',0,0
	.dd LM7-_F_Led_Show_Handle
	.dw 0x0d,0x0a
.code
LM7:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[_sSysFlags+4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,28,',0,0
	.dd LM8-_F_Led_Show_Handle
	.dw 0x0d,0x0a
.code
LM8:
	R1=BP	// QImode move
	R2=BP+1
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divu1	// call with return value
	SP=SP+2
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _F_Led_Show	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,30,',0,0
	.dd LM9-_F_Led_Show_Handle
	.dw 0x0d,0x0a
.code
LM9:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modu1	// call with return value
	SP=SP+2
	[SP--]=R1	// QImode move
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	call _F_Led_Show	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,32,',0,0
	.dd LM10-_F_Led_Show_Handle
	.dw 0x0d,0x0a
.code
LM10:
LBE2:
.debug
	.dw '.stabn 0x44,0,32,',0,0
	.dd LM11-_F_Led_Show_Handle
	.dw 0x0d,0x0a
.code
LM11:
L2:

	sp+=4
	pop bp from [sp]
	retf
	.endp	// end of F_Led_Show_Handle

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_F_Led_Show_Handle
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "i:4",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "uiShowVoltageValue:4",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE2-_F_Led_Show_Handle
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME1-_F_Led_Show_Handle
	.dw 0x0d,0x0a
.code
LME1:
.code
.debug
	.dw '.stabs "F_Led_Show_NotReady:F19",36,0,0,',0,0,offset _F_Led_Show_NotReady,seg _F_Led_Show_NotReady,0x0d,0x0a
.CODE
.public _F_Led_Show_NotReady
_F_Led_Show_NotReady:	.proc
.debug
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM12-_F_Led_Show_NotReady
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
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM13-_F_Led_Show_NotReady
	.dw 0x0d,0x0a
.code
LM13:
	R1=[_sSysFlags+1]	// QImode move
	[SP--]=R1	// QImode move
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _F_Led_Show	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,43,',0,0
	.dd LM14-_F_Led_Show_NotReady
	.dw 0x0d,0x0a
.code
LM14:
.debug
	.dw '.stabn 0x44,0,43,',0,0
	.dd LM15-_F_Led_Show_NotReady
	.dw 0x0d,0x0a
.code
LM15:
L3:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of F_Led_Show_NotReady

.debug
	.dw '.stabf ',0,0
	.dd LME2-_F_Led_Show_NotReady
	.dw 0x0d,0x0a
.code
LME2:
.external _sSysFlags
.external _F_Led_Show
.external __modu1
.external __divu1
	.end
