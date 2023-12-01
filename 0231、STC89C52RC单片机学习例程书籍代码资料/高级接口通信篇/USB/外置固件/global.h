/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */
#ifndef __GLOBAL_H__
#define __GLOBAL_H__
#include <intrins.h>
#include "typedef.h"
#include "UARTInterface.h"
/****************************************************************************************************
*
*                                      宏定义区
* 
*****************************************************************************************************/
/*
              ---      芯片选择      ---
*/
#ifndef __C51__
#define __C51__
#endif
/*
              ---      全局宏定义      ---
*/
#ifdef __C51__

#define  DATA           data
#define IDATA          idata
#define XDATA          xdata
#define PDATA          pdata
#define CONST           code 

#else

#define  DATA   
#define IDATA 
#define XDATA 
#define PDATA 
#define CONST           const 

#endif //end #ifdef __C51__


/*  
		全局显示调试信息开关
*/
#ifndef DEBUG
#define DEBUG           (1)
#endif

#if      DEBUG

#define  DEBUGMSG	     UARTCiPrintfString


#else

#define  DEBUGMSG

#endif //end #if DEBUG


#define  EN_USBDEBUG     (0)


#if     (DEBUG && EN_USBDEBUG)
#define USBMSG           UARTCiPrintfString
#define USBMSGEx         UARTCiPrintfVal
#else
#define USBMSG /\
/USBMSG
#define USBMSGEx /\
/USBMSGEx
#endif //end #if     (DEBUG && EN_USBDEBUG)


/*
              ---      系统任务设置      ---
*/
#define MAX_TASKS        8                       //任务总数

#define SYS_IDLE         0                       //任务0
#define RUN_USB_DISPOSE_DATA 7                   //任务7
/*
              ---      可能用到的宏      ---
*/
#define NULL             (void *)0

#define TRUE              0x01
#define FALSE             0x00

#define UNKNOWN_ERROR     0xFF
#define NO_ERROR          0x00
 
#define ENABLE            TRUE
#define DISBALE           FALSE  

#define NOP()             _nop_()

#define ENTER_CRITICAL()  EA=0	//总中断关闭
#define EXIT_CRITICAL()	  EA=1	//开总中断

#define SWAP16(x)  ((((UINT16)(x))<<8)|(((UINT16)(x))>>8))
#define SWAP32(x)  ((((UINT32)SWAP16(x))<<16)|SWAP16((x)>>16))
#define LSB(x)     ((UINT8)(x))
#define MSB(x)     ((UINT8)(((UINT16)(x))>>8)) 
   
#define MCU_IDLE()					PCON|=0x01	   //单片机进入睡眠模式	

#define EN_HAL_DELAY      (1)                 //是否使能硬件定时器作延时
/****************************************************************************************************
*
*                                      变量区
* 
*****************************************************************************************************/

typedef struct
{
	  const void(*fun)(void);
	  const INT8  *s;
}FUNCTION_ARRAY;
/****************************************************************************************************
*
*                                      函数区
* 
*****************************************************************************************************/
 /******************************************************************
*函数名称:DelayNus
*输    入:t 延时时间
*输    出:无
*说    明:微秒级延时
*******************************************************************/
extern void DelayNus(UINT16 t);
/******************************************************************
*函数名称:DelayNms
*输    入:t 延时时间
*输    出:无
*说    明:毫秒级延时
*******************************************************************/
extern void DelayNms(UINT16 t);
/*************************************************************
* 函数名称:BufClr
* 输    入:dest 缓冲区; size 缓冲区大小
* 输    出:无
* 说    明:清空缓冲区
**************************************************************/
extern BOOL BufClr(UINT8 * dest,UINT32 size);
/*************************************************************
* 函数名称:BufCpy
* 输    入:dest 缓冲区; size 缓冲区大小
* 输    出:无
* 说    明:清空缓冲区
**************************************************************/
extern BOOL BufCpy(UINT8 * dest,UINT8 * src,UINT32 size);
/*************************************************************
* 函数名称:SYSIdle
* 输    入:无
* 输    出:无
* 说    明:空闲任务
**************************************************************/
extern void SYSIdle(void);
/*************************************************************
* 函数名称:SYSPostCurMsg
* 输    入:无
* 输    出:无
* 说    明:发送当前任务
**************************************************************/
extern void  SYSPostCurMsg(UINT8 msg);
/*************************************************************
* 函数名称:SYSIdle
* 输    入:无
* 输    出:无
* 说    明:获取当前任务
**************************************************************/
extern UINT8 SYSRecvCurMsg(void);


#endif