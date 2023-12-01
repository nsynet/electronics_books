/*
 ----------------------------------------------------
 *��    �ߣ�������
 ----------------------------------------------------
 */
#include "stc.h"
#include "global.h"
#include "USBDefine.h"
#include "USBInterface.h"
#include "USBApplication.h"


/****************************************************************************************************
*
*                                      ������
* 
*****************************************************************************************************/
static IDATA UINT8 USBMainBuf[EP2_PACKET_SIZE]={0};
/****************************************************************************************************
*
*                                      ������
* 
*****************************************************************************************************/

/****************************************************
* ��������: USBApDisposeData
* ��    ��: ��
* ��    ��: ��
* ��������: USB ��������
*****************************************************/
void USBApDisposeData(void)
{
	UINT8 ucintStatus;                  //�����ж�״̬����
	UINT8 ucrecvLen;                    //����������ݳ��ȱ���
	
	ENTER_CRITICAL();                   //�ر�ȫ���ж�

	SYSPostCurMsg(SYS_IDLE);              //�����¸�����״̬Ϊ����״̬
	USBCiWriteSingleCmd(CMD_GET_STATUS);//�����ȡUSB״̬
 							 
	ucintStatus =USBCiReadSingleData();//��ȡUSB״̬

	switch(ucintStatus)                  //�������һ��״̬					
	{  
		case USB_INT_EP2_OUT:            //�˵�2���յ�����
			 {
                  //��ȡ���ݳ���
			 	  ucrecvLen=USBCiReadPortData(USBMainBuf);
                  //�����������ݷ��ص���λ��
				  USBCiEP2Send(USBMainBuf,ucrecvLen);
			 }
             break;

		case USB_INT_EP2_IN:										  			     {
                    //�˵�2������ϣ��ͷŻ�������
				  USBCiWriteSingleCmd (CMD_UNLOCK_USB);			
			 }
			 break;

		case USB_INT_EP1_OUT: 
			 {
                   //��ȡ���ݳ���
			     ucrecvLen=USBCiReadPortData(USBMainBuf);
                   //�����������ݷ��ص���λ��
				 USBCiEP1Send(USBMainBuf,ucrecvLen);
			 } 
			 break;

		case USB_INT_EP1_IN:										  			     
             {
			 	//�˵�1������ϣ��ͷŻ�������
				USBCiWriteSingleCmd (CMD_UNLOCK_USB);				
			 }
			 break;

		default:
			  {
                //�ͷŻ�������
				USBCiWriteSingleCmd (CMD_UNLOCK_USB);				      
              }
			  break;
   }

	EXIT_CRITICAL();//����ȫ���ж�
}

