//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//             (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                          ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
// �ļ����ƣ�Dig.asm
// ʵ�ֹ��ܣ������������ʾ��������ʹ��IRQ4_4KHz�ж�
// ���ڣ�    2005/12/2
//============================================================

//================================================
//	LED�ο��ƶ˿��趨
//================================================

.DEFINE SEG_IO_Port			0		// ��LED��ѡʹ��IOA������ø��ж���
//.DEFINE SEG_IO_Port			1		// ��LED��ѡʹ��IOB������ø��ж���

.DEFINE SEG_IO_HighByte		0		// ��LED��ѡʹ��IO�ڵ�8λ����ø��ж���
//.DEFINE SEG_IO_HighByte		1		// ��LED��ѡʹ��IO�ڸ�8λ����ø��ж���

//================================================
//	LEDλ���ƶ˿��趨
//================================================
//.DEFINE DIG_IO_Port			0		// ��LEDλѡʹ��IOA������ø��ж���
.DEFINE DIG_IO_Port			1		// ��LEDλѡʹ��IOB������ø��ж���

/////-----   ����ܵ�λ��   -----/////
.DEFINE DIG_Count			6

/////-----   �����ÿһλ�Ŀ��ƽ��趨   -----/////
.DATA
PIN_DIG:
	.DW 0x8000,0x4000,0x2000,0x1000,0x0004,0x0002,0x0001

/////-----   ���������λ�Ŀ��ƽ��趨��Ӧ����PIN_DIG������֮��   -----/////
.DEFINE PIN_DIG_ALL			0xf007					

//================================================
//	�����޸�����Ķ���
//================================================

.IF	SEG_IO_Port==0
	.DEFINE P_SEG_Data		0x7000
	.DEFINE P_SEG_Buf		0x7001
	.DEFINE P_SEG_Dir		0x7002
	.DEFINE P_SEG_Attrib	0x7003
.ELSE
	.DEFINE P_SEG_Data		0x7005
	.DEFINE P_SEG_Buf		0x7006
	.DEFINE P_SEG_Dir		0x7007
	.DEFINE P_SEG_Attrib	0x7008
.ENDIF

.IF SEG_IO_HighByte==0
	.DEFINE PIN_SEG_ALL		0x00ff
.ELSE
	.DEFINE PIN_SEG_ALL		0xff00
.ENDIF

.IF	DIG_IO_Port==0
	.DEFINE P_DIG_Data		0x7000
	.DEFINE P_DIG_Buf		0x7001
	.DEFINE P_DIG_Dir		0x7002
	.DEFINE P_DIG_Attrib	0x7003
.ELSE
	.DEFINE P_DIG_Data		0x7005
	.DEFINE P_DIG_Buf		0x7006
	.DEFINE P_DIG_Dir		0x7007
	.DEFINE P_DIG_Attrib	0x7008
.ENDIF

//================================================
//	�жϳ�������
//================================================

.DEFINE P_INT_Mask			0x702d
.DEFINE C_IRQ4_4KHz			0x0040


//================================================
//	��������
//================================================
.RAM
R_DIG_Buf:		.DW 		DIG_Count DUP (?)	// �������ʾ������
.IRAM
R_CurDIG:		.DW 		0xffff				// ��ǰ��ʾ�������λ��0xffff��ʾ����ʾ

//================================================
//	���к�������
//================================================
.PUBLIC F_DIG_Init
.PUBLIC _DIG_Init
.PUBLIC F_DIG_Set
.PUBLIC _DIG_Set
.PUBLIC F_DIG_SetAll
.PUBLIC _DIG_SetAll
.PUBLIC F_DIG_Get
.PUBLIC _DIG_Get
.PUBLIC F_DIG_GetAll
.PUBLIC _DIG_GetAll
.PUBLIC	F_DIG_Clear
.PUBLIC _DIG_Clear
.PUBLIC F_DIG_Drive
.PUBLIC _DIG_Drive
.PUBLIC F_DIG_Off
.PUBLIC _DIG_Off
.PUBLIC F_DIG_On
.PUBLIC _DIG_On

.code

//======================================================
// �������ƣ�	DIG_Init
// C���ã�		void DIG_Init(void)
// �����ã�	F_DIG_Init
// ʵ�ֹ��ܣ�   �������ʾ��ʼ�����ú���������IRQ4_4KHz�ж�
// ��ڲ�����	��
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
_DIG_Init:
F_DIG_Init:
	push r1,bp to [sp]
	INT Off

	r1 = DIG_Count
	r2 = 0x0000
	bp = R_DIG_Buf
?DIG_InitBuf:						// �����ʾ������
	[bp++] = r2
	r1 -= 1
	jnz ?DIG_InitBuf
	[R_CurDIG] = r2					// ��ǰ��ʾ��λ����Ϊ0
	
	r1 = [P_SEG_Attrib]				// ��ʼ����ѡIO
	r1 |= PIN_SEG_ALL
	[P_SEG_Attrib] = r1
	r1 = [P_SEG_Buf]
	r1 &= ~PIN_SEG_ALL
	[P_SEG_Data] = r1
	r1 = [P_SEG_Dir]
	r1 |= PIN_SEG_ALL
	[P_SEG_Dir] = r1
	
	r1 = [P_DIG_Attrib]				// ��ʼ��λѡIO
	r1 |= PIN_DIG_ALL
	[P_DIG_Attrib] = r1
	r1 = [P_DIG_Buf]
	r1 &= ~PIN_DIG_ALL
	[P_DIG_Buf] = r1
	r1 = [P_DIG_Dir]
	r1 |= PIN_DIG_ALL
	[P_DIG_Dir] = r1
	
	r1 = [P_INT_Mask]				// ����IRQ4_4KHz�ж�
	r1 |= C_IRQ4_4KHz
	[P_INT_Mask] = r1
	INT FIQ,IRQ

	pop r1,bp from [sp]
retf

//======================================================
// �������ƣ�	DIG_Set
// C���ã�		void DIG_Set(unsigned DigPos, unsigned DigBuffer)
// �����ã�	F_DIG_Set
// ʵ�ֹ��ܣ�   ���������ĳһλ����ʾ����
// ��ڲ�����	DigPos(r1) - ���õ������λ��1~DIG_Count��
//				DigBuffer(r2) - ����ܵ���ʾ����
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
_DIG_Set:
	push r1,r2 to [sp]
	r1 = sp + 5
	r1 = [r1]
	r2 = sp+6
	r2 = [r2]
	call F_DIG_Set
	pop r1,r2 from [sp]
retf

F_DIG_Set:
	push bp to [sp]
.IF SEG_IO_HighByte==1
	r2 = r2 lsl 4
	r2 = r2 lsl 4
.ENDIF
	r1 -= 1
	cmp r1,DIG_Count				// ���"λ"ֵ������Χ���˳�
	ja ?Exit
	bp = R_DIG_Buf					// ��R_DIG_Buf����ӦԪ���޸�Ϊ�趨ֵ
	bp += r1
	[bp] = r2
?Exit:
	pop bp from [sp]
retf

//======================================================
// �������ƣ�	DIG_SetAll
// C���ã�		void DIG_SetAll(unsigned *DigBuffer)
// �����ã�	F_DIG_SetAll
// ʵ�ֹ��ܣ�   ������������ܵ���ʾ����
// ��ڲ�����	DigBuffer(r1) - �������ʾ���ݵ���ʼ��ַ
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
_DIG_SetAll:
	push bp to [sp]
	bp = sp
	r1 = [bp+4]
	call F_DIG_SetAll
	pop bp from [sp]
retf

F_DIG_SetAll:
	push r2,bp to [sp]
	bp = r1
	r2 = DIG_Count
	r3 = R_DIG_Buf
?DIG_Set_Loop:
	r1 = [bp++]						// ��R_DIG_Buf�޸�Ϊ�趨ֵ
.IF SEG_IO_HighByte==1
	r1 = r1 lsl 4
	r1 = r1 lsl 4
.ENDIF
	[r3++] = r1
	r2 -= 1
	jnz ?DIG_Set_Loop
	pop r2,bp from [sp]
retf

//======================================================
// �������ƣ�	DIG_Get
// C���ã�		unsigned DIG_Get(unsigned DigPos)
// �����ã�	F_DIG_Get
// ʵ�ֹ��ܣ�   ��ȡ��������ܵ���ʾ����
// ��ڲ�����	DigPos(r1) - Ҫ��ȡ��ʾ���ݵ�λ
// ���ڲ�����	��λ����ܵ���ʾ����
// �ƻ��Ĵ�����	��
//======================================================
_DIG_Get:
	push bp to [sp]
	bp = sp
	r1 = [bp+4]
	call F_DIG_Get
	pop bp from [sp]
retf

F_DIG_Get:
	push r2 to [sp]
	r2 = R_DIG_Buf
	r2 += r1
	r1 = [r2]
.IF SEG_IO_HighByte==1
	r1 = r1 lsr 4
	r1 = r1 lsr 4
.ENDIF
	pop r2 from [sp]
retf

//======================================================
// �������ƣ�	DIG_GetAll
// C���ã�		unsigned *DIG_GetAll(unsigned *DigBuffer)
// �����ã�	F_DIG_GetAll
// ʵ�ֹ��ܣ�   ��ȡ��������ܵ���ʾ����
// ��ڲ�����	DigBuffer(r1) - �����������ʾ���ݵ���ʼ��ַ
// ���ڲ�����	�����������ʾ���ݵ���ʼ��ַ
// �ƻ��Ĵ�����	��
//======================================================
_DIG_GetAll:
	push bp to [sp]
	bp = sp
	r1 = [bp+4]
	call F_DIG_GetAll
	pop bp from [sp]
retf

F_DIG_GetAll:
	push r2,bp to [sp]
	bp = r1
	r2 = DIG_Count
	r3 = R_DIG_Buf
?DIG_Get_Loop:
	r4 = [r3++]
.IF SEG_IO_HighByte==1
	r4 = r4 lsr 4
	r4 = r4 lsr 4
.ENDIF
	[bp++] = r4
	r2 -= 1
	jnz ?DIG_Get_Loop
	pop r2,bp from [sp]
retf

//======================================================
// �������ƣ�	DIG_Clear
// C���ã�		void DIG_Clear(void)
// �����ã�	F_DIG_Clear
// ʵ�ֹ��ܣ� ��������������ʾ����
// ��ڲ�����	��
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
_DIG_Clear:
F_DIG_Clear:
	push r1, r2 to [sp]
	r1 = R_DIG_Buf
	r2 = 0x00
?L:
	[r1] = r2
	r1 += 1
	cmp r1, R_DIG_Buf+DIG_Count
	jb ?L
	pop r1, r2 from [sp]
retf


//======================================================
// �������ƣ�	DIG_Drive
// C���ã�		void DIG_Drive(void)
// �����ã�	F_DIG_Drive
// ʵ�ֹ��ܣ�   �������ʾ��������IRQ4_4KHz�жϷ���������
// ��ڲ�����	��
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
_DIG_Drive:
F_DIG_Drive:
	push r1,r4 to [sp]
	r1 = [R_CurDIG]					// �������ʾ��ֱ���˳�
	cmp r1,0xffff
	je	?DIG_Exit
	r2 = r1 + R_DIG_Buf
	r2 = [r2]
	r2 &= PIN_SEG_ALL

	r3 = [P_DIG_Buf]				// �����ǰλ��ʾ
	r3 &= ~PIN_DIG_ALL
	[P_DIG_Data] = r3
	
	r4 = [P_SEG_Buf]				// ����������
	r4 &= ~PIN_SEG_ALL
	r4 |= r2
	[P_SEG_Data] = r4
	
	r3 = [P_DIG_Buf]				// λ��������
	r4 = r1 + PIN_DIG
	r3 |= [r4]
	[P_DIG_Data] = r3
	
	r1 += 1							
	cmp r1,DIG_Count
	jb ?DIG_Next					// R_CurDIGָ����һλ
?DIG_Reverse:
	r1 = 0							// ������ʾ�����һλ��R_CurDIGָ���һλ
?DIG_Next:
	[R_CurDIG] = r1
?DIG_Exit:
	pop r1,r4 from [sp]
retf

//======================================================
// �������ƣ�	DIG_Off
// C���ã�		void DIG_Off(void)
// �����ã�	F_DIG_Off
// ʵ�ֹ��ܣ�   ֹͣ�������ʾ
// ��ڲ�����	��
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
_DIG_Off:
F_DIG_Off:
	push r1 to [sp]
	r1 = [P_DIG_Buf]
	r1 &= ~PIN_DIG_ALL
	[P_DIG_Buf] = r1
	r1 = 0xffff
	[R_CurDIG] = r1
	pop r1 from [sp]
retf

//======================================================
// �������ƣ�	DIG_On
// C���ã�		void DIG_On(void)
// �����ã�	F_DIG_On
// ʵ�ֹ��ܣ�   �ָ��������ʾ
// ��ڲ�����	��
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
_DIG_On:
F_DIG_On:
	push r1 to [sp]
	r1 = 0
	[R_CurDIG] = r1
	pop r1 from [sp]
retf