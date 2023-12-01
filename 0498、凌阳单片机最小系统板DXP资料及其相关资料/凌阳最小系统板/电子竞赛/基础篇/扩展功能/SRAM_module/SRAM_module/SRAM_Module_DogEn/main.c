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
//  工程名称： SRAM_Module.spj
//  功能描述:  利用SPCE061A的IO口扩展一块HM628128A，完成录、放音功能HM628128A
//  IDE环境：  SUNPLUS u'nSPTM  IDE 1.8.0（or later）
//
//  涉及的库： NONE
//
//  组成文件:  main.c
//    	 	   sram.asm
//			   system.asm
//	           hardware.inc    	
//  日   期:   2003-07-07
//==============================================================================================================
//==============================================================================================================
// 文件名称:   main.c
// 功    能：  利用SPCE061A的IO口扩展一块SRAM(HM628128A)，完成一个字的读写。
// 库 函 数：  NONE
// 日    期:   2003-07-07
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
		SP_InitWriteSRAM();						//写SRAM初始化
		SP_WriteSRAM(ulAddr,uiWriteRamData);		//写SRAM
		SP_InitReadSRAM();						//读SRAM初始化
		uiReadRamData=SP_ReadSRAM(ulAddr);		//读SRAM
		uiWriteRamData+=1;
		ulAddr+=2;	
		if(ulAddr>0x1FFFF)
			ulAddr=0;
		F_Clear_WatchDog();
	}
}