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
//  工程名称： Key8AndLed.spj
//  功能描述:  利用SPCE061A的IO口扩展一块HM628128A，完成录、放音功能HM628128A
//  IDE环境：  SUNPLUS u'nSPTM  IDE 1.8.0（or later）
//
//  涉及的库： NONE
//
//  组成文件:  main.c
//			   system.asm
//	           hardware.inc    	
//  日   期:   2003-07-07
//==============================================================================================================
//==============================================================================================================
// 文件名称:   main.c
// 功    能：  循环扫描按键，如果有按键按下则点亮相应的二极管。
// 库 函 数：  NONE
// 日    期:   2003-07-07
//==============================================================================================================
extern void F_System_Initial(void);
extern unsigned int F_GetKeyValue(void);
extern void F_LED_On(unsigned int);
main()
{
	unsigned int uiKeyValue=0;
	unsigned int uiLedStatusValue=0;
	F_System_Initial();
	while(1)
	{
		uiKeyValue=F_GetKeyValue();			   //按键扫描
		if(uiKeyValue>0)
		{
			switch(uiKeyValue)
			{
				case 0x0001:
					uiLedStatusValue=0x0001;
					F_LED_On(uiLedStatusValue);//点亮与IOA8相连的LED1
					break;
				case 0x0002:
					uiLedStatusValue=0x0002;
					F_LED_On(uiLedStatusValue);//点亮与IOA9相连的LED2
					break;
				case 0x0004:
					uiLedStatusValue=0x0004;
					F_LED_On(uiLedStatusValue);//点亮与IOA10相连的LED3
					break;	
				case 0x0008:
					uiLedStatusValue=0x0008;
					F_LED_On(uiLedStatusValue);//点亮与IOA11相连的LED4
					break;
				case 0x0010:
					uiLedStatusValue=0x0010;
					F_LED_On(uiLedStatusValue);//点亮与IOA12相连的LED5
					break;
				case 0x0020:
					uiLedStatusValue=0x0020;
					F_LED_On(uiLedStatusValue);//点亮与IOA13相连的LED6
					break;
				case 0x0040:
					uiLedStatusValue=0x0040;
					F_LED_On(uiLedStatusValue);//点亮与IOA14相连的LED7
					break;
				case 0x0080:
					uiLedStatusValue=0x0080;
					F_LED_On(uiLedStatusValue);//点亮与IOA15相连的LED8
					break;
				default:
					uiKeyValue=0;
					break;														
			}
		}
		
	}
}