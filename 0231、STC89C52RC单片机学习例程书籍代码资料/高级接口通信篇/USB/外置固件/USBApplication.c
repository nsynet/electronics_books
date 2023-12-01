/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */
#include "stc.h"
#include "global.h"
#include "USBDefine.h"
#include "USBInterface.h"
#include "USBProtocol.h"
#include "USBApplication.h"


/****************************************************************************************************
*
*                                      变量区
* 
*****************************************************************************************************/
IDATA UINT8 USBMainBuf[EP2_PACKET_SIZE]={0};

//定义USB 标准设备请求 结构体
static CONST FUNCTION_ARRAY StandardDeviceRequest[16]={
	{USBPcGetStatus,       "[00H]USB 标准设备请求:获取状态\r\n  "},
	{USBPcClearFeature,    "[01H]USB 标准设备请求:清除特性\r\n  "},
	{NULL,                 "NULL                                "},
	{USBPcSetFeature,      "[03H]USB 标准设备请求:设置特性\r\n  "},
	{NULL,                 "NULL                                "},
	{USBPcSetAddress,      "[05H]USB 标准设备请求:设置地址\r\n  "},
	{USBPcGetDescriptor,   "[06H]USB 标准设备请求:获取描述符\r\n"},
	{USBPcSetDescriptor,   "[07H]USB 标准设备请求:设置描述符\r\n"},
	{USBPcGetConfiguration,"[08H]USB 标准设备请求:获取配置\r\n  "},
	{USBPcSetConfiguration,"[09H]USB 标准设备请求:设置配置\r\n  "},
	{USBPcGetInterface,    "[0AH]USB 标准设备请求:获取接口\r\n  "},
	{USBPcSetInterface,    "[0BH]USB 标准设备请求:设置接口\r\n  "},
	{NULL,                 "NULL                                "},
	{NULL,                 "NULL                                "},
	{NULL,                 "NULL                                "},
	{NULL,                 "NULL                                "}
};
//定义USB HID类请求 结构体
static CONST FUNCTION_ARRAY HidClassRequest[16]={
	{USBPcGetReport,	   "[00H]USB HID类请求:获取报告\r\n     "},		
	{USBPcGetIdle,	       "[01H]USB HID类请求:获取空闲状态\r\n "},				
	{USBPcGetProtocol,     "[02H]USB HID类请求:获取协议\r\n     "},			
	{NULL,                 "NULL                                "},
	{NULL,                 "NULL                                "},
	{NULL,                 "NULL                                "},
	{NULL,                 "NULL                                "},
	{NULL,                 "NULL                                "},
	{NULL,                 "NULL                                "},
	{USBPcSetReport,	   "[08H]USB HID类请求:设置报告\r\n     "},			
	{USBPcSetIdle,         "[09H]USB HID类请求:设置空闲状态\r\n "},				
	{USBPcSetProtocol,     "[0AH]USB HID类请求:设置协议\r\n     "},			
	{NULL,                 "NULL                                "},
	{NULL,                 "NULL                                "},
	{NULL,                 "NULL                                "},
	{NULL,                 "NULL                                "}
};	
/****************************************************************************************************
*
*                                      函数区
* 
*****************************************************************************************************/
/*****************************************************************
* 函数名称 	: USBApDisposeData
* 输	   入	: 无
* 输	   出	: 无
* 功能描述 	: USB 处理数据
******************************************************************/
void USBApDisposeData(void)
{
	UINT8 ucintStatus;
	UINT8 ucrecvLen;
	
	ENTER_CRITICAL();

	SYSPostCurMsg(SYS_IDLE);

	USBCiWriteSingleCmd(CMD_GET_STATUS);  								//获取中断状态并取消中断请求 
	ucintStatus =USBCiReadSingleData();  								//获取中断状态,清中断标志,对应于INT0中断 
	
	switch(ucintStatus)													//分析中断状态
	{  
		case USB_INT_EP2_OUT: 
			 {
			//这里一定要读取,否则会导致HID系列USB卡死	
			 	  ucrecvLen=USBCiReadPortData(USBMainBuf);

				  USBCiEP2Send(USBMainBuf,64);

			 } 
			 break;

		case USB_INT_EP2_IN:										    //批量端点上传成功,未处理
			 {
				USBCiWriteSingleCmd (CMD_UNLOCK_USB);					//释放缓冲区
			 }
			 break;

		case USB_INT_EP0_SETUP: 		                                //控制端点建立成功，当收到命令的时候，执行该中断
			 {

			  ucrecvLen=USBCiReadPortData((UINT8 *)&USBCtrlPacket.r);   //获取建立请求包的内容
			  
			  //USB为小端模式 51为大端模式 需要切换
			  USBCtrlPacket.r.musRequestValue =SWAP16(USBCtrlPacket.r.musRequestValue);
			  USBCtrlPacket.r.musRequestIndex =SWAP16(USBCtrlPacket.r.musRequestIndex);
			  USBCtrlPacket.r.musRequestLength=SWAP16(USBCtrlPacket.r.musRequestLength);
	
			  USBCtrlPacket.mpucTxd = NULL;       //重新定位发送指针,防止野指针

              USBCtrlPacket.musTxLength=USBCtrlPacket.r.musRequestLength;
			  USBCtrlPacket.musTxCount =0;
		
			 /*********类请求命令***********/
			  if(USBCtrlPacket.r.mucRequestType &0x20)              //类请求，未处理
			  {          
				USBMSG(HidClassRequest[USBCtrlPacket.r.mucRequestType & 0x1F].s);	
				(*HidClassRequest[USBCtrlPacket.r.mucRequestType & 0x1F].fun)();
			  }
			 /*  标准的请求命令*/
			  if(!(USBCtrlPacket.r.mucRequestType&0x60))										
			  {          					
                //检查当前标准请求是否获取描述符
                USBFlags.bits.mbDescriptor=DEF_USB_GET_DESCR   == USBCtrlPacket.r.mucRequestCode?TRUE:FALSE;
                //检查当前标准请求是否获取地址
			    USBFlags.bits.mbAdrress   =DEF_USB_SET_ADDRESS == USBCtrlPacket.r.mucRequestCode?TRUE:FALSE;

				USBMSG(StandardDeviceRequest[USBCtrlPacket.r.mucRequestCode].s);	
				(*StandardDeviceRequest[USBCtrlPacket.r.mucRequestCode].fun)();
			  }

			  USBCtrlPacketTransmit();	  //数据上传
			}
			break;

		case USB_INT_EP0_IN:				                        //控制端点上传成功	
		    {
					//当发送完描述符时,会从	USB_INT_EP0_IN 转到 USB_INT_EP0_SETUP的,
					//即发送完当前规定长度的描述符,才会出现USB_INT_EP0_SETUP中断,
					//否则一直为USB_INT_EP0_IN
	    	
				if(USBFlags.bits.mbDescriptor)          //描述符上传
				{								
					USBDesriptorCopy();                          //复制描述符
					USBCtrlPacketTransmit();															
				}
				//设置USB地址
				else if(USBFlags.bits.mbAdrress)   //设置地址
				{
					USBCiWriteSingleCmd (CMD_SET_USB_ADDR);
					USBCiWriteSingleData(USBPcGetAddress());				//设置USB地址,设置下次事务的USB地址
				}
				else
				{
					USBPcHold();  //发送空包,保持状态 
				}
			  	//释放缓冲区
				USBCiWriteSingleCmd(CMD_UNLOCK_USB);				//释放缓冲区
			}
			break;

		case USB_INT_EP0_OUT:										//控制端点下传成功
			 {
			 	//这里一定要读取,否则会导致HID系列USB卡死
			 	ucrecvLen=USBCiReadPortData(USBCtrlPacket.mucBuf);  
			 }
			 break;

		default:
			  {
			  	//这里一定要有,需要总线复位,否则USB卡住不动
			   	if(ucintStatus&USB_INT_BUS_RESET1)				  //总线复位
			   	{			
                    BufClr((UINT8 *)&USBCtrlPacket,sizeof(USBCtrlPacket));	//清空数据缓冲区				
					USBFlags.musFlags=0;                          //标志位集合全部清零    
					USBFlags.bits.mbReset=TRUE;                   //标志位集合中的复位标志位置1
					USBMSG("HID USB 复位\r\n");
				}

				USBCiWriteSingleCmd (CMD_UNLOCK_USB);				//释放缓冲区
			 }
			 break;

	 }

	 EXIT_CRITICAL();	


}
