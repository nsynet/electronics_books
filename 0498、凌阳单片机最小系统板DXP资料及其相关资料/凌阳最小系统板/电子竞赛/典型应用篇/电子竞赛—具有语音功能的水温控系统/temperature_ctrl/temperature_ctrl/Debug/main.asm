// GCC for SUNPLUS u'nSP version 1.0.10
// Command: E:\PROGRA~1\Sunplus\UNSPID~3\IDE180\cc1.exe C:\DOCUME~1\李华丽.DOMAIN\LOCALS~1\Temp\ccQraaaa.i -fkeep-inline-functions -quiet -dumpbase main.c -gstabs -o .\Debug/main.asm
// gcc2_compiled.:

.stabs "F:\\电子竞赛\\竞赛光盘内容\\典型应用篇\\电子竞赛—具有语音功能的水温控系统\\temperature_ctrl\\temperature_ctrl/", 0x64, 0, 3, Ltext0
.stabs "F:/电子竞赛/竞赛光盘内容/典型应用篇/电子竞赛—具有语音功能的水温控系统/temperature_ctrl/temperature_ctrl/main.c", 0x64, 0, 3, Ltext0
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
	.dw '.stabs "iPlay_times:G1",32,0,0,',0,0,offset _iPlay_times,seg _iPlay_times,0x0d,0x0a
.CODE
.public _iPlay_times
.iram
_iPlay_times:
	.dw 0
.debug
	.dw '.stabs "iNumber:G1",32,0,0,',0,0,offset _iNumber,seg _iNumber,0x0d,0x0a
.CODE
.public _iNumber
.iram
_iNumber:
	.dw 0
.debug
	.dw '.stabs "PID:T20=s10SetPoint:1,0,16;Proportion:12,16,32;\\",128,0,0,0',0x0d,0x0a
	.DW '.stabs "Integral:12,48,32;Derivative:12,80,32;LastError:1,112,16;\\",128,0,0,0',0x0d,0x0a
	.DW '.stabs "PrevError:1,128,16;SumError:1,144,16;;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "PID:t21=20",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "fOut:G1",32,0,0,',0,0,offset _fOut,seg _fOut,0x0d,0x0a
.CODE
.public _fOut
.iram
_fOut:
	.dw 0
.debug
	.dw '.stabs "system_status:T22=esystem_temperature_set:0,system_temperature_control:1,;",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "guiLED_Value:G23=ar1;0;2;4",32,0,0,',0,0,offset _guiLED_Value,seg _guiLED_Value,0x0d,0x0a
.CODE
.public _guiLED_Value
.iram
_guiLED_Value:
	.dw 0
	.dw 0
	.dw 0
.code
.debug
	.dw '.stabs "main:F1",36,0,0,',0,0,offset _main,seg _main,0x0d,0x0a
.CODE
.public _main
_main:	.proc
.debug
	.dw '.stabn 0x44,0,88,',0,0
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
	.dw '.stabn 0x44,0,89,',0,0
	.dd LM2-_main
	.dw 0x0d,0x0a
.code
LM2:
LBB2:
.debug
	.dw '.stabn 0x44,0,91,',0,0
	.dd LM3-_main
	.dw 0x0d,0x0a
.code
LM3:
	R1=0	// QImode move
	[_status]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,92,',0,0
	.dd LM4-_main
	.dw 0x0d,0x0a
.code
LM4:
	R1=0	// QImode move
	[_guifgSpeechPlay]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,93,',0,0
	.dd LM5-_main
	.dw 0x0d,0x0a
.code
LM5:
	call _System_Initial	// call with return value
.debug
	.dw '.stabn 0x44,0,96,',0,0
	.dd LM6-_main
	.dw 0x0d,0x0a
.code
LM6:
	call _PIDinit	// call without return value
.debug
	.dw '.stabn 0x44,0,97,',0,0
	.dd LM7-_main
	.dw 0x0d,0x0a
.code
LM7:
L3:
	pc=L5	// jump
	pc=L4	// jump
L5:
.debug
	.dw '.stabn 0x44,0,98,',0,0
	.dd LM8-_main
	.dw 0x0d,0x0a
.code
LM8:
LBB3:
	call _SP_GetCh	// call with return value
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,99,',0,0
	.dd LM9-_main
	.dw 0x0d,0x0a
.code
LM9:
	R1=[BP]	// QImode move
	[SP--]=R1	// QImode move
	call _key_value_process	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,100,',0,0
	.dd LM10-_main
	.dw 0x0d,0x0a
.code
LM10:
	R1=[_guifgSpeechPlay]	// QImode move
	CMP R1,0	// QImode test
	JNZ L9	// QImode EQ
	PC=L6
L9:
.debug
	.dw '.stabn 0x44,0,101,',0,0
	.dd LM11-_main
	.dw 0x0d,0x0a
.code
LM11:
	call _temperature_speech_play	// call without return value
L6:
.debug
	.dw '.stabn 0x44,0,102,',0,0
	.dd LM12-_main
	.dw 0x0d,0x0a
.code
LM12:
	R1=[_status]	// QImode move
	CMP R1,1	// QImode compare
	JZ L10	// QImode NE
	PC=L7
L10:
.debug
	.dw '.stabn 0x44,0,103,',0,0
	.dd LM13-_main
	.dw 0x0d,0x0a
.code
LM13:
	call _display_speech_ADC_temperature	// call without return value
L7:
.debug
	.dw '.stabn 0x44,0,104,',0,0
	.dd LM14-_main
	.dw 0x0d,0x0a
.code
LM14:
	call _Clear_WatchDog	// call with return value
.debug
	.dw '.stabn 0x44,0,105,',0,0
	.dd LM15-_main
	.dw 0x0d,0x0a
.code
LM15:
	call _System_ServiceLoop	// call with return value
.debug
	.dw '.stabn 0x44,0,106,',0,0
	.dd LM16-_main
	.dw 0x0d,0x0a
.code
LM16:
	R1=[_fOut]	// QImode move
	CMP R1,0	// QImode test
	JNG L11	// QImode GT
	PC=L8
L11:
	call _turn_off_timerB	// call with return value
L8:
.debug
	.dw '.stabn 0x44,0,107,',0,0
	.dd LM17-_main
	.dw 0x0d,0x0a
.code
LM17:
LBE3:
	pc=L3	// jump
L4:
.debug
	.dw '.stabn 0x44,0,108,',0,0
	.dd LM18-_main
	.dw 0x0d,0x0a
.code
LM18:
LBE2:
.debug
	.dw '.stabn 0x44,0,108,',0,0
	.dd LM19-_main
	.dw 0x0d,0x0a
.code
LM19:
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
	.dw '.stabs "iKeyValue:1",128,0,0,0',0x0d,0x0a
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
.code
.debug
	.dw '.stabs "PIDinit:F19",36,0,0,',0,0,offset _PIDinit,seg _PIDinit,0x0d,0x0a
.CODE
.public _PIDinit
_PIDinit:	.proc
.debug
	.dw '.stabn 0x44,0,118,',0,0
	.dd LM20-_PIDinit
	.dw 0x0d,0x0a
.code
LM20:
	// total=0, vars=0
	// frame_pointer_needed: 1
	push bp to [sp]
	bp=sp+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,119,',0,0
	.dd LM21-_PIDinit
	.dw 0x0d,0x0a
.code
LM21:
	R2=0	// QImode move
	[_stPID+7]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,120,',0,0
	.dd LM22-_PIDinit
	.dw 0x0d,0x0a
.code
LM22:
	R2=0	// QImode move
	[_stPID+8]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,121,',0,0
	.dd LM23-_PIDinit
	.dw 0x0d,0x0a
.code
LM23:
	R2=0	// QImode move
	[_stPID+9]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,122,',0,0
	.dd LM24-_PIDinit
	.dw 0x0d,0x0a
.code
LM24:
.debug
	.dw '.stabn 0x44,0,122,',0,0
	.dd LM25-_PIDinit
	.dw 0x0d,0x0a
.code
LM25:
L12:

	pop bp from [sp]
	retf
	.endp	// end of PIDinit

.debug
	.dw '.stabf ',0,0
	.dd LME2-_PIDinit
	.dw 0x0d,0x0a
.code
LME2:
.code
.debug
	.dw '.stabs "PIDCalc:F12",36,0,0,',0,0,offset _PIDCalc,seg _PIDCalc,0x0d,0x0a
.CODE
.public _PIDCalc
_PIDCalc:	.proc
.debug
	.dw '.stabn 0x44,0,132,',0,0
	.dd LM26-_PIDCalc
	.dw 0x0d,0x0a
.code
LM26:
	// total=11, vars=11
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=11
	bp=sp+1

	R1=BP+14
	[bp+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,133,',0,0
	.dd LM27-_PIDCalc
	.dw 0x0d,0x0a
.code
LM27:
LBB4:
.debug
	.dw '.stabn 0x44,0,135,',0,0
	.dd LM28-_PIDCalc
	.dw 0x0d,0x0a
.code
LM28:
	R2=BP	// QImode move
	R1=BP+1
	R3=[bp+2]	// QImode move
	R2=[R3]	// QImode move
	R4=R2	// QImode move
	R3=[R4]	// QImode move
	R2=10	// QImode move
	mr=R3*R2	// r3=R3*R2 16bit=16bit*16bit
	R2=[bp+2]	// QImode move
	R2=[bp+2]	// QImode move
	R4=R2+1
	R2=R3	// QImode move
	R3=R4	// QImode move
	R2-=[R3]	// subqi3_r0R R2=R2-[R3]
	R4=R1	// QImode move
	[R4]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,136,',0,0
	.dd LM29-_PIDCalc
	.dw 0x0d,0x0a
.code
LM29:
	R2=[bp+2]	// QImode move
	R1=[R2]	// QImode move
	R2=R1	// QImode move
	R1=R1+9
	R3=[bp+2]	// QImode move
	R2=[R3]	// QImode move
	R3=R2	// QImode move
	R2=R2+9
	R4=BP	// QImode move
	R3=BP+1
	R4=R2	// QImode move
	R4=[R4]	// QImode move
	[bp+8]=R4	// QImode move
	R2=[bp+8]	// QImode move
	R4=R3	// QImode move
	R2+=[R4]	// addqi3_r0R
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,137,',0,0
	.dd LM30-_PIDCalc
	.dw 0x0d,0x0a
.code
LM30:
	R4=[bp+2]	// QImode move
	R1=[R4]	// QImode move
	R2=R1	// QImode move
	R1=R1+7
	R3=[bp+2]	// QImode move
	R2=[R3]	// QImode move
	R3=R2	// QImode move
	R2=R2+8
	R4=R1	// QImode move
	R3=[R4]	// QImode move
	R1=R3	// QImode move
	R3=R2	// QImode move
	R1-=[R3]	// subqi3_r0R R1=R1-[R3]
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,138,',0,0
	.dd LM31-_PIDCalc
	.dw 0x0d,0x0a
.code
LM31:
	R4=[bp+2]	// QImode move
	R1=[R4]	// QImode move
	R2=R1	// QImode move
	R1=R1+8
	R2=[bp+2]	// QImode move
	R3=[R2]	// QImode move
	R2=R3	// QImode move
	R3=R3+7
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,139,',0,0
	.dd LM32-_PIDCalc
	.dw 0x0d,0x0a
.code
LM32:
	R4=[bp+2]	// QImode move
	R1=[R4]	// QImode move
	R2=R1	// QImode move
	R1=R1+7
	R2=BP	// QImode move
	R3=BP+1
	R4=R3	// QImode move
	R2=[R4]	// QImode move
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,140,',0,0
	.dd LM33-_PIDCalc
	.dw 0x0d,0x0a
.code
LM33:
	R4=[bp+2]	// QImode move
	R2=[R4]	// QImode move
	R1=R2	// QImode move
	R1=R2+1
	[bp+5]=R1	// QImode move
	R1=BP	// QImode move
	R2=BP+1
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call __cvi1f2	// call with return value
	SP=SP+1
	R4=[bp+5]	// QImode move
	R3=[R4++]	// RD=[RS] HFmode, RD+1=RS
	R4=[R4]
	[bp+9]=R3	// HFmode [BP+#IM6]=RS
	[bp+10]=R4
	R3=[bp+9]	// HFmode RD=[BP+#IM6]
	R4=[bp+10]
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	[bp+3]=R1	// HFmode [BP+#IM6]=RS
	[bp+4]=R2
	R4=[bp+2]	// QImode move
	R2=[R4]	// QImode move
	R1=R2	// QImode move
	R1=R2+3
	[bp+6]=R1	// QImode move
	R3=[bp+2]	// QImode move
	R2=[R3]	// QImode move
	R1=R2	// QImode move
	R2=R2+9
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	[SP--]=R1	// QImode move
	call __cvi1f2	// call with return value
	SP=SP+1
	R4=[bp+6]	// QImode move
	R3=[R4++]	// RD=[RS] HFmode, RD+1=RS
	R4=[R4]
	[bp+9]=R3	// HFmode [BP+#IM6]=RS
	[bp+10]=R4
	R3=[bp+9]	// HFmode RD=[BP+#IM6]
	R4=[bp+10]
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	push R1,R2 to [sp]	// pushhf
	R1=[bp+3]	// HFmode RD=[BP+#IM6]
	R2=[bp+4]
	push R1,R2 to [sp]	// pushhf
	call __addf2	// call with return value
	SP=SP+4
	[bp+3]=R1	// HFmode [BP+#IM6]=RS
	[bp+4]=R2
	R3=[bp+2]	// QImode move
	R2=[R3]	// QImode move
	R1=R2	// QImode move
	R4=R2+5
	[bp+7]=R4	// QImode move
	R1=[BP]	// QImode move
	[SP--]=R1	// QImode move
	call __cvi1f2	// call with return value
	SP=SP+1
	R4=[bp+7]	// QImode move
	R3=[R4++]	// RD=[RS] HFmode, RD+1=RS
	R4=[R4]
	[bp+9]=R3	// HFmode [BP+#IM6]=RS
	[bp+10]=R4
	R3=[bp+9]	// HFmode RD=[BP+#IM6]
	R4=[bp+10]
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	push R1,R2 to [sp]	// pushhf
	R1=[bp+3]	// HFmode RD=[BP+#IM6]
	R2=[bp+4]
	push R1,R2 to [sp]	// pushhf
	call __addf2	// call with return value
	SP=SP+4
	[bp+3]=R1	// HFmode [BP+#IM6]=RS
	[bp+4]=R2
	R3=[bp+3]	// HFmode RD=[BP+#IM6]
	R4=[bp+4]
	R1=R3	// HFmode register to register move
	R2=R4
	pc=L13	// jump
.debug
	.dw '.stabn 0x44,0,144,',0,0
	.dd LM34-_PIDCalc
	.dw 0x0d,0x0a
.code
LM34:
LBE4:
.debug
	.dw '.stabn 0x44,0,144,',0,0
	.dd LM35-_PIDCalc
	.dw 0x0d,0x0a
.code
LM35:
L13:

	sp+=11
	pop bp from [sp]
	retf
	.endp	// end of PIDCalc

.debug
	.dw '.stabs "pp:p24=*21",160,0,0,14',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "NextPoint:p1",160,0,0,15',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB4-_PIDCalc
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "dError:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "Error:1",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE4-_PIDCalc
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME3-_PIDCalc
	.dw 0x0d,0x0a
.code
LME3:
.iram
LsiTlast_12:
	.dw 0
.code
.debug
	.dw '.stabs "display_speech_ADC_temperature:F19",36,0,0,',0,0,offset _display_speech_ADC_temperature,seg _display_speech_ADC_temperature,0x0d,0x0a
.CODE
.public _display_speech_ADC_temperature
_display_speech_ADC_temperature:	.proc
.debug
	.dw '.stabn 0x44,0,154,',0,0
	.dd LM36-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM36:
	// total=9, vars=9
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=9
	bp=sp+1

	R1=BP+12
	[bp+5]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,155,',0,0
	.dd LM37-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM37:
LBB5:
.debug
	.dw '.stabn 0x44,0,158,',0,0
	.dd LM38-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM38:
	R1=[_G_ADC_flag]	// QImode move
	CMP R1,0	// QImode test
	JNZ L20	// QImode EQ
	PC=L15
L20:
.debug
	.dw '.stabn 0x44,0,159,',0,0
	.dd LM39-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM39:
	R1=0	// QImode move
	[_G_ADC_flag]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,160,',0,0
	.dd LM40-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM40:
	call _adc_data_cmp	// call with return value
	R2=BP	// QImode move
	R3=BP+4
	R2=R3	// QImode move
	[R2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,161,',0,0
	.dd LM41-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM41:
	R2=BP	// QImode move
	R1=BP+4
	R2=BP	// QImode move
	R3=BP+4
	R2=R3	// QImode move
	R4=[R2]	// QImode move
	R2=R4	// QImode move
	CMP R2,0	// QImode test
	JL L21	// QImode GE
	PC=L16
L21:
	R2=R2+7
L16:
	R2=R2 asr 3
	R3=R1	// QImode move
	[R3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,162,',0,0
	.dd LM42-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM42:
	R1=BP	// QImode move
	R2=BP+4
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	CMP R1,597	// QImode compare
	JG L22	// QImode LE
	PC=L17
L22:
	R1=BP	// QImode move
	R2=BP+2
	R3=51905	// HFmode immediate to register move
	R4=15777
	R1=R2	// QImode move
	[R1++]=R3	// [RD]=RS HFmode, RD!=RS+1
	[R1--]=R4
	pc=L18	// jump
L17:
.debug
	.dw '.stabn 0x44,0,163,',0,0
	.dd LM43-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM43:
	R1=BP	// QImode move
	R2=BP+2
	R3=42467	// HFmode immediate to register move
	R4=15771
	R1=R2	// QImode move
	[R1++]=R3	// [RD]=RS HFmode, RD!=RS+1
	[R1--]=R4
L18:
.debug
	.dw '.stabn 0x44,0,164,',0,0
	.dd LM44-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM44:
	R1=BP	// QImode move
	R2=BP+4
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	[SP--]=R1	// QImode move
	call __cvi1f2	// call with return value
	SP=SP+1
	R3=BP	// QImode move
	R4=BP+2
	[bp+8]=R4	// QImode move
	R4=[bp+8]	// QImode move
	R3=[R4++]	// RD=[RS] HFmode, RD+1=RS
	R4=[R4]
	[bp+6]=R3	// HFmode [BP+#IM6]=RS
	[bp+7]=R4
	R3=[bp+6]	// HFmode RD=[BP+#IM6]
	R4=[bp+7]
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	[BP++]=R1	// [RD]=RS HFmode, RD!=RS+1
	[BP--]=R2
.debug
	.dw '.stabn 0x44,0,165,',0,0
	.dd LM45-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM45:
	R1=[BP++]	// RD=[RS] HFmode, RD!=RS
	R2=[BP--]
	push R1,R2 to [sp]	// pushhf
	call __cvf2i1	// call with return value
	SP=SP+2
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __divi1	// call with return value
	SP=SP+2
	[_guiLED_Value]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,166,',0,0
	.dd LM46-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM46:
	R1=[BP++]	// RD=[RS] HFmode, RD!=RS
	R2=[BP--]
	push R1,R2 to [sp]	// pushhf
	call __cvf2i1	// call with return value
	SP=SP+2
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modi1	// call with return value
	SP=SP+2
	[_guiLED_Value+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,167,',0,0
	.dd LM47-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM47:
	R1=[BP++]	// RD=[RS] HFmode, RD!=RS
	R2=[BP--]
	R3=0	// HFmode immediate to register move
	R4=16672
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	push R1,R2 to [sp]	// pushhf
	call __cvf2i1	// call with return value
	SP=SP+2
	R2=10	// QImode move
	[SP--]=R2	// QImode move
	[SP--]=R1	// QImode move
	call __modi1	// call with return value
	SP=SP+2
	[_guiLED_Value+2]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,168,',0,0
	.dd LM48-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM48:
	R1=[BP++]	// RD=[RS] HFmode, RD!=RS
	R2=[BP--]
	push R1,R2 to [sp]	// pushhf
	call __cvf2i1	// call with return value
	SP=SP+2
	CMP R1,[LsiTlast_12]	// QImode compare
	JNZ L23	// QImode EQ
	PC=L19
L23:
.debug
	.dw '.stabn 0x44,0,169,',0,0
	.dd LM49-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM49:
LBB6:
	R1=_guiLED_Value	// QImode move
	[SP--]=R1	// QImode move
	call _temperature_speech_index	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,170,',0,0
	.dd LM50-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM50:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_A2000_Initial	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,171,',0,0
	.dd LM51-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM51:
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_A2000_InitDecoder	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,172,',0,0
	.dd LM52-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM52:
	call _SP_INT_IRQ6	// call with return value
.debug
	.dw '.stabn 0x44,0,173,',0,0
	.dd LM53-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM53:
	R1=[_iaSpeech_index]	// QImode move
	[SP--]=R1	// QImode move
	call _speech_start_address	// call with return value
	SP=SP+1
	[_iAddrSpeech]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,174,',0,0
	.dd LM54-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM54:
	R1=1	// QImode move
	[_guifgSpeechPlay]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,175,',0,0
	.dd LM55-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM55:
	R1=[BP++]	// RD=[RS] HFmode, RD!=RS
	R2=[BP--]
	push R1,R2 to [sp]	// pushhf
	call __cvf2i1	// call with return value
	SP=SP+2
	[LsiTlast_12]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,176,',0,0
	.dd LM56-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM56:
LBE6:
L19:
.debug
	.dw '.stabn 0x44,0,177,',0,0
	.dd LM57-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM57:
	R1=0	// HFmode immediate to register move
	R2=16320
	[_stPID+1]=R1	// HFmode [Label]=RS
	[_stPID+2]=R2
.debug
	.dw '.stabn 0x44,0,178,',0,0
	.dd LM58-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM58:
	R1=0	// HFmode immediate to register move
	R2=16128
	[_stPID+3]=R1	// HFmode [Label]=RS
	[_stPID+4]=R2
.debug
	.dw '.stabn 0x44,0,179,',0,0
	.dd LM59-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM59:
	R1=0	// HFmode immediate to register move
	R2=0
	[_stPID+5]=R1	// HFmode [Label]=RS
	[_stPID+6]=R2
.debug
	.dw '.stabn 0x44,0,180,',0,0
	.dd LM60-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM60:
	R1=[BP++]	// RD=[RS] HFmode, RD!=RS
	R2=[BP--]
	R3=0	// HFmode immediate to register move
	R4=16672
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	push R1,R2 to [sp]	// pushhf
	call __cvf2i1	// call with return value
	SP=SP+2
	[SP--]=R1	// QImode move
	R1=_stPID	// QImode move
	[SP--]=R1	// QImode move
	call _PIDCalc	// call with return value
	SP=SP+2
	push R1,R2 to [sp]	// pushhf
	call __cvf2i1	// call with return value
	SP=SP+2
	[_fOut]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,181,',0,0
	.dd LM61-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM61:
	call _active	// call without return value
L15:
.debug
	.dw '.stabn 0x44,0,183,',0,0
	.dd LM62-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM62:
LBE5:
.debug
	.dw '.stabn 0x44,0,183,',0,0
	.dd LM63-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LM63:
L14:

	sp+=9
	pop bp from [sp]
	retf
	.endp	// end of display_speech_ADC_temperature

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB5-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "fT:12",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "K:12",128,0,0,2',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "adc_data:1",128,0,0,4',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "siTlast:V1",38,0,0,',0,0,offset LsiTlast_12,seg LsiTlast_12,0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB6-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE6-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE5-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME4-_display_speech_ADC_temperature
	.dw 0x0d,0x0a
.code
LME4:
.code
.debug
	.dw '.stabs "active:F19",36,0,0,',0,0,offset _active,seg _active,0x0d,0x0a
.CODE
.public _active
_active:	.proc
.debug
	.dw '.stabn 0x44,0,192,',0,0
	.dd LM64-_active
	.dw 0x0d,0x0a
.code
LM64:
	// total=3, vars=3
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=3
	bp=sp+1

	R1=BP+6
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,193,',0,0
	.dd LM65-_active
	.dw 0x0d,0x0a
.code
LM65:
LBB7:
	R1=[_fOut]	// QImode move
	CMP R1,0	// QImode test
	JNG L29	// QImode GT
	PC=L25
L29:
.debug
	.dw '.stabn 0x44,0,194,',0,0
	.dd LM66-_active
	.dw 0x0d,0x0a
.code
LM66:
LBB8:
	call _turn_off_relay	// call with return value
.debug
	.dw '.stabn 0x44,0,195,',0,0
	.dd LM67-_active
	.dw 0x0d,0x0a
.code
LM67:
	call _turn_off_timerB	// call with return value
.debug
	.dw '.stabn 0x44,0,196,',0,0
	.dd LM68-_active
	.dw 0x0d,0x0a
.code
LM68:
LBE8:
	pc=L26	// jump
L25:
.debug
	.dw '.stabn 0x44,0,198,',0,0
	.dd LM69-_active
	.dw 0x0d,0x0a
.code
LM69:
LBB9:
	R1=[_fOut]	// QImode move
	[SP--]=R1	// QImode move
	call __cvi1f2	// call with return value
	SP=SP+1
	[bp+1]=R1	// HFmode [BP+#IM6]=RS
	[bp+2]=R2
	R1=[_stPID+1]	// HFmode RD=[Label]
	R2=[_stPID+2]
	R3=0	// HFmode immediate to register move
	R4=16880
	push R3,R4 to [sp]	// pushhf
	push R1,R2 to [sp]	// pushhf
	call __mulf2	// call with return value
	SP=SP+4
	push R1,R2 to [sp]	// pushhf
	R1=[bp+1]	// HFmode RD=[BP+#IM6]
	R2=[bp+2]
	push R1,R2 to [sp]	// pushhf
	call __cmpf2	// call with return value
	SP=SP+4
	CMP R1,1	// QImode compare
	JG L30	// QImode LE
	PC=L27
L30:
.debug
	.dw '.stabn 0x44,0,199,',0,0
	.dd LM70-_active
	.dw 0x0d,0x0a
.code
LM70:
	call _turn_on_relay	// call with return value
	pc=L26	// jump
L27:
.debug
	.dw '.stabn 0x44,0,200,',0,0
	.dd LM71-_active
	.dw 0x0d,0x0a
.code
LM71:
LBB10:
	call _turn_on_relay	// call with return value
	call _SP_INT_TIMEB	// call with return value
LBE10:
L28:
.debug
	.dw '.stabn 0x44,0,202,',0,0
	.dd LM72-_active
	.dw 0x0d,0x0a
.code
LM72:
LBE9:
L26:
.debug
	.dw '.stabn 0x44,0,203,',0,0
	.dd LM73-_active
	.dw 0x0d,0x0a
.code
LM73:
LBE7:
.debug
	.dw '.stabn 0x44,0,203,',0,0
	.dd LM74-_active
	.dw 0x0d,0x0a
.code
LM74:
L24:

	sp+=3
	pop bp from [sp]
	retf
	.endp	// end of active

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB7-_active
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB8-_active
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE8-_active
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB9-_active
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB10-_active
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE10-_active
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE9-_active
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE7-_active
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME5-_active
	.dw 0x0d,0x0a
.code
LME5:
.code
.debug
	.dw '.stabs "adc_data_cmp:F1",36,0,0,',0,0,offset _adc_data_cmp,seg _adc_data_cmp,0x0d,0x0a
.CODE
.public _adc_data_cmp
_adc_data_cmp:	.proc
.debug
	.dw '.stabn 0x44,0,213,',0,0
	.dd LM75-_adc_data_cmp
	.dw 0x0d,0x0a
.code
LM75:
	// total=12, vars=12
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=12
	bp=sp+1

	R2=BP+15
.debug
	.dw '.stabn 0x44,0,214,',0,0
	.dd LM76-_adc_data_cmp
	.dw 0x0d,0x0a
.code
LM76:
LBB11:
.debug
	.dw '.stabn 0x44,0,218,',0,0
	.dd LM77-_adc_data_cmp
	.dw 0x0d,0x0a
.code
LM77:
	R1=[_giADC_DataSave+1]	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,219,',0,0
	.dd LM78-_adc_data_cmp
	.dw 0x0d,0x0a
.code
LM78:
	R1=BP	// QImode move
	R3=BP+3
	R1=1	// QImode move
	R4=R3	// QImode move
	[R4]=R1	// QImode move
L32:
	R1=BP	// QImode move
	R3=BP+3
	R4=R3	// QImode move
	R1=[R4]	// QImode move
	CMP R1,10	// QImode compare
	JG L46	// QImode LE
	PC=L35
L46:
	pc=L33	// jump
L35:
.debug
	.dw '.stabn 0x44,0,220,',0,0
	.dd LM79-_adc_data_cmp
	.dw 0x0d,0x0a
.code
LM79:
	R1=BP	// QImode move
	R3=BP+3
	R1=_giADC_DataSave	// QImode move
	R4=R3	// QImode move
	R3=[R4]	// QImode move
	R1+=R3	// addqi3_r0r
	R4=R1	// QImode move
	R3=[R4]	// QImode move
	CMP R3,[BP]	// QImode compare
	JA L47	// QImode LEU
	PC=L34
L47:
.debug
	.dw '.stabn 0x44,0,221,',0,0
	.dd LM80-_adc_data_cmp
	.dw 0x0d,0x0a
.code
LM80:
	R1=BP	// QImode move
	R3=BP+3
	R1=_giADC_DataSave	// QImode move
	R4=R3	// QImode move
	R3=[R4]	// QImode move
	R1+=R3	// addqi3_r0r
	R4=R1	// QImode move
	R3=[R4]	// QImode move
	[BP]=R3	// QImode move
L36:
.debug
	.dw '.stabn 0x44,0,219,',0,0
	.dd LM81-_adc_data_cmp
	.dw 0x0d,0x0a
.code
LM81:
L34:
	R1=BP	// QImode move
	R3=BP+3
	R4=BP	// QImode move
	R1=BP+3
	R3=BP	// QImode move
	R3=BP+3
	[bp+9]=R3	// QImode move
	R4=[bp+9]	// QImode move
	R3=[R4]	// QImode move
	R4=R3+1
	R3=R1	// QImode move
	[R3]=R4	// QImode move
	pc=L32	// jump
L33:
.debug
	.dw '.stabn 0x44,0,223,',0,0
	.dd LM82-_adc_data_cmp
	.dw 0x0d,0x0a
.code
LM82:
	R3=BP	// QImode move
	R1=BP+1
	R3=BP	// QImode move
	R4=BP+3
	R3=_giADC_DataSave	// QImode move
	[bp+10]=R3	// QImode move
	R3=R4	// QImode move
	R4=[R3]	// QImode move
	R3=[bp+10]	// QImode move
	R3+=R4	// addqi3_r0r
	R4=R3	// QImode move
	R4=[R4]	// QImode move
	[bp+9]=R4	// QImode move
	R3=[bp+9]	// QImode move
	R4=R1	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,224,',0,0
	.dd LM83-_adc_data_cmp
	.dw 0x0d,0x0a
.code
LM83:
	R1=BP	// QImode move
	R3=BP+3
	R1=1	// QImode move
	R4=R3	// QImode move
	[R4]=R1	// QImode move
L37:
	R1=BP	// QImode move
	R3=BP+3
	R4=R3	// QImode move
	R1=[R4]	// QImode move
	CMP R1,10	// QImode compare
	JG L48	// QImode LE
	PC=L40
L48:
	pc=L38	// jump
L40:
.debug
	.dw '.stabn 0x44,0,225,',0,0
	.dd LM84-_adc_data_cmp
	.dw 0x0d,0x0a
.code
LM84:
	R1=BP	// QImode move
	R3=BP+3
	R1=_giADC_DataSave	// QImode move
	R4=R3	// QImode move
	R3=[R4]	// QImode move
	R1+=R3	// addqi3_r0r
	R3=BP	// QImode move
	R4=BP+1
	R3=R1	// QImode move
	R1=[R3]	// QImode move
	R3=R4	// QImode move
	CMP R1,[R3]	// QImode compare
	JB L49	// QImode GEU
	PC=L39
L49:
.debug
	.dw '.stabn 0x44,0,226,',0,0
	.dd LM85-_adc_data_cmp
	.dw 0x0d,0x0a
.code
LM85:
	R3=BP	// QImode move
	R1=BP+1
	R3=BP	// QImode move
	R4=BP+3
	R3=_giADC_DataSave	// QImode move
	[bp+10]=R3	// QImode move
	R3=R4	// QImode move
	R4=[R3]	// QImode move
	R3=[bp+10]	// QImode move
	R3+=R4	// addqi3_r0r
	R4=R3	// QImode move
	R4=[R4]	// QImode move
	[bp+9]=R4	// QImode move
	R3=[bp+9]	// QImode move
	R4=R1	// QImode move
	[R4]=R3	// QImode move
L41:
.debug
	.dw '.stabn 0x44,0,224,',0,0
	.dd LM86-_adc_data_cmp
	.dw 0x0d,0x0a
.code
LM86:
L39:
	R1=BP	// QImode move
	R3=BP+3
	R4=BP	// QImode move
	R1=BP+3
	R3=BP	// QImode move
	R3=BP+3
	[bp+9]=R3	// QImode move
	R4=[bp+9]	// QImode move
	R3=[R4]	// QImode move
	R4=R3+1
	R3=R1	// QImode move
	[R3]=R4	// QImode move
	pc=L37	// jump
L38:
.debug
	.dw '.stabn 0x44,0,228,',0,0
	.dd LM87-_adc_data_cmp
	.dw 0x0d,0x0a
.code
LM87:
	R1=BP	// QImode move
	R3=BP+3
	R1=1	// QImode move
	R4=R3	// QImode move
	[R4]=R1	// QImode move
L42:
	R1=BP	// QImode move
	R3=BP+3
	R4=R3	// QImode move
	R1=[R4]	// QImode move
	CMP R1,10	// QImode compare
	JG L50	// QImode LE
	PC=L45
L50:
	pc=L43	// jump
L45:
.debug
	.dw '.stabn 0x44,0,229,',0,0
	.dd LM88-_adc_data_cmp
	.dw 0x0d,0x0a
.code
LM88:
	R3=BP	// QImode move
	R1=BP+2
	[bp+11]=R1	// QImode move
	R4=BP	// QImode move
	R3=BP+2
	[bp+10]=R3	// QImode move
	R4=BP	// QImode move
	R4=BP+3
	[bp+4]=R4	// QImode move
	R1=_giADC_DataSave	// QImode move
	[bp+9]=R1	// QImode move
	R3=[bp+4]	// QImode move
	R3=[R3]	// QImode move
	[bp+5]=R3	// QImode move
	R4=[bp+9]	// QImode move
	R1=[bp+5]	// QImode move
	R4+=R1	// addqi3_r0r
	R3=[bp+10]	// QImode move
	R3=[R3]	// QImode move
	[bp+6]=R3	// QImode move
	R3=[bp+6]	// QImode move
	R1=R4	// QImode move
	R3+=[R1]	// addqi3_r0R
	R4=[bp+11]	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,228,',0,0
	.dd LM89-_adc_data_cmp
	.dw 0x0d,0x0a
.code
LM89:
L44:
	R1=BP	// QImode move
	R3=BP+3
	R4=BP	// QImode move
	R1=BP+3
	R3=BP	// QImode move
	R3=BP+3
	[bp+9]=R3	// QImode move
	R4=[bp+9]	// QImode move
	R3=[R4]	// QImode move
	R4=R3+1
	R3=R1	// QImode move
	[R3]=R4	// QImode move
	pc=L42	// jump
L43:
.debug
	.dw '.stabn 0x44,0,230,',0,0
	.dd LM90-_adc_data_cmp
	.dw 0x0d,0x0a
.code
LM90:
	R3=BP	// QImode move
	R1=BP+2
	R3=BP	// QImode move
	R4=BP+2
	R3=R4	// QImode move
	R3=[R3]	// QImode move
	[bp+7]=R3	// QImode move
	R3=[bp+7]	// QImode move
	R3-=[BP]	// subqi3_r0R R3=R3-[BP]
	R4=BP	// QImode move
	R4=BP+1
	[bp+8]=R4	// QImode move
	R4=[bp+8]	// QImode move
	R3-=[R4]	// subqi3_r0R R3=R3-[R4]
	R4=R1	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,231,',0,0
	.dd LM91-_adc_data_cmp
	.dw 0x0d,0x0a
.code
LM91:
	R1=BP	// QImode move
	R3=BP+2
	R1=R3	// QImode move
	R4=[R1]	// QImode move
	R1=R4	// QImode move
	pc=L31	// jump
.debug
	.dw '.stabn 0x44,0,232,',0,0
	.dd LM92-_adc_data_cmp
	.dw 0x0d,0x0a
.code
LM92:
LBE11:
.debug
	.dw '.stabn 0x44,0,232,',0,0
	.dd LM93-_adc_data_cmp
	.dw 0x0d,0x0a
.code
LM93:
L31:

	sp+=12
	pop bp from [sp]
	retf
	.endp	// end of adc_data_cmp

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB11-_adc_data_cmp
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "max:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "min:1",128,0,0,1',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "Sum:1",128,0,0,2',0x0d,0x0a
.CODE
.debug
	.dw '.stabs "i:1",128,0,0,3',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE11-_adc_data_cmp
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME6-_adc_data_cmp
	.dw 0x0d,0x0a
.code
LME6:
.code
.debug
	.dw '.stabs "key_value_process:F19",36,0,0,',0,0,offset _key_value_process,seg _key_value_process,0x0d,0x0a
.CODE
.public _key_value_process
_key_value_process:	.proc
.debug
	.dw '.stabn 0x44,0,241,',0,0
	.dd LM94-_key_value_process
	.dw 0x0d,0x0a
.code
LM94:
	// total=2, vars=2
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=2
	bp=sp+1

	R1=BP+5
	[bp+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,242,',0,0
	.dd LM95-_key_value_process
	.dw 0x0d,0x0a
.code
LM95:
LBB12:
.debug
	.dw '.stabn 0x44,0,243,',0,0
	.dd LM96-_key_value_process
	.dw 0x0d,0x0a
.code
LM96:
	R2=[bp+1]	// QImode move
	R1=[R2]	// QImode move
	CMP R1,1	// QImode compare
	JNZ L66	// QImode EQ
	PC=L54
L66:
	CMP R1,1	// QImode compare
	JNG L67	// QImode GT
	PC=L65
L67:
	CMP R1,0	// QImode test
	JNZ L68	// QImode EQ
	PC=L53
L68:
	pc=L63	// jump
L65:
	CMP R1,2	// QImode compare
	JNZ L69	// QImode EQ
	PC=L57
L69:
	CMP R1,4	// QImode compare
	JNZ L70	// QImode EQ
	PC=L60
L70:
	pc=L63	// jump
.debug
	.dw '.stabn 0x44,0,244,',0,0
	.dd LM97-_key_value_process
	.dw 0x0d,0x0a
.code
LM97:
L53:
	pc=L52	// jump
L54:
.debug
	.dw '.stabn 0x44,0,246,',0,0
	.dd LM98-_key_value_process
	.dw 0x0d,0x0a
.code
LM98:
	R1=[_status]	// QImode move
	CMP R1,0	// QImode test
	JZ L71	// QImode NE
	PC=L55
L71:
.debug
	.dw '.stabn 0x44,0,247,',0,0
	.dd LM99-_key_value_process
	.dw 0x0d,0x0a
.code
LM99:
	R1=[_guiLED_Value]	// QImode move
	R2=1	// QImode move
	[_guiLED_Value]=R1+R2
.debug
	.dw '.stabn 0x44,0,248,',0,0
	.dd LM100-_key_value_process
	.dw 0x0d,0x0a
.code
LM100:
	R1=[_guiLED_Value]	// QImode move
	CMP R1,10	// QImode compare
	JZ L72	// QImode NE
	PC=L55
L72:
.debug
	.dw '.stabn 0x44,0,249,',0,0
	.dd LM101-_key_value_process
	.dw 0x0d,0x0a
.code
LM101:
	R1=0	// QImode move
	[_guiLED_Value]=R1	// QImode move
L56:
L55:
.debug
	.dw '.stabn 0x44,0,251,',0,0
	.dd LM102-_key_value_process
	.dw 0x0d,0x0a
.code
LM102:
	pc=L52	// jump
L57:
.debug
	.dw '.stabn 0x44,0,253,',0,0
	.dd LM103-_key_value_process
	.dw 0x0d,0x0a
.code
LM103:
	R1=[_status]	// QImode move
	CMP R1,0	// QImode test
	JZ L73	// QImode NE
	PC=L58
L73:
.debug
	.dw '.stabn 0x44,0,254,',0,0
	.dd LM104-_key_value_process
	.dw 0x0d,0x0a
.code
LM104:
	R1=[_guiLED_Value+1]	// QImode move
	R2=1	// QImode move
	[_guiLED_Value+1]=R1+R2
.debug
	.dw '.stabn 0x44,0,255,',0,0
	.dd LM105-_key_value_process
	.dw 0x0d,0x0a
.code
LM105:
	R1=[_guiLED_Value+1]	// QImode move
	CMP R1,10	// QImode compare
	JZ L74	// QImode NE
	PC=L58
L74:
.debug
	.dw '.stabn 0x44,0,256,',0,0
	.dd LM106-_key_value_process
	.dw 0x0d,0x0a
.code
LM106:
	R1=0	// QImode move
	[_guiLED_Value+1]=R1	// QImode move
L59:
L58:
.debug
	.dw '.stabn 0x44,0,258,',0,0
	.dd LM107-_key_value_process
	.dw 0x0d,0x0a
.code
LM107:
	pc=L52	// jump
L60:
.debug
	.dw '.stabn 0x44,0,260,',0,0
	.dd LM108-_key_value_process
	.dw 0x0d,0x0a
.code
LM108:
	R1=[_status]	// QImode move
	CMP R1,0	// QImode test
	JZ L75	// QImode NE
	PC=L61
L75:
.debug
	.dw '.stabn 0x44,0,261,',0,0
	.dd LM109-_key_value_process
	.dw 0x0d,0x0a
.code
LM109:
LBB13:
	R1=_guiLED_Value	// QImode move
	[SP--]=R1	// QImode move
	call _temperature_speech_index	// call without return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,262,',0,0
	.dd LM110-_key_value_process
	.dw 0x0d,0x0a
.code
LM110:
	R1=1	// QImode move
	[_status]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,263,',0,0
	.dd LM111-_key_value_process
	.dw 0x0d,0x0a
.code
LM111:
	R1=0	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_A2000_Initial	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,264,',0,0
	.dd LM112-_key_value_process
	.dw 0x0d,0x0a
.code
LM112:
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_A2000_InitDecoder	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,265,',0,0
	.dd LM113-_key_value_process
	.dw 0x0d,0x0a
.code
LM113:
	R1=1	// QImode move
	[_guifgSpeechPlay]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,266,',0,0
	.dd LM114-_key_value_process
	.dw 0x0d,0x0a
.code
LM114:
	R1=[_guiLED_Value]	// QImode move
	R2=10	// QImode move
	mr=R1*R2	// r3=R1*R2 16bit=16bit*16bit
	R1=[_guiLED_Value+1]	// QImode move
	[_stPID]=R3+R1
.debug
	.dw '.stabn 0x44,0,267,',0,0
	.dd LM115-_key_value_process
	.dw 0x0d,0x0a
.code
LM115:
	R1=[_iaSpeech_index]	// QImode move
	[SP--]=R1	// QImode move
	call _speech_start_address	// call with return value
	SP=SP+1
	[_iAddrSpeech]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,268,',0,0
	.dd LM116-_key_value_process
	.dw 0x0d,0x0a
.code
LM116:
LBE13:
	pc=L62	// jump
L61:
.debug
	.dw '.stabn 0x44,0,270,',0,0
	.dd LM117-_key_value_process
	.dw 0x0d,0x0a
.code
LM117:
LBB14:
	call _turn_off_IRQ5	// call with return value
.debug
	.dw '.stabn 0x44,0,271,',0,0
	.dd LM118-_key_value_process
	.dw 0x0d,0x0a
.code
LM118:
	R1=0	// QImode move
	[_status]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,272,',0,0
	.dd LM119-_key_value_process
	.dw 0x0d,0x0a
.code
LM119:
LBE14:
L62:
.debug
	.dw '.stabn 0x44,0,273,',0,0
	.dd LM120-_key_value_process
	.dw 0x0d,0x0a
.code
LM120:
	pc=L52	// jump
L63:
.debug
	.dw '.stabn 0x44,0,274,',0,0
	.dd LM121-_key_value_process
	.dw 0x0d,0x0a
.code
LM121:
	pc=L52	// jump
L52:
.debug
	.dw '.stabn 0x44,0,276,',0,0
	.dd LM122-_key_value_process
	.dw 0x0d,0x0a
.code
LM122:
LBE12:
.debug
	.dw '.stabn 0x44,0,276,',0,0
	.dd LM123-_key_value_process
	.dw 0x0d,0x0a
.code
LM123:
L51:

	sp+=2
	pop bp from [sp]
	retf
	.endp	// end of key_value_process

.debug
	.dw '.stabs "key:p1",160,0,0,5',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB12-_key_value_process
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "iAddr:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB13-_key_value_process
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE13-_key_value_process
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB14-_key_value_process
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE14-_key_value_process
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE12-_key_value_process
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME7-_key_value_process
	.dw 0x0d,0x0a
.code
LME7:
.code
.debug
	.dw '.stabs "temperature_speech_index:F19",36,0,0,',0,0,offset _temperature_speech_index,seg _temperature_speech_index,0x0d,0x0a
.CODE
.public _temperature_speech_index
_temperature_speech_index:	.proc
.debug
	.dw '.stabn 0x44,0,285,',0,0
	.dd LM124-_temperature_speech_index
	.dw 0x0d,0x0a
.code
LM124:
	// total=0, vars=0
	// frame_pointer_needed: 1
	push bp to [sp]
	bp=sp+1

	R1=BP+3
.debug
	.dw '.stabn 0x44,0,286,',0,0
	.dd LM125-_temperature_speech_index
	.dw 0x0d,0x0a
.code
LM125:
	R3=R1	// QImode move
	R2=[R3]	// QImode move
	R4=R2	// QImode move
	R3=[R4]	// QImode move
	CMP R3,0	// QImode test
	JNZ L81	// QImode EQ
	PC=L77
L81:
.debug
	.dw '.stabn 0x44,0,287,',0,0
	.dd LM126-_temperature_speech_index
	.dw 0x0d,0x0a
.code
LM126:
	R3=R1	// QImode move
	R2=[R3]	// QImode move
	R4=R2	// QImode move
	R3=[R4]	// QImode move
	[_iaSpeech_index]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,288,',0,0
	.dd LM127-_temperature_speech_index
	.dw 0x0d,0x0a
.code
LM127:
	R2=10	// QImode move
	[_iaSpeech_index+1]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,289,',0,0
	.dd LM128-_temperature_speech_index
	.dw 0x0d,0x0a
.code
LM128:
	R3=R1	// QImode move
	R2=[R3]	// QImode move
	R3=R2+1
	R4=R1	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,291,',0,0
	.dd LM129-_temperature_speech_index
	.dw 0x0d,0x0a
.code
LM129:
	R3=R1	// QImode move
	R2=[R3]	// QImode move
	R4=R2	// QImode move
	R3=[R4]	// QImode move
	CMP R3,0	// QImode test
	JNZ L82	// QImode EQ
	PC=L78
L82:
.debug
	.dw '.stabn 0x44,0,292,',0,0
	.dd LM130-_temperature_speech_index
	.dw 0x0d,0x0a
.code
LM130:
	R3=R1	// QImode move
	R2=[R3]	// QImode move
	R4=R2	// QImode move
	R3=[R4]	// QImode move
	[_iaSpeech_index+2]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,293,',0,0
	.dd LM131-_temperature_speech_index
	.dw 0x0d,0x0a
.code
LM131:
	R2=11	// QImode move
	[_iaSpeech_index+3]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,294,',0,0
	.dd LM132-_temperature_speech_index
	.dw 0x0d,0x0a
.code
LM132:
	R2=4	// QImode move
	[_iPlay_times]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,295,',0,0
	.dd LM133-_temperature_speech_index
	.dw 0x0d,0x0a
.code
LM133:
	pc=L79	// jump
L78:
.debug
	.dw '.stabn 0x44,0,297,',0,0
	.dd LM134-_temperature_speech_index
	.dw 0x0d,0x0a
.code
LM134:
	R2=3	// QImode move
	[_iPlay_times]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,298,',0,0
	.dd LM135-_temperature_speech_index
	.dw 0x0d,0x0a
.code
LM135:
	R2=11	// QImode move
	[_iaSpeech_index+2]=R2	// QImode move
L79:
.debug
	.dw '.stabn 0x44,0,301,',0,0
	.dd LM136-_temperature_speech_index
	.dw 0x0d,0x0a
.code
LM136:
	pc=L80	// jump
L77:
.debug
	.dw '.stabn 0x44,0,304,',0,0
	.dd LM137-_temperature_speech_index
	.dw 0x0d,0x0a
.code
LM137:
	R3=R1	// QImode move
	R2=[R3]	// QImode move
	R3=R2+1
	R4=R1	// QImode move
	[R4]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,305,',0,0
	.dd LM138-_temperature_speech_index
	.dw 0x0d,0x0a
.code
LM138:
	R3=R1	// QImode move
	R2=[R3]	// QImode move
	R4=R2	// QImode move
	R3=[R4]	// QImode move
	[_iaSpeech_index]=R3	// QImode move
.debug
	.dw '.stabn 0x44,0,306,',0,0
	.dd LM139-_temperature_speech_index
	.dw 0x0d,0x0a
.code
LM139:
	R2=11	// QImode move
	[_iaSpeech_index+1]=R2	// QImode move
.debug
	.dw '.stabn 0x44,0,307,',0,0
	.dd LM140-_temperature_speech_index
	.dw 0x0d,0x0a
.code
LM140:
	R2=2	// QImode move
	[_iPlay_times]=R2	// QImode move
L80:
.debug
	.dw '.stabn 0x44,0,309,',0,0
	.dd LM141-_temperature_speech_index
	.dw 0x0d,0x0a
.code
LM141:
.debug
	.dw '.stabn 0x44,0,309,',0,0
	.dd LM142-_temperature_speech_index
	.dw 0x0d,0x0a
.code
LM142:
L76:

	pop bp from [sp]
	retf
	.endp	// end of temperature_speech_index

.debug
	.dw '.stabs "p_speech:p25=*4",160,0,0,3',0x0d,0x0a
.CODE
.debug
	.dw '.stabf ',0,0
	.dd LME8-_temperature_speech_index
	.dw 0x0d,0x0a
.code
LME8:
.code
.debug
	.dw '.stabs "speech_start_address:F1",36,0,0,',0,0,offset _speech_start_address,seg _speech_start_address,0x0d,0x0a
.CODE
.public _speech_start_address
_speech_start_address:	.proc
.debug
	.dw '.stabn 0x44,0,318,',0,0
	.dd LM143-_speech_start_address
	.dw 0x0d,0x0a
.code
LM143:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R2=BP+4
.debug
	.dw '.stabn 0x44,0,319,',0,0
	.dd LM144-_speech_start_address
	.dw 0x0d,0x0a
.code
LM144:
LBB15:
.debug
	.dw '.stabn 0x44,0,320,',0,0
	.dd LM145-_speech_start_address
	.dw 0x0d,0x0a
.code
LM145:
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,11	// QImode compare
	JNA L99	// QImode GTU
	PC=L97
L99:
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	R3=R1	// QImode move
	R1=R3	// QImode move
	R1=R1+L98
	R4=R1	// QImode move
	R3=[R4]	// QImode move
	pc=R3	// tablejump
.text
L98:
	.dw L85
	.dw L86
	.dw L87
	.dw L88
	.dw L89
	.dw L90
	.dw L91
	.dw L92
	.dw L93
	.dw L94
	.dw L95
	.dw L96
.code
.debug
	.dw '.stabn 0x44,0,321,',0,0
	.dd LM146-_speech_start_address
	.dw 0x0d,0x0a
.code
LM146:
L85:
	R1=[_RES_T046_16K_SA]	// QImode move
	[BP]=R1	// QImode move
	pc=L84	// jump
L86:
.debug
	.dw '.stabn 0x44,0,322,',0,0
	.dd LM147-_speech_start_address
	.dw 0x0d,0x0a
.code
LM147:
	R1=[_RES_T047_16K_SA]	// QImode move
	[BP]=R1	// QImode move
	pc=L84	// jump
L87:
.debug
	.dw '.stabn 0x44,0,323,',0,0
	.dd LM148-_speech_start_address
	.dw 0x0d,0x0a
.code
LM148:
	R1=[_RES_T048_16K_SA]	// QImode move
	[BP]=R1	// QImode move
	pc=L84	// jump
L88:
.debug
	.dw '.stabn 0x44,0,324,',0,0
	.dd LM149-_speech_start_address
	.dw 0x0d,0x0a
.code
LM149:
	R1=[_RES_T049_16K_SA]	// QImode move
	[BP]=R1	// QImode move
	pc=L84	// jump
L89:
.debug
	.dw '.stabn 0x44,0,325,',0,0
	.dd LM150-_speech_start_address
	.dw 0x0d,0x0a
.code
LM150:
	R1=[_RES_T050_16K_SA]	// QImode move
	[BP]=R1	// QImode move
	pc=L84	// jump
L90:
.debug
	.dw '.stabn 0x44,0,326,',0,0
	.dd LM151-_speech_start_address
	.dw 0x0d,0x0a
.code
LM151:
	R1=[_RES_T051_16K_SA]	// QImode move
	[BP]=R1	// QImode move
	pc=L84	// jump
L91:
.debug
	.dw '.stabn 0x44,0,327,',0,0
	.dd LM152-_speech_start_address
	.dw 0x0d,0x0a
.code
LM152:
	R1=[_RES_T052_16K_SA]	// QImode move
	[BP]=R1	// QImode move
	pc=L84	// jump
L92:
.debug
	.dw '.stabn 0x44,0,328,',0,0
	.dd LM153-_speech_start_address
	.dw 0x0d,0x0a
.code
LM153:
	R1=[_RES_T053_16K_SA]	// QImode move
	[BP]=R1	// QImode move
	pc=L84	// jump
L93:
.debug
	.dw '.stabn 0x44,0,329,',0,0
	.dd LM154-_speech_start_address
	.dw 0x0d,0x0a
.code
LM154:
	R1=[_RES_T054_16K_SA]	// QImode move
	[BP]=R1	// QImode move
	pc=L84	// jump
L94:
.debug
	.dw '.stabn 0x44,0,330,',0,0
	.dd LM155-_speech_start_address
	.dw 0x0d,0x0a
.code
LM155:
	R1=[_RES_T055_16K_SA]	// QImode move
	[BP]=R1	// QImode move
	pc=L84	// jump
L95:
.debug
	.dw '.stabn 0x44,0,331,',0,0
	.dd LM156-_speech_start_address
	.dw 0x0d,0x0a
.code
LM156:
	R1=[_RES_T056_16K_SA]	// QImode move
	[BP]=R1	// QImode move
	pc=L84	// jump
L96:
.debug
	.dw '.stabn 0x44,0,332,',0,0
	.dd LM157-_speech_start_address
	.dw 0x0d,0x0a
.code
LM157:
	R1=[_RES_T034_16K_SA]	// QImode move
	[BP]=R1	// QImode move
	pc=L84	// jump
L97:
.debug
	.dw '.stabn 0x44,0,333,',0,0
	.dd LM158-_speech_start_address
	.dw 0x0d,0x0a
.code
LM158:
	pc=L84	// jump
L84:
.debug
	.dw '.stabn 0x44,0,335,',0,0
	.dd LM159-_speech_start_address
	.dw 0x0d,0x0a
.code
LM159:
	R3=[BP]	// QImode move
	R1=R3	// QImode move
	pc=L83	// jump
.debug
	.dw '.stabn 0x44,0,336,',0,0
	.dd LM160-_speech_start_address
	.dw 0x0d,0x0a
.code
LM160:
LBE15:
.debug
	.dw '.stabn 0x44,0,336,',0,0
	.dd LM161-_speech_start_address
	.dw 0x0d,0x0a
.code
LM161:
L83:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of speech_start_address

.debug
	.dw '.stabs "n:p1",160,0,0,4',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB15-_speech_start_address
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "iAddress:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE15-_speech_start_address
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME9-_speech_start_address
	.dw 0x0d,0x0a
.code
LME9:
.code
.debug
	.dw '.stabs "speech_end_address:F1",36,0,0,',0,0,offset _speech_end_address,seg _speech_end_address,0x0d,0x0a
.CODE
.public _speech_end_address
_speech_end_address:	.proc
.debug
	.dw '.stabn 0x44,0,346,',0,0
	.dd LM162-_speech_end_address
	.dw 0x0d,0x0a
.code
LM162:
	// total=1, vars=1
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=1
	bp=sp+1

	R2=BP+4
.debug
	.dw '.stabn 0x44,0,347,',0,0
	.dd LM163-_speech_end_address
	.dw 0x0d,0x0a
.code
LM163:
LBB16:
.debug
	.dw '.stabn 0x44,0,348,',0,0
	.dd LM164-_speech_end_address
	.dw 0x0d,0x0a
.code
LM164:
	R3=R2	// QImode move
	R1=[R3]	// QImode move
	CMP R1,11	// QImode compare
	JNA L116	// QImode GTU
	PC=L114
L116:
	R4=R2	// QImode move
	R1=[R4]	// QImode move
	R3=R1	// QImode move
	R1=R3	// QImode move
	R1=R1+L115
	R4=R1	// QImode move
	R3=[R4]	// QImode move
	pc=R3	// tablejump
.text
L115:
	.dw L102
	.dw L103
	.dw L104
	.dw L105
	.dw L106
	.dw L107
	.dw L108
	.dw L109
	.dw L110
	.dw L111
	.dw L112
	.dw L113
.code
.debug
	.dw '.stabn 0x44,0,349,',0,0
	.dd LM165-_speech_end_address
	.dw 0x0d,0x0a
.code
LM165:
L102:
	R1=[_RES_T046_16K_EA]	// QImode move
	[BP]=R1	// QImode move
	pc=L101	// jump
L103:
.debug
	.dw '.stabn 0x44,0,350,',0,0
	.dd LM166-_speech_end_address
	.dw 0x0d,0x0a
.code
LM166:
	R1=[_RES_T047_16K_EA]	// QImode move
	[BP]=R1	// QImode move
	pc=L101	// jump
L104:
.debug
	.dw '.stabn 0x44,0,351,',0,0
	.dd LM167-_speech_end_address
	.dw 0x0d,0x0a
.code
LM167:
	R1=[_RES_T048_16K_EA]	// QImode move
	[BP]=R1	// QImode move
	pc=L101	// jump
L105:
.debug
	.dw '.stabn 0x44,0,352,',0,0
	.dd LM168-_speech_end_address
	.dw 0x0d,0x0a
.code
LM168:
	R1=[_RES_T049_16K_EA]	// QImode move
	[BP]=R1	// QImode move
	pc=L101	// jump
L106:
.debug
	.dw '.stabn 0x44,0,353,',0,0
	.dd LM169-_speech_end_address
	.dw 0x0d,0x0a
.code
LM169:
	R1=[_RES_T050_16K_EA]	// QImode move
	[BP]=R1	// QImode move
	pc=L101	// jump
L107:
.debug
	.dw '.stabn 0x44,0,354,',0,0
	.dd LM170-_speech_end_address
	.dw 0x0d,0x0a
.code
LM170:
	R1=[_RES_T051_16K_EA]	// QImode move
	[BP]=R1	// QImode move
	pc=L101	// jump
L108:
.debug
	.dw '.stabn 0x44,0,355,',0,0
	.dd LM171-_speech_end_address
	.dw 0x0d,0x0a
.code
LM171:
	R1=[_RES_T052_16K_EA]	// QImode move
	[BP]=R1	// QImode move
	pc=L101	// jump
L109:
.debug
	.dw '.stabn 0x44,0,356,',0,0
	.dd LM172-_speech_end_address
	.dw 0x0d,0x0a
.code
LM172:
	R1=[_RES_T053_16K_EA]	// QImode move
	[BP]=R1	// QImode move
	pc=L101	// jump
L110:
.debug
	.dw '.stabn 0x44,0,357,',0,0
	.dd LM173-_speech_end_address
	.dw 0x0d,0x0a
.code
LM173:
	R1=[_RES_T054_16K_EA]	// QImode move
	[BP]=R1	// QImode move
	pc=L101	// jump
L111:
.debug
	.dw '.stabn 0x44,0,358,',0,0
	.dd LM174-_speech_end_address
	.dw 0x0d,0x0a
.code
LM174:
	R1=[_RES_T055_16K_EA]	// QImode move
	[BP]=R1	// QImode move
	pc=L101	// jump
L112:
.debug
	.dw '.stabn 0x44,0,359,',0,0
	.dd LM175-_speech_end_address
	.dw 0x0d,0x0a
.code
LM175:
	R1=[_RES_T056_16K_EA]	// QImode move
	[BP]=R1	// QImode move
	pc=L101	// jump
L113:
.debug
	.dw '.stabn 0x44,0,360,',0,0
	.dd LM176-_speech_end_address
	.dw 0x0d,0x0a
.code
LM176:
	R1=[_RES_T034_16K_EA]	// QImode move
	[BP]=R1	// QImode move
	pc=L101	// jump
L114:
.debug
	.dw '.stabn 0x44,0,361,',0,0
	.dd LM177-_speech_end_address
	.dw 0x0d,0x0a
.code
LM177:
	pc=L101	// jump
L101:
.debug
	.dw '.stabn 0x44,0,363,',0,0
	.dd LM178-_speech_end_address
	.dw 0x0d,0x0a
.code
LM178:
	R3=[BP]	// QImode move
	R1=R3	// QImode move
	pc=L100	// jump
.debug
	.dw '.stabn 0x44,0,364,',0,0
	.dd LM179-_speech_end_address
	.dw 0x0d,0x0a
.code
LM179:
LBE16:
.debug
	.dw '.stabn 0x44,0,364,',0,0
	.dd LM180-_speech_end_address
	.dw 0x0d,0x0a
.code
LM180:
L100:

	sp+=1
	pop bp from [sp]
	retf
	.endp	// end of speech_end_address

.debug
	.dw '.stabs "m:p1",160,0,0,4',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB16-_speech_end_address
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "iEndAddress:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE16-_speech_end_address
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME10-_speech_end_address
	.dw 0x0d,0x0a
.code
LME10:
.code
.debug
	.dw '.stabs "temperature_speech_play:F19",36,0,0,',0,0,offset _temperature_speech_play,seg _temperature_speech_play,0x0d,0x0a
.CODE
.public _temperature_speech_play
_temperature_speech_play:	.proc
.debug
	.dw '.stabn 0x44,0,375,',0,0
	.dd LM181-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM181:
	// total=2, vars=2
	// frame_pointer_needed: 1
	push bp to [sp]
	sp-=2
	bp=sp+1

	R1=BP+5
	[bp+1]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,376,',0,0
	.dd LM182-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM182:
LBB17:
	R1=0	// QImode move
	[BP]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,377,',0,0
	.dd LM183-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM183:
	call _SP_INT_IRQ6	// call with return value
.debug
	.dw '.stabn 0x44,0,378,',0,0
	.dd LM184-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM184:
	call _SACM_A2000_TestQueue	// call with return value
	CMP R1,1	// QImode compare
	JNZ L123	// QImode EQ
	PC=L118
L123:
.debug
	.dw '.stabn 0x44,0,380,',0,0
	.dd LM185-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM185:
LBB18:
	R1=[_iAddrSpeech]	// QImode move
	[SP--]=R1	// QImode move
	call _SP_GetResource	// call with return value
	SP=SP+1
	[_iRet]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,381,',0,0
	.dd LM186-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM186:
	R1=[_iRet]	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_A2000_FillQueue	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,382,',0,0
	.dd LM187-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM187:
	R1=[_iAddrSpeech]	// QImode move
	R2=1	// QImode move
	[_iAddrSpeech]=R1+R2
.debug
	.dw '.stabn 0x44,0,383,',0,0
	.dd LM188-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM188:
LBE18:
L118:
.debug
	.dw '.stabn 0x44,0,384,',0,0
	.dd LM189-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM189:
	R1=_iaSpeech_index	// QImode move
	R2=[_iNumber]	// QImode move
	R1+=R2	// addqi3_r0r
	R3=R1	// QImode move
	R2=[R3]	// QImode move
	[SP--]=R2	// QImode move
	call _speech_end_address	// call with return value
	SP=SP+1
	R2=[_iAddrSpeech]	// QImode move
	CMP R2,R1	// QImode compare
	JL L124	// QImode GE
	PC=L119
L124:
.debug
	.dw '.stabn 0x44,0,385,',0,0
	.dd LM190-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM190:
	call _SACM_A2000_Decoder	// call with return value
	pc=L120	// jump
L119:
.debug
	.dw '.stabn 0x44,0,387,',0,0
	.dd LM191-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM191:
	R1=[_iPlay_times]	// QImode move
	R2=(-1)	// QImode move
	[_iPlay_times]=R1+R2
.debug
	.dw '.stabn 0x44,0,388,',0,0
	.dd LM192-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM192:
	R1=[_iPlay_times]	// QImode move
	CMP R1,0	// QImode test
	JZ L125	// QImode NE
	PC=L121
L125:
.debug
	.dw '.stabn 0x44,0,389,',0,0
	.dd LM193-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM193:
LBB19:
	call _SACM_A2000_Stop	// call with return value
.debug
	.dw '.stabn 0x44,0,390,',0,0
	.dd LM194-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM194:
	R1=0	// QImode move
	[_guifgSpeechPlay]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,391,',0,0
	.dd LM195-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM195:
	R1=0	// QImode move
	[_iNumber]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,392,',0,0
	.dd LM196-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM196:
	call _SP_INT_IRQ6	// call with return value
.debug
	.dw '.stabn 0x44,0,393,',0,0
	.dd LM197-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM197:
	call _SP_INT_IRQ5	// call with return value
.debug
	.dw '.stabn 0x44,0,394,',0,0
	.dd LM198-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM198:
	call _ADC_Init	// call with return value
.debug
	.dw '.stabn 0x44,0,395,',0,0
	.dd LM199-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM199:
LBE19:
	pc=L120	// jump
L121:
.debug
	.dw '.stabn 0x44,0,397,',0,0
	.dd LM200-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM200:
LBB20:
	R1=[_iNumber]	// QImode move
	R2=1	// QImode move
	[_iNumber]=R1+R2
.debug
	.dw '.stabn 0x44,0,398,',0,0
	.dd LM201-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM201:
	R1=_iaSpeech_index	// QImode move
	R2=[_iNumber]	// QImode move
	R1+=R2	// addqi3_r0r
	R3=R1	// QImode move
	R2=[R3]	// QImode move
	[SP--]=R2	// QImode move
	call _speech_start_address	// call with return value
	SP=SP+1
	[_iAddrSpeech]=R1	// QImode move
.debug
	.dw '.stabn 0x44,0,399,',0,0
	.dd LM202-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM202:
	R1=2	// QImode move
	[SP--]=R1	// QImode move
	call _SACM_A2000_InitDecoder	// call with return value
	SP=SP+1
.debug
	.dw '.stabn 0x44,0,401,',0,0
	.dd LM203-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM203:
LBE20:
L122:
L120:
.debug
	.dw '.stabn 0x44,0,403,',0,0
	.dd LM204-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM204:
LBE17:
.debug
	.dw '.stabn 0x44,0,403,',0,0
	.dd LM205-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LM205:
L117:

	sp+=2
	pop bp from [sp]
	retf
	.endp	// end of temperature_speech_play

.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB17-_temperature_speech_play
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabs "k:1",128,0,0,0',0x0d,0x0a
.CODE
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB18-_temperature_speech_play
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE18-_temperature_speech_play
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB19-_temperature_speech_play
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE19-_temperature_speech_play
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xc0,0,0,',0,0
	.dd LBB20-_temperature_speech_play
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE20-_temperature_speech_play
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabn 0xe0,0,0,',0,0
	.dd LBE17-_temperature_speech_play
	.dw 0x0d,0x0a
.code
.debug
	.dw '.stabf ',0,0
	.dd LME11-_temperature_speech_play
	.dw 0x0d,0x0a
.code
LME11:
.debug
	.dw '.stabs "iRet:G1",32,0,0,',0,0,offset _iRet,seg _iRet,0x0d,0x0a
.CODE
.ram
.public _iRet
_iRet:
	.dw 0
.debug
	.dw '.stabs "iaSpeech_index:G26=ar1;0;3;1",32,0,0,',0,0,offset _iaSpeech_index,seg _iaSpeech_index,0x0d,0x0a
.CODE
.ram
.public _iaSpeech_index
_iaSpeech_index:
	.dw 4 dup(0)
.debug
	.dw '.stabs "guifgSpeechPlay:G4",32,0,0,',0,0,offset _guifgSpeechPlay,seg _guifgSpeechPlay,0x0d,0x0a
.CODE
.ram
.public _guifgSpeechPlay
_guifgSpeechPlay:
	.dw 0
.debug
	.dw '.stabs "stPID:G21",32,0,0,',0,0,offset _stPID,seg _stPID,0x0d,0x0a
.CODE
.ram
.public _stPID
_stPID:
	.dw 10 dup(0)
.debug
	.dw '.stabs "status:G22",32,0,0,',0,0,offset _status,seg _status,0x0d,0x0a
.CODE
.ram
.public _status
_status:
	.dw 0
.debug
	.dw '.stabs "giADC_DataSave:G27=ar1;0;10;4",32,0,0,',0,0,offset _giADC_DataSave,seg _giADC_DataSave,0x0d,0x0a
.CODE
.ram
.public _giADC_DataSave
_giADC_DataSave:
	.dw 11 dup(0)
.debug
	.dw '.stabs "iAddrSpeech:G1",32,0,0,',0,0,offset _iAddrSpeech,seg _iAddrSpeech,0x0d,0x0a
.CODE
.ram
.public _iAddrSpeech
_iAddrSpeech:
	.dw 0
.external _SACM_A2000_InitDecoder
.external _ADC_Init
.external _SP_INT_IRQ5
.external _SACM_A2000_Stop
.external _SACM_A2000_Decoder
.external _SACM_A2000_FillQueue
.external _SP_GetResource
.external _SACM_A2000_TestQueue
.external _SP_INT_IRQ6
.external _RES_T034_16K_EA
.external _RES_T056_16K_EA
.external _RES_T055_16K_EA
.external _RES_T054_16K_EA
.external _RES_T053_16K_EA
.external _RES_T052_16K_EA
.external _RES_T051_16K_EA
.external _RES_T050_16K_EA
.external _RES_T049_16K_EA
.external _RES_T048_16K_EA
.external _RES_T047_16K_EA
.external _RES_T046_16K_EA
.external _RES_T034_16K_SA
.external _RES_T056_16K_SA
.external _RES_T055_16K_SA
.external _RES_T054_16K_SA
.external _RES_T053_16K_SA
.external _RES_T052_16K_SA
.external _RES_T051_16K_SA
.external _RES_T050_16K_SA
.external _RES_T049_16K_SA
.external _RES_T048_16K_SA
.external _RES_T047_16K_SA
.external _RES_T046_16K_SA
.external _turn_off_IRQ5
.external _SP_INT_TIMEB
.external _turn_on_relay
.external _turn_off_timerB
.external _turn_off_relay
.external _SACM_A2000_Initial
.external _G_ADC_flag
.external _System_ServiceLoop
.external _Clear_WatchDog
.external _SP_GetCh
.external _System_Initial
.external __cmpf2
.external __mulf2
.external __cvi1f2
.external __cvf2i1
.external __modi1
.external __divi1
.external __addf2
	.end
