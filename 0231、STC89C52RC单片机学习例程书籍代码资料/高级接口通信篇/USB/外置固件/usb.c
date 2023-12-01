/************************************************************************
*作    者:温子祺 邮箱:k125008301@126.com
*文    件:usb.c
*说    明:代码优化,描述符架构更改为结构体形式
*修改日期:2009/12/06
--------------------------------------------------------------
*说    明:代码优化,修正少许BUG
*修改日期:2009/12/05
--------------------------------------------------------------
*说    明:能够正常发送数据和接收数据
*修改日期:2009/12/02
--------------------------------------------------------------
*创建日期:2009/11/30
*说    明:基本USB可以枚举成功
--------------------------------------------------------------
AVR是小端模式  USB小端模式 51 大端模式

所以要注意高低字节的问题
*************************************************************************/
#include "stc.h"
#include "global.h"
#include "usb.h"
/****************************************************************************************************
*
*                                      变量区
* 
*****************************************************************************************************/
CONST USB_DEVICE_DESCRIPTOR USBDevDescriptor={
//设备描述符
	sizeof(USB_DEVICE_DESCRIPTOR),					//设备描述符长度，= 12H
	USB_DEVICE_DESCRIPTOR_TYPE,						//设备描述符类型，= 01H
	0x00,0x01,										//协议版本，= 1.10
	USB_CLASS_CODE_TEST_CLASS_DEVICE,				//测试设备类型， = 0DCH	
	0, 0,											//设备子类，设备协议
	EP0_PACKET_SIZE,								//端点0最大数据包大小，= 10H
	0x72,0x04,										//PHILIPS公司的设备ID	
	0x02,0x00,										//设备制造商定的产品ID
	0x00,0x00,										//设备系列号
	0x01,0x02,0x03,									//索引
	1												//可能的配置数
};

CONST USB_DESCRIPTOR USBDescriptor ={
//配置描述符
{
	sizeof(USB_CONFIGURATION_DESCRIPTOR),			//配置描述符长度，= 09H
	USB_CONFIGURATION_DESCRIPTOR_TYPE,				//配置描述符类型，= 02H
	CONFIG_DESCRIPTOR_LENGTH,0x00,					//描述符总长度， = 002EH
	1,												//只支持1个接口
	1,												//配置值
	0,												//字符串描述符指针(无)
	0x60,											//自供电,支持远程唤醒
	0x32											//最大功耗(100mA)	
},
//HID类接口描述符
{
  sizeof(USB_INTERFACE_DESCRIPTOR),				   //接口描述符长度，= 09H
  USB_INTERFACE_DESCRIPTOR_TYPE,                   //接口描述符类型
  0x00,                                            //识别码
  0x00,                                            //代替数值
  0x02,                                            //支持的端点数
  USB_DEVICE_CLASS_HUMAN_INTERFACE,                //类别码,HID设备
  HID_SUBCLASS_NONE,                               //子类别码
  HID_PROTOCOL_NONE,                               //协议码
  0x00                                             //索引
},
//HID描述符结构
{
	sizeof(USB_HID_DESCRIPTOR),						//描述符长度， = 09H
	0x21,											//描述符类型， = 21H
	0x00, 0x01,										//HID规范版本号， = 0100H
	0x00,											//国家代码	
	0x01,											//所支持的其他类描述符个数，1个
	0x22,											//从属描述符类型，22H 表示报告描述符
	0x34, 0x00										//从属描述符长度，0034H
},

{
// 逻辑端点 2 输入	
 {
	sizeof(USB_ENDPOINT_DESCRIPTOR),				// 端点描述符长度,= 07H  	  
	USB_ENDPOINT_DESCRIPTOR_TYPE,					// 端点描述符类型,= 05H  
	0x82,											// 端点2 IN					  
	USB_ENDPOINT_TYPE_INTERRUPT,					// 中断传输,= 03H  		
	EP2_PACKET_SIZE,0x00,							// 端点最大包的大小,= 0040H  
	10												// 批量传输时该值无效 	
 },
// 逻辑端点 2 输出
 {	
 	sizeof(USB_ENDPOINT_DESCRIPTOR),				// 端点描述符长度,= 07H       
	USB_ENDPOINT_DESCRIPTOR_TYPE,					// 端点描述符类型,= 05H		  
	0x2,											// 端点2 OUT				  
	USB_ENDPOINT_TYPE_INTERRUPT,					// 中断传输,= 03H			   
	EP2_PACKET_SIZE,0x00,							// 端点最大包的大小,= 0040H	   
	10												// 批量传输时该值无效
 }
}
};
CONST UINT8 acUSBHidReportDescriptor[52] = 
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
//定义USB 标准设备请求 结构体
CONST FUNCTION_ARRAY StandardDeviceRequest[16]={
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
CONST FUNCTION_ARRAY HidClassRequest[16]={
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
//语言描述符
UINT8  CONST acUSBLanguageDesCriptor[4]={0x04,0x03,0x09,0x04};	
//字符串描述符	
UINT8  CONST acUSBSerialDesriptor[18]  ={0x12,0x03,'C',0,'H',0,'3',0,'7',0,'2',0,'U',0,'S',0,'B',0};		

//字符串描述符所用的语言种类 
CONST UINT8 acUSBLanguageID[4]={0x04,0x03,0x09,0x04};                   

//设备序列号										
CONST UINT8 acUSBDeviceSerialNumber[22]=
{22,0x03,'2',0,'0',0,'0',0,'7',0,'-',0,'0',0,'3',0,'-',0,'2',0,'3',0};

//厂商字符串
CONST UINT8 acUSBManufacturerString[80]=
{
 80,0x03,0x16,0x7F,0x0B,0x7A,0x0F,0x5C,0x5B,0x72,0xBA,0x4E,0x84,0x76,
 'U',0,'S',0,'B',0,0xbE,0x8b,0x07,0x59,' ',0,0x20,0x00,'k',0,'1',0,'2',0,
 '5',0,'0',0,'0',0,'8',0,'3',0,'0',0,'1',0,'@',0,'1',0,'2',0,'6',0,'.',0,'c',0,
 'o',0,'m',0
};

//产品字符串
CONST UINT8 acUSBProducterString[80]=
{
 80,0x03,0x16,0x7F,0x0B,0x7A,0x0F,0x5C,0x5B,0x72,0xBA,0x4E,0x84,0x76,
 'U',0,'S',0,'B',0,0xbE,0x8b,0x07,0x59,' ',0,0x20,0x00,'k',0,'1',0,'2',0,
 '5',0,'0',0,'0',0,'8',0,'3',0,'0',0,'1',0,'@',0,'1',0,'2',0,'6',0,'.',0,'c',0,
 'o',0,'m',0
 };


USB_CTRL_PACKET  USBCtrlPacket={0};
USB_FLAGS        USBFlags={0};

UINT8 ucUSBAddress=0	;		          //暂存USB主机发来的地址

IDATA UINT8 USBMainBuf[EP2_PACKET_SIZE]={0};

/****************************************************************************************************
*
*                                      函数区
* 
*****************************************************************************************************/

/**********************************************************************************
** 函数名称 	: WriteDatToUsb
** 功能描述 	: 向CH372写数据
** 输		入	: UINT8 dat
** 输		出	: 无
************************************************************************************/
static 
void WriteDatToUsb(UINT8 dat)
{
    USB_CS=0;
	USB_DATA_OUTPUT=0xff;//拉高引脚
	USB_A0=USB_DAT_MODE;
	USB_WR=0;
	DelayNus(20);
	USB_DATA_OUTPUT=dat;
	DelayNus(20);
	USB_CS=1;
	USB_DATA_OUTPUT=0xff;//拉高引脚,防止引脚短路
	USB_WR=1;
}
/***********************************************************************************
** 函数名称 	: WriteCmdToUsb
** 功能描述 	: 向CH372写命令
** 输		入	:	 UINT8 cmd
** 输		出	:    无
************************************************************************************/
static 
void WriteCmdToUsb(UINT8 cmd)
{
    USB_CS=0;
	USB_DATA_OUTPUT=0xff;//拉高引脚
	USB_A0=USB_CMD_MODE;
	USB_WR=0;
	DelayNus(20);
	USB_DATA_OUTPUT=cmd;
	DelayNus(20);
	USB_CS=1;
	USB_DATA_OUTPUT=0xff;//拉高引脚,防止引脚短路
	USB_WR=1;
}
/***********************************************************************************
** 函数名称 	: ReadDatFromUsb
** 功能描述 	: 读取USB数据
** 输		入	:	 无
** 输		出	:    无
************************************************************************************/
static 
UINT8 ReadDatFromUsb(void)
{	
	UINT8 dat;
	USB_CS=0;
	USB_DATA_INPUT=0xff;//拉高引脚
	USB_A0=USB_DAT_MODE;
	USB_RD=0;
	DelayNus(20);	   //20*0.25us=5us
	dat=USB_DATA_INPUT;
	DelayNus(20);	   //20*0.25us=5us
	USB_CS=1;
	USB_RD=1;
	USB_DATA_INPUT=0xff;//拉高引脚,防止引脚短路

	return dat;
}
/***********************************************************************************
** 函数名称 	: USBCiWriteSingleCmd
** 功能描述 	: USB 写入单个命令
** 输		入	: 无
** 输		出	: 无
************************************************************************************/
void USBCiWriteSingleCmd(UINT8 cmd)
{
	 WriteCmdToUsb(cmd);
}
/***********************************************************************************
** 函数名称 	: USBCiWriteSingleData
** 功能描述 	: USB 写入单个数据
** 输		入	: 无
** 输		出	: 无
************************************************************************************/
void USBCiWriteSingleData(UINT8 dat)
{
	 WriteDatToUsb(dat);
}
/***********************************************************************************
** 函数名称 	: USBCiReadSingleData
** 功能描述 	: USB 读取单个数据
** 输		入	: 无
** 输		出	: 无
************************************************************************************/
UINT8 USBCiReadSingleData(void)
{
	 return ReadDatFromUsb();
}
/***********************************************************************************
** 函数名称 	: USBCiReadPortData
** 功能描述 	: 连续读取USB数据
** 输		入	:	 无
** 输		出	:    无
************************************************************************************/
UINT8 USBCiReadPortData(UINT8 *buf)
{
	 UINT8 i,len;
	 
	 USBCiWriteSingleCmd(CMD_RD_USB_DATA);
	 
	 len=USBCiReadSingleData();
	 
	 for(i=0; i<len; i++)
	 {
	 	*buf=USBCiReadSingleData();
	 		  
	 	 buf++;
	 }
	 
	 return len;
}
/***********************************************************************************
** 函数名称 	: USBCiWriteCmd
** 功能描述 	: USB 写命令
** 输		入	: 无
** 输		出	: 无
************************************************************************************/
void USBCiWritePortData(UINT8 *buf, UINT8 len)
{
	 if(buf == NULL || len ==0 )return;
	 
	 USBCiWriteSingleData(len);				//发送的长度为len
	 
	 while(len--)
	 {
		USBCiWriteSingleData(*buf);			//逐个数据发送

		buf++;
	 }
}
/***********************************************************************************
** 函数名称 	: USBCiEP0Send
** 功能描述 	: 向端点0写连续的数据
** 输		入	: buf 要发送数据的缓冲区
                  len 要发送数据的长度
** 输		出	: 无
************************************************************************************/
void USBCiEP0Send(UINT8 *buf,UINT8 len)
{
	USBCiWriteSingleCmd (CMD_WR_USB_DATA3);	//向端点0发送数据	
	USBCiWritePortData  (buf ,len);
}
/***********************************************************************************
** 函数名称 	: USBCiEP2Send
** 功能描述 	: 向端点2写连续的数据
** 输		入	: buf 要发送数据的缓冲区
                  len 要发送数据的长度
** 输		出	: 无
************************************************************************************/
void USBCiEP2Send(UINT8 *buf,UINT8 len)
{
	USBCiWriteSingleCmd (CMD_WR_USB_DATA7);	//向端点2发送数据
	USBCiWritePortData  (buf,len);
}
/***********************************************************************************
** 函数名称 	: USBCiInit
** 功能描述 	: USB初始化
** 输		入	:	 无
** 输		出	:    无
************************************************************************************/
void USBCiInit(void)
{
    UINT8 i=0;
    
	USBCiWriteSingleCmd(0x01);

	i=USBCiReadSingleData();

	USBCiWriteSingleCmd (CMD_SET_USB_MODE);
	USBCiWriteSingleData(CMD_OUTSIDE_FIRMWARE);   //外置固件模式

  	for (i=100;i!=0;i--)				          //等待操作成功,通常需要等待10uS-20uS
	{
		if(CMD_RET_SUCCESS==USBCiReadSingleData());
		{
			break;
		}
	
	}	//if ( i==0 ) CH372/CH375存在硬件错误;

	IE1=0;
	IT1=0;//置外部信号为低电平触发,IT1=1边沿触发
	EX1=1;
}

/*
  ---------------------  USB 协议层函数  ---------------------
*/
/***********************************************************************************
** 函数名称 : USBPcCtrlSend
** 功能描述 : 控制端点数据上传
** 输	 入	: 无
** 输	出	: 无
************************************************************************************/
void USBPcCtrlSend(UINT8 *buf,UINT8 len)
{
	 USBCiEP0Send(buf,len);
}
/***********************************************************************************
** 函数名称 : USBPcHold
** 功能描述 : 保持当前状态
** 输	 入	: 无
** 输	出	: 无
************************************************************************************/
void USBPcHold(void)
{
	 USBCiWriteSingleCmd (CMD_WR_USB_DATA3);	//发出写端点0的命令
	 USBCiWriteSingleData(0);			        //上传0长度数据，这是一个状态阶段
}
/***********************************************************************************
** 函数名称 : USBEP0DesriptorCopy
** 功能描述 : 复制描述符以便上传
** 输	 入	: 无
** 输	出	: 无
************************************************************************************/
void USBEP0DesriptorCopy(void)
{
	BufCpy(USBCtrlPacket.mucBuf,
		   USBCtrlPacket.mpucTxd+USBCtrlPacket.musTxCount,
		   EP0_PACKET_SIZE			
		  );
}
/***********************************************************************************
** 函数名称 : USBEP0Up
** 功能描述 : 端点0数据上传
** 输	 入	: 无
** 输	出	: 无
************************************************************************************/
void USBEP0Up(void)
{
	UINT8 len;
	
	//USBMSGEx("USBCtrlPacket.musTxLength:= ",USBCtrlPacket.musTxLength,10);
	
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
/*****************************************************************************************
** 函数名称: USBPcGetDescriptor				
** 功能描述: 获得描述符	
** 输    入: 无
** 输	 出: 无							
******************************************************************************************/
void USBPcGetDescriptor(void)
{
		//USBMSGEx("USBCtrlPacket.r.musRequestValue:=",USBCtrlPacket.r.musRequestValue,16);

		switch(MSB(USBCtrlPacket.r.musRequestValue))
		{
			case 0x01://设备描述符上传
				 {
                    USBMSG("-->获得设备描述符\r\n");

				 	USBCtrlPacket.mpucTxd=(UINT8 *)&USBDevDescriptor;
					USBCtrlPacket.musTxLength=USBCtrlPacket.musTxLength <=USBDevDescriptor.bLength? \
                                              USBCtrlPacket.musTxLength  :USBDevDescriptor.bLength;					
				 }
				break;

			case 0x02://配置描述符上传
				 {
                    USBMSG("-->获得配置描述符\r\n");

				 	USBCtrlPacket.mpucTxd=(UINT8 *)&USBDescriptor.ConfigDescr;
					//由于配置描述符比较小,其实只用US就已经足够了BDescriptor.ConfigDescr.wTotalLength0
					USBCtrlPacket.musTxLength=USBCtrlPacket.musTxLength <=(USBDescriptor.ConfigDescr.wTotalLength1<<8)|USBDescriptor.ConfigDescr.wTotalLength0? \
                                              USBCtrlPacket.musTxLength  :(USBDescriptor.ConfigDescr.wTotalLength1<<8)|USBDescriptor.ConfigDescr.wTotalLength0;

				
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
					            USBCtrlPacket.musTxLength=USBCtrlPacket.musTxLength <=acUSBLanguageDesCriptor[0]? \
                                                          USBCtrlPacket.musTxLength  :acUSBLanguageDesCriptor[0];								
												    
							}
							break ;
							
						case 0x01 ://获得厂商字符串
							{
								USBMSG("-->获得厂商字符串\r\n");
								
								USBCtrlPacket.mpucTxd = acUSBManufacturerString;
					            USBCtrlPacket.musTxLength=USBCtrlPacket.musTxLength <=acUSBManufacturerString[0]? \
                                                          USBCtrlPacket.musTxLength  :acUSBManufacturerString[0];												
							}

							break ;
							
						case 0x02 ://获取产品字符串
							{
								USBMSG("-->获得产品字符串\r\n");
								
								USBCtrlPacket.mpucTxd = acUSBProducterString;								
					            USBCtrlPacket.musTxLength=USBCtrlPacket.musTxLength <=acUSBProducterString[0]? \
                                                          USBCtrlPacket.musTxLength  :acUSBProducterString[0];										
							}
							break ;
							
						case 0x03 ://获取设备序列号
							{
								USBMSG("-->获取设备序列号\r\n");	
								
								USBCtrlPacket.mpucTxd = acUSBDeviceSerialNumber;								
					            USBCtrlPacket.musTxLength=USBCtrlPacket.musTxLength <=acUSBDeviceSerialNumber[0]? \
                                                          USBCtrlPacket.musTxLength  :acUSBDeviceSerialNumber[0];									    						
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
					USBCtrlPacket.musTxLength=USBCtrlPacket.musTxLength <=sizeof(acUSBHidReportDescriptor)?\
                                              USBCtrlPacket.musTxLength  :sizeof(acUSBHidReportDescriptor);

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
	
		USBEP0DesriptorCopy();
}
/*****************************************************************************************
** 函数名称: USBPcGetConfiguration				
** 功能描述: 获得配置
** 输    入: 无
** 输	 出: 无							
******************************************************************************************/
void USBPcGetConfiguration(void)
{
	 USBCtrlPacket.r.mucRequestType=USBFlags.bits.mbConfig ? 1:0;
}
/*****************************************************************************************
** 函数名称: USBPcClearFeature				
** 功能描述: 清除特性
** 输    入: 无
** 输	 出: 无							
******************************************************************************************/
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
/*****************************************************************************************
** 函数名称: USBPcGetInterface				
** 功能描述: 获得接口
** 输    入: 无
** 输	 出: 无							
******************************************************************************************/
void USBPcGetInterface(void)
{
     USBCtrlPacket.r.mucRequestType =0x01;
	 USBCtrlPacket.r.mucRequestCode =0x00;	 
}
/*****************************************************************************************
** 函数名称: USBPcGetStatus				
** 功能描述: 获得状态
** 输    入: 无
** 输	 出: 无							
******************************************************************************************/
void USBPcGetStatus(void)
{
     USBCtrlPacket.r.mucRequestType =0x00;
	 USBCtrlPacket.r.mucRequestCode =0x00;		
}
/*****************************************************************************************
** 函数名称: USBPcSetConfiguration				
** 功能描述: 设置配置
** 输    入: 无
** 输	 出: 无							
******************************************************************************************/
void USBPcSetConfiguration(void)
{
	USBFlags.bits.mbConfig = FALSE;

	USBFlags.bits.mbConfig = LSB(USBCtrlPacket.r.musRequestValue)? TRUE:FALSE;
}
/*****************************************************************************************
** 函数名称: USBPcSetAddress				
** 功能描述: 设置地址
** 输    入: 无
** 输	 出: 无							
******************************************************************************************/
void USBPcSetAddress(void)
{
	ucUSBAddress=LSB(USBCtrlPacket.r.musRequestValue);//暂存USB主机发来的地址
}
/*****************************************************************************************
** 函数名称: USBPcSetDescriptor				
** 功能描述: 设置描述符
** 输    入: 无
** 输	 出: 无							
******************************************************************************************/
void USBPcSetDescriptor(void)
{
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}
/*****************************************************************************************
** 函数名称: USBPcSetFeature				
** 功能描述: 设置特性
** 输    入: 无
** 输	 出: 无							
******************************************************************************************/
void USBPcSetFeature(void)
{

    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}
/*****************************************************************************************
** 函数名称: USBPcSetInterface				
** 功能描述: 设置接口
** 输    入: 无
** 输	 出: 无							
******************************************************************************************/
void USBPcSetInterface(void)
{
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}
/*****************************************************************************************
** 函数名称: USBPcGetReport				
** 功能描述: 获取报告
** 输    入: 无
** 输	 出: 无							
******************************************************************************************/
void USBPcGetReport(void) 
{
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;	
}
/*****************************************************************************************
** 函数名称: USBPcGetIdle				
** 功能描述: 获取空闲状态
** 输    入: 无
** 输	 出: 无							
******************************************************************************************/
void USBPcGetIdle(void)
{

    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;	
}
/*****************************************************************************************
** 函数名称: USBPcGetProtocol				
** 功能描述: 获取协议
** 输    入: 无
** 输	 出: 无							
******************************************************************************************/
void USBPcGetProtocol(void)
{
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}
/*****************************************************************************************
** 函数名称: USBPcSetProtocol				
** 功能描述: 设置协议
** 输    入: 无
** 输	 出: 无							
******************************************************************************************/
void USBPcSetProtocol(void)
{
	 //ucUSBProtocol = LSB(USBCtrlPacket.r.musRequestValue);
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
	/*UINT8 i ;
	i = 0x1 ;

	USBCtrlPacket.mpucTxd=&i ; //由于i为临时变量,容易出现野指针
	 USBCtrlPacket.musTxLength    = 1 ;*/
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
	//ucUSBIdle = USBCtrlPacket.r.musRequestValue ;
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
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
void UsbIRQ(void) interrupt 2
{
	UINT8 ucintStatus;
	UINT8 ucrecvLen,i;

	USBCiWriteSingleCmd(CMD_GET_STATUS);  								//获取中断状态并取消中断请求 
	ucintStatus =USBCiReadSingleData();  								//获取中断状态,清中断标志,对应于INT0中断 
	
	switch(ucintStatus)													//分析中断状态
	{  
		case USB_INT_EP2_OUT: 
			 {
				//这里一定要读取,否则会导致CH37x系列USB卡死
			 	  ucrecvLen=USBCiReadPortData(USBMainBuf);
  				  //USBMSG("\r\nCH37x USB 端点2收到数据\r\n");
				  USBMSG("CH37x USB接收到数据如下:\r\n");
				  for(i=0;i<ucrecvLen;i++)USBMSGEx("",USBMainBuf[i],16);
				  USBMSG("\r\n");
				  USBMSG("CH37x USB向PC机发送数据---->\r\n");			 
				  USBMSG("\r\n");
				  USBCiEP2Send(USBMainBuf,64);

			 } 
			 break;

		case USB_INT_EP2_IN:										    //批量端点上传成功,未处理
			 {
			 	USBMSG("\r\nCH37x USB 发送数据成功\r\n");
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

			  USBEP0Up();	  //数据上传
			}
			break;

		case USB_INT_EP0_IN:				                        //控制端点上传成功	
		    {
					//当发送完描述符时,会从	USB_INT_EP0_IN 转到 USB_INT_EP0_SETUP的,
					//即发送完当前规定长度的描述符,才会出现USB_INT_EP0_SETUP中断,
					//否则一直为USB_INT_EP0_IN
	    	
				if(USBFlags.bits.mbDescriptor)          //描述符上传
				{								
					USBEP0DesriptorCopy();                          //复制描述符
					USBEP0Up();															
				}
				//设置USB地址
				else if(USBFlags.bits.mbAdrress)   //设置地址
				{
					USBCiWriteSingleCmd (CMD_SET_USB_ADDR);
					USBCiWriteSingleData(ucUSBAddress);				//设置USB地址,设置下次事务的USB地址
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
			 	//这里一定要读取,否则会导致CH37x系列USB卡死
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
					USBMSG("CH37x USB 复位\r\n");
				}

				USBCiWriteSingleCmd (CMD_UNLOCK_USB);				//释放缓冲区
			 }
			 break;

	 }
}
