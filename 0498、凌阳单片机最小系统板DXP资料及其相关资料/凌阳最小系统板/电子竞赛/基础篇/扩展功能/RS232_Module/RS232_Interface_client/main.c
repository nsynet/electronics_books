//===============================================================================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//          (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                       ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//==============================================================================================================

//==============================================================================================================
//  工程名称：RS232_Interface.scs
//  功能描述: 实现双CPU的Client功能,即接收数据和点亮LED灯
//  IDE 环境：SUNPLUS u'nSPTM  IDE 1.8.0
//
//  涉及的库：NONE
//        
//  组成文件:
//            system.asm
//    	      uart.asm       
//            main.c       
//          
//  完成日期: 2003-7-7
//============================================================================================================
//============================================================================================================
// 文件名称：main.c
// 实现功能：循环读串口，根据主机发送的命令点亮相应的LED灯。
// 日    期：2003/7/7
//============================================================================================================
extern unsigned int F_UART_Initial(void);
extern unsigned int F_UART_Read(void);
extern void F_LED_On(unsigned int);
main()
{
	unsigned int uiUARTCommand=0;
	F_System_Initial();
	F_UART_Initial();
	while(1)
	{		
		uiUARTCommand = F_UART_Read();
		switch(uiUARTCommand)
		{	 
			case 0x0000:
				break;
			case 0x0011:
				F_LED_On(0xFFFE);
				break;
			case 0x0022:
				F_LED_On(0xFFFD);
				break;
			case 0x0044:
				F_LED_On(0xFFFB);
				break;		
			default:
				break;
		}	
	}		
	
}