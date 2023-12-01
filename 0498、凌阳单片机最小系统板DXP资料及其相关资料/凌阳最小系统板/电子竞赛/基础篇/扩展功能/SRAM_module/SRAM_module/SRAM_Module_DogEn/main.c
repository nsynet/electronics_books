//======================================================================================
//
//        The information contained herein is the exclusive property of
//      Sunplus Technology Co. And shall not be distributed, reproduced,
//      or disclosed in whole in part without prior written permission.
//
//            (C) COPYRIGHT 2001   SUNPLUS TECHNOLOGY CO.
//                           ALL RIGHTS RESERVED
//
//    The entire notice above must be reproduced on all authorized copies.
//
//==============================================================================================================
//  �������ƣ� SRAM_Module.spj
//  ��������:  ����SPCE061A��IO����չһ��HM628128A�����¼����������HM628128A
//  IDE������  SUNPLUS u'nSPTM  IDE 1.8.0��or later��
//
//  �漰�Ŀ⣺ NONE
//
//  ����ļ�:  main.c
//    	 	   sram.asm
//			   system.asm
//	           hardware.inc    	
//  ��   ��:   2003-07-07
//==============================================================================================================
//==============================================================================================================
// �ļ�����:   main.c
// ��    �ܣ�  ����SPCE061A��IO����չһ��SRAM(HM628128A)�����һ���ֵĶ�д��
// �� �� ����  NONE
// ��    ��:   2003-07-07
//==============================================================================================================
extern void F_System_Initial(void);
extern void SP_InitWriteSRAM();
extern void SP_WriteSRAM(unsigned long ,unsigned int);
extern void SP_InitReadSRAM(void);
extern unsigned int SP_ReadSRAM(unsigned  long);
extern void F_Clear_WatchDog(void);
main(void)
{
	unsigned int uiWriteRamData=0;
	unsigned int uiReadRamData=0;
	unsigned long ulAddr=0;
	F_System_Initial();
	uiWriteRamData=0x5aa5;
	while(1)
	{
		SP_InitWriteSRAM();						//дSRAM��ʼ��
		SP_WriteSRAM(ulAddr,uiWriteRamData);		//дSRAM
		SP_InitReadSRAM();						//��SRAM��ʼ��
		uiReadRamData=SP_ReadSRAM(ulAddr);		//��SRAM
		uiWriteRamData+=1;
		ulAddr+=2;	
		if(ulAddr>0x1FFFF)
			ulAddr=0;
		F_Clear_WatchDog();
	}
}