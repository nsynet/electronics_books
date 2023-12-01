/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */
#include "stc.h"
#include "global.h"
#include "USBDefine.h"
#include "USBHardware.h"
#include "USBInterface.h"
/****************************************************************************************************
*
*                                      变量区
* 
*****************************************************************************************************/

/****************************************************************************************************
*
*                                      函数区
* 
*****************************************************************************************************/

/****************************************************
* 函数名称: WriteDatToUsb
* 输    入: UINT8 dat
* 输    出: 无
* 功能描述: 向CH372写数据
*****************************************************/
static void WriteDatToUsb(UINT8 dat)
{
    USB_CS=0;                    //选通CH372
	USB_DATA_OUTPUT=0xFF;        //拉高引脚
	USB_A0=USB_DAT_MODE;         //数据模式
	USB_WR=0;                    //允许写
           
	USB_DATA_OUTPUT=dat;         //写数据

    DelayNus(3);            
	USB_CS=1;                    //不选通CH372
	USB_DATA_OUTPUT=0xFF;        //拉高引脚
	USB_WR=1;                    //禁止写
}
/****************************************************
* 函数名称: WriteDatToUsb
* 输    入: UINT8 cmd
* 输    出: 无
* 功能描述: 向CH372写命令
*****************************************************/
static void WriteCmdToUsb(UINT8 cmd)
{
    USB_CS=0;                   //选通CH372
	USB_DATA_OUTPUT=0xFF;       //拉高引脚
	USB_A0=USB_CMD_MODE;        //命令模式
	USB_WR=0;                   //允许写
         	
	USB_DATA_OUTPUT=cmd;        //写命令

    DelayNus(3);           
	USB_CS=1;                   //不选通CH372
	USB_DATA_OUTPUT=0xFF;       //拉高引脚
	USB_WR=1;                   //禁止写
}
/****************************************************
* 函数名称: WriteDatToUsb
* 输    入: UINT8 cmd
* 输    出: 无
* 功能描述: 向CH372写命令
*****************************************************/
static UINT8 ReadDatFromUsb(void)
{	
	UINT8 dat;
	USB_CS=0;                   //选通CH372
	USB_DATA_INPUT=0xFF;        //拉高引脚
	USB_A0=USB_DAT_MODE;        //数据模式
	USB_RD=0;                   //允许读
          
	dat=USB_DATA_INPUT;         //读取数据

    DelayNus(3);	          
	USB_CS=1;                   //不选通CH372
	USB_RD=1;                   //禁止读
	USB_DATA_INPUT=0xFF;        //拉高引脚

	return dat;                 //返回读取到的数据
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
	 //if(buf == NULL || len ==0 )return;
	 
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

	DelayNms(250);
  	for (i=100;i!=0;i--)				          //等待操作成功,通常需要等待10uS-20uS
	{
		if(CMD_RET_SUCCESS==USBCiReadSingleData());
		{
			break;
		}
	
	}	//if ( i==0 ) CH372/CH375存在硬件错误;

	USBHwInit();
}

