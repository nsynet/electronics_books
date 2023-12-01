/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */
#include "stc.h"
#include "Global.h"
/****************************************************************************************************
*
*                                      变量区
* 
*****************************************************************************************************/
//系统消息变量
static
volatile UINT8 __ucSysMsg=SYS_IDLE;

/******************************************************************
*函数名称:DelayNus
*输    入:t 延时时间
*输    出:无
*说    明:微秒级延时
*******************************************************************/
void DelayNus(UINT16 t)
{
	do
	{
		NOP();
	}while(--t >0);	
}
/******************************************************************
*函数名称:DelayNms
*输    入:t 延时时间
*输    出:无
*说    明:毫秒级延时
*******************************************************************/
void DelayNms(UINT16 t)
{
	 do
	 {
	 	DelayNus(1000);

	 }while(--t >0);
}

/*************************************************************
* 函数名称:BufClr
* 输    入:dest 缓冲区; size 缓冲区大小
* 输    出:无
* 说    明:清空缓冲区
**************************************************************/
BOOL BufClr(UINT8 * dest,UINT32 size)
{
    if(NULL ==dest || 0==size)
    {
    	return FALSE;
    }
    
	do
	{
		*dest++ = 0;		 
		
	}while(--size!=0);
	
	return TRUE;
}
/*************************************************************
* 函数名称:BufCpy
* 输    入:dest 缓冲区; size 缓冲区大小
* 输    出:无
* 说    明:清空缓冲区
**************************************************************/
BOOL BufCpy(UINT8 * dest,UINT8 * src,UINT32 size)
{
    if(NULL ==dest || NULL==src ||0==size)
    {
    	return FALSE;
    }
    
	do
	{
		*dest++ = *src++;
		
	}while(--size!=0);
	
	return TRUE;
} 
/*************************************************************
* 函数名称:SYSIdle
* 输    入:无
* 输    出:无
* 说    明:空闲任务
**************************************************************/
void SYSIdle(void)
{
	 MCU_IDLE();
}
/*************************************************************
* 函数名称:SYSPostCurMsg
* 输    入:无
* 输    出:无
* 说    明:发送当前任务
**************************************************************/
void  SYSPostCurMsg(UINT8 msg)
{
	__ucSysMsg=msg;
}
/*************************************************************
* 函数名称:SYSIdle
* 输    入:无
* 输    出:无
* 说    明:获取当前任务
**************************************************************/
UINT8 SYSRecvCurMsg(void)
{
	return __ucSysMsg;
}
