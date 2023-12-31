#ifndef __USBINTERFACE_H__
#define __USBINTERFACE_H__
/***********************************************************************************
** 函数名称 	: USBCiInit
** 功能描述 	: USB初始化
** 输		入	:	 无
** 输		出	:    无
************************************************************************************/
extern void USBCiInit(void);
/***********************************************************************************
** 函数名称 	: USBCiWriteSingleCmd
** 功能描述 	: USB 写入单个命令
** 输		入	: 无
** 输		出	: 无
************************************************************************************/
extern void USBCiWriteSingleCmd(UINT8 cmd);
/***********************************************************************************
** 函数名称 	: USBCiWriteSingleData
** 功能描述 	: USB 写入单个数据
** 输		入	: 无
** 输		出	: 无
************************************************************************************/
extern void USBCiWriteSingleData(UINT8 dat);
/***********************************************************************************
** 函数名称 	: USBCiReadSingleData
** 功能描述 	: USB 读取单个数据
** 输		入	: 无
** 输		出	: 无
************************************************************************************/
extern UINT8 USBCiReadSingleData(void);
/***********************************************************************************
** 函数名称 	: USBCiReadPortData
** 功能描述 	: 连续读取USB数据
** 输		入	:	 无
** 输		出	:    无
************************************************************************************/
extern UINT8 USBCiReadPortData(UINT8 *buf);
/***********************************************************************************
** 函数名称 	: USBCiWriteCmd
** 功能描述 	: USB 写命令
** 输		入	: 无
** 输		出	: 无
************************************************************************************/
extern void USBCiWritePortData(UINT8 *buf, UINT8 len);
/***********************************************************************************
** 函数名称 	: USBCiEP0Send
** 功能描述 	: 向端点0写连续的数据
** 输		入	: buf 要发送数据的缓冲区
                  len 要发送数据的长度
** 输		出	: 无
************************************************************************************/
extern void USBCiEP0Send(UINT8 *buf,UINT8 len);
/***********************************************************************************
** 函数名称 	: USBCiEP1Send
** 功能描述 	: 向端点1写连续的数据
** 输		入	: buf 要发送数据的缓冲区
                  len 要发送数据的长度
** 输		出	: 无
************************************************************************************/
extern void USBCiEP1Send(UINT8 *buf,UINT8 len);
/***********************************************************************************
** 函数名称 	: USBCiEP2Send
** 功能描述 	: 向端点2写连续的数据
** 输		入	: buf 要发送数据的缓冲区
                  len 要发送数据的长度
** 输		出	: 无
************************************************************************************/
extern void USBCiEP2Send(UINT8 *buf,UINT8 len);
#endif