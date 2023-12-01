//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//             (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                          ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
// �ļ����ƣ�Key.asm
// ʵ�ֹ��ܣ�4*4����ɨ�����ʹ��IRQ6_TMB2�ж�(128Hz)
// ���ڣ�    2005/6/18
//============================================================

//================================================
//	����ȥ����ʱ���趨����λΪ1/128��
//================================================
.DEFINE Key_Debounce	4			//(4/128)��=31ms
//================================================
//	��������ʱ�����趨����λ1/128��
//================================================
.DEFINE Key_TimeOut		64			//(64/128)��=0.5s

//================================================
//	����ʹ�ö˿��趨
//================================================
.DEFINE Key_IO_Port			0		// ������ʹ��IOA������ø��ж���
//.DEFINE Key_IO_Port			1		// ������ʹ��IOB������ø��ж���

.DEFINE Key_IO_HighByte		0		// ������ʹ��IO�ڵ�8λ����ø��ж���
//.DEFINE Key_IO_HighByte		1		// ������ʹ��IO�ڸ�8λ����ø��ж���

/////-----       �����޸�����Ķ���	    -----/////
.IF Key_IO_HighByte==0
	.DEFINE Key_ALL			0x00ff		
	.DEFINE Key_NibbleL		0x000f
	.DEFINE Key_NibbleH		0x00f0
.ELSE
	.DEFINE Key_ALL			0xff00
	.DEFINE Key_NibbleL		0x0f00
	.DEFINE Key_NibbleH		0xf000
.ENDIF
/////-----       �����޸�����Ķ���	    -----/////
.IF Key_IO_Port==0
	.DEFINE P_Key_Data		0x7000
	.DEFINE P_Key_Buf		0x7001
	.DEFINE P_Key_Dir		0x7002
	.DEFINE P_Key_Attrib	0x7003
.ELSE
	.DEFINE P_Key_Data		0x7005
	.DEFINE P_Key_Buf		0x7006
	.DEFINE P_Key_Dir		0x7007
	.DEFINE P_Key_Attrib	0x7008
.ENDIF


.DEFINE P_INT_Mask			0x702d
.DEFINE P_TimeBase_Setup	0x700e
.DEFINE	P_Watchdog_Clear	0x7012
.DEFINE C_IRQ6_TMB2			0x0001
.DEFINE C_TMB2_128Hz		0x0000

.PUBLIC F_Key_Init
.PUBLIC _Key_Init
.PUBLIC F_Key_Scan
.PUBLIC _Key_Scan
.PUBLIC F_Key_Get
.PUBLIC _Key_Get

.RAM
.VAR KeyCode						// �洢��õļ�ֵ
.VAR ScanCnt						// �ñ���������ʾ��������ʱ��
.VAR KeyUp							// �����Ƿ���̧��״̬

.CODE
//======================================================
// �������ƣ�	Key_Init
// C���ã�		void Key_Init(void)
// �����ã�	F_Key_Init
// ʵ�ֹ��ܣ�   ��ʼ������ɨ����򣬸ú���������IRQ6_TMB2�ж�
// ��ڲ�����	��
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
F_Key_Init:
_Key_Init:
	push r1 to [sp]
	INT Off
	r1 = [P_Key_Dir]				// ��ʼ��IO, ��4λ�������룬��4λ�����
	r1 |= Key_NibbleH
	r1 &= ~Key_NibbleL
	[P_Key_Dir] = r1
	r1 = [P_Key_Attrib]
	r1 |= Key_NibbleH
	r1 &= ~Key_NibbleL
	[P_Key_Attrib] = r1
	r1 = [P_Key_Buf]
	r1 |= Key_NibbleH
	r1 &= ~Key_NibbleL
	[P_Key_Buf] = r1
	
	r1 = 0
	[ScanCnt] = r1					// ��ʼ������
	[KeyCode] = r1
	[KeyUp] = r1
	r1 = C_TMB2_128Hz				// ����IRQ6_TMB2(128Hz)�ж�
	[P_TimeBase_Setup] = r1
	r1 = [P_INT_Mask]
	r1 |= C_IRQ6_TMB2
	[P_INT_Mask] = r1
	INT FIQ,IRQ
	pop r1 from [sp]
retf

//======================================================
// �������ƣ�	Key_Scan
// C���ã�		void Key_Scan(void)
// �����ã�	F_Key_Scan
// ʵ�ֹ��ܣ�   ����ɨ�裬�ú�����IRQ6_TMB2�жϷ���������
// ��ڲ�����	��
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
F_Key_Scan:
_Key_Scan:
	push r1,r4 to [sp]

//	r1 = [P_Key_Dir]				// ��ʼ��IO, ��4λ�������룬��4λ�����
//	r1 |= Key_NibbleH
//	r1 &= ~Key_NibbleL
//	[P_Key_Dir] = r1
//	r1 = [P_Key_Attrib]
//	r1 |= Key_NibbleH
//	r1 &= ~Key_NibbleL
//	[P_Key_Attrib] = r1
//	r1 = [P_Key_Buf]
//	r1 |= Key_NibbleH
//	r1 &= ~Key_NibbleL
//	[P_Key_Buf] = r1

	r2 = [P_Key_Data]				// ��ȡIO�˿�״̬
	r2 &= Key_NibbleL
	jnz ?L_ScanKey_Down				// �жϵ�ǰ�Ƿ��м�����
?L_ScanKey_Up:
	r1 = 1							// �����������̧��״̬��KeyUp��1
	[KeyUp] = r1
	goto ?L_ScanKey_Exit
?L_ScanKey_Down:
	r1 = 0							// KeyUp��0
	[KeyUp] = r1
	r4 = [P_Key_Buf]

	r3 = Key_NibbleH & 0x1010
	r1 = r4 & ~Key_NibbleH			// ɨ���1��(����1��IO����øߣ���������״̬�Ƿ�仯)
	r1 |= r3
	[P_Key_Buf] = r1
	r1 = [P_Key_Data]
	r1 &= Key_NibbleL
	jnz ?L_GetCode
	
	r3 = Key_NibbleH & 0x2020		// ɨ���2��
	r1 = r4 & ~Key_NibbleH
	r1 |= r3
	[P_Key_Buf] = r1
	r1 = [P_Key_Data]
	r1 &= Key_NibbleL
	jnz ?L_GetCode

	r3 = Key_NibbleH & 0x4040		// ɨ���3��
	r1 = r4 & ~Key_NibbleH
	r1 |= r3
	[P_Key_Buf] = r1
	r1 = [P_Key_Data]
	r1 &= Key_NibbleL
	jnz ?L_GetCode

	r3 = Key_NibbleH & 0x8080		// ɨ���4��
	r1 = r4 & ~Key_NibbleH
	r1 |= r3
	[P_Key_Buf] = r1
	r1 = [P_Key_Data]
	r1 &= Key_NibbleL
	jnz ?L_GetCode
	jmp ?L_ScanKey_Up				// ���δɨ�赽����
?L_GetCode:
	r1 = [P_Key_Buf]				// ���³�ʼ��IO
	r1 |= Key_NibbleH
	[P_Key_Data] = r1
	
	r2 |= r3
.IF Key_IO_HighByte
	r2 = r2 lsr 4
	r2 = r2 lsr 4
.ENDIF
	cmp r2,[KeyCode]				// ���εõ��ļ�ֵ���ϴεõ��ļ�ֵ�Ƚ�
	je	?L_ScanKey_Cont
?L_ScanKey_New:						// ������ϴμ�ֵ��ͬ�����ü�ֵ
	[KeyCode] = r2
	r1 = 1							// ���¼�¼���������µ�ʱ��
	[ScanCnt] = r1
	jmp ?L_ScanKey_Exit
?L_ScanKey_Cont:					// ����˴μ�ֵ���ϴμ�ֵ��ͬ
	r1 = [ScanCnt]					// ���°�������ʱ��(ScanCnt��1)
	r1 += 1
	[ScanCnt] = r1
?L_ScanKey_Exit:
	pop r1,r4 from [sp]
retf

//======================================================
// �������ƣ�	Key_Get
// C���ã�		unsigned Key_Get(void)
// �����ã�	F_Key_Get
// ʵ�ֹ��ܣ�   ��ȡ��ֵ
// ��ڲ�����	��
// ���ڲ�����	r1 - ��õļ�ֵ
// �ƻ��Ĵ�����	r1
//======================================================
F_Key_Get:
_Key_Get:
	INT OFF
	push r2 to [sp]
	r2 = 0x01
	[P_Watchdog_Clear] = r2
	r2 = [ScanCnt]
	cmp r2,Key_Debounce				// �����������ʱ��С��Key_Debounce
	jb	?L_GetKey_NoKey				// ����Ϊ��ǰû�м�����
	cmp r2,Key_TimeOut				// �����������ʱ�����Key_TimeOut
	jnb ?L_GetKey					// ����Ϊ������һ�ΰ���
	r2 = [KeyUp]					// �����������ʱ����Key_Debounce��Key_TimeOut֮��
	jnz ?L_GetKey					// �����������̧��״̬����Ϊ������һ�ΰ���
?L_GetKey_NoKey:
	r1 = 0							// û�а����򷵻�0
	jmp ?L_GetKey_Exit
?L_GetKey:
	r1 = [KeyCode]					// �а����򷵻ؼ�ֵ
	r2 = 0
	[KeyCode] = r2					// ���³�ʼ������
	[ScanCnt] = r2
	[KeyUp] = r2
?L_GetKey_Exit:
	INT FIQ,IRQ
	pop r2 from [sp]
retf
