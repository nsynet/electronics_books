// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\PROGRA~1\Sunplus\UNSPID~3\IDE180\cc1.exe C:\DOCUME~1\李华丽.DOMAIN\LOCALS~1\Temp\ccIxaaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\电子竞赛\\C语言应用篇\\Source Code\\chapter10 Intergraded example\\SIO_UART/", 0x64, 0, 3, Ltext0
.stabs "F:/电子竞赛/C语言应用篇/Source Code/chapter10 Intergraded example/SIO_UART/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "BaseType:T20=eUartOpen:0,UartClose:1,;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "SubStatus:T21=eStop:0,Record:1,Play:2,\\",128,0,0,0',0x0d,0x0a
	.DW '.stabs "Download:3,Upload:4,Receive_data:5,\\",128,0,0,0',0x0d,0x0a
	.DW '.stabs "RePlay_All:6,RePlay:7,;",128,0,0,0',0x0d,0x0a
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
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,39,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
	R1=1	// QImode move
	[_BaseType]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,40,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	R1=0	// QImode move
	[_SubStatus]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,41,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R1=1	// QImode move
	[_Segment]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,42,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	R1=0	// HImode immediate to register move
	R2=0
	[_Addr]=R1	// HImode [Label]=RS
	[_Addr+1]=R2
.debug
	.dw '.stabn 0x44,0,43,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	R1=255	// QImode move
	[_Keycode]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
	R1=0	// QImode move
	[_i]=R1	// QImode move
	R1=(-4096)	// QImode move
	[_internal_addr]=R1	// QImode move
L3:
	R1=[_i]	// QImode move
	CMP R1,20	// QImode compare
	JA L10	// QImode LEU
	PC=L6
L10:
	pc=L4	// jump
L6:
.debug
	.dw '.stabn 0x44,0,45,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
	R1=[_internal_addr]	// QImode move
	[SP--]=R1	// QImode move
	call _SP_ReadWord	// call with return value
	SP=SP+1
	R2=[_i]	// QImode move
	R3=R2	// QImode move
	R2=R3 lsl 1
	R4=_Buffer	// QImode move
	R3=R4	// QImode move
	R3+=R2	// addqi3_r0r
	R2=0	// sign extend
	R1=R1
	jpl 1
	R2=-1
	R4=R3	// QImode move
	[R4++]=R1	// [RD]=RS HImode, RD!=RS+1
	[R4--]=R2
.debug
	.dw '.stabn 0x44,0,44,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
L5:
	R1=[_i]	// QImode move
	R2=1	// QImode move
	[_i]=R1+R2
	R1=[_internal_addr]	// QImode move
	R2=1	// QImode move
	[_internal_addr]=R1+R2
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,47,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	call _System_Initial	// call with return value
.debug
	.dw '.stabn 0x44,0,49,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_DVR_Initial	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,50,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
L7:
	pc=L9	// jump
	pc=L8	// jump
L9:
.debug
	.dw '.stabn 0x44,0,52,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
LBB3:
	call _F_Key_Scan	// call with return value
	[_Keycode]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,53,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	call _According_to_Keycode	// call without return value
.debug
	.dw '.stabn 0x44,0,54,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	call _According_to_SubStatus	// call without return value
.debug
	.dw '.stabn 0x44,0,55,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
LBE3:
	pc=L7	// jump
L8:
.debug
	.dw '.stabn 0x44,0,56,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
	R1=0	// QImode move
	pc=L2	// jump
.debug
	.dw '.stabn 0x44,0,57,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
LBE2:
.debug
	.dw '.stabn 0x44,0,57,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
L2:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of main

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB2-_main
	.dw 0x0d,0x0a
.code
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
.code
.debug
	.dw '.stabs "Modify_Index:F19",36,0,0,',0,0,offset _Modify_Index,seg _Modify_Index,0x0d,0x0a
.CODE
.public _Modify_Index
_Modify_Index:	.proc
.debug
	.dw '.stabn 0x44,0,70,',0,0
	.dd LM20-_Modify_Index
	.dw 0x0d,0x0a
.code
LM20:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,71,',0,0
	.dd LM21-_Modify_Index
	.dw 0x0d,0x0a
.code
LM21:
	R1=0	// QImode move
	[_i]=R1	// QImode move
	R1=(-4096)	// QImode move
	[_internal_addr]=R1	// QImode move
L12:
	R1=[_i]	// QImode move
	CMP R1,20	// QImode compare
	JA L25	// QImode LEU
	PC=L15
L25:
	pc=L13	// jump
L15:
.debug
	.dw '.stabn 0x44,0,72,',0,0
	.dd LM22-_Modify_Index
	.dw 0x0d,0x0a
.code
LM22:
	R1=[_internal_addr]	// QImode move
	[SP--]=R1	// QImode move
	call _SP_ReadWord	// call with return value
	SP=SP+1
	R2=[_i]	// QImode move
	R3=R2	// QImode move
	R2=R3 lsl 1
	R4=_Buffer	// QImode move
	R3=R4	// QImode move
	R3+=R2	// addqi3_r0r
	R2=0	// sign extend
	R1=R1
	jpl 1
	R2=-1
	R4=R3	// QImode move
	[R4++]=R1	// [RD]=RS HImode, RD!=RS+1
	[R4--]=R2
.debug
	.dw '.stabn 0x44,0,71,',0,0
	.dd LM23-_Modify_Index
	.dw 0x0d,0x0a
.code
LM23:
L14:
	R1=[_i]	// QImode move
	R2=1	// QImode move
	[_i]=R1+R2
	R1=[_internal_addr]	// QImode move
	R2=1	// QImode move
	[_internal_addr]=R1+R2
	pc=L12	// jump
L13:
.debug
	.dw '.stabn 0x44,0,73,',0,0
	.dd LM24-_Modify_Index
	.dw 0x0d,0x0a
.code
LM24:
	R1=[_Buffer]	// HImode RD=[Label]
	R2=[_Buffer+1]
	R3=R1+1	// HImode RD=RS+#IMM16
	R4=R2+0, Carry
	[_Buffer]=R3	// HImode [Label]=RS
	[_Buffer+1]=R4
.debug
	.dw '.stabn 0x44,0,74,',0,0
	.dd LM25-_Modify_Index
	.dw 0x0d,0x0a
.code
LM25:
	R3=[_Buffer]	// HImode RD=[Label]
	R4=[_Buffer+1]
	R1=R3	// HImode register to register move
	R2=R4
	R3=1	// QImode move
	[SP--]=R3	// QImode move
	push R1,R2 to [sp]	// pushhi
	call __lshiu2	// call with return value
	SP=SP+3
	R3=R1	// QImode move
	[_Ret]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,75,',0,0
	.dd LM26-_Modify_Index
	.dw 0x0d,0x0a
.code
LM26:
	R1=[_Ret]	// QImode move
	R2=R1	// QImode move
	R1=R2 lsl 1
	R3=_Buffer	// QImode move
	R2=R3	// QImode move
	R2+=R1	// addqi3_r0r
	R3=[_Addr]	// HImode RD=[Label]
	R4=[_Addr+1]
	R1=R2	// QImode move
	[R1++]=R3	// [RD]=RS HImode, RD!=RS+1
	[R1--]=R4
.debug
	.dw '.stabn 0x44,0,76,',0,0
	.dd LM27-_Modify_Index
	.dw 0x0d,0x0a
.code
LM27:
	R1=0	// HImode immediate to register move
	R2=0
	[_Tem]=R1	// HImode [Label]=RS
	[_Tem+1]=R2
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM28-_Modify_Index
	.dw 0x0d,0x0a
.code
LM28:
	R1=1	// QImode move
	[_i]=R1	// QImode move
L16:
	R1=[_i]	// QImode move
	CMP R1,255	// QImode compare
	JNA L26	// QImode GTU
	PC=L20
L26:
	R1=[_Tem]	// HImode RD=[Label]
	R2=[_Tem+1]
	R3=[_Addr]	// HImode RD=[Label]
	R4=[_Addr+1]
	CMP R2,R4	// HImode compare
	JB  L27	// HImode LTU
	JNZ L28
	CMP R1,R3
	JNB L28
L27:
	PC=L19
L28:
	R1=[_Tem]	// HImode RD=[Label]
	R2=[_Tem+1]
	R3=[_Addr]	// HImode RD=[Label]
	R4=[_Addr+1]
	CMP R2,R4	// HImode compare
	JNZ L30	// HImode EQ
	CMP R1,R3
	JNZ L30
	PC=L19
L30:
	pc=L20	// jump
L20:
	pc=L17	// jump
L19:
.debug
	.dw '.stabn 0x44,0,78,',0,0
	.dd LM29-_Modify_Index
	.dw 0x0d,0x0a
.code
LM29:
	R1=[_i]	// QImode move
	R2=2048	// QImode move
	mr=R1*R2	// r3=R1*R2 16bit=16bit*16bit
	R1=R3
	R2=0
	[_Tem]=R1	// HImode [Label]=RS
	[_Tem+1]=R2
.debug
	.dw '.stabn 0x44,0,77,',0,0
	.dd LM30-_Modify_Index
	.dw 0x0d,0x0a
.code
LM30:
L18:
	R1=[_i]	// QImode move
	R2=1	// QImode move
	[_i]=R1+R2
	pc=L16	// jump
L17:
.debug
	.dw '.stabn 0x44,0,79,',0,0
	.dd LM31-_Modify_Index
	.dw 0x0d,0x0a
.code
LM31:
	R2=[_Ret]	// QImode move
	R1=R2+1
	R2=R1	// QImode move
	R1=R2 lsl 1
	R3=_Buffer	// QImode move
	R2=R3	// QImode move
	R2+=R1	// addqi3_r0r
	R3=[_Tem]	// HImode RD=[Label]
	R4=[_Tem+1]
	R1=R2	// QImode move
	[R1++]=R3	// [RD]=RS HImode, RD!=RS+1
	[R1--]=R4
.debug
	.dw '.stabn 0x44,0,80,',0,0
	.dd LM32-_Modify_Index
	.dw 0x0d,0x0a
.code
LM32:
	R1=(-4096)	// QImode move
	[SP--]=R1	// QImode move
	call _SP_PageErase	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,81,',0,0
	.dd LM33-_Modify_Index
	.dw 0x0d,0x0a
.code
LM33:
	R1=0	// QImode move
	[_i]=R1	// QImode move
	R1=(-4096)	// QImode move
	[_internal_addr]=R1	// QImode move
L21:
	R1=[_i]	// QImode move
	CMP R1,20	// QImode compare
	JA L31	// QImode LEU
	PC=L24
L31:
	pc=L22	// jump
L24:
.debug
	.dw '.stabn 0x44,0,82,',0,0
	.dd LM34-_Modify_Index
	.dw 0x0d,0x0a
.code
LM34:
	R1=[_i]	// QImode move
	R2=R1	// QImode move
	R1=R2 lsl 1
	R3=_Buffer	// QImode move
	R2=R3	// QImode move
	R2+=R1	// addqi3_r0r
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	push R3,R4 to [sp]	// pushhi
	R1=[_internal_addr]	// QImode move
	[SP--]=R1	// QImode move
	call _SP_WriteWord	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,81,',0,0
	.dd LM35-_Modify_Index
	.dw 0x0d,0x0a
.code
LM35:
L23:
	R1=[_i]	// QImode move
	R2=1	// QImode move
	[_i]=R1+R2
	R1=[_internal_addr]	// QImode move
	R2=1	// QImode move
	[_internal_addr]=R1+R2
	pc=L21	// jump
L22:
.debug
	.dw '.stabn 0x44,0,83,',0,0
	.dd LM36-_Modify_Index
	.dw 0x0d,0x0a
.code
LM36:
.debug
	.dw '.stabn 0x44,0,83,',0,0
	.dd LM37-_Modify_Index
	.dw 0x0d,0x0a
.code
LM37:
L11:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of Modify_Index

.debug
	.dw '.stabf ',0,0
	.dd LME2-_Modify_Index
	.dw 0x0d,0x0a
.code
LME2:
.code
.debug
	.dw '.stabs "DVR_Stop:F19",36,0,0,',0,0,offset _DVR_Stop,seg _DVR_Stop,0x0d,0x0a
.CODE
.public _DVR_Stop
_DVR_Stop:	.proc
.debug
	.dw '.stabn 0x44,0,95,',0,0
	.dd LM38-_DVR_Stop
	.dw 0x0d,0x0a
.code
LM38:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,96,',0,0
	.dd LM39-_DVR_Stop
	.dw 0x0d,0x0a
.code
LM39:
LBB4:
	call _SACM_DVR_Stop	// call without return value
.debug
	.dw '.stabn 0x44,0,97,',0,0
	.dd LM40-_DVR_Stop
	.dw 0x0d,0x0a
.code
LM40:
	call _SP_RampUpDAC1	// call with return value
.debug
	.dw '.stabn 0x44,0,98,',0,0
	.dd LM41-_DVR_Stop
	.dw 0x0d,0x0a
.code
LM41:
	call _SP_RampUpDAC2	// call with return value
.debug
	.dw '.stabn 0x44,0,99,',0,0
	.dd LM42-_DVR_Stop
	.dw 0x0d,0x0a
.code
LM42:
LBE4:
.debug
	.dw '.stabn 0x44,0,99,',0,0
	.dd LM43-_DVR_Stop
	.dw 0x0d,0x0a
.code
LM43:
L32:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of DVR_Stop

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB4-_DVR_Stop
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE4-_DVR_Stop
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME3-_DVR_Stop
	.dw 0x0d,0x0a
.code
LME3:
.code
.debug
	.dw '.stabs "Send_QueueData_to_Sflash:F19",36,0,0,',0,0,offset _Send_QueueData_to_Sflash,seg _Send_QueueData_to_Sflash,0x0d,0x0a
.CODE
.public _Send_QueueData_to_Sflash
_Send_QueueData_to_Sflash:	.proc
.debug
	.dw '.stabn 0x44,0,111,',0,0
	.dd LM44-_Send_QueueData_to_Sflash
	.dw 0x0d,0x0a
.code
LM44:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,112,',0,0
	.dd LM45-_Send_QueueData_to_Sflash
	.dw 0x0d,0x0a
.code
LM45:
L34:
	call _SACM_DVR_TestQueue	// call with return value
	CMP R1,2	// QImode compare
	JZ L37	// QImode NE
	PC=L36
L37:
	pc=L35	// jump
L36:
.debug
	.dw '.stabn 0x44,0,114,',0,0
	.dd LM46-_Send_QueueData_to_Sflash
	.dw 0x0d,0x0a
.code
LM46:
	call _SACM_DVR_FetchQueue	// call with return value
	[_Ret]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,115,',0,0
	.dd LM47-_Send_QueueData_to_Sflash
	.dw 0x0d,0x0a
.code
LM47:
	R1=[_Ret]	// QImode move
	[SP--]=R1	// QImode move
	R1=[_Addr]	// HImode RD=[Label]
	R2=[_Addr+1]
	push R1,R2 to [sp]	// pushhi
	call _SP_SIOSendAWord	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,116,',0,0
	.dd LM48-_Send_QueueData_to_Sflash
	.dw 0x0d,0x0a
.code
LM48:
	R1=[_Addr]	// HImode RD=[Label]
	R2=[_Addr+1]
	R3=R1+2	// HImode RD=RS+#IMM16
	R4=R2+0, Carry
	[_Addr]=R3	// HImode [Label]=RS
	[_Addr+1]=R4
.debug
	.dw '.stabn 0x44,0,117,',0,0
	.dd LM49-_Send_QueueData_to_Sflash
	.dw 0x0d,0x0a
.code
LM49:
	pc=L34	// jump
L35:
.debug
	.dw '.stabn 0x44,0,118,',0,0
	.dd LM50-_Send_QueueData_to_Sflash
	.dw 0x0d,0x0a
.code
LM50:
.debug
	.dw '.stabn 0x44,0,118,',0,0
	.dd LM51-_Send_QueueData_to_Sflash
	.dw 0x0d,0x0a
.code
LM51:
L33:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of Send_QueueData_to_Sflash

.debug
	.dw '.stabf ',0,0
	.dd LME4-_Send_QueueData_to_Sflash
	.dw 0x0d,0x0a
.code
LME4:
.code
.debug
	.dw '.stabs "Play_Initial:F19",36,0,0,',0,0,offset _Play_Initial,seg _Play_Initial,0x0d,0x0a
.CODE
.public _Play_Initial
_Play_Initial:	.proc
.debug
	.dw '.stabn 0x44,0,130,',0,0
	.dd LM52-_Play_Initial
	.dw 0x0d,0x0a
.code
LM52:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,131,',0,0
	.dd LM53-_Play_Initial
	.dw 0x0d,0x0a
.code
LM53:
	call _SACM_DVR_InitQueue	// call without return value
.debug
	.dw '.stabn 0x44,0,132,',0,0
	.dd LM54-_Play_Initial
	.dw 0x0d,0x0a
.code
LM54:
L39:
	call _SACM_DVR_TestQueue	// call with return value
	CMP R1,1	// QImode compare
	JZ L42	// QImode NE
	PC=L41
L42:
	pc=L40	// jump
L41:
.debug
	.dw '.stabn 0x44,0,134,',0,0
	.dd LM55-_Play_Initial
	.dw 0x0d,0x0a
.code
LM55:
	R1=[_Addr]	// HImode RD=[Label]
	R2=[_Addr+1]
	push R1,R2 to [sp]	// pushhi
	call _SP_SIOReadAWord	// call with return value
	SP=SP+2
	[_Ret]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,135,',0,0
	.dd LM56-_Play_Initial
	.dw 0x0d,0x0a
.code
LM56:
	R1=[_Ret]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_DVR_FillQueue	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,136,',0,0
	.dd LM57-_Play_Initial
	.dw 0x0d,0x0a
.code
LM57:
	R1=[_Addr]	// HImode RD=[Label]
	R2=[_Addr+1]
	R3=R1+2	// HImode RD=RS+#IMM16
	R4=R2+0, Carry
	[_Addr]=R3	// HImode [Label]=RS
	[_Addr+1]=R4
.debug
	.dw '.stabn 0x44,0,137,',0,0
	.dd LM58-_Play_Initial
	.dw 0x0d,0x0a
.code
LM58:
	pc=L39	// jump
L40:
.debug
	.dw '.stabn 0x44,0,138,',0,0
	.dd LM59-_Play_Initial
	.dw 0x0d,0x0a
.code
LM59:
	R1=3	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_DVR_InitDecoder	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,139,',0,0
	.dd LM60-_Play_Initial
	.dw 0x0d,0x0a
.code
LM60:
.debug
	.dw '.stabn 0x44,0,139,',0,0
	.dd LM61-_Play_Initial
	.dw 0x0d,0x0a
.code
LM61:
L38:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of Play_Initial

.debug
	.dw '.stabf ',0,0
	.dd LME5-_Play_Initial
	.dw 0x0d,0x0a
.code
LME5:
.code
.debug
	.dw '.stabs "Fill_A_Word_To_Queue:F19",36,0,0,',0,0,offset _Fill_A_Word_To_Queue,seg _Fill_A_Word_To_Queue,0x0d,0x0a
.CODE
.public _Fill_A_Word_To_Queue
_Fill_A_Word_To_Queue:	.proc
.debug
	.dw '.stabn 0x44,0,151,',0,0
	.dd LM62-_Fill_A_Word_To_Queue
	.dw 0x0d,0x0a
.code
LM62:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,152,',0,0
	.dd LM63-_Fill_A_Word_To_Queue
	.dw 0x0d,0x0a
.code
LM63:
	call _SACM_DVR_TestQueue	// call with return value
	CMP R1,1	// QImode compare
	JNZ L45	// QImode EQ
	PC=L44
L45:
.debug
	.dw '.stabn 0x44,0,154,',0,0
	.dd LM64-_Fill_A_Word_To_Queue
	.dw 0x0d,0x0a
.code
LM64:
	R1=[_Addr]	// HImode RD=[Label]
	R2=[_Addr+1]
	push R1,R2 to [sp]	// pushhi
	call _SP_SIOReadAWord	// call with return value
	SP=SP+2
	[_Ret]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,155,',0,0
	.dd LM65-_Fill_A_Word_To_Queue
	.dw 0x0d,0x0a
.code
LM65:
	R1=[_Ret]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_DVR_FillQueue	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,156,',0,0
	.dd LM66-_Fill_A_Word_To_Queue
	.dw 0x0d,0x0a
.code
LM66:
	R1=[_Addr]	// HImode RD=[Label]
	R2=[_Addr+1]
	R3=R1+2	// HImode RD=RS+#IMM16
	R4=R2+0, Carry
	[_Addr]=R3	// HImode [Label]=RS
	[_Addr+1]=R4
L44:
.debug
	.dw '.stabn 0x44,0,158,',0,0
	.dd LM67-_Fill_A_Word_To_Queue
	.dw 0x0d,0x0a
.code
LM67:
.debug
	.dw '.stabn 0x44,0,158,',0,0
	.dd LM68-_Fill_A_Word_To_Queue
	.dw 0x0d,0x0a
.code
LM68:
L43:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of Fill_A_Word_To_Queue

.debug
	.dw '.stabf ',0,0
	.dd LME6-_Fill_A_Word_To_Queue
	.dw 0x0d,0x0a
.code
LME6:
.code
.debug
	.dw '.stabs "According_to_Keycode:F19",36,0,0,',0,0,offset _According_to_Keycode,seg _According_to_Keycode,0x0d,0x0a
.CODE
.public _According_to_Keycode
_According_to_Keycode:	.proc
.debug
	.dw '.stabn 0x44,0,170,',0,0
	.dd LM69-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM69:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,171,',0,0
	.dd LM70-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM70:
LBB5:
	R1=[_BaseType]	// QImode move
	CMP R1,1	// QImode compare
	JZ L78	// QImode NE
	PC=L47
L78:
.debug
	.dw '.stabn 0x44,0,173,',0,0
	.dd LM71-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM71:
	R1=[_Keycode]	// QImode move
	CMP R1,255	// QImode compare
	JNZ L79	// QImode EQ
	PC=L48
L79:
.debug
	.dw '.stabn 0x44,0,175,',0,0
	.dd LM72-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM72:
	call _DVR_Stop	// call without return value
.debug
	.dw '.stabn 0x44,0,176,',0,0
	.dd LM73-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM73:
	R1=[_SubStatus]	// QImode move
	CMP R1,1	// QImode compare
	JZ L80	// QImode NE
	PC=L49
L80:
.debug
	.dw '.stabn 0x44,0,178,',0,0
	.dd LM74-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM74:
	call _Send_QueueData_to_Sflash	// call without return value
.debug
	.dw '.stabn 0x44,0,179,',0,0
	.dd LM75-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM75:
	call _Modify_Index	// call without return value
L49:
.debug
	.dw '.stabn 0x44,0,182,',0,0
	.dd LM76-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM76:
	R1=[_Keycode]	// QImode move
	CMP R1,15	// QImode compare
	JNA L81	// QImode GTU
	PC=L63
L81:
	R1=[_Keycode]	// QImode move
	R2=R1	// QImode move
	R1=R2	// QImode move
	R1=R1+L64
	R3=R1	// QImode move
	R2=[R3]	// QImode move
	pc=R2	// tablejump
.text
L64:
	.dw L51
	.dw L52
	.dw L55
	.dw L58
	.dw L59
	.dw L60
	.dw L63
	.dw L61
	.dw L63
	.dw L63
	.dw L63
	.dw L63
	.dw L63
	.dw L63
	.dw L63
	.dw L62
.code
.debug
	.dw '.stabn 0x44,0,184,',0,0
	.dd LM77-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM77:
LBB6:
L51:
.debug
	.dw '.stabn 0x44,0,185,',0,0
	.dd LM78-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM78:
	R1=[_Segment]	// QImode move
	R2=R1	// QImode move
	R1=R2 lsl 1
	R2=R1+(-1)
	R3=R2	// QImode move
	R1=R3 lsl 1
	R3=_Buffer	// QImode move
	R2=R3	// QImode move
	R2+=R1	// addqi3_r0r
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	[_Addr]=R3	// HImode [Label]=RS
	[_Addr+1]=R4
.debug
	.dw '.stabn 0x44,0,186,',0,0
	.dd LM79-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM79:
	call _Play_Initial	// call without return value
.debug
	.dw '.stabn 0x44,0,187,',0,0
	.dd LM80-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM80:
	R1=2	// QImode move
	[_SubStatus]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,188,',0,0
	.dd LM81-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM81:
	pc=L48	// jump
L52:
.debug
	.dw '.stabn 0x44,0,190,',0,0
	.dd LM82-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM82:
	R1=[_Segment]	// QImode move
	CMP R1,1	// QImode compare
	JA L82	// QImode LEU
	PC=L53
L82:
	R1=[_Segment]
	R2=0
	R3=[_Buffer]	// HImode RD=[Label]
	R4=[_Buffer+1]
	CMP R2,R4	// HImode compare
	JA  L83	// HImode GTU
	JNZ L84
	CMP R1,R3
	JNA L84
L83:
	PC=L53
L84:
.debug
	.dw '.stabn 0x44,0,192,',0,0
	.dd LM83-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM83:
	R1=[_Segment]	// QImode move
	R2=(-1)	// QImode move
	[_Segment]=R1+R2
.debug
	.dw '.stabn 0x44,0,193,',0,0
	.dd LM84-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM84:
	R1=[_Segment]	// QImode move
	R2=R1	// QImode move
	R1=R2 lsl 1
	R2=R1+(-1)
	R3=R2	// QImode move
	R1=R3 lsl 1
	R3=_Buffer	// QImode move
	R2=R3	// QImode move
	R2+=R1	// addqi3_r0r
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	[_Addr]=R3	// HImode [Label]=RS
	[_Addr+1]=R4
.debug
	.dw '.stabn 0x44,0,194,',0,0
	.dd LM85-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM85:
	pc=L54	// jump
L53:
.debug
	.dw '.stabn 0x44,0,197,',0,0
	.dd LM86-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM86:
	R1=[_Buffer]	// QImode move
	[_Segment]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,198,',0,0
	.dd LM87-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM87:
	R3=[_Buffer]	// HImode RD=[Label]
	R4=[_Buffer+1]
	R1=R3	// HImode register to register move
	R2=R4
	R3=1	// QImode move
	[SP--]=R3	// QImode move
	push R1,R2 to [sp]	// pushhi
	call __lshiu2	// call with return value
	SP=SP+3
	R3=R1+(-1)
	R2=R3	// QImode move
	R1=R2 lsl 1
	R3=_Buffer	// QImode move
	R2=R3	// QImode move
	R2+=R1	// addqi3_r0r
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	[_Addr]=R3	// HImode [Label]=RS
	[_Addr+1]=R4
L54:
.debug
	.dw '.stabn 0x44,0,200,',0,0
	.dd LM88-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM88:
	call _Play_Initial	// call without return value
.debug
	.dw '.stabn 0x44,0,201,',0,0
	.dd LM89-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM89:
	R1=2	// QImode move
	[_SubStatus]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,202,',0,0
	.dd LM90-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM90:
	pc=L48	// jump
L55:
.debug
	.dw '.stabn 0x44,0,204,',0,0
	.dd LM91-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM91:
	R1=[_Segment]
	R2=0
	R3=[_Buffer]	// HImode RD=[Label]
	R4=[_Buffer+1]
	CMP R2,R4	// HImode compare
	JB  L86	// HImode GEU
	JNZ L85
	CMP R1,R3
	JB  L86
L85:
	PC=L56
L86:
.debug
	.dw '.stabn 0x44,0,206,',0,0
	.dd LM92-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM92:
	R1=[_Segment]	// QImode move
	R2=1	// QImode move
	[_Segment]=R1+R2
.debug
	.dw '.stabn 0x44,0,207,',0,0
	.dd LM93-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM93:
	R1=[_Segment]	// QImode move
	R2=R1	// QImode move
	R1=R2 lsl 1
	R2=R1+(-1)
	R3=R2	// QImode move
	R1=R3 lsl 1
	R3=_Buffer	// QImode move
	R2=R3	// QImode move
	R2+=R1	// addqi3_r0r
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	[_Addr]=R3	// HImode [Label]=RS
	[_Addr+1]=R4
.debug
	.dw '.stabn 0x44,0,208,',0,0
	.dd LM94-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM94:
	pc=L57	// jump
L56:
.debug
	.dw '.stabn 0x44,0,211,',0,0
	.dd LM95-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM95:
	R1=1	// QImode move
	[_Segment]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,212,',0,0
	.dd LM96-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM96:
	R1=[_Buffer+2]	// HImode RD=[Label]
	R2=[_Buffer+3]
	[_Addr]=R1	// HImode [Label]=RS
	[_Addr+1]=R2
L57:
.debug
	.dw '.stabn 0x44,0,214,',0,0
	.dd LM97-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM97:
	call _Play_Initial	// call without return value
.debug
	.dw '.stabn 0x44,0,215,',0,0
	.dd LM98-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM98:
	R1=2	// QImode move
	[_SubStatus]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,216,',0,0
	.dd LM99-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM99:
	pc=L48	// jump
L58:
.debug
	.dw '.stabn 0x44,0,218,',0,0
	.dd LM100-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM100:
	R1=0	// QImode move
	[_SubStatus]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,219,',0,0
	.dd LM101-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM101:
	pc=L48	// jump
L59:
.debug
	.dw '.stabn 0x44,0,221,',0,0
	.dd LM102-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM102:
	R1=[_Segment]	// QImode move
	R2=R1	// QImode move
	R1=R2 lsl 1
	R2=R1+(-1)
	R3=R2	// QImode move
	R1=R3 lsl 1
	R3=_Buffer	// QImode move
	R2=R3	// QImode move
	R2+=R1	// addqi3_r0r
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	[_Addr]=R3	// HImode [Label]=RS
	[_Addr+1]=R4
.debug
	.dw '.stabn 0x44,0,222,',0,0
	.dd LM103-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM103:
	call _Play_Initial	// call without return value
.debug
	.dw '.stabn 0x44,0,223,',0,0
	.dd LM104-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM104:
	R1=6	// QImode move
	[_SubStatus]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,224,',0,0
	.dd LM105-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM105:
	pc=L48	// jump
L60:
.debug
	.dw '.stabn 0x44,0,226,',0,0
	.dd LM106-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM106:
	R1=[_Segment]	// QImode move
	R2=R1	// QImode move
	R1=R2 lsl 1
	R2=R1+(-1)
	R3=R2	// QImode move
	R1=R3 lsl 1
	R3=_Buffer	// QImode move
	R2=R3	// QImode move
	R2+=R1	// addqi3_r0r
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	[_Addr]=R3	// HImode [Label]=RS
	[_Addr+1]=R4
.debug
	.dw '.stabn 0x44,0,227,',0,0
	.dd LM107-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM107:
	call _Play_Initial	// call without return value
.debug
	.dw '.stabn 0x44,0,228,',0,0
	.dd LM108-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM108:
	R1=7	// QImode move
	[_SubStatus]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,229,',0,0
	.dd LM109-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM109:
	pc=L48	// jump
L61:
.debug
	.dw '.stabn 0x44,0,231,',0,0
	.dd LM110-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM110:
	R3=[_Buffer]	// HImode RD=[Label]
	R4=[_Buffer+1]
	R1=R3	// HImode register to register move
	R2=R4
	R3=1	// QImode move
	[SP--]=R3	// QImode move
	push R1,R2 to [sp]	// pushhi
	call __lshiu2	// call with return value
	SP=SP+3
	R3=R1+1
	R2=R3	// QImode move
	R1=R2 lsl 1
	R3=_Buffer	// QImode move
	R2=R3	// QImode move
	R2+=R1	// addqi3_r0r
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	[_Addr]=R3	// HImode [Label]=RS
	[_Addr+1]=R4
.debug
	.dw '.stabn 0x44,0,232,',0,0
	.dd LM111-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM111:
	call _SACM_DVR_InitQueue	// call without return value
.debug
	.dw '.stabn 0x44,0,233,',0,0
	.dd LM112-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM112:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_DVR_InitEncoder	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,234,',0,0
	.dd LM113-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM113:
	R1=1	// QImode move
	[_SubStatus]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,235,',0,0
	.dd LM114-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM114:
	pc=L48	// jump
L62:
.debug
	.dw '.stabn 0x44,0,237,',0,0
	.dd LM115-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM115:
	call _Close_Interrupt	// call with return value
.debug
	.dw '.stabn 0x44,0,238,',0,0
	.dd LM116-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM116:
	call _SP_UART_Init	// call with return value
.debug
	.dw '.stabn 0x44,0,239,',0,0
	.dd LM117-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM117:
	R1=0	// QImode move
	[_BaseType]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,240,',0,0
	.dd LM118-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM118:
	R1=0	// QImode move
	[_SubStatus]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,241,',0,0
	.dd LM119-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM119:
	pc=L48	// jump
L63:
.debug
	.dw '.stabn 0x44,0,243,',0,0
	.dd LM120-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM120:
	pc=L48	// jump
.debug
	.dw '.stabn 0x44,0,244,',0,0
	.dd LM121-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM121:
LBE6:
L50:
L48:
.debug
	.dw '.stabn 0x44,0,246,',0,0
	.dd LM122-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM122:
	pc=L65	// jump
L47:
.debug
	.dw '.stabn 0x44,0,250,',0,0
	.dd LM123-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM123:
	R1=[_Keycode]	// QImode move
	CMP R1,2	// QImode compare
	JNZ L87	// QImode EQ
	PC=L68
L87:
	CMP R1,2	// QImode compare
	JNA L88	// QImode GTU
	PC=L77
L88:
	CMP R1,1	// QImode compare
	JNZ L89	// QImode EQ
	PC=L67
L89:
	pc=L75	// jump
L77:
	CMP R1,3	// QImode compare
	JNZ L90	// QImode EQ
	PC=L69
L90:
	CMP R1,15	// QImode compare
	JNZ L91	// QImode EQ
	PC=L74
L91:
	pc=L75	// jump
L67:
.debug
	.dw '.stabn 0x44,0,253,',0,0
	.dd LM124-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM124:
	R1=4	// QImode move
	[_SubStatus]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,254,',0,0
	.dd LM125-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM125:
	pc=L65	// jump
L68:
.debug
	.dw '.stabn 0x44,0,256,',0,0
	.dd LM126-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM126:
	R1=3	// QImode move
	[_SubStatus]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,257,',0,0
	.dd LM127-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM127:
	pc=L65	// jump
L69:
.debug
	.dw '.stabn 0x44,0,259,',0,0
	.dd LM128-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM128:
	call _SP_SIOMassErase	// call with return value
.debug
	.dw '.stabn 0x44,0,260,',0,0
	.dd LM129-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM129:
	R1=(-4096)	// QImode move
	[SP--]=R1	// QImode move
	call _SP_PageErase	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,261,',0,0
	.dd LM130-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM130:
	R1=0	// QImode move
	[_i]=R1	// QImode move
L70:
	R1=[_i]	// QImode move
	CMP R1,20	// QImode compare
	JA L92	// QImode LEU
	PC=L73
L92:
	pc=L71	// jump
L73:
.debug
	.dw '.stabn 0x44,0,263,',0,0
	.dd LM131-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM131:
	R1=[_i]	// QImode move
	R2=R1	// QImode move
	R1=R2 lsl 1
	R3=_Buffer	// QImode move
	R2=R3	// QImode move
	R2+=R1	// addqi3_r0r
	R3=0	// HImode immediate to register move
	R4=0
	R1=R2	// QImode move
	[R1++]=R3	// [RD]=RS HImode, RD!=RS+1
	[R1--]=R4
.debug
	.dw '.stabn 0x44,0,264,',0,0
	.dd LM132-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM132:
	R1=0	// HImode immediate to register move
	R2=0
	push R1,R2 to [sp]	// pushhi
	R2=[_i]	// QImode move
	R1=R2+(-4096)
	[SP--]=R1	// QImode move
	call _SP_WriteWord	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,261,',0,0
	.dd LM133-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM133:
L72:
	R1=[_i]	// QImode move
	R2=1	// QImode move
	[_i]=R1+R2
	pc=L70	// jump
L71:
.debug
	.dw '.stabn 0x44,0,266,',0,0
	.dd LM134-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM134:
	R1=1	// QImode move
	[_Segment]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,267,',0,0
	.dd LM135-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM135:
	R1=0	// HImode immediate to register move
	R2=0
	[_Addr]=R1	// HImode [Label]=RS
	[_Addr+1]=R2
.debug
	.dw '.stabn 0x44,0,268,',0,0
	.dd LM136-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM136:
	R1=1	// QImode move
	[_BaseType]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,269,',0,0
	.dd LM137-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM137:
	R1=0	// QImode move
	[_SubStatus]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,270,',0,0
	.dd LM138-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM138:
	pc=L65	// jump
L74:
.debug
	.dw '.stabn 0x44,0,272,',0,0
	.dd LM139-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM139:
	call _Open_Interrupt	// call with return value
.debug
	.dw '.stabn 0x44,0,273,',0,0
	.dd LM140-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM140:
	R1=1	// QImode move
	[_BaseType]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,274,',0,0
	.dd LM141-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM141:
	R1=0	// QImode move
	[_SubStatus]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,275,',0,0
	.dd LM142-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM142:
	pc=L65	// jump
L75:
.debug
	.dw '.stabn 0x44,0,277,',0,0
	.dd LM143-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM143:
	pc=L65	// jump
L66:
L65:
.debug
	.dw '.stabn 0x44,0,280,',0,0
	.dd LM144-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM144:
LBE5:
.debug
	.dw '.stabn 0x44,0,280,',0,0
	.dd LM145-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LM145:
L46:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of According_to_Keycode

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB5-_According_to_Keycode
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB6-_According_to_Keycode
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE6-_According_to_Keycode
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE5-_According_to_Keycode
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME7-_According_to_Keycode
	.dw 0x0d,0x0a
.code
LME7:
.code
.debug
	.dw '.stabs "According_to_SubStatus:F19",36,0,0,',0,0,offset _According_to_SubStatus,seg _According_to_SubStatus,0x0d,0x0a
.CODE
.public _According_to_SubStatus
_According_to_SubStatus:	.proc
.debug
	.dw '.stabn 0x44,0,292,',0,0
	.dd LM146-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM146:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R1=BP+4
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,293,',0,0
	.dd LM147-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM147:
LBB7:
	R1=[_SubStatus]	// QImode move
	CMP R1,7	// QImode compare
	JNA L124	// QImode GTU
	PC=L117
L124:
	R1=[_SubStatus]	// QImode move
	R2=R1	// QImode move
	R1=R2	// QImode move
	R1=R1+L123
	R3=R1	// QImode move
	R2=[R3]	// QImode move
	pc=R2	// tablejump
.text
L123:
	.dw L117
	.dw L95
	.dw L99
	.dw L110
	.dw L111
	.dw L117
	.dw L102
	.dw L107
.code
L95:
.debug
	.dw '.stabn 0x44,0,296,',0,0
	.dd LM148-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM148:
	R1=[_Addr]	// HImode RD=[Label]
	R2=[_Addr+1]
	CMP R2,7	// HImode compare
	JA  L125	// HImode GTU
	JNZ L126
	CMP R1,(-149)
	JNA L126
L125:
	PC=L96
L126:
.debug
	.dw '.stabn 0x44,0,298,',0,0
	.dd LM149-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM149:
LBB8:
	call _SACM_DVR_Encode	// call with return value
.debug
	.dw '.stabn 0x44,0,299,',0,0
	.dd LM150-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM150:
	call _SACM_DVR_TestQueue	// call with return value
	CMP R1,2	// QImode compare
	JNZ L127	// QImode EQ
	PC=L97
L127:
.debug
	.dw '.stabn 0x44,0,301,',0,0
	.dd LM151-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM151:
	call _SACM_DVR_FetchQueue	// call with return value
	[_Ret]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,302,',0,0
	.dd LM152-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM152:
	R1=[_Ret]	// QImode move
	[SP--]=R1	// QImode move
	R1=[_Addr]	// HImode RD=[Label]
	R2=[_Addr+1]
	push R1,R2 to [sp]	// pushhi
	call _SP_SIOSendAWord	// call with return value
	SP=SP+3
.debug
	.dw '.stabn 0x44,0,303,',0,0
	.dd LM153-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM153:
	R1=[_Addr]	// HImode RD=[Label]
	R2=[_Addr+1]
	R3=R1+2	// HImode RD=RS+#IMM16
	R4=R2+0, Carry
	[_Addr]=R3	// HImode [Label]=RS
	[_Addr+1]=R4
L97:
.debug
	.dw '.stabn 0x44,0,305,',0,0
	.dd LM154-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM154:
LBE8:
	pc=L98	// jump
L96:
.debug
	.dw '.stabn 0x44,0,308,',0,0
	.dd LM155-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM155:
	call _DVR_Stop	// call without return value
.debug
	.dw '.stabn 0x44,0,309,',0,0
	.dd LM156-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM156:
	call _Send_QueueData_to_Sflash	// call without return value
.debug
	.dw '.stabn 0x44,0,310,',0,0
	.dd LM157-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM157:
	call _Modify_Index	// call without return value
.debug
	.dw '.stabn 0x44,0,311,',0,0
	.dd LM158-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM158:
	R1=0	// QImode move
	[_SubStatus]=R1	// QImode move
L98:
.debug
	.dw '.stabn 0x44,0,313,',0,0
	.dd LM159-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM159:
	pc=L94	// jump
L99:
.debug
	.dw '.stabn 0x44,0,315,',0,0
	.dd LM160-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM160:
	call _SACM_DVR_Status	// call with return value
	R2=R1&1
	CMP R2,0	// QImode test
	JNZ L128	// QImode EQ
	PC=L100
L128:
.debug
	.dw '.stabn 0x44,0,317,',0,0
	.dd LM161-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM161:
LBB9:
	call _Fill_A_Word_To_Queue	// call without return value
.debug
	.dw '.stabn 0x44,0,318,',0,0
	.dd LM162-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM162:
	call _SACM_DVR_Decode	// call with return value
.debug
	.dw '.stabn 0x44,0,319,',0,0
	.dd LM163-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM163:
LBE9:
	pc=L101	// jump
L100:
.debug
	.dw '.stabn 0x44,0,322,',0,0
	.dd LM164-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM164:
	call _DVR_Stop	// call without return value
.debug
	.dw '.stabn 0x44,0,323,',0,0
	.dd LM165-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM165:
	R1=0	// QImode move
	[_SubStatus]=R1	// QImode move
L101:
.debug
	.dw '.stabn 0x44,0,325,',0,0
	.dd LM166-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM166:
	pc=L94	// jump
L102:
.debug
	.dw '.stabn 0x44,0,328,',0,0
	.dd LM167-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM167:
	call _SACM_DVR_Status	// call with return value
	R2=R1&1
	CMP R2,0	// QImode test
	JNZ L129	// QImode EQ
	PC=L103
L129:
.debug
	.dw '.stabn 0x44,0,330,',0,0
	.dd LM168-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM168:
LBB10:
	call _Fill_A_Word_To_Queue	// call without return value
.debug
	.dw '.stabn 0x44,0,331,',0,0
	.dd LM169-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM169:
	call _SACM_DVR_Decode	// call with return value
.debug
	.dw '.stabn 0x44,0,332,',0,0
	.dd LM170-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM170:
LBE10:
	pc=L104	// jump
L103:
.debug
	.dw '.stabn 0x44,0,335,',0,0
	.dd LM171-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM171:
	call _DVR_Stop	// call without return value
.debug
	.dw '.stabn 0x44,0,336,',0,0
	.dd LM172-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM172:
	R1=[_Segment]
	R2=0
	R3=[_Buffer]	// HImode RD=[Label]
	R4=[_Buffer+1]
	CMP R2,R4	// HImode compare
	JB  L131	// HImode GEU
	JNZ L130
	CMP R1,R3
	JB  L131
L130:
	PC=L105
L131:
.debug
	.dw '.stabn 0x44,0,338,',0,0
	.dd LM173-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM173:
	R1=[_Segment]	// QImode move
	R2=1	// QImode move
	[_Segment]=R1+R2
.debug
	.dw '.stabn 0x44,0,339,',0,0
	.dd LM174-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM174:
	R1=[_Segment]	// QImode move
	R2=R1	// QImode move
	R1=R2 lsl 1
	R2=R1+(-1)
	R3=R2	// QImode move
	R1=R3 lsl 1
	R3=_Buffer	// QImode move
	R2=R3	// QImode move
	R2+=R1	// addqi3_r0r
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	[_Addr]=R3	// HImode [Label]=RS
	[_Addr+1]=R4
.debug
	.dw '.stabn 0x44,0,340,',0,0
	.dd LM175-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM175:
	pc=L106	// jump
L105:
.debug
	.dw '.stabn 0x44,0,343,',0,0
	.dd LM176-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM176:
	R1=1	// QImode move
	[_Segment]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,344,',0,0
	.dd LM177-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM177:
	R1=[_Buffer+2]	// HImode RD=[Label]
	R2=[_Buffer+3]
	[_Addr]=R1	// HImode [Label]=RS
	[_Addr+1]=R2
L106:
.debug
	.dw '.stabn 0x44,0,346,',0,0
	.dd LM178-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM178:
	call _Play_Initial	// call without return value
L104:
.debug
	.dw '.stabn 0x44,0,348,',0,0
	.dd LM179-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM179:
	pc=L94	// jump
L107:
.debug
	.dw '.stabn 0x44,0,350,',0,0
	.dd LM180-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM180:
	call _SACM_DVR_Status	// call with return value
	R2=R1&1
	CMP R2,0	// QImode test
	JNZ L132	// QImode EQ
	PC=L108
L132:
.debug
	.dw '.stabn 0x44,0,352,',0,0
	.dd LM181-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM181:
LBB11:
	call _Fill_A_Word_To_Queue	// call without return value
.debug
	.dw '.stabn 0x44,0,353,',0,0
	.dd LM182-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM182:
	call _SACM_DVR_Decode	// call with return value
.debug
	.dw '.stabn 0x44,0,354,',0,0
	.dd LM183-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM183:
LBE11:
	pc=L109	// jump
L108:
.debug
	.dw '.stabn 0x44,0,357,',0,0
	.dd LM184-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM184:
	call _DVR_Stop	// call without return value
.debug
	.dw '.stabn 0x44,0,358,',0,0
	.dd LM185-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM185:
	R1=[_Segment]	// QImode move
	R2=R1	// QImode move
	R1=R2 lsl 1
	R2=R1+(-1)
	R3=R2	// QImode move
	R1=R3 lsl 1
	R3=_Buffer	// QImode move
	R2=R3	// QImode move
	R2+=R1	// addqi3_r0r
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	[_Addr]=R3	// HImode [Label]=RS
	[_Addr+1]=R4
.debug
	.dw '.stabn 0x44,0,359,',0,0
	.dd LM186-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM186:
	call _Play_Initial	// call without return value
L109:
.debug
	.dw '.stabn 0x44,0,361,',0,0
	.dd LM187-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM187:
	pc=L94	// jump
L110:
.debug
	.dw '.stabn 0x44,0,363,',0,0
	.dd LM188-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM188:
	R3=[_Buffer]	// HImode RD=[Label]
	R4=[_Buffer+1]
	R1=R3	// HImode register to register move
	R2=R4
	R3=1	// QImode move
	[SP--]=R3	// QImode move
	push R1,R2 to [sp]	// pushhi
	call __lshiu2	// call with return value
	SP=SP+3
	R3=R1+1
	R2=R3	// QImode move
	R1=R2 lsl 1
	R3=_Buffer	// QImode move
	R2=R3	// QImode move
	R2+=R1	// addqi3_r0r
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	[_Addr]=R3	// HImode [Label]=RS
	[_Addr+1]=R4
.debug
	.dw '.stabn 0x44,0,364,',0,0
	.dd LM189-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM189:
	call _UART_Download	// call with return value
.debug
	.dw '.stabn 0x44,0,365,',0,0
	.dd LM190-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM190:
	call _Modify_Index	// call without return value
.debug
	.dw '.stabn 0x44,0,366,',0,0
	.dd LM191-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM191:
	R1=1	// QImode move
	[_BaseType]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,367,',0,0
	.dd LM192-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM192:
	R1=0	// QImode move
	[_SubStatus]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,368,',0,0
	.dd LM193-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM193:
	call _Open_Interrupt	// call with return value
.debug
	.dw '.stabn 0x44,0,369,',0,0
	.dd LM194-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM194:
	pc=L94	// jump
L111:
.debug
	.dw '.stabn 0x44,0,371,',0,0
	.dd LM195-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM195:
	R1=[_Segment]	// QImode move
	R2=R1	// QImode move
	R1=R2 lsl 1
	R2=R1+(-1)
	R3=R2	// QImode move
	R1=R3 lsl 1
	R3=_Buffer	// QImode move
	R2=R3	// QImode move
	R2+=R1	// addqi3_r0r
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	[_Addr0]=R3	// HImode [Label]=RS
	[_Addr0+1]=R4
.debug
	.dw '.stabn 0x44,0,372,',0,0
	.dd LM196-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM196:
	R1=[_Segment]	// QImode move
	R2=R1	// QImode move
	R1=R2 lsl 2
	R3=_Buffer	// QImode move
	R2=R3	// QImode move
	R2+=R1	// addqi3_r0r
	R1=R2	// QImode move
	R3=[R1++]	// RD=[RS] HImode, RD!=RS
	R4=[R1--]
	[_Addr1]=R3	// HImode [Label]=RS
	[_Addr1+1]=R4
.debug
	.dw '.stabn 0x44,0,373,',0,0
	.dd LM197-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM197:
	R1=[_Addr0]	// HImode RD=[Label]
	R2=[_Addr0+1]
	[_Addr]=R1	// HImode [Label]=RS
	[_Addr+1]=R2
L112:
	R1=[_Addr]	// HImode RD=[Label]
	R2=[_Addr+1]
	R3=[_Addr1]	// HImode RD=[Label]
	R4=[_Addr1+1]
	CMP R2,R4	// HImode compare
	JA  L134	// HImode LEU
	JNZ L133
	CMP R1,R3
	JA  L134
L133:
	PC=L115
L134:
	pc=L113	// jump
L115:
.debug
	.dw '.stabn 0x44,0,375,',0,0
	.dd LM198-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM198:
LBB12:
	R1=[_Addr]	// HImode RD=[Label]
	R2=[_Addr+1]
	push R1,R2 to [sp]	// pushhi
	call _SP_SIOReadAByte	// call with return value
	SP=SP+2
	[_Ret]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,376,',0,0
	.dd LM199-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM199:
	R1=[_Ret]	// QImode move
	[SP--]=R1	// QImode move
	call _SP_UartSentByte	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,377,',0,0
	.dd LM200-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM200:
LBE12:
.debug
	.dw '.stabn 0x44,0,373,',0,0
	.dd LM201-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM201:
L114:
	R1=[_Addr]	// HImode RD=[Label]
	R2=[_Addr+1]
	R3=R1+1	// HImode RD=RS+#IMM16
	R4=R2+0, Carry
	[_Addr]=R3	// HImode [Label]=RS
	[_Addr+1]=R4
	pc=L112	// jump
L113:
.debug
	.dw '.stabn 0x44,0,378,',0,0
	.dd LM202-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM202:
	R1=1	// QImode move
	[_BaseType]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,379,',0,0
	.dd LM203-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM203:
	R1=0	// QImode move
	[_SubStatus]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,380,',0,0
	.dd LM204-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM204:
	call _Open_Interrupt	// call with return value
.debug
	.dw '.stabn 0x44,0,381,',0,0
	.dd LM205-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM205:
	pc=L94	// jump
L116:
L117:
.debug
	.dw '.stabn 0x44,0,384,',0,0
	.dd LM206-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM206:
	R1=50	// QImode move
	[_i]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,385,',0,0
	.dd LM207-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM207:
L118:
	R2=[_i]	// QImode move
	R1=R2+(-1)
	R2=R1	// QImode move
	[_i]=R2	// QImode move
	CMP R2,(-1)	// QImode compare
	JZ L135	// QImode NE
	PC=L120
L135:
	pc=L119	// jump
L120:
.debug
	.dw '.stabn 0x44,0,387,',0,0
	.dd LM208-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM208:
LBB13:
	R1=[_BaseType]	// QImode move
	CMP R1,0	// QImode test
	JNZ L136	// QImode EQ
	PC=L121
L136:
.debug
	.dw '.stabn 0x44,0,388,',0,0
	.dd LM209-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM209:
	R1=16128	// QImode move
	[SP--]=R1	// QImode move
	R1=28672	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Export	// call with return value
	SP=SP+2
	pc=L122	// jump
L121:
.debug
	.dw '.stabn 0x44,0,390,',0,0
	.dd LM210-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM210:
	R1=(-1024)	// QImode move
	[SP--]=R1	// QImode move
	R1=28672	// QImode move
	[SP--]=R1	// QImode move
	call _SP_Export	// call with return value
	SP=SP+2
L122:
.debug
	.dw '.stabn 0x44,0,391,',0,0
	.dd LM211-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM211:
LBE13:
	pc=L118	// jump
L119:
.debug
	.dw '.stabn 0x44,0,392,',0,0
	.dd LM212-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM212:
	pc=L94	// jump
L94:
.debug
	.dw '.stabn 0x44,0,394,',0,0
	.dd LM213-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM213:
LBE7:
.debug
	.dw '.stabn 0x44,0,394,',0,0
	.dd LM214-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LM214:
L93:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of According_to_SubStatus

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB7-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB8-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE8-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB9-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE9-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB10-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE10-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB11-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE11-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB12-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE12-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB13-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE13-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE7-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME8-_According_to_SubStatus
	.dw 0x0d,0x0a
.code
LME8:
.debug
	.dw '.stabs "Keycode:G4",32,0,0,',0,0,offset _Keycode,seg _Keycode,0x0d,0x0a
.CODE
.ram
.public _Keycode
_Keycode:
	.dw 0
.debug
	.dw '.stabs "Ret:G4",32,0,0,',0,0,offset _Ret,seg _Ret,0x0d,0x0a
.CODE
.ram
.public _Ret
_Ret:
	.dw 0
.debug
	.dw '.stabs "i:G4",32,0,0,',0,0,offset _i,seg _i,0x0d,0x0a
.CODE
.ram
.public _i
_i:
	.dw 0
.debug
	.dw '.stabs "Segment:G4",32,0,0,',0,0,offset _Segment,seg _Segment,0x0d,0x0a
.CODE
.ram
.public _Segment
_Segment:
	.dw 0
.debug
	.dw '.stabs "internal_addr:G4",32,0,0,',0,0,offset _internal_addr,seg _internal_addr,0x0d,0x0a
.CODE
.ram
.public _internal_addr
_internal_addr:
	.dw 0
.debug
	.dw '.stabs "BaseType:G4",32,0,0,',0,0,offset _BaseType,seg _BaseType,0x0d,0x0a
.CODE
.ram
.public _BaseType
_BaseType:
	.dw 0
.debug
	.dw '.stabs "SubStatus:G4",32,0,0,',0,0,offset _SubStatus,seg _SubStatus,0x0d,0x0a
.CODE
.ram
.public _SubStatus
_SubStatus:
	.dw 0
.debug
	.dw '.stabs "Addr:G5",32,0,0,',0,0,offset _Addr,seg _Addr,0x0d,0x0a
.CODE
.ram
.public _Addr
_Addr:
	.dw 2 dup(0)
.debug
	.dw '.stabs "Addr0:G5",32,0,0,',0,0,offset _Addr0,seg _Addr0,0x0d,0x0a
.CODE
.ram
.public _Addr0
_Addr0:
	.dw 2 dup(0)
.debug
	.dw '.stabs "Addr1:G5",32,0,0,',0,0,offset _Addr1,seg _Addr1,0x0d,0x0a
.CODE
.ram
.public _Addr1
_Addr1:
	.dw 2 dup(0)
.debug
	.dw '.stabs "Tem:G5",32,0,0,',0,0,offset _Tem,seg _Tem,0x0d,0x0a
.CODE
.ram
.public _Tem
_Tem:
	.dw 2 dup(0)
.debug
	.dw '.stabs "Buffer:G22=ar1;0;20;5",32,0,0,',0,0,offset _Buffer,seg _Buffer,0x0d,0x0a
.CODE
.ram
.public _Buffer
_Buffer:
	.dw 42 dup(0)
.external _SP_Export
.external _SP_UartSentByte
.external _SP_SIOReadAByte
.external _UART_Download
.external _SACM_DVR_Decode
.external _SACM_DVR_Status
.external _SACM_DVR_Encode
.external _Open_Interrupt
.external _SP_SIOMassErase
.external _SP_UART_Init
.external _Close_Interrupt
.external _SACM_DVR_InitEncoder
.external _SACM_DVR_InitDecoder
.external _SACM_DVR_FillQueue
.external _SP_SIOReadAWord
.external _SACM_DVR_InitQueue
.external _SP_SIOSendAWord
.external _SACM_DVR_FetchQueue
.external _SACM_DVR_TestQueue
.external _SP_RampUpDAC2
.external _SP_RampUpDAC1
.external _SACM_DVR_Stop
.external _SP_WriteWord
.external _SP_PageErase
.external _F_Key_Scan
.external _SACM_DVR_Initial
.external _System_Initial
.external _SP_ReadWord
.external __lshiu2
	.end
