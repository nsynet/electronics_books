//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//             (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                          ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//======================================================
// �ļ����ƣ�	flash.asm
// ����������	����������д�ӳ��� 
// ά����¼��	2006-08-30	v1.0
//======================================================

.PUBLIC F_Flash_Erase
.PUBLIC _Flash_Erase
.PUBLIC F_Flash_WriteWord
.PUBLIC _Flash_WriteWord
.PUBLIC F_Flash_Write
.PUBLIC _Flash_Write
.PUBLIC F_Flash_ReadWord
.PUBLIC _Flash_ReadWord
.PUBLIC F_Flash_Read
.PUBLIC _Flash_Read

.DEFINE C_FLASH_SIZE			0x8000
.DEFINE C_FLASH_BLOCK_SIZE		0x100 
.DEFINE C_FLASH_MATCH			0xAAAA
.DEFINE C_FLASH_PAGE_ERASE		0x5511		//erase 1 page
.DEFINE C_FLASH_MASS_ERASE		0x5522		//only can execution on STOP=1
.DEFINE C_FLASH_1WORD_PGM		0x5533		//write 1 word 
.DEFINE C_FLASH_SEQUENT_PGM		0x5544		//write sequential word 
.DEFINE P_Flash_Ctrl  			0x7555

.CODE
//======================================================
// ����ʽ��	F_Flash_WriteWord
// C��ʽ��		void Flash_WriteWord(unsigned int FlashAddr, unsigned int Data);
// ʵ�ֹ��ܣ�	дһ���ֵ�FLASH��ָ����ַ��
// ��ڲ�����	FlashAddr(r1) - ��д��Flash�ĵ�ַ
//				Data(r2) - ��д������
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
_Flash_WriteWord:
	push r1, r2 to [sp]
	r1 = sp + 5						// ��ò���1
	r1 = [r1]
	r2 = sp + 6						// ��ò���2
	r2 = [r2]
	call F_Flash_WriteWord
	pop r1, r2 from [sp]
retf

F_Flash_WriteWord:
	push r3 to [sp]

	r3 = C_FLASH_MATCH				// 0xAAAA
	[P_Flash_Ctrl] = r3
	r3 = C_FLASH_1WORD_PGM			// 0x5533
	[P_Flash_Ctrl] = r3	
	[r1] = r2

	pop r3 from [sp]
	retf

//======================================================
// ����ʽ��	F_Flash_Write
// C��ʽ��		void Flash_Write(unsigned int FlashAddr, unsigned int *DataBuf, unsigned int Count);
// ʵ�ֹ��ܣ�	д����ֵ�FLASH����
// ��ڲ�����	FlashAddr(r1) - ��д��Flash�ĵ�ַ
//				DataBuf(r2) - ��д�����ݵ���ʼ��ַ
//				Count(r3) - ��д�����ݵ�����
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
_Flash_Write:
	push r1, r3 to [sp]
	r1 = sp + 6						// ��ò���1
	r1 = [r1]
	r2 = sp + 7						// ��ò���2
	r2 = [r2]
	r3 = sp + 8						// ��ò���3
	r3 = [r3]
	call F_Flash_Write
	pop r1, r3 from [sp]
retf	

F_Flash_Write:
	push r3, r4 to [sp]
	r4 = C_FLASH_MATCH				// 0x5511
	[P_Flash_Ctrl] = r4
?Loop:	
	r4 = C_FLASH_SEQUENT_PGM		// 0x5544
	[P_Flash_Ctrl] = r4
	r4 = [r2++]
	[r1++] = r4
	r3 -= 1
	jnz ?Loop
	pop r3, r4 from [sp]
retf



//======================================================
// ����ʽ��	F_Flash_Erase
// C��ʽ��		void Flash_Erase(unsigned int FlashAddr);
// ʵ�ֹ��ܣ�	����ָ����ַ���ڵ�ҳ
// ��ڲ�����	FlashAddr(r1) - ������ҳ���ڵ�Flash��ַ
// ���ڲ�����	��
// �ƻ��Ĵ�����	��
//======================================================
_Flash_Erase:
	push r1 to [sp]
	r1 = sp + 4
	r1 = [r1]
	call F_Flash_Erase
	pop r1 from [sp]
retf

F_Flash_Erase:
	push r2 to [sp]
	r2 = C_FLASH_MATCH				//AAAA
	[P_Flash_Ctrl] = r2
	r2 = C_FLASH_PAGE_ERASE			//5511
	[P_Flash_Ctrl] = r2
	
	[r1] = r1
	pop r2 from [sp]
retf

//======================================================
// ����ʽ��	F_Flash_ReadWord
// C��ʽ��		unsigned int Flash_ReadWord(unsigned int FlashAddr);
// ʵ�ֹ��ܣ�	��ȡFlashָ����ַ�е�����
// ��ڲ�����	FlashAddr(r1) - Flash��ַ
// ���ڲ�����	�õ�ַ�е�����
// �ƻ��Ĵ�����	��
//======================================================
_Flash_ReadWord:
	r1 = sp + 3
	r1 = [r1]
	call F_Flash_ReadWord
retf

F_Flash_ReadWord:
	r1 = [r1]
	retf

//======================================================
// ����ʽ��	F_Flash_Read
// C��ʽ��		unsigned int *Flash_Read(unsigned int FlashAddr, unsigned int *DataBuf, unsigned int Count);
// ʵ�ֹ��ܣ�	��ȡFlashָ����ʼ��ַ�Ķ������
// ��ڲ�����	FlashAddr(r1) - ����ȡFlash����ʼ��ַ
//				DataBuf(r2) - ���ڴ洢�������ݵ�Ram��ʼ��ַ
//				Count(r3) - ����ȡ���ݵ�����
// ���ڲ�����	���ڴ洢�������ݵ�Ram��ʼ��ַ
// �ƻ��Ĵ�����	��
//======================================================
_Flash_Read:
	push r1, r3 to [sp]
	r1 = sp + 6						// ��ò���1
	r1 = [r1]
	r2 = sp + 7						// ��ò���2
	r2 = [r2]
	r3 = sp + 8						// ��ò���3
	r3 = [r3]
	call F_Flash_Read
	pop r1, r3 from [sp]
retf

F_Flash_Read:
	push r3, r4 to [sp]
?Loop:
	r4 = [r1++]	
	[r2++] = r4
	r3 -= 1
	jnz ?Loop
	pop r3, r4 from [sp]
retf