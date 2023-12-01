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
//  工程名称： LineIN_Record_DigitalFilter.spj
//  功能描述:  数字语音录放
//				
//  IDE环境：  	SUNPLUS unSP IDE 1.8.0
//
//  涉及的库：	CMacro.lib
//
//  组成文件:	
//    	 		main.c
//	                	
//  日期:       
//===========================================================================================

extern	void	System_Initial(),SP_SIOMassErase();

unsigned	long	int	g_ulAddr;

#define		M_RECORD		1
#define		M_STOP			2
#define		M_PLAY			4

unsigned	int		g_Flag_Status;

#include	"SPCE061V004.H"
main()
{

	unsigned	int		uiKeyValue;
	
	System_Initial();							//系统初始化

	while(1)
	{
	 	*P_Watchdog_Clear=0x1;
	 	
		uiKeyValue=*P_IOA_Data;					//按键扫描
		uiKeyValue &= 0x7;
		
		if(uiKeyValue&0x7)						//如果有键按下则进行相应操作
		{
			if(uiKeyValue&M_RECORD)				//录音键按下的操作
			{	__asm("int	off");
				SP_SIOMassErase();
				g_Flag_Status=M_RECORD;
				g_ulAddr=0;
				Timer_for_Record();
				__asm("int	fiq");
			}
			else	if(uiKeyValue&M_PLAY)		//播放键按下的操作
			{	__asm("int	off");
				g_Flag_Status=M_PLAY;
				g_ulAddr=0;
				Timer_for_Play();
				__asm("int	fiq");
			}
			else								//停止键按下的操作
			{	__asm("int	off");
				g_Flag_Status=M_STOP;
				g_ulAddr=0;
				__asm("int	fiq");
			}
		}
		
	}
}

	
		
	