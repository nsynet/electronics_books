/*
 ----------------------------------------------------
 *��    �ߣ�������
 ----------------------------------------------------
 */
#include "stc.h"
#include "global.h"
#include "USBDefine.h"
#include "USBInterface.h"
#include "USBProtocol.h"
#include "USBApplication.h"


/****************************************************************************************************
*
*                                      ������
* 
*****************************************************************************************************/
IDATA UINT8 USBMainBuf[EP2_PACKET_SIZE]={0};

//����USB ��׼�豸���� �ṹ��
static CONST FUNCTION_ARRAY StandardDeviceRequest[16]={
	{USBPcGetStatus,       "[00H]USB ��׼�豸����:��ȡ״̬\r\n  "},
	{USBPcClearFeature,    "[01H]USB ��׼�豸����:�������\r\n  "},
	{NULL,                 "NULL                                "},
	{USBPcSetFeature,      "[03H]USB ��׼�豸����:��������\r\n  "},
	{NULL,                 "NULL                                "},
	{USBPcSetAddress,      "[05H]USB ��׼�豸����:���õ�ַ\r\n  "},
	{USBPcGetDescriptor,   "[06H]USB ��׼�豸����:��ȡ������\r\n"},
	{USBPcSetDescriptor,   "[07H]USB ��׼�豸����:����������\r\n"},
	{USBPcGetConfiguration,"[08H]USB ��׼�豸����:��ȡ����\r\n  "},
	{USBPcSetConfiguration,"[09H]USB ��׼�豸����:��������\r\n  "},
	{USBPcGetInterface,    "[0AH]USB ��׼�豸����:��ȡ�ӿ�\r\n  "},
	{USBPcSetInterface,    "[0BH]USB ��׼�豸����:���ýӿ�\r\n  "},
	{NULL,                 "NULL                                "},
	{NULL,                 "NULL                                "},
	{NULL,                 "NULL                                "},
	{NULL,                 "NULL                                "}
};
//����USB HID������ �ṹ��
static CONST FUNCTION_ARRAY HidClassRequest[16]={
	{USBPcGetReport,	   "[00H]USB HID������:��ȡ����\r\n     "},		
	{USBPcGetIdle,	       "[01H]USB HID������:��ȡ����״̬\r\n "},				
	{USBPcGetProtocol,     "[02H]USB HID������:��ȡЭ��\r\n     "},			
	{NULL,                 "NULL                                "},
	{NULL,                 "NULL                                "},
	{NULL,                 "NULL                                "},
	{NULL,                 "NULL                                "},
	{NULL,                 "NULL                                "},
	{NULL,                 "NULL                                "},
	{USBPcSetReport,	   "[08H]USB HID������:���ñ���\r\n     "},			
	{USBPcSetIdle,         "[09H]USB HID������:���ÿ���״̬\r\n "},				
	{USBPcSetProtocol,     "[0AH]USB HID������:����Э��\r\n     "},			
	{NULL,                 "NULL                                "},
	{NULL,                 "NULL                                "},
	{NULL,                 "NULL                                "},
	{NULL,                 "NULL                                "}
};	
/****************************************************************************************************
*
*                                      ������
* 
*****************************************************************************************************/
/*****************************************************************
* �������� 	: USBApDisposeData
* ��	   ��	: ��
* ��	   ��	: ��
* �������� 	: USB ��������
******************************************************************/
void USBApDisposeData(void)
{
	UINT8 ucintStatus;
	UINT8 ucrecvLen;
	
	ENTER_CRITICAL();

	SYSPostCurMsg(SYS_IDLE);

	USBCiWriteSingleCmd(CMD_GET_STATUS);  								//��ȡ�ж�״̬��ȡ���ж����� 
	ucintStatus =USBCiReadSingleData();  								//��ȡ�ж�״̬,���жϱ�־,��Ӧ��INT0�ж� 
	
	switch(ucintStatus)													//�����ж�״̬
	{  
		case USB_INT_EP2_OUT: 
			 {
			//����һ��Ҫ��ȡ,����ᵼ��HIDϵ��USB����	
			 	  ucrecvLen=USBCiReadPortData(USBMainBuf);

				  USBCiEP2Send(USBMainBuf,64);

			 } 
			 break;

		case USB_INT_EP2_IN:										    //�����˵��ϴ��ɹ�,δ����
			 {
				USBCiWriteSingleCmd (CMD_UNLOCK_USB);					//�ͷŻ�����
			 }
			 break;

		case USB_INT_EP0_SETUP: 		                                //���ƶ˵㽨���ɹ������յ������ʱ��ִ�и��ж�
			 {

			  ucrecvLen=USBCiReadPortData((UINT8 *)&USBCtrlPacket.r);   //��ȡ���������������
			  
			  //USBΪС��ģʽ 51Ϊ���ģʽ ��Ҫ�л�
			  USBCtrlPacket.r.musRequestValue =SWAP16(USBCtrlPacket.r.musRequestValue);
			  USBCtrlPacket.r.musRequestIndex =SWAP16(USBCtrlPacket.r.musRequestIndex);
			  USBCtrlPacket.r.musRequestLength=SWAP16(USBCtrlPacket.r.musRequestLength);
	
			  USBCtrlPacket.mpucTxd = NULL;       //���¶�λ����ָ��,��ֹҰָ��

              USBCtrlPacket.musTxLength=USBCtrlPacket.r.musRequestLength;
			  USBCtrlPacket.musTxCount =0;
		
			 /*********����������***********/
			  if(USBCtrlPacket.r.mucRequestType &0x20)              //������δ����
			  {          
				USBMSG(HidClassRequest[USBCtrlPacket.r.mucRequestType & 0x1F].s);	
				(*HidClassRequest[USBCtrlPacket.r.mucRequestType & 0x1F].fun)();
			  }
			 /*  ��׼����������*/
			  if(!(USBCtrlPacket.r.mucRequestType&0x60))										
			  {          					
                //��鵱ǰ��׼�����Ƿ��ȡ������
                USBFlags.bits.mbDescriptor=DEF_USB_GET_DESCR   == USBCtrlPacket.r.mucRequestCode?TRUE:FALSE;
                //��鵱ǰ��׼�����Ƿ��ȡ��ַ
			    USBFlags.bits.mbAdrress   =DEF_USB_SET_ADDRESS == USBCtrlPacket.r.mucRequestCode?TRUE:FALSE;

				USBMSG(StandardDeviceRequest[USBCtrlPacket.r.mucRequestCode].s);	
				(*StandardDeviceRequest[USBCtrlPacket.r.mucRequestCode].fun)();
			  }

			  USBCtrlPacketTransmit();	  //�����ϴ�
			}
			break;

		case USB_INT_EP0_IN:				                        //���ƶ˵��ϴ��ɹ�	
		    {
					//��������������ʱ,���	USB_INT_EP0_IN ת�� USB_INT_EP0_SETUP��,
					//�������굱ǰ�涨���ȵ�������,�Ż����USB_INT_EP0_SETUP�ж�,
					//����һֱΪUSB_INT_EP0_IN
	    	
				if(USBFlags.bits.mbDescriptor)          //�������ϴ�
				{								
					USBDesriptorCopy();                          //����������
					USBCtrlPacketTransmit();															
				}
				//����USB��ַ
				else if(USBFlags.bits.mbAdrress)   //���õ�ַ
				{
					USBCiWriteSingleCmd (CMD_SET_USB_ADDR);
					USBCiWriteSingleData(USBPcGetAddress());				//����USB��ַ,�����´������USB��ַ
				}
				else
				{
					USBPcHold();  //���Ϳհ�,����״̬ 
				}
			  	//�ͷŻ�����
				USBCiWriteSingleCmd(CMD_UNLOCK_USB);				//�ͷŻ�����
			}
			break;

		case USB_INT_EP0_OUT:										//���ƶ˵��´��ɹ�
			 {
			 	//����һ��Ҫ��ȡ,����ᵼ��HIDϵ��USB����
			 	ucrecvLen=USBCiReadPortData(USBCtrlPacket.mucBuf);  
			 }
			 break;

		default:
			  {
			  	//����һ��Ҫ��,��Ҫ���߸�λ,����USB��ס����
			   	if(ucintStatus&USB_INT_BUS_RESET1)				  //���߸�λ
			   	{			
                    BufClr((UINT8 *)&USBCtrlPacket,sizeof(USBCtrlPacket));	//������ݻ�����				
					USBFlags.musFlags=0;                          //��־λ����ȫ������    
					USBFlags.bits.mbReset=TRUE;                   //��־λ�����еĸ�λ��־λ��1
					USBMSG("HID USB ��λ\r\n");
				}

				USBCiWriteSingleCmd (CMD_UNLOCK_USB);				//�ͷŻ�����
			 }
			 break;

	 }

	 EXIT_CRITICAL();	


}
