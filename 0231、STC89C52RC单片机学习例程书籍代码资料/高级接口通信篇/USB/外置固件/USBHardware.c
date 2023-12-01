/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */
#include "stc.h"
#include "global.h"
#include "USBHardware.h"
#include "USBInterface.h"
/***********************************************************************************
** 函数名称 : USBHwInit
** 功能描述 : USB 硬件初始化
** 输	 入	: 无
** 输	出	: 无
************************************************************************************/
void USBHwInit(void)
{
	
	IE0=0;
	IT0=0;//置外部信号为低电平触发,IT1=1边沿触发
	EX0=1;
}

/*
  ---------------------  USB 中断服务程序  ---------------------
*/

/***********************************************************************************
** 函数名称 : UsbIRQ
** 功能描述 : 中断服务程序
** 输	 入	: 无
** 输	出	: 无
************************************************************************************/
void UsbIRQ(void) interrupt 0
{
	 ENTER_CRITICAL();

	 SYSPostCurMsg(RUN_USB_DISPOSE_DATA);

     EXIT_CRITICAL();	
}
