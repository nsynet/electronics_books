/***********************************************************
*��    ��:������ 
*��    ��:Process.c
*��������:2010-06-10
*����˵��:���׽��̵�����
***********************************************************/
#include "Typedef.h"
#include "Process.h"



extern PROC_API void PROC_SetData (WPARAM Wp,LPARAM Lp);//�ⲿ����PROC_SetData
extern PROC_API void PROC_SendData(WPARAM Wp,LPARAM Lp);//�ⲿ����PROC_SendData


/*
 ======================================================

                         ���Ͷ���

 ======================================================
*/
typedef struct _PROCCTRL 
{
    PROC_API void (*Proc)(WPARAM Wp,LPARAM Lp);//����
	BOOL   bAlive;                                   //�����Ƿ���Ч��־λ
	WPARAM WParam;                                  //����1(��ѡ)
	LPARAM LParam;                                  //����2(��ѡ)
}PROCCTRL;

/*
 ======================================================

                         ������

 ======================================================
*/
static UINT8 g_ucCurProc=0;                   //��ǰ����

static PROCCTRL g_StProcTbl[]={

	   #include "ProcessTab.h"                //��������б�

                            };

/*
 ======================================================

                         ������

 ======================================================
*/
#define EN_LOW_POWER     (0)        //�Ƿ�����͹���ģʽ

#if     EN_LOW_POWER
/******************************************************
*�ļ�����:PROC_Idle
*��    ��:��
*��    ��:��
*����˵��:����͹���ģʽ
*******************************************************/
static void PROC_Idle(void)
{
       //��������Ӵ���(���벻��̫��,��Ӱ��ϵͳ����)
	   PCON|=0x01;
}
#endif

/******************************************************
*�ļ�����:SetProcIsAlive
*��    ��:unProc  �������
          bAlive  �����Ƿ���Ч
		 Wp       ����1(��ѡ)
          Lp      ����2(��ѡ)
*��    ��:��
*����˵��:���ý����Ƿ���Ч,��֧�ִ���
*******************************************************/
void SetProcIsAlive(UINT8 unProc,BOOL bAlive,WPARAM Wp,LPARAM Lp)
{
	 g_StProcTbl[unProc].bAlive=bAlive?TRUE:FALSE;
	 g_StProcTbl[unProc].WParam=Wp;
	 g_StProcTbl[unProc].LParam=Lp;
}
/******************************************************
*�ļ�����:SetCurProcIsAlive
*��    ��:bAlive  ��ǰ�����Ƿ���Ч
*��    ��:��
*����˵��:���õ�ǰ�����Ƿ���Ч
*******************************************************/
void SetCurProcIsAlive(BOOL bAlive)
{
	 g_StProcTbl[g_ucCurProc].bAlive=bAlive?TRUE:FALSE;
}
/******************************************************
*�ļ�����:ProcPerform
*��    ��:��
*��    ��:��
*����˵��:���̵���
*******************************************************/
void ProcPerform(void)
{

#if     EN_LOW_POWER                               //�Ƿ�����͹���

#define ENTER_IDLE_COUNT (3)                    //����͹���ģʽ�����ֵ
 
     static UINT8 ucIdleCount=0;                //����͹���ģʽ������ 
	 static BOOL  bIsFoundProcAlive=FALSE;    //�Ƿ�����Ч�Ľ���

#endif
     
	 for(g_ucCurProc=0;g_StProcTbl[g_ucCurProc].Proc !=0;g_ucCurProc++)
	 {
		 if(g_StProcTbl[g_ucCurProc].bAlive) //������Ч�Ľ�����ִ�в��������  
		 {
			g_StProcTbl[g_ucCurProc].Proc(g_StProcTbl[g_ucCurProc].WParam,
			                              g_StProcTbl[g_ucCurProc].LParam);			
#if  EN_LOW_POWER
			bIsFoundProcAlive=TRUE;          //������Ч�Ľ���
#endif		
		 }
#if  EN_LOW_POWER
		 else
		 {
		 	bIsFoundProcAlive=FALSE;         //û�з�����Ч�Ľ���
		 }
#endif
	 		 	
	 }

#if  EN_LOW_POWER

     if(bIsFoundProcAlive)                       //������Ч�Ľ���
	 {
	 	ucIdleCount=0;                           //����͹���ģʽ����������  

		return;
	 }

     if(++ucIdleCount >= ENTER_IDLE_COUNT)   //������͹���ģʽ�������ﵽ�ֵ
     {
          
          PROC_Idle();                           //����͹���ģʽ

          ucIdleCount=0;                         //����͹���ģʽ����������
     }

#endif
}

