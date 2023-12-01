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
//  �������ƣ� Key8AndLed.spj
//  ��������:  ����SPCE061A��IO����չһ��HM628128A�����¼����������HM628128A
//  IDE������  SUNPLUS u'nSPTM  IDE 1.8.0��or later��
//
//  �漰�Ŀ⣺ NONE
//
//  ����ļ�:  main.c
//			   system.asm
//	           hardware.inc    	
//  ��   ��:   2003-07-07
//==============================================================================================================
//==============================================================================================================
// �ļ�����:   main.c
// ��    �ܣ�  ѭ��ɨ�谴��������а��������������Ӧ�Ķ����ܡ�
// �� �� ����  NONE
// ��    ��:   2003-07-07
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
		uiKeyValue=F_GetKeyValue();			   //����ɨ��
		if(uiKeyValue>0)
		{
			switch(uiKeyValue)
			{
				case 0x0001:
					uiLedStatusValue=0x0001;
					F_LED_On(uiLedStatusValue);//������IOA8������LED1
					break;
				case 0x0002:
					uiLedStatusValue=0x0002;
					F_LED_On(uiLedStatusValue);//������IOA9������LED2
					break;
				case 0x0004:
					uiLedStatusValue=0x0004;
					F_LED_On(uiLedStatusValue);//������IOA10������LED3
					break;	
				case 0x0008:
					uiLedStatusValue=0x0008;
					F_LED_On(uiLedStatusValue);//������IOA11������LED4
					break;
				case 0x0010:
					uiLedStatusValue=0x0010;
					F_LED_On(uiLedStatusValue);//������IOA12������LED5
					break;
				case 0x0020:
					uiLedStatusValue=0x0020;
					F_LED_On(uiLedStatusValue);//������IOA13������LED6
					break;
				case 0x0040:
					uiLedStatusValue=0x0040;
					F_LED_On(uiLedStatusValue);//������IOA14������LED7
					break;
				case 0x0080:
					uiLedStatusValue=0x0080;
					F_LED_On(uiLedStatusValue);//������IOA15������LED8
					break;
				default:
					uiKeyValue=0;
					break;														
			}
		}
		
	}
}