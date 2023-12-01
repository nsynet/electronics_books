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
/****************************************************************************************************
*
*                                      变量区
* 
*****************************************************************************************************/

/*
        设备描述符
*/
static CONST USB_DEVICE_DESCRIPTOR USBDevDescriptor={

sizeof(USB_DEVICE_DESCRIPTOR),	//设备描述符长度，= 12H
USB_DEVICE_DESCRIPTOR_TYPE,		//设备描述符类型，= 01H
0x10,0x01,						//协议版本，= 1.10
USB_CLASS_CODE_TEST_CLASS_DEVICE,//测试设备类型， = 0DCH	
0, 0,							//设备子类，设备协议
EP0_PACKET_SIZE,				//端点0最大数据包大小，= 08H
0x72,0x04,						//公司的设备ID	
0x02,0x00,						//设备制造商定的产品ID
0x00,0x00,						//设备系列号
0x01,0x02,0x03,					//索引
1								//可能的配置数
};
/*
        配置描述符+接口描述符+端口描述符
*/
static CONST USB_DESCRIPTOR USBDescriptor ={
//配置描述符
{
sizeof(USB_CONFIGURATION_DESCRIPTOR),//配置描述符长度，= 09H
USB_CONFIGURATION_DESCRIPTOR_TYPE,	 //配置描述符类型，= 02H
CONFIG_DESCRIPTOR_LENGTH,0x00,		 //描述符总长度， = 002EH
1,									 //只支持1个接口
1,									 //配置值
0,									 //字符串描述符指针(无)
0x60,								 //自供电,支持远程唤醒
0x32								 //最大功耗(100mA)	
},
//HID类接口描述符
{
sizeof(USB_INTERFACE_DESCRIPTOR),	 //接口描述符长度，= 09H
USB_INTERFACE_DESCRIPTOR_TYPE,       //接口描述符类型
0x00,                                //识别码
0x00,                                //代替数值
0x02,                                //支持的端点数
USB_DEVICE_CLASS_HUMAN_INTERFACE,    //类别码,HID设备
HID_SUBCLASS_NONE,                   //子类别码
HID_PROTOCOL_NONE,                   //协议码
0x00                                 //索引
},
//HID描述符结构
{
sizeof(USB_HID_DESCRIPTOR),			 //描述符长度， = 09H
0x21,								 //描述符类型， = 21H
0x00, 0x01,							 //HID规范版本号， = 0100H
0x00,								 //国家代码	
0x01,								 //所支持的其他类描述符个数，1个
0x22,								 //从属描述符类型，22H 表示报告描述符
0x34, 0x00							 //从属描述符长度，0034H
},

{
// 逻辑端点 2 输入	
 {
sizeof(USB_ENDPOINT_DESCRIPTOR),	 // 端点描述符长度,= 07H  	  
USB_ENDPOINT_DESCRIPTOR_TYPE,		 // 端点描述符类型,= 05H  
0x82,								 // 端点2 IN					  
USB_ENDPOINT_TYPE_INTERRUPT,		 // 中断传输,= 03H  		
EP2_PACKET_SIZE,0x00,				 // 端点最大包的大小,= 0040H  
10									 // 批量传输时该值无效 	
 },
// 逻辑端点 2 输出
 {	
sizeof(USB_ENDPOINT_DESCRIPTOR),	// 端点描述符长度,= 07H       
USB_ENDPOINT_DESCRIPTOR_TYPE,		// 端点描述符类型,= 05H		  
0x02,								// 端点2 OUT				  
USB_ENDPOINT_TYPE_INTERRUPT,		// 中断传输,= 03H			   
EP2_PACKET_SIZE,0x00,				// 端点最大包的大小,= 0040H	   
10									// 批量传输时该值无效
 }
}
};
/*
        HID 报告描述符
*/
static CONST UINT8 acUSBHidReportDescriptor[52] = 
{
0x06,0xA0,0xFF,      //用法页(FFA0h, vendor defined)
0x09, 0x01,          //用法(vendor defined)
0xA1, 0x01,          //集合(Application)
0x09, 0x02 ,         //用法(vendor defined)
0xA1, 0x00,          //集合(Physical)
0x06,0xA1,0xFF,      //用法页(vendor defined)
//输入报告
0x09, 0x03 ,         //用法(vendor defined)
0x09, 0x04,          //用法(vendor defined)
0x15, 0x80,          //逻辑最小值(0x80 or -128)
0x25, 0x7F,          //逻辑最大值(0x7F or 127)
0x35, 0x00,          //物理最小值(0)
0x45, 0xFF,          //物理最大值(255)
0x75, 0x08,          //报告长度Report size (8位)
0x95, 0x40,          //报告数值(64 fields)
0x81, 0x02,          //输入(data, variable, absolute)
//输出报告
0x09, 0x05,          //用法(vendor defined)
0x09, 0x06,          //用法(vendor defined)
0x15, 0x80,          //逻辑最小值(0x80 or -128)
0x25, 0x7F,          //逻辑最大值(0x7F or 127)
0x35, 0x00,          //物理最小值(0)
0x45, 0xFF,          //物理最大值(255)
0x75, 0x08,          //报告长度(8位)
0x95, 0x40,          //报告数值(64 fields)
0x91, 0x02,          //输出(data, variable, absolute)
0xC0,                //集合结束(Physical)
0xC0                 //集合结束(Application)	
};
						
//语言描述符
static CONST UINT8 acUSBLanguageDesCriptor[4]={0x04,0x03,0x09,0x04};	
//字符串描述符	
static CONST UINT8 acUSBSerialDesriptor[18]  ={0x12,0x03,'C',0,'H',0,'3',0,'7',0,'2',0,'U',0,'S',0,'B',0};		

//字符串描述符所用的语言种类 
static CONST UINT8 acUSBLanguageID[4]={0x04,0x03,0x09,0x04};                   

//设备序列号										
static CONST UINT8 acUSBDeviceSerialNumber[22]=
{22,0x03,'2',0,'0',0,'0',0,'7',0,'-',0,'0',0,'3',0,'-',0,'2',0,'3',0};

//厂商字符串
static CONST UINT8 acUSBManufacturerString[80]=
{
  80,0x03,'M',0,'y',0,
 'U',0,'S',0,'B',0,0xbE,0x8b,0x07,0x59,' ',0,0x20,0x00,'W',0,'e',0,'n',0,
 'Z',0,'i',0,'Q',0,'i',0,'@',0,'h',0,'o',0,'t',0,'m',0,'a',0,'i',0,'l',0,'.',0,'c',0,
 'o',0,'m',0
};

//产品字符串
static CONST UINT8 acUSBProducterString[80]=
{
  80,0x03,'M',0,'y',0,
 'U',0,'S',0,'B',0,0xbE,0x8b,0x07,0x59,' ',0,0x20,0x00,'W',0,'e',0,'n',0,
 'Z',0,'i',0,'Q',0,'i',0,'@',0,'h',0,'o',0,'t',0,'m',0,'a',0,'i',0,'l',0,'.',0,'c',0,
 'o',0,'m',0
 };

static UINT8     ucUSBAddress=0;          //暂存USB主机发来的地址

USB_CTRL_PACKET  USBCtrlPacket={0};//USB控制数据包
USB_FLAGS        USBFlags={0};     //USB标志位


/****************************************************************************************************
*
*                                      函数区
* 
*****************************************************************************************************/
/*
  ---------------------  USB 协议层函数  ---------------------
*/
/**********************************************************
* 函数名称 ：USBPcCtrlSend
* 输     入：buf 数据缓冲区
             len 发送数据长度
* 输     出：无
* 功能描述 ：控制端点数据上传
************************************************************/
void USBPcCtrlSend(UINT8 *buf,UINT8 len)
{
	 USBCiEP0Send(buf,len);
}
/**********************************************************
* 函数名称 ：USBPcHold
* 输     入：无
* 输     出：无
* 功能描述 ：保持当前状态
************************************************************/
void USBPcHold(void)
{
	 USBCiWriteSingleCmd (CMD_WR_USB_DATA3);	//发出写端点0的命令
	 USBCiWriteSingleData(0);			        //上传0长度数据，这是一个状态阶段
}
/**********************************************************
* 函数名称 ：USBDesriptorCopy
* 输     入：无
* 输     出：无
* 功能描述 ：复制描述符以便上传
************************************************************/
void USBDesriptorCopy(void)
{
	BufCpy(USBCtrlPacket.mucBuf,
		   USBCtrlPacket.mpucTxd+USBCtrlPacket.musTxCount,
		   EP0_PACKET_SIZE			
		  );
}
/**********************************************************
* 函数名称 ：USBCtrlPacketTransmit
* 输     入：无
* 输     出：无
* 功能描述 ：端点0数据上传
************************************************************/
void USBCtrlPacketTransmit(void)
{
	UINT8 len;
	
	if(USBCtrlPacket.musTxLength)
	{								 //长度不为0传输具体长度的数据
		if(USBCtrlPacket.musTxLength<=EP0_PACKET_SIZE)
		{
			len=USBCtrlPacket.musTxLength;	 //长度小于8则长输要求的长度
			USBCtrlPacket.musTxLength=0;
			USBCtrlPacket.musTxCount+=len;
		}
		else
		{
			len=EP0_PACKET_SIZE;
			USBCtrlPacket.musTxLength-=EP0_PACKET_SIZE;	//长度大于8则传输8个，切总长度减8
            USBCtrlPacket.musTxCount +=EP0_PACKET_SIZE;
		}	
						       
		USBPcCtrlSend(USBCtrlPacket.mucBuf,len);//这个buf可以重用	
	}
	else
	{
		USBPcHold();
	}
}
/*
      -----------------		    usb标准设备请求服务程序		    -----------------
*/
/**********************************************************
* 函数名称 ：USBPcGetDescriptor
* 输     入：无
* 输     出：无
* 功能描述 ：获取描述符
************************************************************/
void USBPcGetDescriptor(void)
{
        UINT16 i;

		switch(MSB(USBCtrlPacket.r.musRequestValue))
		{
			case 0x01://设备描述符上传
				 {
                    USBMSG("-->获得设备描述符\r\n");

				 	USBCtrlPacket.mpucTxd= (UINT8 *)&USBDevDescriptor;
					
					if(USBCtrlPacket.musTxLength >USBDevDescriptor.bLength)
                    {
                       USBCtrlPacket.musTxLength=USBDevDescriptor.bLength;
                    }       
									
				 }
				break;

			case 0x02://配置描述符上传
				 {
                    USBMSG("-->获得配置描述符\r\n");

				 	USBCtrlPacket.mpucTxd=(UINT8 *)&USBDescriptor.ConfigDescr;
					//由于配置描述符比较小,其实只用US就已经足够了BDescriptor.ConfigDescr.wTotalLength0

                    i=(USBDescriptor.ConfigDescr.wTotalLength1<<8)|USBDescriptor.ConfigDescr.wTotalLength0;

                    if(USBCtrlPacket.musTxLength>i)
                    {
                       USBCtrlPacket.musTxLength=i;
                    }

				 }	
				 break;

			case 0x03://字符串描述符
				 {
					switch(LSB(USBCtrlPacket.r.musRequestValue))
					{
						case 0x00://获得语言ID
							{
								USBMSG("-->获得语言ID\r\n");
								
								USBCtrlPacket.mpucTxd=acUSBLanguageDesCriptor;
                               
                                if(USBCtrlPacket.musTxLength>acUSBLanguageDesCriptor[0])
                                {
                                   USBCtrlPacket.musTxLength=acUSBLanguageDesCriptor[0];
                                }							
												    
							}
							break ;
							
						case 0x01 ://获得厂商字符串
							{
								USBMSG("-->获得厂商字符串\r\n");
								
								USBCtrlPacket.mpucTxd = acUSBManufacturerString;
                                
                                if(USBCtrlPacket.musTxLength>acUSBManufacturerString[0])
                                {
                                   USBCtrlPacket.musTxLength=acUSBManufacturerString[0];
                                }
												
							}

							break ;
							
						case 0x02 ://获取产品字符串
							{
								USBMSG("-->获得产品字符串\r\n");
								
								USBCtrlPacket.mpucTxd = acUSBProducterString;

                                if(USBCtrlPacket.musTxLength>acUSBProducterString[0])
                                {
                                   USBCtrlPacket.musTxLength=acUSBProducterString[0];
                                }																		
							}
							break ;
							
						case 0x03 ://获取设备序列号
							{
								USBMSG("-->获取设备序列号\r\n");	
								
								USBCtrlPacket.mpucTxd = acUSBDeviceSerialNumber;
                                 
                                if(USBCtrlPacket.musTxLength>acUSBDeviceSerialNumber[0])
								{
                                   USBCtrlPacket.musTxLength=acUSBDeviceSerialNumber[0];
                                }
									    						
							}
							break ;
							
						default :
							break ;
					}
				}
				break  ;

			case 0x21://HID描述符
				{
					USBMSG("-->获取HID描述符\r\n");	
					//HID描述符在acUSBConDescriptor数组中地址偏移为18
					USBCtrlPacket.mpucTxd=(UINT8 *)&USBDescriptor.HidDesr;					
				}
				break;

			case 0x22://报告描述符
				{
					USBCtrlPacket.mpucTxd=acUSBHidReportDescriptor;

                    if(USBCtrlPacket.musTxLength>sizeof(acUSBHidReportDescriptor))
                    {
                       USBCtrlPacket.musTxLength=sizeof(acUSBHidReportDescriptor);
                    }

			 	    USBMSG("-->获取HID报告描述符\r\n");
					USBMSG("\r\n\r\n-->     USB设备枚举成功     <--  \r\n\r\n");
	
					USBFlags.bits.mbEnumed=TRUE;


				}
				break;

			case 0x23://物理描述符
				break;

			default :
				break;
		}	
	
		USBDesriptorCopy();
}
/**********************************************************
* 函数名称 ：USBPcGetConfiguration
* 输     入：无
* 输     出：无
* 功能描述 ：获得配置
************************************************************/
void USBPcGetConfiguration(void)
{
	 USBCtrlPacket.r.mucRequestType=USBFlags.bits.mbConfig ? 1:0;
}
/**********************************************************
* 函数名称 ：USBPcClearFeature
* 输     入：无
* 输     出：无
* 功能描述 ：清除特性
************************************************************/
void USBPcClearFeature(void)
{
	if((USBCtrlPacket.r.mucRequestType&0x1F)==0X02)
	{				
		switch(LSB(USBCtrlPacket.r.musRequestIndex))
		{
			case 0x82:
				USBCiWriteSingleCmd (CMD_SET_ENDP7);				//清除端点2上传
				USBCiWriteSingleData(0x8E);                			//发命令清除端点
				break;
			case 0x02:
				USBCiWriteSingleCmd (CMD_SET_ENDP6);
				USBCiWriteSingleData(0x80);							//清除端点2下传
				break;
			case 0x81:
				USBCiWriteSingleCmd (CMD_SET_ENDP5);				//清除端点1上传
				USBCiWriteSingleData(0x8E);
				break;
			case 0x01:
				USBCiWriteSingleCmd (CMD_SET_ENDP4);				//清除端点1下传
				USBCiWriteSingleData(0x80);
				break;
			default:
				break;
		}
	}
	else
	{
		USBPcHold();//发送空包,表示保持当前状态
	}
}
/**********************************************************
* 函数名称 ：USBPcGetInterface
* 输     入：无
* 输     出：无
* 功能描述 ：获得接口
************************************************************/
void USBPcGetInterface(void)
{
     USBCtrlPacket.r.mucRequestType =0x01;
	 USBCtrlPacket.r.mucRequestCode =0x00;	 
}/**********************************************************
* 函数名称 ：USBPcGetStatus
* 输     入：无
* 输     出：无
* 功能描述 ：获得状态
************************************************************/
void USBPcGetStatus(void)
{
     USBCtrlPacket.r.mucRequestType =0x00;
	 USBCtrlPacket.r.mucRequestCode =0x00;		
}
/**********************************************************
* 函数名称 ：USBPcSetConfiguration
* 输     入：无
* 输     出：无
* 功能描述 ：设置配置
************************************************************/
void USBPcSetConfiguration(void)
{
	USBFlags.bits.mbConfig = FALSE;

	USBFlags.bits.mbConfig = LSB(USBCtrlPacket.r.musRequestValue)? TRUE:FALSE;
}
/**********************************************************
* 函数名称 ：USBPcSetAddress
* 输     入：无
* 输     出：无
* 功能描述 ：设置地址
************************************************************/
void USBPcSetAddress(void)
{
	ucUSBAddress=LSB(USBCtrlPacket.r.musRequestValue);//暂存USB主机发来的地址
}
/**********************************************************
* 函数名称 ：USBPcGetAddress
* 输     入：无
* 输     出：地址
* 功能描述 ：返回USB地址
************************************************************/
UINT8 USBPcGetAddress(void)
{
	return ucUSBAddress;
}
/**********************************************************
* 函数名称 ：USBPcSetDescriptor
* 输     入：无
* 输     出：无
* 功能描述 ：设置描述符
************************************************************/
void USBPcSetDescriptor(void)
{
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}
/**********************************************************
* 函数名称 ：USBPcSetFeature
* 输     入：无
* 输     出：无
* 功能描述 ：设置特性
************************************************************/
void USBPcSetFeature(void)
{

    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}
/**********************************************************
* 函数名称 ：USBPcSetInterface
* 输     入：无
* 输     出：无
* 功能描述 ：设置接口
************************************************************/
void USBPcSetInterface(void)
{
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}
/**********************************************************
* 函数名称 ：USBPcGetReport
* 输     入：无
* 输     出：无
* 功能描述 ：获取报告
************************************************************/
void USBPcGetReport(void) 
{
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;	
}
/**********************************************************
* 函数名称 ：USBPcGetIdle
* 输     入：无
* 输     出：无
* 功能描述 ：获取空闲状态
************************************************************/
void USBPcGetIdle(void)
{

    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;	
}
/**********************************************************
* 函数名称 ：USBPcGetProtocol
* 输     入：无
* 输     出：无
* 功能描述 ：获取协议
************************************************************/
void USBPcGetProtocol(void)
{
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}
/**********************************************************
* 函数名称 ：USBPcSetProtocol
* 输     入：无
* 输     出：无
* 功能描述 ：设置协议
************************************************************/
void USBPcSetProtocol(void)
{
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}
/*****************************************************************************************
** 函数名称: USBPcSetReport				
** 功能描述: 设置报告
** 输    入: 无
** 输	 出: 无							
******************************************************************************************/
void USBPcSetReport(void)
{
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}
/*****************************************************************************************
** 函数名称: USBPcSetIdle				
** 功能描述: 设置空闲状态
** 输    入: 无
** 输	 出: 无							
******************************************************************************************/
void USBPcSetIdle(void)
{
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}

