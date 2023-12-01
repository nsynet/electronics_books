/*
---------------------------------------------------------------
文件名称:Process.h
说    明:函数进程调度
作    者:温子祺
创建时间:2010-06-10
---------------------------------------------------------------
*/
#ifndef __PROCESS_H__
#define __PROCESS_H__



/*
 ======================================================

                         宏

 ======================================================
*/
#define PROC_API                     //进程标识

#define PROC_SET_DATA            0   //设置数据进程序号
#define PROC_SEND_DATA	         1   //发送数据进程



/*
 ======================================================

                         引用函数

 ======================================================
*/
extern void SetProcIsAlive   (UINT8 unProc,BOOL bAlive,WPARAM Wp,LPARAM Lp);
extern void SetCurProcIsAlive(BOOL bAlive);
extern void ProcPerform      (void);
      



#endif


