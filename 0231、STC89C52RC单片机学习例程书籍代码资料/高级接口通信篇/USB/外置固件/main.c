/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */
#include "stc.h"
#include "global.h"
/*
	串口头文件
*/
#include "UARTInterface.h"
/*
	USB头文件
*/
#include "USBInterface.h"
#include "USBApplication.h"

/****************************************************************************************************
*
*                                      变量区
* 
*****************************************************************************************************/
/*
	  任务级函数

说明:自行添加需要运行的任务
注意:认真检查MAX_TASKS的最大值和自己添加的任务

*/
static void (* CONST avTaskTbl[MAX_TASKS])(void)={ SYSIdle,              //    系统空闲 任务
										           NULL,                 //       空    任务
										           NULL,                 //       空    任务
										           NULL,                 //       空    任务
										           NULL,                 //       空    任务
										           NULL,                 //       空    任务
										           NULL,                 //       空    任务
										           USBApDisposeData      //USB 处理数据 任务
};									    
/****************************************************************************************************
*
*                                      函数区
* 
*****************************************************************************************************/
void main(void)
{
     P2=P3=0xFF;
	 UARTCiInit();
     USBCiInit();
	 EXIT_CRITICAL();

	 SYSPostCurMsg(SYS_IDLE);

	 while(1)
	 {
		avTaskTbl[SYSRecvCurMsg()](); //总线捕获信息
	 }
	 
	 

}