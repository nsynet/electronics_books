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
    USB_CS=0;                 //选通CH372
	USB_DATA_OUTPUT=0xFF;     //拉高引脚
	USB_A0=USB_CMD_MODE;      //命令模式
	USB_WR=0;                 //允许写       	
	USB_DATA_OUTPUT=cmd;      //写命令
    DelayNus(3);           
	USB_CS=1;                 //不选通CH372
	USB_DATA_OUTPUT=0xFF;     //拉高引脚
	USB_WR=1;                 //禁止写
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
/****************************************************
* 函数名称: USBCiWriteSingleCmd
* 输    入: UINT8 cmd
* 输    出: 无
* 功能描述: 写入USB单个命令
*****************************************************/
void USBCiWriteSingleCmd(UINT8 cmd)
{
	 WriteCmdToUsb(cmd);     
}

/****************************************************
* 函数名称: USBCiWriteSingleData
* 输    入: 单字节数据
* 输    出: 无
* 功能描述: 写入USB单个数据
*****************************************************/
void USBCiWriteSingleData(UINT8 dat)
{
	 WriteDatToUsb(dat);   //调用WriteDatToUsb函数写数据
}
/****************************************************
* 函数名称: USBCiReadSingleData
* 输    入: 无
* 输    出: 单字节数据
* 功能描述: 读取USB单个数据
*****************************************************/
UINT8 USBCiReadSingleData(void)
{
	 return ReadDatFromUsb();//调用ReadDatFromUsb函数写数据
}
/****************************************************
* 函数名称: USBCiReadPortData
* 输    入: 数据缓冲区buf
* 输    出: 读取数据的长度
* 功能描述: 读取USB多个数据
*****************************************************/
UINT8 USBCiReadPortData(UINT8 *buf)
{
	 UINT8 i,len; 
	 
	 USBCiWriteSingleCmd(CMD_RD_USB_DATA); //读数据命令
	 
	 len=USBCiReadSingleData();              //读取长度
	 
	 for(i=0; i<len; i++)                     //for 循环
	 {
	 	*buf=USBCiReadSingleData();         //读取数据
	 		  
	 	 buf++;                                 //buf偏移1个字节
	 }
	 
	 return len;                               //返回读取的数据长度
}
/****************************************************
* 函数名称: USBCiWritePortData
* 输    入: 数据缓冲区buf，数据长度len
* 输    出: 无
* 功能描述: 写入USB多个数据
*****************************************************/
void USBCiWritePortData(UINT8 *buf, UINT8 len)
{	 
	 USBCiWriteSingleData(len);				//发送的长度为len
	 
	 while(len--)
	 {
		USBCiWriteSingleData(*buf);			//逐个数据发送

		buf++;
	 }
}
/****************************************************
* 函数名称: USBCiEP1Send
* 输    入: 数据缓冲区buf，数据长度len
* 输    出: 无
* 功能描述: 端点1发送连续的数据
*****************************************************/
void USBCiEP1Send(UINT8 *buf,UINT8 len)
{
	USBCiWriteSingleCmd (CMD_WR_USB_DATA5);	//向端点1发送数据
	USBCiWritePortData  (buf,len);
}
/****************************************************
* 函数名称: USBCiEP2Send
* 输    入: 数据缓冲区buf，数据长度len
* 输    出: 无
* 功能描述: 端点2发送连续的数据
*****************************************************/
void USBCiEP2Send(UINT8 *buf,UINT8 len)
{
	USBCiWriteSingleCmd (CMD_WR_USB_DATA7);	//向端点2发送数据
	USBCiWritePortData  (buf,len);
}
/****************************************************
* 函数名称: USBCiInit
* 输    入: 无
* 输    出: 无
* 功能描述: USB 初始化
*****************************************************/
void USBCiInit(void)
{    
	USBCiWriteSingleCmd (CMD_SET_USB_MODE);     //设置模式
	USBCiWriteSingleData(CMD_INSIDE_FIRMWARE);  //内置固件
	DelayNus(20);                               //延时一小段时间
    USBHwInit();                                //USB硬件初始化
}

