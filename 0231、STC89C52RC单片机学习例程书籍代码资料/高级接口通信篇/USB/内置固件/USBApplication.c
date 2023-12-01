/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */
#include "stc.h"
#include "global.h"
#include "USBDefine.h"
#include "USBInterface.h"
#include "USBApplication.h"


/****************************************************************************************************
*
*                                      变量区
* 
*****************************************************************************************************/
static IDATA UINT8 USBMainBuf[EP2_PACKET_SIZE]={0};
/****************************************************************************************************
*
*                                      函数区
* 
*****************************************************************************************************/

/****************************************************
* 函数名称: USBApDisposeData
* 输    入: 无
* 输    出: 无
* 功能描述: USB 处理数据
*****************************************************/
void USBApDisposeData(void)
{
	UINT8 ucintStatus;                  //定义中断状态变量
	UINT8 ucrecvLen;                    //定义接收数据长度变量
	
	ENTER_CRITICAL();                   //关闭全局中断

	SYSPostCurMsg(SYS_IDLE);              //设置下个任务状态为空闲状态
	USBCiWriteSingleCmd(CMD_GET_STATUS);//请求获取USB状态
 							 
	ucintStatus =USBCiReadSingleData();//读取USB状态

	switch(ucintStatus)                  //检测是哪一种状态					
	{  
		case USB_INT_EP2_OUT:            //端点2接收到数据
			 {
                  //读取数据长度
			 	  ucrecvLen=USBCiReadPortData(USBMainBuf);
                  //将读到的数据返回到上位机
				  USBCiEP2Send(USBMainBuf,ucrecvLen);
			 }
             break;

		case USB_INT_EP2_IN:										  			     {
                    //端点2发送完毕，释放缓冲区。
				  USBCiWriteSingleCmd (CMD_UNLOCK_USB);			
			 }
			 break;

		case USB_INT_EP1_OUT: 
			 {
                   //读取数据长度
			     ucrecvLen=USBCiReadPortData(USBMainBuf);
                   //将读到的数据返回到上位机
				 USBCiEP1Send(USBMainBuf,ucrecvLen);
			 } 
			 break;

		case USB_INT_EP1_IN:										  			     
             {
			 	//端点1发送完毕，释放缓冲区。
				USBCiWriteSingleCmd (CMD_UNLOCK_USB);				
			 }
			 break;

		default:
			  {
                //释放缓冲区。
				USBCiWriteSingleCmd (CMD_UNLOCK_USB);				      
              }
			  break;
   }

	EXIT_CRITICAL();//开启全局中断
}

