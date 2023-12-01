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
//========================================================================================
//  工程名称： SPR4096.spj
//  功能描述:  扩展SPR4096
//				
//  IDE环境：  	SUNPLUS unSP IDE 1.8.0
//
//  涉及的库：	CMacro.lib
//
//  组成文件:	
//    	 		main.c，4096.asm
//	                	
//  日期:  		2003-07-09     
//===========================================================================================

extern	void				SP_SIOInitial(void);
extern	void				SP_SIOMassErase(void);
extern	void				SP_SIOSectorErase(unsigned int uiSector);
extern	void				SP_SIOSendAWord(unsigned long int ulAddr,unsigned int uiData);
extern	void				SP_SIOSendAByte(unsigned long int ulAddr,unsigned int uiData);
extern	unsigned	int		SP_SIOReadAWord(unsigned long int ulAddr);
extern	unsigned	int		SP_SIOReadAByte(unsigned long int ulAddr);

#define	M_NUMBER	10									//数组uiByteBuffer的元素个数
#define	M_SECTOR	0									//第几个扇区（0～255）
#include	"SPCE061V004.H"
main()
{
	unsigned	long	int	ulAddr,ulStartAddr;
	unsigned	int		uiData,i,j,uiByteBuffer[M_NUMBER],uiWordBuffer[M_NUMBER];
	
	SP_SIOInitial();									//系统初始化
	
	SP_SIOMassErase();									//格式化SPR409
	ulStartAddr=0x800*M_SECTOR;					

	for(i=0,ulAddr=ulStartAddr,uiData=6;i<M_NUMBER;i++)	//往4096写入M_NUMBER个Byte的数据
	{
		SP_SIOSendAByte(ulAddr,uiData);
		ulAddr+=1;
		uiData+=1;
		*P_Watchdog_Clear=0x1;
	}
	for(i=0,ulAddr=ulStartAddr;i<M_NUMBER;i++)			//从4096读出M_NUMBER个Byte的数据
	{
		uiByteBuffer[i]=SP_SIOReadAByte(ulAddr);
		ulAddr+=1;
	 	*P_Watchdog_Clear=0x1;
	}


	SP_SIOSectorErase(M_SECTOR);						//对4096的第M_SECTOR个扇区进行擦除


	for(i=0,ulAddr=ulStartAddr,uiData=2;i<M_NUMBER;i++)	//往4096写入M_NUMBER个Word的数据
	{
		SP_SIOSendAWord(ulAddr,uiData);
		ulAddr+=2;
		uiData+=1;
		*P_Watchdog_Clear=0x1;
	}
	for(i=0,ulAddr=ulStartAddr;i<M_NUMBER;i++)			//从4096读出M_NUMBER个Byte的数据
	{
		uiWordBuffer[i]=SP_SIOReadAWord(ulAddr);
		ulAddr+=2;
	 	*P_Watchdog_Clear=0x1;
	}
	while(1)
	{
	 	*P_Watchdog_Clear=0x1;
	}
	
}

	
		
	