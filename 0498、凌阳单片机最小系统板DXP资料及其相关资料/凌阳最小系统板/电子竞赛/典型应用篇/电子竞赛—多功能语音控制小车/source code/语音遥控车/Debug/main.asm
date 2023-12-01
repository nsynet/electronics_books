// GCC for SUNPLUS u'nSP version 1.0.10-10
// Command: C:\PROGRA~1\Sunplus\UNSPID~1\unSPIDE\cc1.exe C:\DOCUME~1\张向艳\LOCALS~1\Temp\ccasaaaa.i -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\test\\CD_Root\\AutoPlay\\Docs\\刻录光盘\\电子竞赛\\典型应用篇\\电子竞赛—多功能语音控制小车\\source code\\语音遥控车/", 0x64, 0, 3, Ltext0
.stabs "F:/test/CD_Root/AutoPlay/Docs/縗\314耚\274筡\342臷\314/礬\347譢\323綷\272萛\374/礬\344衆\315覾\246覾\303芢\252/礬\347譢\323綷\272萛\374\252禱\340筡\246腬\334覾\357襖\364縗\330謀\306衆\241砛\265/source code/覾\357襖\364襖\243縗\330砛\265/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "gActivated:G1",32,0,0,',0,0,offset _gActivated,seg _gActivated,0x0d,0x0a
.CODE
.public _gActivated
.iram
_gActivated:
	.dw 0
.debug
	.dw '.stabs "gTriggerRespond:G20=ar1;0;-1;1",32,0,0,',0,0,offset _gTriggerRespond,seg _gTriggerRespond,0x0d,0x0a
.CODE
.public _gTriggerRespond
.iram
_gTriggerRespond:
	.dw 9
	.dw 10
	.dw 9
.debug
	.dw '.stabs "gComm2Respond:G21=ar1;0;-1;1",32,0,0,',0,0,offset _gComm2Respond,seg _gComm2Respond,0x0d,0x0a
.CODE
.public _gComm2Respond
.iram
_gComm2Respond:
	.dw 11
	.dw 12
	.dw 13
.debug
	.dw '.stabs "PlayFlag:G1",32,0,0,',0,0,offset _PlayFlag,seg _PlayFlag,0x0d,0x0a
.CODE
.public _PlayFlag
.iram
_PlayFlag:
	.dw 0
.debug
	.dw '.stabs "uiSpeed:G4",32,0,0,',0,0,offset _uiSpeed,seg _uiSpeed,0x0d,0x0a
.CODE
.public _uiSpeed
.iram
_uiSpeed:
	.dw 0
.code
.debug
	.dw '.stabs "PlayRespond2:F19",36,0,0,',0,0,offset _PlayRespond2,seg _PlayRespond2,0x0d,0x0a
.CODE
.public _PlayRespond2
_PlayRespond2:	.proc
.debug
	.dw '.stabn 0x44,0,36,',0,0
	.dd LM1-_PlayRespond2
	.dw 0x0d,0x0a
.code
LM1:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,37,',0,0
	.dd LM2-_PlayRespond2
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	call _BSR_StopRecognizer	// call without return value
.debug
	.dw '.stabn 0x44,0,38,',0,0
	.dd LM3-_PlayRespond2
	.dw 0x0d,0x0a
.code
LM3:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_A2000_Initial	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,39,',0,0
	.dd LM4-_PlayRespond2
	.dw 0x0d,0x0a
.code
LM4:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R2=[BP]	// QImode move
	R1=[R2]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_A2000_Play	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,40,',0,0
	.dd LM5-_PlayRespond2
	.dw 0x0d,0x0a
.code
LM5:
L3:
	call _SACM_A2000_Status	// call with return value
	R2=R1&1
	CMP R2,0	// QImode test
	JZ L6	// QImode NE
	PC=L5
L6:
	pc=L4	// Indirect jump
L5:
.debug
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM6-_PlayRespond2
	.dw 0x0d,0x0a
.code
LM6:
LBB3:
	call _SACM_A2000_ServiceLoop	// call with return value
.debug
	.dw '.stabn 0x44,0,43,',0,0
	.dd LM7-_PlayRespond2
	.dw 0x0d,0x0a
.code
LM7:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM8-_PlayRespond2
	.dw 0x0d,0x0a
.code
LM8:
LBE3:
	pc=L3	// Indirect jump
L4:
.debug
	.dw '.stabn 0x44,0,45,',0,0
	.dd LM9-_PlayRespond2
	.dw 0x0d,0x0a
.code
LM9:
	call _SACM_A2000_Stop	// call with return value
.debug
	.dw '.stabn 0x44,0,46,',0,0
	.dd LM10-_PlayRespond2
	.dw 0x0d,0x0a
.code
LM10:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _BSR_InitRecognizer	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM11-_PlayRespond2
	.dw 0x0d,0x0a
.code
LM11:
	call _BSR_EnableCPUIndicator	// call without return value
.debug
	.dw '.stabn 0x44,0,48,',0,0
	.dd LM12-_PlayRespond2
	.dw 0x0d,0x0a
.code
LM12:
LBE2:
.debug
	.dw '.stabn 0x44,0,48,',0,0
	.dd LM13-_PlayRespond2
	.dw 0x0d,0x0a
.code
LM13:
L2:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of PlayRespond2

.debug
	.dw '.stabs "Result:p1",160,0,0,4',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_PlayRespond2
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB3-_PlayRespond2
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE3-_PlayRespond2
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE2-_PlayRespond2
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME1-_PlayRespond2
	.dw 0x0d,0x0a
.code
LME1:
.code
.debug
	.dw '.stabs "PlayRespond:F19",36,0,0,',0,0,offset _PlayRespond,seg _PlayRespond,0x0d,0x0a
.CODE
.public _PlayRespond
_PlayRespond:	.proc
.debug
	.dw '.stabn 0x44,0,51,',0,0
	.dd LM14-_PlayRespond
	.dw 0x0d,0x0a
.code
LM14:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,52,',0,0
	.dd LM15-_PlayRespond
	.dw 0x0d,0x0a
.code
LM15:
LBB4:
	call _BSR_StopRecognizer	// call without return value
.debug
	.dw '.stabn 0x44,0,53,',0,0
	.dd LM16-_PlayRespond
	.dw 0x0d,0x0a
.code
LM16:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_S480_Initial	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM17-_PlayRespond
	.dw 0x0d,0x0a
.code
LM17:
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
	.dw '.stabn 0x44,0,55,',0,0
	.dd LM18-_PlayRespond
	.dw 0x0d,0x0a
.code
LM18:
L8:
	call _SACM_S480_Status	// call with return value
	R2=R1&1
	CMP R2,0	// QImode test
	JZ L11	// QImode NE
	PC=L10
L11:
	pc=L9	// Indirect jump
L10:
.debug
	.dw '.stabn 0x44,0,57,',0,0
	.dd LM19-_PlayRespond
	.dw 0x0d,0x0a
.code
LM19:
LBB5:
	call _SACM_S480_ServiceLoop	// call with return value
.debug
	.dw '.stabn 0x44,0,58,',0,0
	.dd LM20-_PlayRespond
	.dw 0x0d,0x0a
.code
LM20:
	call _ClearWatchDog	// call without return value
.debug
	.dw '.stabn 0x44,0,59,',0,0
	.dd LM21-_PlayRespond
	.dw 0x0d,0x0a
.code
LM21:
LBE5:
	pc=L8	// Indirect jump
L9:
.debug
	.dw '.stabn 0x44,0,60,',0,0
	.dd LM22-_PlayRespond
	.dw 0x0d,0x0a
.code
LM22:
	call _SACM_S480_Stop	// call with return value
.debug
	.dw '.stabn 0x44,0,61,',0,0
	.dd LM23-_PlayRespond
	.dw 0x0d,0x0a
.code
LM23:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _BSR_InitRecognizer	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,62,',0,0
	.dd LM24-_PlayRespond
	.dw 0x0d,0x0a
.code
LM24:
	call _BSR_EnableCPUIndicator	// call without return value
.debug
	.dw '.stabn 0x44,0,63,',0,0
	.dd LM25-_PlayRespond
	.dw 0x0d,0x0a
.code
LM25:
LBE4:
.debug
	.dw '.stabn 0x44,0,63,',0,0
	.dd LM26-_PlayRespond
	.dw 0x0d,0x0a
.code
LM26:
L7:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of PlayRespond

.debug
	.dw '.stabs "Result:p1",160,0,0,4',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB4-_PlayRespond
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB5-_PlayRespond
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE5-_PlayRespond
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE4-_PlayRespond
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME2-_PlayRespond
	.dw 0x0d,0x0a
.code
LME2:
.code
.debug
	.dw '.stabs "TrainWord:F1",36,0,0,',0,0,offset _TrainWord,seg _TrainWord,0x0d,0x0a
.CODE
.public _TrainWord
_TrainWord:	.proc
.debug
	.dw '.stabn 0x44,0,66,',0,0
	.dd LM27-_TrainWord
	.dw 0x0d,0x0a
.code
LM27:
	// total=2, vars=2
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=2
	bp=sp+1

	R1=BP+5
	[bp+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,67,',0,0
	.dd LM28-_TrainWord
	.dw 0x0d,0x0a
.code
LM28:
LBB6:
.debug
	.dw '.stabn 0x44,0,68,',0,0
	.dd LM29-_TrainWord
	.dw 0x0d,0x0a
.code
LM29:
	R1=[bp+1]	// QImode move
	R3=[bp+1]	// QImode move
	R2=R3+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,69,',0,0
	.dd LM30-_TrainWord
	.dw 0x0d,0x0a
.code
LM30:
L13:
	pc=L15	// Indirect jump
	pc=L14	// Indirect jump
L15:
.debug
	.dw '.stabn 0x44,0,71,',0,0
	.dd LM31-_TrainWord
	.dw 0x0d,0x0a
.code
LM31:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	R2=[bp+1]	// QImode move
	R1=[R2]	// QImode move
	[SP--]=R1	// QImode move
	call _BSR_Train	// call with return value
	SP=SP+2
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,73,',0,0
	.dd LM32-_TrainWord
	.dw 0x0d,0x0a
.code
LM32:
	R1=[BP]	// QImode move
	CMP R1,0	// QImode test
	JZ L28	// QImode NE
	PC=L16
L28:
	pc=L14	// Indirect jump
L16:
.debug
	.dw '.stabn 0x44,0,74,',0,0
	.dd LM33-_TrainWord
	.dw 0x0d,0x0a
.code
LM33:
	R2=[BP]	// QImode move
	R1=R2+6
	CMP R1,5	// QImode compare
	JNA L29	// QImode GTU
	PC=L17
L29:
	R2=R1	// QImode move
	R1=R2	// QImode move
	R1=R1+L26
	R3=R1	// QImode move
	R2=[R3]	// QImode move
	pc=R2	// tablejump
.text
L26:
	.dw L25
	.dw L22
	.dw L21
	.dw L20
	.dw L19
	.dw L18
.code
L18:
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM34-_TrainWord
	.dw 0x0d,0x0a
.code
LM34:
	R1=5	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM35-_TrainWord
	.dw 0x0d,0x0a
.code
LM35:
	R1=(-1)	// QImode move
	pc=L12	// Indirect jump
L19:
.debug
	.dw '.stabn 0x44,0,80,',0,0
	.dd LM36-_TrainWord
	.dw 0x0d,0x0a
.code
LM36:
	R1=4	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,81,',0,0
	.dd LM37-_TrainWord
	.dw 0x0d,0x0a
.code
LM37:
	pc=L17	// Indirect jump
L20:
.debug
	.dw '.stabn 0x44,0,83,',0,0
	.dd LM38-_TrainWord
	.dw 0x0d,0x0a
.code
LM38:
	R1=14	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,84,',0,0
	.dd LM39-_TrainWord
	.dw 0x0d,0x0a
.code
LM39:
	R1=(-1)	// QImode move
	pc=L12	// Indirect jump
L21:
.debug
	.dw '.stabn 0x44,0,86,',0,0
	.dd LM40-_TrainWord
	.dw 0x0d,0x0a
.code
LM40:
	R1=(-1)	// QImode move
	pc=L12	// Indirect jump
L22:
.debug
	.dw '.stabn 0x44,0,88,',0,0
	.dd LM41-_TrainWord
	.dw 0x0d,0x0a
.code
LM41:
	R2=[bp+1]	// QImode move
	R1=[R2]	// QImode move
	CMP R1,256	// QImode compare
	JZ L30	// QImode NE
	PC=L23
L30:
	R1=5	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
	pc=L24	// Indirect jump
L23:
.debug
	.dw '.stabn 0x44,0,89,',0,0
	.dd LM42-_TrainWord
	.dw 0x0d,0x0a
.code
LM42:
	R1=5	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
L24:
.debug
	.dw '.stabn 0x44,0,90,',0,0
	.dd LM43-_TrainWord
	.dw 0x0d,0x0a
.code
LM43:
	R1=(-1)	// QImode move
	pc=L12	// Indirect jump
L25:
.debug
	.dw '.stabn 0x44,0,92,',0,0
	.dd LM44-_TrainWord
	.dw 0x0d,0x0a
.code
LM44:
	R1=(-1)	// QImode move
	pc=L12	// Indirect jump
L27:
L17:
.debug
	.dw '.stabn 0x44,0,94,',0,0
	.dd LM45-_TrainWord
	.dw 0x0d,0x0a
.code
LM45:
	pc=L13	// Indirect jump
L14:
.debug
	.dw '.stabn 0x44,0,95,',0,0
	.dd LM46-_TrainWord
	.dw 0x0d,0x0a
.code
LM46:
	R1=0	// QImode move
	pc=L12	// Indirect jump
.debug
	.dw '.stabn 0x44,0,96,',0,0
	.dd LM47-_TrainWord
	.dw 0x0d,0x0a
.code
LM47:
LBE6:
.debug
	.dw '.stabn 0x44,0,96,',0,0
	.dd LM48-_TrainWord
	.dw 0x0d,0x0a
.code
LM48:
L12:

	sp+=2
	pop bp from [sp]
	retf
	.endp	// end of TrainWord

.debug
	.dw '.stabs "WordID:p1",160,0,0,5',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "RespondID:p1",160,0,0,6',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB6-_TrainWord
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "res:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE6-_TrainWord
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME3-_TrainWord
	.dw 0x0d,0x0a
.code
LME3:
.code
.debug
	.dw '.stabs "main:F1",36,0,0,',0,0,offset _main,seg _main,0x0d,0x0a
.CODE
.public _main
_main:	.proc
.debug
	.dw '.stabn 0x44,0,99,',0,0
	.dd LM49-_main
	.dw 0x0d,0x0a
.code
LM49:
	// total=10, vars=10
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=10
	bp=sp+1

	R1=BP+13
	[bp+9]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,100,',0,0
	.dd LM50-_main
	.dw 0x0d,0x0a
.code
LM50:
LBB7:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+2
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+3
	R1=(-1)	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+4
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,101,',0,0
	.dd LM51-_main
	.dw 0x0d,0x0a
.code
LM51:
	R1=BP	// QImode move
	R2=BP+5
	R1=28690	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,104,',0,0
	.dd LM52-_main
	.dw 0x0d,0x0a
.code
LM52:
	R1=BP	// QImode move
	R2=BP+8
	R1=28677	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,105,',0,0
	.dd LM53-_main
	.dw 0x0d,0x0a
.code
LM53:
	call _F_Speed	// call with return value
.debug
	.dw '.stabn 0x44,0,106,',0,0
	.dd LM54-_main
	.dw 0x0d,0x0a
.code
LM54:
	R1=BP	// QImode move
	R2=BP+5
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=1	// QImode move
	R4=R1	// QImode move
	[R4]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,107,',0,0
	.dd LM55-_main
	.dw 0x0d,0x0a
.code
LM55:
	R1=255	// QImode move
	[SP--]=R1	// QImode move
	R1=(-256)	// QImode move
	[SP--]=R1	// QImode move
	R1=(-256)	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Init_IOB	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,111,',0,0
	.dd LM56-_main
	.dw 0x0d,0x0a
.code
LM56:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _BSR_DeleteSDGroup	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,113,',0,0
	.dd LM57-_main
	.dw 0x0d,0x0a
.code
LM57:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,115,',0,0
	.dd LM58-_main
	.dw 0x0d,0x0a
.code
LM58:
L32:
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	R1=256	// QImode move
	[SP--]=R1	// QImode move
	call _TrainWord	// call with return value
	SP=SP+2
	CMP R1,0	// QImode test
	JZ L105	// QImode NE
	PC=L34
L105:
	pc=L33	// Indirect jump
L34:
	pc=L32	// Indirect jump
L33:
.debug
	.dw '.stabn 0x44,0,117,',0,0
	.dd LM59-_main
	.dw 0x0d,0x0a
.code
LM59:
L35:
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	R1=257	// QImode move
	[SP--]=R1	// QImode move
	call _TrainWord	// call with return value
	SP=SP+2
	CMP R1,0	// QImode test
	JZ L106	// QImode NE
	PC=L37
L106:
	pc=L36	// Indirect jump
L37:
	pc=L35	// Indirect jump
L36:
.debug
	.dw '.stabn 0x44,0,119,',0,0
	.dd LM60-_main
	.dw 0x0d,0x0a
.code
LM60:
L38:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=258	// QImode move
	[SP--]=R1	// QImode move
	call _TrainWord	// call with return value
	SP=SP+2
	CMP R1,0	// QImode test
	JZ L107	// QImode NE
	PC=L40
L107:
	pc=L39	// Indirect jump
L40:
	pc=L38	// Indirect jump
L39:
.debug
	.dw '.stabn 0x44,0,121,',0,0
	.dd LM61-_main
	.dw 0x0d,0x0a
.code
LM61:
L41:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=259	// QImode move
	[SP--]=R1	// QImode move
	call _TrainWord	// call with return value
	SP=SP+2
	CMP R1,0	// QImode test
	JZ L108	// QImode NE
	PC=L43
L108:
	pc=L42	// Indirect jump
L43:
	pc=L41	// Indirect jump
L42:
.debug
	.dw '.stabn 0x44,0,123,',0,0
	.dd LM62-_main
	.dw 0x0d,0x0a
.code
LM62:
L44:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	R1=260	// QImode move
	[SP--]=R1	// QImode move
	call _TrainWord	// call with return value
	SP=SP+2
	CMP R1,0	// QImode test
	JZ L109	// QImode NE
	PC=L46
L109:
	pc=L45	// Indirect jump
L46:
	pc=L44	// Indirect jump
L45:
.debug
	.dw '.stabn 0x44,0,126,',0,0
	.dd LM63-_main
	.dw 0x0d,0x0a
.code
LM63:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _BSR_InitRecognizer	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,129,',0,0
	.dd LM64-_main
	.dw 0x0d,0x0a
.code
LM64:
	R1=8	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,131,',0,0
	.dd LM65-_main
	.dw 0x0d,0x0a
.code
LM65:
L47:
	pc=L49	// Indirect jump
	pc=L48	// Indirect jump
L49:
.debug
	.dw '.stabn 0x44,0,135,',0,0
	.dd LM66-_main
	.dw 0x0d,0x0a
.code
LM66:
LBB8:
	R1=255	// QImode move
	[SP--]=R1	// QImode move
	R1=(-256)	// QImode move
	[SP--]=R1	// QImode move
	R1=(-256)	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Init_IOB	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,136,',0,0
	.dd LM67-_main
	.dw 0x0d,0x0a
.code
LM67:
	R1=BP	// QImode move
	R2=BP+3
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	R1=28677	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Export	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,137,',0,0
	.dd LM68-_main
	.dw 0x0d,0x0a
.code
LM68:
	R1=BP	// QImode move
	R2=BP+5
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	R2=1	// QImode move
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,140,',0,0
	.dd LM69-_main
	.dw 0x0d,0x0a
.code
LM69:
	R2=BP	// QImode move
	R1=BP+6
	R2=BP	// QImode move
	R3=BP+8
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R4=R2	// QImode move
	R3=[R4]	// QImode move
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,141,',0,0
	.dd LM70-_main
	.dw 0x0d,0x0a
.code
LM70:
	R2=BP	// QImode move
	R1=BP+6
	R2=BP	// QImode move
	R3=BP+6
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2&240
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,142,',0,0
	.dd LM71-_main
	.dw 0x0d,0x0a
.code
LM71:
	R1=BP	// QImode move
	R2=BP+6
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,224	// QImode compare
	JNZ L110	// QImode EQ
	PC=L51
L110:
	R1=BP	// QImode move
	R2=BP+6
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,176	// QImode compare
	JNZ L111	// QImode EQ
	PC=L51
L111:
	R1=BP	// QImode move
	R2=BP+6
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,208	// QImode compare
	JNZ L112	// QImode EQ
	PC=L51
L112:
	R1=BP	// QImode move
	R2=BP+6
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,240	// QImode compare
	JNZ L113	// QImode EQ
	PC=L51
L113:
	pc=L50	// Indirect jump
L51:
.debug
	.dw '.stabn 0x44,0,144,',0,0
	.dd LM72-_main
	.dw 0x0d,0x0a
.code
LM72:
	R1=BP	// QImode move
	R2=BP+6
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,208	// QImode compare
	JNZ L114	// QImode EQ
	PC=L63
L114:
	CMP R1,208	// QImode compare
	JNA L115	// QImode GTU
	PC=L67
L115:
	CMP R1,176	// QImode compare
	JNZ L116	// QImode EQ
	PC=L54
L116:
	pc=L52	// Indirect jump
L67:
	CMP R1,224	// QImode compare
	JNZ L117	// QImode EQ
	PC=L53
L117:
	CMP R1,240	// QImode compare
	JNZ L118	// QImode EQ
	PC=L64
L118:
	pc=L52	// Indirect jump
L53:
.debug
	.dw '.stabn 0x44,0,147,',0,0
	.dd LM73-_main
	.dw 0x0d,0x0a
.code
LM73:
	R1=(-9473)	// QImode move
	[SP--]=R1	// QImode move
	R1=28677	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Export	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,149,',0,0
	.dd LM74-_main
	.dw 0x0d,0x0a
.code
LM74:
	R1=BP	// QImode move
	R2=BP+5
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	R2=1	// QImode move
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,150,',0,0
	.dd LM75-_main
	.dw 0x0d,0x0a
.code
LM75:
	R1=BP	// QImode move
	R2=BP+3
	R1=(-9473)	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,151,',0,0
	.dd LM76-_main
	.dw 0x0d,0x0a
.code
LM76:
	pc=L52	// Indirect jump
L54:
.debug
	.dw '.stabn 0x44,0,154,',0,0
	.dd LM77-_main
	.dw 0x0d,0x0a
.code
LM77:
	R1=(-513)	// QImode move
	[SP--]=R1	// QImode move
	R1=28677	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Export	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,155,',0,0
	.dd LM78-_main
	.dw 0x0d,0x0a
.code
LM78:
	R1=BP	// QImode move
	R2=BP+7
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L55:
	R1=BP	// QImode move
	R2=BP+7
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,3	// QImode compare
	JA L119	// QImode LEU
	PC=L58
L119:
	pc=L56	// Indirect jump
L58:
.debug
	.dw '.stabn 0x44,0,157,',0,0
	.dd LM79-_main
	.dw 0x0d,0x0a
.code
LM79:
LBB9:
	call _F_Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,158,',0,0
	.dd LM80-_main
	.dw 0x0d,0x0a
.code
LM80:
	R1=BP	// QImode move
	R2=BP+5
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=1	// QImode move
	R4=R1	// QImode move
	[R4]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,159,',0,0
	.dd LM81-_main
	.dw 0x0d,0x0a
.code
LM81:
LBE9:
.debug
	.dw '.stabn 0x44,0,155,',0,0
	.dd LM82-_main
	.dw 0x0d,0x0a
.code
LM82:
L57:
	R1=BP	// QImode move
	R2=BP+7
	R3=BP	// QImode move
	R1=BP+7
	R2=BP	// QImode move
	R3=BP+7
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
	pc=L55	// Indirect jump
L56:
.debug
	.dw '.stabn 0x44,0,160,',0,0
	.dd LM83-_main
	.dw 0x0d,0x0a
.code
LM83:
	R1=BP	// QImode move
	R2=BP+3
	R1=(-513)	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,161,',0,0
	.dd LM84-_main
	.dw 0x0d,0x0a
.code
LM84:
	R1=255	// QImode move
	[SP--]=R1	// QImode move
	R1=(-256)	// QImode move
	[SP--]=R1	// QImode move
	R1=(-256)	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Init_IOB	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,162,',0,0
	.dd LM85-_main
	.dw 0x0d,0x0a
.code
LM85:
	R1=(-5377)	// QImode move
	[SP--]=R1	// QImode move
	R1=28677	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Export	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,164,',0,0
	.dd LM86-_main
	.dw 0x0d,0x0a
.code
LM86:
	R1=BP	// QImode move
	R2=BP+7
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
L59:
	R1=BP	// QImode move
	R2=BP+7
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,4	// QImode compare
	JA L120	// QImode LEU
	PC=L62
L120:
	pc=L60	// Indirect jump
L62:
.debug
	.dw '.stabn 0x44,0,166,',0,0
	.dd LM87-_main
	.dw 0x0d,0x0a
.code
LM87:
LBB10:
	call _F_Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,167,',0,0
	.dd LM88-_main
	.dw 0x0d,0x0a
.code
LM88:
	R1=BP	// QImode move
	R2=BP+5
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	R2=1	// QImode move
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,168,',0,0
	.dd LM89-_main
	.dw 0x0d,0x0a
.code
LM89:
LBE10:
.debug
	.dw '.stabn 0x44,0,164,',0,0
	.dd LM90-_main
	.dw 0x0d,0x0a
.code
LM90:
L61:
	R1=BP	// QImode move
	R2=BP+7
	R3=BP	// QImode move
	R1=BP+7
	R2=BP	// QImode move
	R3=BP+7
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
	pc=L59	// Indirect jump
L60:
.debug
	.dw '.stabn 0x44,0,169,',0,0
	.dd LM91-_main
	.dw 0x0d,0x0a
.code
LM91:
	R1=BP	// QImode move
	R2=BP+3
	R1=(-5377)	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,170,',0,0
	.dd LM92-_main
	.dw 0x0d,0x0a
.code
LM92:
	pc=L52	// Indirect jump
L63:
.debug
	.dw '.stabn 0x44,0,174,',0,0
	.dd LM93-_main
	.dw 0x0d,0x0a
.code
LM93:
	R1=(-5377)	// QImode move
	[SP--]=R1	// QImode move
	R1=28677	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Export	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,175,',0,0
	.dd LM94-_main
	.dw 0x0d,0x0a
.code
LM94:
	R1=BP	// QImode move
	R2=BP+5
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	R2=1	// QImode move
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,176,',0,0
	.dd LM95-_main
	.dw 0x0d,0x0a
.code
LM95:
	R1=BP	// QImode move
	R2=BP+3
	R1=(-5377)	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,177,',0,0
	.dd LM96-_main
	.dw 0x0d,0x0a
.code
LM96:
	pc=L52	// Indirect jump
L64:
.debug
	.dw '.stabn 0x44,0,181,',0,0
	.dd LM97-_main
	.dw 0x0d,0x0a
.code
LM97:
	R1=(-257)	// QImode move
	[SP--]=R1	// QImode move
	R1=28677	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Export	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,182,',0,0
	.dd LM98-_main
	.dw 0x0d,0x0a
.code
LM98:
	R1=BP	// QImode move
	R2=BP+5
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=1	// QImode move
	R4=R1	// QImode move
	[R4]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,183,',0,0
	.dd LM99-_main
	.dw 0x0d,0x0a
.code
LM99:
	pc=L52	// Indirect jump
L66:
L52:
.debug
	.dw '.stabn 0x44,0,185,',0,0
	.dd LM100-_main
	.dw 0x0d,0x0a
.code
LM100:
	pc=L68	// Indirect jump
L50:
.debug
	.dw '.stabn 0x44,0,188,',0,0
	.dd LM101-_main
	.dw 0x0d,0x0a
.code
LM101:
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
L68:
.debug
	.dw '.stabn 0x44,0,189,',0,0
	.dd LM102-_main
	.dw 0x0d,0x0a
.code
LM102:
	R1=BP	// QImode move
	R2=BP+2
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,2	// QImode compare
	JG L121	// QImode LE
	PC=L69
L121:
	R1=BP	// QImode move
	R2=BP+2
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
L69:
.debug
	.dw '.stabn 0x44,0,190,',0,0
	.dd LM103-_main
	.dw 0x0d,0x0a
.code
LM103:
	call _BSR_GetResult	// call with return value
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,191,',0,0
	.dd LM104-_main
	.dw 0x0d,0x0a
.code
LM104:
	R1=[BP]	// QImode move
	CMP R1,0	// QImode test
	JG L122	// QImode LE
	PC=L70
L122:
.debug
	.dw '.stabn 0x44,0,193,',0,0
	.dd LM105-_main
	.dw 0x0d,0x0a
.code
LM105:
	R1=[_gActivated]	// QImode move
	CMP R1,0	// QImode test
	JNZ L123	// QImode EQ
	PC=L71
L123:
.debug
	.dw '.stabn 0x44,0,195,',0,0
	.dd LM106-_main
	.dw 0x0d,0x0a
.code
LM106:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,196,',0,0
	.dd LM107-_main
	.dw 0x0d,0x0a
.code
LM107:
	R2=[BP]	// QImode move
	R1=R2+(-256)
	CMP R1,4	// QImode compare
	JNA L124	// QImode GTU
	PC=L72
L124:
	R2=R1	// QImode move
	R1=R2	// QImode move
	R1=R1+L98
	R4=R1	// QImode move
	R2=[R4]	// QImode move
	pc=R2	// tablejump
.text
L98:
	.dw L73
	.dw L78
	.dw L83
	.dw L88
	.dw L93
.code
L73:
.debug
	.dw '.stabn 0x44,0,199,',0,0
	.dd LM108-_main
	.dw 0x0d,0x0a
.code
LM108:
	R1=255	// QImode move
	[SP--]=R1	// QImode move
	R1=(-256)	// QImode move
	[SP--]=R1	// QImode move
	R1=(-256)	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Init_IOB	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,200,',0,0
	.dd LM109-_main
	.dw 0x0d,0x0a
.code
LM109:
	R1=(-1)	// QImode move
	[SP--]=R1	// QImode move
	R1=28677	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Export	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,201,',0,0
	.dd LM110-_main
	.dw 0x0d,0x0a
.code
LM110:
	R1=BP	// QImode move
	R2=BP+7
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L74:
	R1=BP	// QImode move
	R2=BP+7
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,2	// QImode compare
	JA L125	// QImode LEU
	PC=L77
L125:
	pc=L75	// Indirect jump
L77:
.debug
	.dw '.stabn 0x44,0,203,',0,0
	.dd LM111-_main
	.dw 0x0d,0x0a
.code
LM111:
LBB11:
	call _F_Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,204,',0,0
	.dd LM112-_main
	.dw 0x0d,0x0a
.code
LM112:
	R1=BP	// QImode move
	R2=BP+5
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=1	// QImode move
	R4=R1	// QImode move
	[R4]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,205,',0,0
	.dd LM113-_main
	.dw 0x0d,0x0a
.code
LM113:
LBE11:
.debug
	.dw '.stabn 0x44,0,201,',0,0
	.dd LM114-_main
	.dw 0x0d,0x0a
.code
LM114:
L76:
	R1=BP	// QImode move
	R2=BP+7
	R3=BP	// QImode move
	R1=BP+7
	R2=BP	// QImode move
	R3=BP+7
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
	pc=L74	// Indirect jump
L75:
.debug
	.dw '.stabn 0x44,0,206,',0,0
	.dd LM115-_main
	.dw 0x0d,0x0a
.code
LM115:
	R1=1	// QImode move
	[_PlayFlag]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,207,',0,0
	.dd LM116-_main
	.dw 0x0d,0x0a
.code
LM116:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond2	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,208,',0,0
	.dd LM117-_main
	.dw 0x0d,0x0a
.code
LM117:
	R1=0	// QImode move
	[_PlayFlag]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,209,',0,0
	.dd LM118-_main
	.dw 0x0d,0x0a
.code
LM118:
	R1=BP	// QImode move
	R2=BP+5
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=1	// QImode move
	R4=R1	// QImode move
	[R4]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,212,',0,0
	.dd LM119-_main
	.dw 0x0d,0x0a
.code
LM119:
	R1=BP	// QImode move
	R2=BP+3
	R1=(-1)	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,213,',0,0
	.dd LM120-_main
	.dw 0x0d,0x0a
.code
LM120:
	pc=L72	// Indirect jump
L78:
.debug
	.dw '.stabn 0x44,0,215,',0,0
	.dd LM121-_main
	.dw 0x0d,0x0a
.code
LM121:
	R1=255	// QImode move
	[SP--]=R1	// QImode move
	R1=(-256)	// QImode move
	[SP--]=R1	// QImode move
	R1=(-256)	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Init_IOB	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,216,',0,0
	.dd LM122-_main
	.dw 0x0d,0x0a
.code
LM122:
	R1=(-257)	// QImode move
	[SP--]=R1	// QImode move
	R1=28677	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Export	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,217,',0,0
	.dd LM123-_main
	.dw 0x0d,0x0a
.code
LM123:
	R1=BP	// QImode move
	R2=BP+7
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
L79:
	R1=BP	// QImode move
	R2=BP+7
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,2	// QImode compare
	JA L126	// QImode LEU
	PC=L82
L126:
	pc=L80	// Indirect jump
L82:
.debug
	.dw '.stabn 0x44,0,219,',0,0
	.dd LM124-_main
	.dw 0x0d,0x0a
.code
LM124:
LBB12:
	call _F_Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,220,',0,0
	.dd LM125-_main
	.dw 0x0d,0x0a
.code
LM125:
	R1=BP	// QImode move
	R2=BP+5
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	R2=1	// QImode move
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,221,',0,0
	.dd LM126-_main
	.dw 0x0d,0x0a
.code
LM126:
LBE12:
.debug
	.dw '.stabn 0x44,0,217,',0,0
	.dd LM127-_main
	.dw 0x0d,0x0a
.code
LM127:
L81:
	R1=BP	// QImode move
	R2=BP+7
	R3=BP	// QImode move
	R1=BP+7
	R2=BP	// QImode move
	R3=BP+7
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
	pc=L79	// Indirect jump
L80:
.debug
	.dw '.stabn 0x44,0,222,',0,0
	.dd LM128-_main
	.dw 0x0d,0x0a
.code
LM128:
	R1=1	// QImode move
	[_PlayFlag]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,223,',0,0
	.dd LM129-_main
	.dw 0x0d,0x0a
.code
LM129:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond2	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,225,',0,0
	.dd LM130-_main
	.dw 0x0d,0x0a
.code
LM130:
	R1=0	// QImode move
	[_PlayFlag]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,226,',0,0
	.dd LM131-_main
	.dw 0x0d,0x0a
.code
LM131:
	R1=BP	// QImode move
	R2=BP+5
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=1	// QImode move
	R4=R1	// QImode move
	[R4]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,227,',0,0
	.dd LM132-_main
	.dw 0x0d,0x0a
.code
LM132:
	R1=BP	// QImode move
	R2=BP+3
	R1=(-257)	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,228,',0,0
	.dd LM133-_main
	.dw 0x0d,0x0a
.code
LM133:
	R1=0	// QImode move
	[_gActivated]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,229,',0,0
	.dd LM134-_main
	.dw 0x0d,0x0a
.code
LM134:
	pc=L72	// Indirect jump
L83:
.debug
	.dw '.stabn 0x44,0,231,',0,0
	.dd LM135-_main
	.dw 0x0d,0x0a
.code
LM135:
	R1=255	// QImode move
	[SP--]=R1	// QImode move
	R1=(-256)	// QImode move
	[SP--]=R1	// QImode move
	R1=(-256)	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Init_IOB	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,232,',0,0
	.dd LM136-_main
	.dw 0x0d,0x0a
.code
LM136:
	R1=(-9473)	// QImode move
	[SP--]=R1	// QImode move
	R1=28677	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Export	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,233,',0,0
	.dd LM137-_main
	.dw 0x0d,0x0a
.code
LM137:
	R1=BP	// QImode move
	R2=BP+7
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
L84:
	R1=BP	// QImode move
	R2=BP+7
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,2	// QImode compare
	JA L127	// QImode LEU
	PC=L87
L127:
	pc=L85	// Indirect jump
L87:
.debug
	.dw '.stabn 0x44,0,235,',0,0
	.dd LM138-_main
	.dw 0x0d,0x0a
.code
LM138:
LBB13:
	call _F_Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,236,',0,0
	.dd LM139-_main
	.dw 0x0d,0x0a
.code
LM139:
	R1=BP	// QImode move
	R2=BP+5
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	R2=1	// QImode move
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,237,',0,0
	.dd LM140-_main
	.dw 0x0d,0x0a
.code
LM140:
LBE13:
.debug
	.dw '.stabn 0x44,0,233,',0,0
	.dd LM141-_main
	.dw 0x0d,0x0a
.code
LM141:
L86:
	R1=BP	// QImode move
	R2=BP+7
	R3=BP	// QImode move
	R1=BP+7
	R2=BP	// QImode move
	R3=BP+7
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
	pc=L84	// Indirect jump
L85:
.debug
	.dw '.stabn 0x44,0,238,',0,0
	.dd LM142-_main
	.dw 0x0d,0x0a
.code
LM142:
	R1=1	// QImode move
	[_PlayFlag]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,239,',0,0
	.dd LM143-_main
	.dw 0x0d,0x0a
.code
LM143:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond2	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,240,',0,0
	.dd LM144-_main
	.dw 0x0d,0x0a
.code
LM144:
	R1=0	// QImode move
	[_PlayFlag]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,242,',0,0
	.dd LM145-_main
	.dw 0x0d,0x0a
.code
LM145:
	R1=BP	// QImode move
	R2=BP+5
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=1	// QImode move
	R4=R1	// QImode move
	[R4]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,245,',0,0
	.dd LM146-_main
	.dw 0x0d,0x0a
.code
LM146:
	R1=BP	// QImode move
	R2=BP+3
	R1=(-9473)	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,246,',0,0
	.dd LM147-_main
	.dw 0x0d,0x0a
.code
LM147:
	R1=0	// QImode move
	[_gActivated]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,247,',0,0
	.dd LM148-_main
	.dw 0x0d,0x0a
.code
LM148:
	pc=L72	// Indirect jump
L88:
.debug
	.dw '.stabn 0x44,0,249,',0,0
	.dd LM149-_main
	.dw 0x0d,0x0a
.code
LM149:
	R1=255	// QImode move
	[SP--]=R1	// QImode move
	R1=(-256)	// QImode move
	[SP--]=R1	// QImode move
	R1=(-256)	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Init_IOB	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,250,',0,0
	.dd LM150-_main
	.dw 0x0d,0x0a
.code
LM150:
	R1=(-5377)	// QImode move
	[SP--]=R1	// QImode move
	R1=28677	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Export	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,251,',0,0
	.dd LM151-_main
	.dw 0x0d,0x0a
.code
LM151:
	R1=BP	// QImode move
	R2=BP+7
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
L89:
	R1=BP	// QImode move
	R2=BP+7
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,2	// QImode compare
	JA L128	// QImode LEU
	PC=L92
L128:
	pc=L90	// Indirect jump
L92:
.debug
	.dw '.stabn 0x44,0,253,',0,0
	.dd LM152-_main
	.dw 0x0d,0x0a
.code
LM152:
LBB14:
	call _F_Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,254,',0,0
	.dd LM153-_main
	.dw 0x0d,0x0a
.code
LM153:
	R1=BP	// QImode move
	R2=BP+5
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	R2=1	// QImode move
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,255,',0,0
	.dd LM154-_main
	.dw 0x0d,0x0a
.code
LM154:
LBE14:
.debug
	.dw '.stabn 0x44,0,251,',0,0
	.dd LM155-_main
	.dw 0x0d,0x0a
.code
LM155:
L91:
	R1=BP	// QImode move
	R2=BP+7
	R3=BP	// QImode move
	R1=BP+7
	R2=BP	// QImode move
	R3=BP+7
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
	pc=L89	// Indirect jump
L90:
.debug
	.dw '.stabn 0x44,0,256,',0,0
	.dd LM156-_main
	.dw 0x0d,0x0a
.code
LM156:
	R1=1	// QImode move
	[_PlayFlag]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,257,',0,0
	.dd LM157-_main
	.dw 0x0d,0x0a
.code
LM157:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond2	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,258,',0,0
	.dd LM158-_main
	.dw 0x0d,0x0a
.code
LM158:
	R1=0	// QImode move
	[_PlayFlag]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,259,',0,0
	.dd LM159-_main
	.dw 0x0d,0x0a
.code
LM159:
	R1=BP	// QImode move
	R2=BP+5
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=1	// QImode move
	R4=R1	// QImode move
	[R4]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,261,',0,0
	.dd LM160-_main
	.dw 0x0d,0x0a
.code
LM160:
	R1=BP	// QImode move
	R2=BP+3
	R1=(-5377)	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,262,',0,0
	.dd LM161-_main
	.dw 0x0d,0x0a
.code
LM161:
	R1=0	// QImode move
	[_gActivated]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,263,',0,0
	.dd LM162-_main
	.dw 0x0d,0x0a
.code
LM162:
	pc=L72	// Indirect jump
L93:
.debug
	.dw '.stabn 0x44,0,265,',0,0
	.dd LM163-_main
	.dw 0x0d,0x0a
.code
LM163:
	R1=255	// QImode move
	[SP--]=R1	// QImode move
	R1=(-256)	// QImode move
	[SP--]=R1	// QImode move
	R1=(-256)	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Init_IOB	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,266,',0,0
	.dd LM164-_main
	.dw 0x0d,0x0a
.code
LM164:
	R1=(-513)	// QImode move
	[SP--]=R1	// QImode move
	R1=28677	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Export	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,267,',0,0
	.dd LM165-_main
	.dw 0x0d,0x0a
.code
LM165:
	R2=BP	// QImode move
	R1=BP+4
	R2=BP	// QImode move
	R3=BP+4
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,268,',0,0
	.dd LM166-_main
	.dw 0x0d,0x0a
.code
LM166:
	R1=BP	// QImode move
	R2=BP+7
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L94:
	R1=BP	// QImode move
	R2=BP+7
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,2	// QImode compare
	JA L129	// QImode LEU
	PC=L97
L129:
	pc=L95	// Indirect jump
L97:
.debug
	.dw '.stabn 0x44,0,270,',0,0
	.dd LM167-_main
	.dw 0x0d,0x0a
.code
LM167:
LBB15:
	call _F_Delay	// call with return value
.debug
	.dw '.stabn 0x44,0,271,',0,0
	.dd LM168-_main
	.dw 0x0d,0x0a
.code
LM168:
	R1=BP	// QImode move
	R2=BP+5
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=1	// QImode move
	R4=R1	// QImode move
	[R4]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,272,',0,0
	.dd LM169-_main
	.dw 0x0d,0x0a
.code
LM169:
LBE15:
.debug
	.dw '.stabn 0x44,0,268,',0,0
	.dd LM170-_main
	.dw 0x0d,0x0a
.code
LM170:
L96:
	R1=BP	// QImode move
	R2=BP+7
	R3=BP	// QImode move
	R1=BP+7
	R2=BP	// QImode move
	R3=BP+7
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
	pc=L94	// Indirect jump
L95:
.debug
	.dw '.stabn 0x44,0,273,',0,0
	.dd LM171-_main
	.dw 0x0d,0x0a
.code
LM171:
	R1=1	// QImode move
	[_PlayFlag]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,274,',0,0
	.dd LM172-_main
	.dw 0x0d,0x0a
.code
LM172:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond2	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,275,',0,0
	.dd LM173-_main
	.dw 0x0d,0x0a
.code
LM173:
	R1=0	// QImode move
	[_PlayFlag]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,276,',0,0
	.dd LM174-_main
	.dw 0x0d,0x0a
.code
LM174:
	R1=BP	// QImode move
	R2=BP+5
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=1	// QImode move
	R4=R1	// QImode move
	[R4]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,278,',0,0
	.dd LM175-_main
	.dw 0x0d,0x0a
.code
LM175:
	R1=BP	// QImode move
	R2=BP+3
	R1=(-513)	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,279,',0,0
	.dd LM176-_main
	.dw 0x0d,0x0a
.code
LM176:
	R1=0	// QImode move
	[_gActivated]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,280,',0,0
	.dd LM177-_main
	.dw 0x0d,0x0a
.code
LM177:
	pc=L72	// Indirect jump
L99:
L72:
.debug
	.dw '.stabn 0x44,0,282,',0,0
	.dd LM178-_main
	.dw 0x0d,0x0a
.code
LM178:
	pc=L100	// Indirect jump
L71:
.debug
	.dw '.stabn 0x44,0,285,',0,0
	.dd LM179-_main
	.dw 0x0d,0x0a
.code
LM179:
	R1=[BP]	// QImode move
	CMP R1,256	// QImode compare
	JZ L130	// QImode NE
	PC=L100
L130:
.debug
	.dw '.stabn 0x44,0,287,',0,0
	.dd LM180-_main
	.dw 0x0d,0x0a
.code
LM180:
	R1=BP	// QImode move
	R2=BP+5
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	R2=1	// QImode move
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,288,',0,0
	.dd LM181-_main
	.dw 0x0d,0x0a
.code
LM181:
	R1=BP	// QImode move
	R2=BP+2
	R1=_gTriggerRespond	// QImode move
	R4=R2	// QImode move
	R2=[R4]	// QImode move
	R1+=R2	// addqi3_r0r
	R3=R1	// QImode move
	R2=[R3]	// QImode move
	[SP--]=R2	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,289,',0,0
	.dd LM182-_main
	.dw 0x0d,0x0a
.code
LM182:
	R1=1	// QImode move
	[_gActivated]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,290,',0,0
	.dd LM183-_main
	.dw 0x0d,0x0a
.code
LM183:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R4=R2	// QImode move
	[R4]=R1	// QImode move
L101:
L100:
.debug
	.dw '.stabn 0x44,0,293,',0,0
	.dd LM184-_main
	.dw 0x0d,0x0a
.code
LM184:
	pc=L102	// Indirect jump
L70:
.debug
	.dw '.stabn 0x44,0,294,',0,0
	.dd LM185-_main
	.dw 0x0d,0x0a
.code
LM185:
	R1=[_gActivated]	// QImode move
	CMP R1,0	// QImode test
	JNZ L131	// QImode EQ
	PC=L102
L131:
.debug
	.dw '.stabn 0x44,0,296,',0,0
	.dd LM186-_main
	.dw 0x0d,0x0a
.code
LM186:
	R1=BP	// QImode move
	R2=BP+1
	R3=BP	// QImode move
	R1=BP+1
	R2=BP	// QImode move
	R3=BP+1
	R2=R3	// QImode move
	R4=[R2]	// QImode move
	R2=R4+1
	R3=R2	// QImode move
	R4=R1	// QImode move
	[R4]=R3	// QImode move
	CMP R3,450	// QImode compare
	JG L132	// QImode LE
	PC=L102
L132:
.debug
	.dw '.stabn 0x44,0,298,',0,0
	.dd LM187-_main
	.dw 0x0d,0x0a
.code
LM187:
	R1=BP	// QImode move
	R2=BP+5
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=1	// QImode move
	R4=R1	// QImode move
	[R4]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,299,',0,0
	.dd LM188-_main
	.dw 0x0d,0x0a
.code
LM188:
	R1=5	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,300,',0,0
	.dd LM189-_main
	.dw 0x0d,0x0a
.code
LM189:
	R1=0	// QImode move
	[_gActivated]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,301,',0,0
	.dd LM190-_main
	.dw 0x0d,0x0a
.code
LM190:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L104:
L103:
L102:
.debug
	.dw '.stabn 0x44,0,304,',0,0
	.dd LM191-_main
	.dw 0x0d,0x0a
.code
LM191:
LBE8:
	pc=L47	// Indirect jump
L48:
.debug
	.dw '.stabn 0x44,0,305,',0,0
	.dd LM192-_main
	.dw 0x0d,0x0a
.code
LM192:
LBE7:
.debug
	.dw '.stabn 0x44,0,305,',0,0
	.dd LM193-_main
	.dw 0x0d,0x0a
.code
LM193:
L31:

	sp+=10
	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB7-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "res:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "timeCnt:1",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "random_no:1",128,0,0,2',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "iMoveFlag:1",128,0,0,3',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "aFlag:1",128,0,0,4',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "ClearWatchdog:22=*4",128,0,0,5',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "uiIOB:4",128,0,0,6',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "i:4",128,0,0,7',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "p:22",128,0,0,8',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB8-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB9-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE9-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB10-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE10-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB11-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE11-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB12-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE12-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB13-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE13-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB14-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE14-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB15-_main
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE15-_main
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
	.dw '.stabf ',0,0
	.dd LME4-_main
	.dw 0x0d,0x0a
.code
LME4:
.code
.debug
	.dw '.stabs "ShowAndVoic:F1",36,0,0,',0,0,offset _ShowAndVoic,seg _ShowAndVoic,0x0d,0x0a
.CODE
.public _ShowAndVoic
_ShowAndVoic:	.proc
.debug
	.dw '.stabn 0x44,0,308,',0,0
	.dd LM194-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM194:
	// total=36, vars=36
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=36
	bp=sp+1

	R1=BP+39
	[bp+16]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,309,',0,0
	.dd LM195-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM195:
LBB16:
.debug
	.dw '.stabn 0x44,0,310,',0,0
	.dd LM196-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM196:
	call _car_time	// call with return value
	R2=BP	// QImode move
	R3=BP+2
	R2=R3	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,311,',0,0
	.dd LM197-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM197:
	call _car_long	// call with return value
	R2=BP	// QImode move
	R3=BP+3
	R4=R3	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,312,',0,0
	.dd LM198-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM198:
	R2=BP	// QImode move
	R1=BP+3
	R2=BP	// QImode move
	R3=BP+3
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=15	// QImode move
	[bp+35]=R3	// QImode move
	R3=[bp+35]	// QImode move
	mr=R2*R3	// r3=R2*R3 16bit=16bit*16bit
	R2=R3	// QImode move
	R4=R1	// QImode move
	[R4]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,313,',0,0
	.dd LM199-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM199:
	R1=BP	// QImode move
	R1=BP+4
	[bp+17]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+2
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modi1	// call with return value
	SP=SP+2
	R4=[bp+17]	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,314,',0,0
	.dd LM200-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM200:
	R1=BP	// QImode move
	R1=BP+1
	[bp+18]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+2
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divi1	// call with return value
	SP=SP+2
	R4=[bp+18]	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,315,',0,0
	.dd LM201-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM201:
	R1=BP	// QImode move
	R1=BP+5
	[bp+19]=R1	// QImode move
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
	.dw '.stabn 0x44,0,316,',0,0
	.dd LM202-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM202:
	R1=BP	// QImode move
	R1=BP+1
	[bp+20]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+2
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divi1	// call with return value
	SP=SP+2
	R4=[bp+20]	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,317,',0,0
	.dd LM203-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM203:
	R1=BP	// QImode move
	R1=BP+6
	[bp+21]=R1	// QImode move
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
	.dw '.stabn 0x44,0,318,',0,0
	.dd LM204-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM204:
	R1=BP	// QImode move
	R1=BP+1
	[bp+22]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+2
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=1000	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divi1	// call with return value
	SP=SP+2
	R4=[bp+22]	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,319,',0,0
	.dd LM205-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM205:
	R1=BP	// QImode move
	R1=BP+7
	[bp+23]=R1	// QImode move
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
	.dw '.stabn 0x44,0,320,',0,0
	.dd LM206-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM206:
	R1=BP	// QImode move
	R1=BP+10
	[bp+24]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+3
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modi1	// call with return value
	SP=SP+2
	R4=[bp+24]	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,321,',0,0
	.dd LM207-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM207:
	R1=BP	// QImode move
	R1=BP+1
	[bp+25]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+3
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
	.dw '.stabn 0x44,0,322,',0,0
	.dd LM208-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM208:
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
	.dw '.stabn 0x44,0,323,',0,0
	.dd LM209-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM209:
	R1=BP	// QImode move
	R1=BP+1
	[bp+27]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+3
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=100	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divi1	// call with return value
	SP=SP+2
	R4=[bp+27]	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,324,',0,0
	.dd LM210-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM210:
	R1=BP	// QImode move
	R1=BP+12
	[bp+28]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modi1	// call with return value
	SP=SP+2
	R4=[bp+28]	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,325,',0,0
	.dd LM211-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM211:
	R1=BP	// QImode move
	R1=BP+1
	[bp+29]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+3
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
	.dw '.stabn 0x44,0,326,',0,0
	.dd LM212-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM212:
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
	.dw '.stabn 0x44,0,327,',0,0
	.dd LM213-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM213:
	R1=BP	// QImode move
	R1=BP+1
	[bp+31]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+3
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=10000	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divi1	// call with return value
	SP=SP+2
	R4=[bp+31]	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,328,',0,0
	.dd LM214-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM214:
	R1=BP	// QImode move
	R1=BP+14
	[bp+32]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modi1	// call with return value
	SP=SP+2
	R4=[bp+32]	// QImode move
	[R4]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,329,',0,0
	.dd LM215-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM215:
	R1=BP	// QImode move
	R1=BP+1
	[bp+33]=R1	// QImode move
	R1=BP	// QImode move
	R3=BP+3
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
	.dw '.stabn 0x44,0,330,',0,0
	.dd LM216-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM216:
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
L134:
.debug
	.dw '.stabn 0x44,0,333,',0,0
	.dd LM217-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM217:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L135:
.debug
	.dw '.stabn 0x44,0,335,',0,0
	.dd LM218-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM218:
LBB17:
	R2=BP	// QImode move
	R1=BP+1
	R2=BP	// QImode move
	R3=BP+1
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,336,',0,0
	.dd LM219-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM219:
	R1=BP	// QImode move
	R2=BP+4
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _singleled	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,338,',0,0
	.dd LM220-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM220:
	R1=1	// QImode move
	[BP]=R1	// QImode move
L138:
	R1=[BP]	// QImode move
	CMP R1,80	// QImode compare
	JG L171	// QImode LE
	PC=L141
L171:
	pc=L139	// Indirect jump
L141:
.debug
	.dw '.stabn 0x44,0,339,',0,0
	.dd LM221-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM221:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,338,',0,0
	.dd LM222-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM222:
L140:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L138	// Indirect jump
L139:
.debug
	.dw '.stabn 0x44,0,341,',0,0
	.dd LM223-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM223:
	R1=BP	// QImode move
	R2=BP+5
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _singleled	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,342,',0,0
	.dd LM224-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM224:
	R1=1	// QImode move
	[BP]=R1	// QImode move
L142:
	R1=[BP]	// QImode move
	CMP R1,50	// QImode compare
	JG L172	// QImode LE
	PC=L145
L172:
	pc=L143	// Indirect jump
L145:
.debug
	.dw '.stabn 0x44,0,343,',0,0
	.dd LM225-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM225:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,342,',0,0
	.dd LM226-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM226:
L144:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L142	// Indirect jump
L143:
.debug
	.dw '.stabn 0x44,0,344,',0,0
	.dd LM227-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM227:
	R1=BP	// QImode move
	R2=BP+6
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	call _singleled	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,345,',0,0
	.dd LM228-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM228:
	R1=1	// QImode move
	[BP]=R1	// QImode move
L146:
	R1=[BP]	// QImode move
	CMP R1,50	// QImode compare
	JG L173	// QImode LE
	PC=L149
L173:
	pc=L137	// Indirect jump
L149:
.debug
	.dw '.stabn 0x44,0,346,',0,0
	.dd LM229-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM229:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,345,',0,0
	.dd LM230-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM230:
L148:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L146	// Indirect jump
L147:
.debug
	.dw '.stabn 0x44,0,350,',0,0
	.dd LM231-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM231:
LBE17:
L137:
.debug
	.dw '.stabn 0x44,0,351,',0,0
	.dd LM232-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM232:
	R1=BP	// QImode move
	R2=BP+1
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,1999	// QImode compare
	JG L174	// QImode LE
	PC=L150
L174:
	pc=L136	// Indirect jump
L150:
	pc=L135	// Indirect jump
L136:
.debug
	.dw '.stabn 0x44,0,354,',0,0
	.dd LM233-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM233:
	R1=BP	// QImode move
	R2=BP+1
	R1=0	// QImode move
	R3=R2	// QImode move
	[R3]=R1	// QImode move
L151:
.debug
	.dw '.stabn 0x44,0,356,',0,0
	.dd LM234-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM234:
LBB18:
	R2=BP	// QImode move
	R1=BP+1
	R2=BP	// QImode move
	R3=BP+1
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R2+1
	R2=R1	// QImode move
	[R2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,357,',0,0
	.dd LM235-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM235:
	R1=BP	// QImode move
	R2=BP+10
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _singleled	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,359,',0,0
	.dd LM236-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM236:
	R1=1	// QImode move
	[BP]=R1	// QImode move
L154:
	R1=[BP]	// QImode move
	CMP R1,80	// QImode compare
	JG L175	// QImode LE
	PC=L157
L175:
	pc=L155	// Indirect jump
L157:
.debug
	.dw '.stabn 0x44,0,360,',0,0
	.dd LM237-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM237:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,359,',0,0
	.dd LM238-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM238:
L156:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L154	// Indirect jump
L155:
.debug
	.dw '.stabn 0x44,0,362,',0,0
	.dd LM239-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM239:
	R1=BP	// QImode move
	R2=BP+11
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	R1=1	// QImode move
	[SP--]=R1	// QImode move
	call _singleled	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,363,',0,0
	.dd LM240-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM240:
	R1=1	// QImode move
	[BP]=R1	// QImode move
L158:
	R1=[BP]	// QImode move
	CMP R1,50	// QImode compare
	JG L176	// QImode LE
	PC=L161
L176:
	pc=L159	// Indirect jump
L161:
.debug
	.dw '.stabn 0x44,0,364,',0,0
	.dd LM241-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM241:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,363,',0,0
	.dd LM242-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM242:
L160:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L158	// Indirect jump
L159:
.debug
	.dw '.stabn 0x44,0,365,',0,0
	.dd LM243-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM243:
	R1=BP	// QImode move
	R2=BP+12
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	call _singleled	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,366,',0,0
	.dd LM244-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM244:
	R1=1	// QImode move
	[BP]=R1	// QImode move
L162:
	R1=[BP]	// QImode move
	CMP R1,50	// QImode compare
	JG L177	// QImode LE
	PC=L165
L177:
	pc=L163	// Indirect jump
L165:
.debug
	.dw '.stabn 0x44,0,367,',0,0
	.dd LM245-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM245:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,366,',0,0
	.dd LM246-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM246:
L164:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L162	// Indirect jump
L163:
.debug
	.dw '.stabn 0x44,0,370,',0,0
	.dd LM247-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM247:
	R1=BP	// QImode move
	R2=BP+13
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _singleled	// call with return value
	SP=SP+2
.debug
	.dw '.stabn 0x44,0,372,',0,0
	.dd LM248-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM248:
	R1=1	// QImode move
	[BP]=R1	// QImode move
L166:
	R1=[BP]	// QImode move
	CMP R1,80	// QImode compare
	JG L178	// QImode LE
	PC=L169
L178:
	pc=L153	// Indirect jump
L169:
.debug
	.dw '.stabn 0x44,0,373,',0,0
	.dd LM249-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM249:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,372,',0,0
	.dd LM250-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM250:
L168:
	R1=[BP]	// QImode move
	R2=R1+1
	[BP]=R2	// QImode move
	pc=L166	// Indirect jump
L167:
.debug
	.dw '.stabn 0x44,0,374,',0,0
	.dd LM251-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM251:
LBE18:
L153:
.debug
	.dw '.stabn 0x44,0,375,',0,0
	.dd LM252-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM252:
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,1999	// QImode compare
	JG L179	// QImode LE
	PC=L170
L179:
	pc=L152	// Indirect jump
L170:
	pc=L151	// Indirect jump
L152:
.debug
	.dw '.stabn 0x44,0,379,',0,0
	.dd LM253-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM253:
	R1=12	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,381,',0,0
	.dd LM254-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM254:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,382,',0,0
	.dd LM255-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM255:
	R1=BP	// QImode move
	R2=BP+6
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,384,',0,0
	.dd LM256-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM256:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,385,',0,0
	.dd LM257-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM257:
	R1=BP	// QImode move
	R2=BP+5
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,387,',0,0
	.dd LM258-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM258:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,388,',0,0
	.dd LM259-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM259:
	R1=BP	// QImode move
	R2=BP+4
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,390,',0,0
	.dd LM260-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM260:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,391,',0,0
	.dd LM261-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM261:
	R1=11	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,392,',0,0
	.dd LM262-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM262:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,393,',0,0
	.dd LM263-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM263:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,394,',0,0
	.dd LM264-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM264:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,395,',0,0
	.dd LM265-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM265:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,396,',0,0
	.dd LM266-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM266:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,397,',0,0
	.dd LM267-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM267:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,398,',0,0
	.dd LM268-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM268:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,399,',0,0
	.dd LM269-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM269:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,400,',0,0
	.dd LM270-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM270:
	R1=BP	// QImode move
	R2=BP+13
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,402,',0,0
	.dd LM271-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM271:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,403,',0,0
	.dd LM272-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM272:
	R1=BP	// QImode move
	R2=BP+12
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,405,',0,0
	.dd LM273-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM273:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,406,',0,0
	.dd LM274-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM274:
	R1=BP	// QImode move
	R2=BP+11
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,408,',0,0
	.dd LM275-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM275:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,409,',0,0
	.dd LM276-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM276:
	R1=BP	// QImode move
	R2=BP+10
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,411,',0,0
	.dd LM277-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM277:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,412,',0,0
	.dd LM278-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM278:
	R1=13	// QImode move
	[SP--]=R1	// QImode move
	call _PlayRespond	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,414,',0,0
	.dd LM279-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM279:
	call _delay	// call with return value
.debug
	.dw '.stabn 0x44,0,416,',0,0
	.dd LM280-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM280:
LBE16:
.debug
	.dw '.stabn 0x44,0,416,',0,0
	.dd LM281-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LM281:
L133:

	sp+=36
	pop bp from [sp]
	retf
	.endp	// end of ShowAndVoic

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB16-_ShowAndVoic
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "i:1",128,0,0,0',0x0d,0x0a
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
	.dd LBB17-_ShowAndVoic
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE17-_ShowAndVoic
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB18-_ShowAndVoic
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE18-_ShowAndVoic
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE16-_ShowAndVoic
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME5-_ShowAndVoic
	.dw 0x0d,0x0a
.code
LME5:
.external _delay
.external _singleled
.external _car_long
.external _car_time
.external _F_Delay
.external _BSR_GetResult
.external _SP_Export
.external _BSR_DeleteSDGroup
.external _SP_Init_IOB
.external _F_Speed
.external _BSR_Train
.external _SACM_S480_Stop
.external _SACM_S480_ServiceLoop
.external _SACM_S480_Status
.external _SACM_S480_Play
.external _SACM_S480_Initial
.external _BSR_EnableCPUIndicator
.external _BSR_InitRecognizer
.external _SACM_A2000_Stop
.external _ClearWatchDog
.external _SACM_A2000_ServiceLoop
.external _SACM_A2000_Status
.external _SACM_A2000_Play
.external _SACM_A2000_Initial
.external _BSR_StopRecognizer
.external __modi1
.external __divi2
.external __divi1
	.end
