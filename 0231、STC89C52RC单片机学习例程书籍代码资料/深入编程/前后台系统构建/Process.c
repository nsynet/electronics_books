/***********************************************************
*作    者:温子祺 
*文    件:Process.c
*创建日期:2010-06-10
*功能说明:简易进程调度器
***********************************************************/
#include "Typedef.h"
#include "Process.h"



extern PROC_API void PROC_SetData (WPARAM Wp,LPARAM Lp);//外部引用PROC_SetData
extern PROC_API void PROC_SendData(WPARAM Wp,LPARAM Lp);//外部引用PROC_SendData


/*
 ======================================================

                         类型定义

 ======================================================
*/
typedef struct _PROCCTRL 
{
    PROC_API void (*Proc)(WPARAM Wp,LPARAM Lp);//进程
	BOOL   bAlive;                                   //进程是否有效标志位
	WPARAM WParam;                                  //参数1(可选)
	LPARAM LParam;                                  //参数2(可选)
}PROCCTRL;

/*
 ======================================================

                         变量区

 ======================================================
*/
static UINT8 g_ucCurProc=0;                   //当前进程

static PROCCTRL g_StProcTbl[]={

	   #include "ProcessTab.h"                //引入进程列表

                            };

/*
 ======================================================

                         函数区

 ======================================================
*/
#define EN_LOW_POWER     (0)        //是否允许低功耗模式

#if     EN_LOW_POWER
/******************************************************
*文件名称:PROC_Idle
*输    入:无
*输    出:无
*功能说明:进入低功耗模式
*******************************************************/
static void PROC_Idle(void)
{
       //请自行添加代码(代码不宜太多,会影响系统性能)
	   PCON|=0x01;
}
#endif

/******************************************************
*文件名称:SetProcIsAlive
*输    入:unProc  进程序号
          bAlive  进程是否有效
		 Wp       参数1(可选)
          Lp      参数2(可选)
*输    出:无
*功能说明:设置进程是否有效,并支持传参
*******************************************************/
void SetProcIsAlive(UINT8 unProc,BOOL bAlive,WPARAM Wp,LPARAM Lp)
{
	 g_StProcTbl[unProc].bAlive=bAlive?TRUE:FALSE;
	 g_StProcTbl[unProc].WParam=Wp;
	 g_StProcTbl[unProc].LParam=Lp;
}
/******************************************************
*文件名称:SetCurProcIsAlive
*输    入:bAlive  当前进程是否有效
*输    出:无
*功能说明:设置当前进程是否有效
*******************************************************/
void SetCurProcIsAlive(BOOL bAlive)
{
	 g_StProcTbl[g_ucCurProc].bAlive=bAlive?TRUE:FALSE;
}
/******************************************************
*文件名称:ProcPerform
*输    入:无
*输    出:无
*功能说明:进程调度
*******************************************************/
void ProcPerform(void)
{

#if     EN_LOW_POWER                               //是否允许低功耗

#define ENTER_IDLE_COUNT (3)                    //进入低功耗模式额定计数值
 
     static UINT8 ucIdleCount=0;                //进入低功耗模式计数器 
	 static BOOL  bIsFoundProcAlive=FALSE;    //是否发现有效的进程

#endif
     
	 for(g_ucCurProc=0;g_StProcTbl[g_ucCurProc].Proc !=0;g_ucCurProc++)
	 {
		 if(g_StProcTbl[g_ucCurProc].bAlive) //发现有效的进程则执行并传入参数  
		 {
			g_StProcTbl[g_ucCurProc].Proc(g_StProcTbl[g_ucCurProc].WParam,
			                              g_StProcTbl[g_ucCurProc].LParam);			
#if  EN_LOW_POWER
			bIsFoundProcAlive=TRUE;          //发现有效的进程
#endif		
		 }
#if  EN_LOW_POWER
		 else
		 {
		 	bIsFoundProcAlive=FALSE;         //没有发现有效的进程
		 }
#endif
	 		 	
	 }

#if  EN_LOW_POWER

     if(bIsFoundProcAlive)                       //发现有效的进程
	 {
	 	ucIdleCount=0;                           //进入低功耗模式计数器清零  

		return;
	 }

     if(++ucIdleCount >= ENTER_IDLE_COUNT)   //若进入低功耗模式计数器达到额定值
     {
          
          PROC_Idle();                           //进入低功耗模式

          ucIdleCount=0;                         //进入低功耗模式计数器清零
     }

#endif
}

