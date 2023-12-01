/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */
#include "Board.h" 
#include "Global.h"
/*
	网口
*/
#include "NETDefine.h" 
#include "NETInterface.h"
#include "NETProtocol.h"
#include "NETApplication.h"





/****************************************************************************************************
*
*                                      变量区
* 
*****************************************************************************************************/
static   UINT8 CODE acLocalMac[6] = {0x54,0x55,0x58,0x10,0x00,0x24};
static   UINT8 CODE acLocalIP[4]  = {192,168,1,218};
/*
	  任务级函数

说明:自行添加需要运行的任务
注意:认真检查MAX_TASKS的最大值和自己添加的任务

*/


static void (* CODE avTaskTbl[MAX_TASKS])(void)={  SYSIdle,              //    系统空闲 任务
										           NULL,                 //       空    任务
										           NULL,                 //       空    任务
										           NULL,                 //       空    任务
										           NULL,                 //       空    任务
										           NULL,                 //       空    任务
										           NETApDisposeData,     //NET 处理数据 任务
										           NULL                  //       空    任务
};
/****************************************************************************************************
*
*                                      函数区
* 
*****************************************************************************************************/
void main(void)
{ 

  NET_PORT=SI_ENJ|SO_ENJ|SCK_ENJ;
  P3=0xFF;
  
  NETCiInit(acLocalMac);        //设置ENC28j60的MAC地址
  NETCiClkOut(2);               //设置ENC28j60的时钟翻倍
  DelayNms(10);
  NETCiPhyWrite(PHLCON,0xD76);	 
  DelayNms(20);   
  NETPcInit(acLocalMac,acLocalIP,TCP_PORT); //网络初始化本机IP地址和MAC地址

  SYSPostCurMsg(RUN_NET_DISPOSE_DATA);      //设置任务


  while(1)
  {
	
	avTaskTbl[SYSRecvCurMsg()](); //总线捕获信息
  }

}

