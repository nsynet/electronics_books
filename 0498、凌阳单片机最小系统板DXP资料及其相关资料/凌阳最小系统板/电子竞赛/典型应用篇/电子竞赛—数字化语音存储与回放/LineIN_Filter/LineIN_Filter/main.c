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
//  �������ƣ� LineIN_Record_DigitalFilter.spj
//  ��������:  ��������¼��
//				
//  IDE������  	SUNPLUS unSP IDE 1.8.0
//
//  �漰�Ŀ⣺	CMacro.lib
//
//  ����ļ�:	
//    	 		main.c
//	                	
//  ����:       
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
	
	System_Initial();							//ϵͳ��ʼ��

	while(1)
	{
	 	*P_Watchdog_Clear=0x1;
	 	
		uiKeyValue=*P_IOA_Data;					//����ɨ��
		uiKeyValue &= 0x7;
		
		if(uiKeyValue&0x7)						//����м������������Ӧ����
		{
			if(uiKeyValue&M_RECORD)				//¼�������µĲ���
			{	__asm("int	off");
				SP_SIOMassErase();
				g_Flag_Status=M_RECORD;
				g_ulAddr=0;
				Timer_for_Record();
				__asm("int	fiq");
			}
			else	if(uiKeyValue&M_PLAY)		//���ż����µĲ���
			{	__asm("int	off");
				g_Flag_Status=M_PLAY;
				g_ulAddr=0;
				Timer_for_Play();
				__asm("int	fiq");
			}
			else								//ֹͣ�����µĲ���
			{	__asm("int	off");
				g_Flag_Status=M_STOP;
				g_ulAddr=0;
				__asm("int	fiq");
			}
		}
		
	}
}

	
		
	