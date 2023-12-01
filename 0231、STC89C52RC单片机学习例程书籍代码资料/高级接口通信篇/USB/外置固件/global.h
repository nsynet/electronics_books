/*
 ----------------------------------------------------
 *��    �ߣ�������
 ----------------------------------------------------
 */
#ifndef __GLOBAL_H__
#define __GLOBAL_H__
#include <intrins.h>
#include "typedef.h"
#include "UARTInterface.h"
/****************************************************************************************************
*
*                                      �궨����
* 
*****************************************************************************************************/
/*
              ---      оƬѡ��      ---
*/
#ifndef __C51__
#define __C51__
#endif
/*
              ---      ȫ�ֺ궨��      ---
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
		ȫ����ʾ������Ϣ����
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
              ---      ϵͳ��������      ---
*/
#define MAX_TASKS        8                       //��������

#define SYS_IDLE         0                       //����0
#define RUN_USB_DISPOSE_DATA 7                   //����7
/*
              ---      �����õ��ĺ�      ---
*/
#define NULL             (void *)0

#define TRUE              0x01
#define FALSE             0x00

#define UNKNOWN_ERROR     0xFF
#define NO_ERROR          0x00
 
#define ENABLE            TRUE
#define DISBALE           FALSE  

#define NOP()             _nop_()

#define ENTER_CRITICAL()  EA=0	//���жϹر�
#define EXIT_CRITICAL()	  EA=1	//�����ж�

#define SWAP16(x)  ((((UINT16)(x))<<8)|(((UINT16)(x))>>8))
#define SWAP32(x)  ((((UINT32)SWAP16(x))<<16)|SWAP16((x)>>16))
#define LSB(x)     ((UINT8)(x))
#define MSB(x)     ((UINT8)(((UINT16)(x))>>8)) 
   
#define MCU_IDLE()					PCON|=0x01	   //��Ƭ������˯��ģʽ	

#define EN_HAL_DELAY      (1)                 //�Ƿ�ʹ��Ӳ����ʱ������ʱ
/****************************************************************************************************
*
*                                      ������
* 
*****************************************************************************************************/

typedef struct
{
	  const void(*fun)(void);
	  const INT8  *s;
}FUNCTION_ARRAY;
/****************************************************************************************************
*
*                                      ������
* 
*****************************************************************************************************/
 /******************************************************************
*��������:DelayNus
*��    ��:t ��ʱʱ��
*��    ��:��
*˵    ��:΢�뼶��ʱ
*******************************************************************/
extern void DelayNus(UINT16 t);
/******************************************************************
*��������:DelayNms
*��    ��:t ��ʱʱ��
*��    ��:��
*˵    ��:���뼶��ʱ
*******************************************************************/
extern void DelayNms(UINT16 t);
/*************************************************************
* ��������:BufClr
* ��    ��:dest ������; size ��������С
* ��    ��:��
* ˵    ��:��ջ�����
**************************************************************/
extern BOOL BufClr(UINT8 * dest,UINT32 size);
/*************************************************************
* ��������:BufCpy
* ��    ��:dest ������; size ��������С
* ��    ��:��
* ˵    ��:��ջ�����
**************************************************************/
extern BOOL BufCpy(UINT8 * dest,UINT8 * src,UINT32 size);
/*************************************************************
* ��������:SYSIdle
* ��    ��:��
* ��    ��:��
* ˵    ��:��������
**************************************************************/
extern void SYSIdle(void);
/*************************************************************
* ��������:SYSPostCurMsg
* ��    ��:��
* ��    ��:��
* ˵    ��:���͵�ǰ����
**************************************************************/
extern void  SYSPostCurMsg(UINT8 msg);
/*************************************************************
* ��������:SYSIdle
* ��    ��:��
* ��    ��:��
* ˵    ��:��ȡ��ǰ����
**************************************************************/
extern UINT8 SYSRecvCurMsg(void);


#endif