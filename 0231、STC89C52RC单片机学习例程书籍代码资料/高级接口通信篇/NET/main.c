/*
 ----------------------------------------------------
 *��    �ߣ�������
 ----------------------------------------------------
 */
#include "Board.h" 
#include "Global.h"
/*
	����
*/
#include "NETDefine.h" 
#include "NETInterface.h"
#include "NETProtocol.h"
#include "NETApplication.h"





/****************************************************************************************************
*
*                                      ������
* 
*****************************************************************************************************/
static   UINT8 CODE acLocalMac[6] = {0x54,0x55,0x58,0x10,0x00,0x24};
static   UINT8 CODE acLocalIP[4]  = {192,168,1,218};
/*
	  ���񼶺���

˵��:���������Ҫ���е�����
ע��:������MAX_TASKS�����ֵ���Լ���ӵ�����

*/


static void (* CODE avTaskTbl[MAX_TASKS])(void)={  SYSIdle,              //    ϵͳ���� ����
										           NULL,                 //       ��    ����
										           NULL,                 //       ��    ����
										           NULL,                 //       ��    ����
										           NULL,                 //       ��    ����
										           NULL,                 //       ��    ����
										           NETApDisposeData,     //NET �������� ����
										           NULL                  //       ��    ����
};
/****************************************************************************************************
*
*                                      ������
* 
*****************************************************************************************************/
void main(void)
{ 

  NET_PORT=SI_ENJ|SO_ENJ|SCK_ENJ;
  P3=0xFF;
  
  NETCiInit(acLocalMac);        //����ENC28j60��MAC��ַ
  NETCiClkOut(2);               //����ENC28j60��ʱ�ӷ���
  DelayNms(10);
  NETCiPhyWrite(PHLCON,0xD76);	 
  DelayNms(20);   
  NETPcInit(acLocalMac,acLocalIP,TCP_PORT); //�����ʼ������IP��ַ��MAC��ַ

  SYSPostCurMsg(RUN_NET_DISPOSE_DATA);      //��������


  while(1)
  {
	
	avTaskTbl[SYSRecvCurMsg()](); //���߲�����Ϣ
  }

}

