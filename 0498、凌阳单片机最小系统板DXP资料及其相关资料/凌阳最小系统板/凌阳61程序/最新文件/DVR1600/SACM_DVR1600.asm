//========================================================
//	�ļ����ƣ�	SACM_DVR1600.asm
//	����������	DVR1600���������û��ӿڳ���
//				һ������½����޸�C_SYSTEMCLOCK��C_CLOCK_SET����
//	ά����¼��	2006-10-16	v1.0, by Qwerty
//========================================================

//=========================================================================
//	�����ļ�
//=========================================================================
.INCLUDE SPCE061A.inc

//=========================================================================
//	���������Ƿ�����
//=========================================================================
.DEFINE C_20M						20480000
.DEFINE C_24M						24576000
.DEFINE C_32M						32768000
.DEFINE C_40M						40960000
.DEFINE C_49M						49152000

//***** �������޸�C_SYSTEMCLOCK��C_CLOCK_SET ******************************
.DEFINE C_SYSTEM_CLOCK				C_49M
.DEFINE	C_CLOCK_SET					C_Fosc_49M	// value of [P_SystemClock], defined in spce061a.inc
//*************************************************************************

.DEFINE C_Timer_Setting_8K			65536 - (C_SYSTEM_CLOCK/2)/8000
.DEFINE C_Timer_Setting_16K			65536 - (C_SYSTEM_CLOCK/2)/16000
.DEFINE C_Timer_Setting_32K			65536 - (C_SYSTEM_CLOCK/2)/32000

.DEFINE C_DVR1600_Timer_Setting_X1	C_Timer_Setting_8K
.DEFINE C_DVR1600_Timer_Setting_X2	C_Timer_Setting_16K
.DEFINE C_DVR1600_Timer_Setting_X4	C_Timer_Setting_32K

//=========================================================================
//	ȫ�ֺ�������
//=========================================================================
.PUBLIC F_SACM_DVR1600_Init
.PUBLIC F_SACM_DVR1600_DAC_Timer_X1
.PUBLIC F_SACM_DVR1600_DAC_Timer_X2
.PUBLIC F_SACM_DVR1600_ADC_Timer_X1
.PUBLIC F_SACM_DVR1600_ADC_Timer_X2
.PUBLIC F_SACM_DVR1600_ADC_Timer_X4
.PUBLIC F_SACM_DVR1600_SendDAC1
.PUBLIC F_SACM_DVR1600_SendDAC2
.PUBLIC F_SACM_DVR1600_GetADC
.PUBLIC F_SACM_DVR1600_EndPlay
.PUBLIC F_SACM_DVR1600_EndRecord
.PUBLIC F_SACM_DVR1600_RampUpDAC1
.PUBLIC F_SACM_DVR1600_RampUpDAC2
.PUBLIC F_SACM_DVR1600_RampDnDAC1
.PUBLIC F_SACM_DVR1600_RampDnDAC2

.CODE
//======================================================
// �������ƣ�	SACM_DVR1600_Init
// C���ã�		��
// �����ã�	F_SACM_DVR1600_Init
// ʵ�ֹ��ܣ�   (�����⺯������)DVR1600��ʼ������
// ��ڲ�����	��
// ���ڲ�����	��
// �ƻ��Ĵ�����	r1
//======================================================
F_SACM_DVR1600_Init:
	fir_mov off
	r1 = C_CLOCK_SET				// Setup system clock
	[P_SystemClock] = r1
	
	r1 = 0x00A0						// Latch DAC1 by TimerA; Latch DAC2 by TimerA
	[P_DAC_Ctrl] = r1
	
	r1 = 0x0005
	[P_ADC_Ctrl] = r1

	r1 = [P_INT_Mask]
	r1 |= C_FIQ_TMA					// Enable Timer A FIQ
	[P_INT_Mask] = r1
	fiq on
	retf

//======================================================
// �������ƣ�	SACM_DVR1600_DAC_Timer_X1
// C���ã�		��
// �����ã�	F_SACM_DVR1600_DAC_Timer_X1
// ʵ�ֹ��ܣ�   (�����⺯������)��DAC_FIRTypeѡ��0ʱִ�е�Timer��ʼ������(��ʼ��Ϊ8000Hz)
// ��ڲ�����	��
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
F_SACM_DVR1600_DAC_Timer_X1:
	push r1 to [sp]
	r1 = 0x0030						// TimerA CKA=Fosc/2 CKB=1 Tout:off
	[P_TimerA_Ctrl] = r1
	r1= C_DVR1600_Timer_Setting_X1	// TimerA setting
	[P_TimerA_Data] = r1
	pop r1 from [sp]
	retf

//======================================================
// �������ƣ�	SACM_DVR1600_DAC_Timer_X2
// C���ã�		��
// �����ã�	F_SACM_DVR1600_DAC_Timer_X2
// ʵ�ֹ��ܣ�   (�����⺯������)��DAC_FIRTypeѡ��1~3ʱִ�е�Timer��ʼ������(��ʼ��Ϊ16000Hz)
// ��ڲ�����	��
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
F_SACM_DVR1600_DAC_Timer_X2:
	push r1 to [sp]
	r1 = 0x0030						// TimerA CKA=Fosc/2 CKB=1 Tout:off
	[P_TimerA_Ctrl] = r1
	r1= C_DVR1600_Timer_Setting_X2	// TimerA setting
	[P_TimerA_Data] = r1
	pop r1 from [sp]
	retf

//======================================================
// �������ƣ�	SACM_DVR1600_ADC_Timer_X1
// C���ã�		��
// �����ã�	F_SACM_DVR1600_ADC_Timer_X1
// ʵ�ֹ��ܣ�   (�����⺯������)��ADC_FIRTypeѡ��0ʱִ�е�Timer��ʼ������(��ʼ��Ϊ8000Hz)
// ��ڲ�����	��
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
F_SACM_DVR1600_ADC_Timer_X1:
	push r1 to [sp]
	r1 = 0x0030						// TimerA CKA=Fosc/2 CKB=1 Tout:off
	[P_TimerA_Ctrl] = r1
	r1= C_DVR1600_Timer_Setting_X1	// TimerA setting
	[P_TimerA_Data] = r1
	pop r1 from [sp]
	retf

//======================================================
// �������ƣ�	SACM_DVR1600_ADC_Timer_X2
// C���ã�		��
// �����ã�	F_SACM_DVR1600_ADC_Timer_X2
// ʵ�ֹ��ܣ�   (�����⺯������)��ADC_FIRTypeѡ��1ʱִ�е�Timer��ʼ������(��ʼ��Ϊ16000Hz)
// ��ڲ�����	��
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
F_SACM_DVR1600_ADC_Timer_X2:
	push r1 to [sp]
	r1 = 0x0030						// TimerA CKA=Fosc/2 CKB=1 Tout:off
	[P_TimerA_Ctrl] = r1
	r1= C_DVR1600_Timer_Setting_X2	// TimerA setting
	[P_TimerA_Data] = r1
	pop r1 from [sp]
	retf

//======================================================
// �������ƣ�	SACM_DVR1600_ADC_Timer_X4
// C���ã�		��
// �����ã�	F_SACM_DVR1600_ADC_Timer_X4
// ʵ�ֹ��ܣ�   (�����⺯������)��ADC_FIRTypeѡ��2ʱִ�е�Timer��ʼ������(��ʼ��Ϊ32000Hz)
// ��ڲ�����	��
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
F_SACM_DVR1600_ADC_Timer_X4:
	push r1 to [sp]
	r1 = 0x0030						// TimerA CKA=Fosc/2 CKB=1 Tout:off
	[P_TimerA_Ctrl] = r1
	r1= C_DVR1600_Timer_Setting_X4	// TimerA setting
	[P_TimerA_Data] = r1
	pop r1 from [sp]
	retf

//======================================================
// �������ƣ�	SACM_DVR1600_SendDAC1
// C���ã�		��
// �����ã�	F_SACM_DVR1600_SendDAC1
// ʵ�ֹ��ܣ�   (�����⺯������)��������������DAC1�������
// ��ڲ�����	r1 - ���������������
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
F_SACM_DVR1600_SendDAC1:
	push r1 to [sp]
	[P_DAC1] = r1
	pop r1 from [sp]
	retf

//======================================================
// �������ƣ�	SACM_DVR1600_SendDAC2
// C���ã�		��
// �����ã�	F_SACM_DVR1600_SendDAC2
// ʵ�ֹ��ܣ�   (�����⺯������)��������������DAC2�������
// ��ڲ�����	r1 - ���������������
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
F_SACM_DVR1600_SendDAC2:
	push r1 to [sp]
	[P_DAC2] = r1
	pop r1 from [sp]
	retf

//======================================================
// �������ƣ�	SACM_DVR1600_GetADC
// C���ã�		��
// �����ã�	F_SACM_DVR1600_GetADC
// ʵ�ֹ��ܣ�   (�����⺯������)ִ��A/Dת��
// ��ڲ�����	��
// ���ڲ�����	r1 - ת���õ���������
// �ƻ��Ĵ�����	r1
//======================================================
F_SACM_DVR1600_GetADC:
	r1 = [P_ADC]
	retf


//======================================================
// �������ƣ�	SACM_DVR1600_EndPlay
// C���ã�		��
// �����ã�	SACM_DVR1600_EndPlay
// ʵ�ֹ��ܣ�   (�����⺯������)��һ�������������ʱִ�еĹ���
// ��ڲ�����	��
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
F_SACM_DVR1600_EndPlay:
	nop
	retf

//======================================================
// �������ƣ�	SACM_DVR1600_EndRecord
// C���ã�		��
// �����ã�	SACM_DVR1600_EndRecord
// ʵ�ֹ��ܣ�   (�����⺯������)��һ�������������ʱִ�еĹ���
// ��ڲ�����	��
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
F_SACM_DVR1600_EndRecord:
	nop
	retf

//======================================================
// �������ƣ�	SACM_DVR1600_RampUpDAC1
// C���ã�		��
// �����ã�	F_SACM_DVR1600_RampUpDAC1
// ʵ�ֹ��ܣ�   (�����⺯������)��һ���������ſ�ʼǰִ�еĽ������(DAC1)
// ��ڲ�����	��
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
F_SACM_DVR1600_RampUpDAC1:
	push r1 to [sp]
	r1 = [P_DAC1]
	r1 &= 0xffc0
	cmp r1, 0x8000
	jb ?L_Loop2
	je ?L_Exit
?L_Loop1:
	call F_SACM_RampDelay
	r1 -= 0x0040
	[P_DAC1] = r1
	cmp r1, 0x8000
	jne ?L_Loop1
	jmp ?L_Exit
?L_Loop2:
	call F_SACM_RampDelay
	r1 += 0x0040
	[P_DAC1] = r1
	cmp r1, 0x8000
	jne ?L_Loop2
?L_Exit:
	pop r1 from [sp]
	retf

//======================================================
// �������ƣ�	SACM_DVR1600_RampUpDAC2
// C���ã�		��
// �����ã�	F_SACM_DVR1600_RampUpDAC2
// ʵ�ֹ��ܣ�   (�����⺯������)��һ���������ſ�ʼǰִ�еĽ������(DAC2)
// ��ڲ�����	��
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
F_SACM_DVR1600_RampUpDAC2:
	push r1 to [sp]
	r1 = [P_DAC2]
	r1 &= 0xffc0
	cmp r1, 0x8000
	jb ?L_Loop2
	je ?L_Exit
?L_Loop1:
	call F_SACM_RampDelay
	r1 -= 0x0040
	[P_DAC2] = r1
	cmp r1, 0x8000
	jne ?L_Loop1
	jmp ?L_Exit
?L_Loop2:
	call F_SACM_RampDelay
	r1 += 0x0040
	[P_DAC2] = r1
	cmp r1, 0x8000
	jne ?L_Loop2
?L_Exit:
	pop r1 from [sp]
	retf

//======================================================
// �������ƣ�	SACM_DVR1600_RampDnDAC1
// C���ã�		��
// �����ã�	F_SACM_DVR1600_RampDnDAC1
// ʵ�ֹ��ܣ�   (�����⺯������)��һ���������Ž�����ִ�еĽ�������(DAC1)
// ��ڲ�����	��
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
F_SACM_DVR1600_RampDnDAC1:
	push r1 to [sp]
	r1 = [P_DAC1]
	r1 &= 0xffc0
	jz ?L_Exit
?L_Loop:
	call F_SACM_RampDelay
	r1 -= 0x0040
	[P_DAC1] = r1
	jnz ?L_Loop
?L_Exit:
	pop r1 from [sp]
	retf

//======================================================
// �������ƣ�	SACM_DVR1600_RampDnDAC2
// C���ã�		��
// �����ã�	F_SACM_DVR1600_RampDnDAC2
// ʵ�ֹ��ܣ�   (�����⺯������)��һ���������Ž�����ִ�еĽ�������(DAC2)
// ��ڲ�����	��
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
F_SACM_DVR1600_RampDnDAC2:
	push r1 to [sp]
	r1 = [P_DAC2]
	r1 &= 0xffc0
	jz ?L_Exit
?L_Loop:
	call F_SACM_RampDelay
	r1 -= 0x0040
	[P_DAC2] = r1
	jnz ?L_Loop
?L_Exit:
	pop r1 from [sp]
	retf


//======================================================
// �������ƣ�	SACM_RampDelay
// C���ã�		��
// �����ã�	F_SACM_RampDelay
// ʵ�ֹ��ܣ�   (����RampUp/RampDn��������)��ʱ����
// ��ڲ�����	��
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
.DEFINE C_SACM_RAMP_DELAY   80
F_SACM_RampDelay:
	push r1 to [sp]
	r1 = C_SACM_RAMP_DELAY 			// Ramp Up/Dn delay per step
?L_Loop:
	r1 -= 0x0001
	jnz ?L_Loop
	pop r1 from [sp]
	retf
