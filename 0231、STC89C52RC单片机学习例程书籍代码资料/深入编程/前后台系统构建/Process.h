/*
---------------------------------------------------------------
�ļ�����:Process.h
˵    ��:�������̵���
��    ��:������
����ʱ��:2010-06-10
---------------------------------------------------------------
*/
#ifndef __PROCESS_H__
#define __PROCESS_H__



/*
 ======================================================

                         ��

 ======================================================
*/
#define PROC_API                     //���̱�ʶ

#define PROC_SET_DATA            0   //�������ݽ������
#define PROC_SEND_DATA	         1   //�������ݽ���



/*
 ======================================================

                         ���ú���

 ======================================================
*/
extern void SetProcIsAlive   (UINT8 unProc,BOOL bAlive,WPARAM Wp,LPARAM Lp);
extern void SetCurProcIsAlive(BOOL bAlive);
extern void ProcPerform      (void);
      



#endif


