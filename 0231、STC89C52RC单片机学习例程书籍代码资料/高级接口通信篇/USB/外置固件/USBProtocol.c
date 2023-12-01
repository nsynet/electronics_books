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
/****************************************************************************************************
*
*                                      ������
* 
*****************************************************************************************************/

/*
        �豸������
*/
static CONST USB_DEVICE_DESCRIPTOR USBDevDescriptor={

sizeof(USB_DEVICE_DESCRIPTOR),	//�豸���������ȣ�= 12H
USB_DEVICE_DESCRIPTOR_TYPE,		//�豸���������ͣ�= 01H
0x10,0x01,						//Э��汾��= 1.10
USB_CLASS_CODE_TEST_CLASS_DEVICE,//�����豸���ͣ� = 0DCH	
0, 0,							//�豸���࣬�豸Э��
EP0_PACKET_SIZE,				//�˵�0������ݰ���С��= 08H
0x72,0x04,						//��˾���豸ID	
0x02,0x00,						//�豸�����̶��Ĳ�ƷID
0x00,0x00,						//�豸ϵ�к�
0x01,0x02,0x03,					//����
1								//���ܵ�������
};
/*
        ����������+�ӿ�������+�˿�������
*/
static CONST USB_DESCRIPTOR USBDescriptor ={
//����������
{
sizeof(USB_CONFIGURATION_DESCRIPTOR),//�������������ȣ�= 09H
USB_CONFIGURATION_DESCRIPTOR_TYPE,	 //�������������ͣ�= 02H
CONFIG_DESCRIPTOR_LENGTH,0x00,		 //�������ܳ��ȣ� = 002EH
1,									 //ֻ֧��1���ӿ�
1,									 //����ֵ
0,									 //�ַ���������ָ��(��)
0x60,								 //�Թ���,֧��Զ�̻���
0x32								 //��󹦺�(100mA)	
},
//HID��ӿ�������
{
sizeof(USB_INTERFACE_DESCRIPTOR),	 //�ӿ����������ȣ�= 09H
USB_INTERFACE_DESCRIPTOR_TYPE,       //�ӿ�����������
0x00,                                //ʶ����
0x00,                                //������ֵ
0x02,                                //֧�ֵĶ˵���
USB_DEVICE_CLASS_HUMAN_INTERFACE,    //�����,HID�豸
HID_SUBCLASS_NONE,                   //�������
HID_PROTOCOL_NONE,                   //Э����
0x00                                 //����
},
//HID�������ṹ
{
sizeof(USB_HID_DESCRIPTOR),			 //���������ȣ� = 09H
0x21,								 //���������ͣ� = 21H
0x00, 0x01,							 //HID�淶�汾�ţ� = 0100H
0x00,								 //���Ҵ���	
0x01,								 //��֧�ֵ�������������������1��
0x22,								 //�������������ͣ�22H ��ʾ����������
0x34, 0x00							 //�������������ȣ�0034H
},

{
// �߼��˵� 2 ����	
 {
sizeof(USB_ENDPOINT_DESCRIPTOR),	 // �˵�����������,= 07H  	  
USB_ENDPOINT_DESCRIPTOR_TYPE,		 // �˵�����������,= 05H  
0x82,								 // �˵�2 IN					  
USB_ENDPOINT_TYPE_INTERRUPT,		 // �жϴ���,= 03H  		
EP2_PACKET_SIZE,0x00,				 // �˵������Ĵ�С,= 0040H  
10									 // ��������ʱ��ֵ��Ч 	
 },
// �߼��˵� 2 ���
 {	
sizeof(USB_ENDPOINT_DESCRIPTOR),	// �˵�����������,= 07H       
USB_ENDPOINT_DESCRIPTOR_TYPE,		// �˵�����������,= 05H		  
0x02,								// �˵�2 OUT				  
USB_ENDPOINT_TYPE_INTERRUPT,		// �жϴ���,= 03H			   
EP2_PACKET_SIZE,0x00,				// �˵������Ĵ�С,= 0040H	   
10									// ��������ʱ��ֵ��Ч
 }
}
};
/*
        HID ����������
*/
static CONST UINT8 acUSBHidReportDescriptor[52] = 
{
0x06,0xA0,0xFF,      //�÷�ҳ(FFA0h, vendor defined)
0x09, 0x01,          //�÷�(vendor defined)
0xA1, 0x01,          //����(Application)
0x09, 0x02 ,         //�÷�(vendor defined)
0xA1, 0x00,          //����(Physical)
0x06,0xA1,0xFF,      //�÷�ҳ(vendor defined)
//���뱨��
0x09, 0x03 ,         //�÷�(vendor defined)
0x09, 0x04,          //�÷�(vendor defined)
0x15, 0x80,          //�߼���Сֵ(0x80 or -128)
0x25, 0x7F,          //�߼����ֵ(0x7F or 127)
0x35, 0x00,          //������Сֵ(0)
0x45, 0xFF,          //�������ֵ(255)
0x75, 0x08,          //���泤��Report size (8λ)
0x95, 0x40,          //������ֵ(64 fields)
0x81, 0x02,          //����(data, variable, absolute)
//�������
0x09, 0x05,          //�÷�(vendor defined)
0x09, 0x06,          //�÷�(vendor defined)
0x15, 0x80,          //�߼���Сֵ(0x80 or -128)
0x25, 0x7F,          //�߼����ֵ(0x7F or 127)
0x35, 0x00,          //������Сֵ(0)
0x45, 0xFF,          //�������ֵ(255)
0x75, 0x08,          //���泤��(8λ)
0x95, 0x40,          //������ֵ(64 fields)
0x91, 0x02,          //���(data, variable, absolute)
0xC0,                //���Ͻ���(Physical)
0xC0                 //���Ͻ���(Application)	
};
						
//����������
static CONST UINT8 acUSBLanguageDesCriptor[4]={0x04,0x03,0x09,0x04};	
//�ַ���������	
static CONST UINT8 acUSBSerialDesriptor[18]  ={0x12,0x03,'C',0,'H',0,'3',0,'7',0,'2',0,'U',0,'S',0,'B',0};		

//�ַ������������õ��������� 
static CONST UINT8 acUSBLanguageID[4]={0x04,0x03,0x09,0x04};                   

//�豸���к�										
static CONST UINT8 acUSBDeviceSerialNumber[22]=
{22,0x03,'2',0,'0',0,'0',0,'7',0,'-',0,'0',0,'3',0,'-',0,'2',0,'3',0};

//�����ַ���
static CONST UINT8 acUSBManufacturerString[80]=
{
  80,0x03,'M',0,'y',0,
 'U',0,'S',0,'B',0,0xbE,0x8b,0x07,0x59,' ',0,0x20,0x00,'W',0,'e',0,'n',0,
 'Z',0,'i',0,'Q',0,'i',0,'@',0,'h',0,'o',0,'t',0,'m',0,'a',0,'i',0,'l',0,'.',0,'c',0,
 'o',0,'m',0
};

//��Ʒ�ַ���
static CONST UINT8 acUSBProducterString[80]=
{
  80,0x03,'M',0,'y',0,
 'U',0,'S',0,'B',0,0xbE,0x8b,0x07,0x59,' ',0,0x20,0x00,'W',0,'e',0,'n',0,
 'Z',0,'i',0,'Q',0,'i',0,'@',0,'h',0,'o',0,'t',0,'m',0,'a',0,'i',0,'l',0,'.',0,'c',0,
 'o',0,'m',0
 };

static UINT8     ucUSBAddress=0;          //�ݴ�USB���������ĵ�ַ

USB_CTRL_PACKET  USBCtrlPacket={0};//USB�������ݰ�
USB_FLAGS        USBFlags={0};     //USB��־λ


/****************************************************************************************************
*
*                                      ������
* 
*****************************************************************************************************/
/*
  ---------------------  USB Э��㺯��  ---------------------
*/
/**********************************************************
* �������� ��USBPcCtrlSend
* ��     �룺buf ���ݻ�����
             len �������ݳ���
* ��     ������
* �������� �����ƶ˵������ϴ�
************************************************************/
void USBPcCtrlSend(UINT8 *buf,UINT8 len)
{
	 USBCiEP0Send(buf,len);
}
/**********************************************************
* �������� ��USBPcHold
* ��     �룺��
* ��     ������
* �������� �����ֵ�ǰ״̬
************************************************************/
void USBPcHold(void)
{
	 USBCiWriteSingleCmd (CMD_WR_USB_DATA3);	//����д�˵�0������
	 USBCiWriteSingleData(0);			        //�ϴ�0�������ݣ�����һ��״̬�׶�
}
/**********************************************************
* �������� ��USBDesriptorCopy
* ��     �룺��
* ��     ������
* �������� �������������Ա��ϴ�
************************************************************/
void USBDesriptorCopy(void)
{
	BufCpy(USBCtrlPacket.mucBuf,
		   USBCtrlPacket.mpucTxd+USBCtrlPacket.musTxCount,
		   EP0_PACKET_SIZE			
		  );
}
/**********************************************************
* �������� ��USBCtrlPacketTransmit
* ��     �룺��
* ��     ������
* �������� ���˵�0�����ϴ�
************************************************************/
void USBCtrlPacketTransmit(void)
{
	UINT8 len;
	
	if(USBCtrlPacket.musTxLength)
	{								 //���Ȳ�Ϊ0������峤�ȵ�����
		if(USBCtrlPacket.musTxLength<=EP0_PACKET_SIZE)
		{
			len=USBCtrlPacket.musTxLength;	 //����С��8����Ҫ��ĳ���
			USBCtrlPacket.musTxLength=0;
			USBCtrlPacket.musTxCount+=len;
		}
		else
		{
			len=EP0_PACKET_SIZE;
			USBCtrlPacket.musTxLength-=EP0_PACKET_SIZE;	//���ȴ���8����8�������ܳ��ȼ�8
            USBCtrlPacket.musTxCount +=EP0_PACKET_SIZE;
		}	
						       
		USBPcCtrlSend(USBCtrlPacket.mucBuf,len);//���buf��������	
	}
	else
	{
		USBPcHold();
	}
}
/*
      -----------------		    usb��׼�豸����������		    -----------------
*/
/**********************************************************
* �������� ��USBPcGetDescriptor
* ��     �룺��
* ��     ������
* �������� ����ȡ������
************************************************************/
void USBPcGetDescriptor(void)
{
        UINT16 i;

		switch(MSB(USBCtrlPacket.r.musRequestValue))
		{
			case 0x01://�豸�������ϴ�
				 {
                    USBMSG("-->����豸������\r\n");

				 	USBCtrlPacket.mpucTxd= (UINT8 *)&USBDevDescriptor;
					
					if(USBCtrlPacket.musTxLength >USBDevDescriptor.bLength)
                    {
                       USBCtrlPacket.musTxLength=USBDevDescriptor.bLength;
                    }       
									
				 }
				break;

			case 0x02://�����������ϴ�
				 {
                    USBMSG("-->�������������\r\n");

				 	USBCtrlPacket.mpucTxd=(UINT8 *)&USBDescriptor.ConfigDescr;
					//���������������Ƚ�С,��ʵֻ��US���Ѿ��㹻��BDescriptor.ConfigDescr.wTotalLength0

                    i=(USBDescriptor.ConfigDescr.wTotalLength1<<8)|USBDescriptor.ConfigDescr.wTotalLength0;

                    if(USBCtrlPacket.musTxLength>i)
                    {
                       USBCtrlPacket.musTxLength=i;
                    }

				 }	
				 break;

			case 0x03://�ַ���������
				 {
					switch(LSB(USBCtrlPacket.r.musRequestValue))
					{
						case 0x00://�������ID
							{
								USBMSG("-->�������ID\r\n");
								
								USBCtrlPacket.mpucTxd=acUSBLanguageDesCriptor;
                               
                                if(USBCtrlPacket.musTxLength>acUSBLanguageDesCriptor[0])
                                {
                                   USBCtrlPacket.musTxLength=acUSBLanguageDesCriptor[0];
                                }							
												    
							}
							break ;
							
						case 0x01 ://��ó����ַ���
							{
								USBMSG("-->��ó����ַ���\r\n");
								
								USBCtrlPacket.mpucTxd = acUSBManufacturerString;
                                
                                if(USBCtrlPacket.musTxLength>acUSBManufacturerString[0])
                                {
                                   USBCtrlPacket.musTxLength=acUSBManufacturerString[0];
                                }
												
							}

							break ;
							
						case 0x02 ://��ȡ��Ʒ�ַ���
							{
								USBMSG("-->��ò�Ʒ�ַ���\r\n");
								
								USBCtrlPacket.mpucTxd = acUSBProducterString;

                                if(USBCtrlPacket.musTxLength>acUSBProducterString[0])
                                {
                                   USBCtrlPacket.musTxLength=acUSBProducterString[0];
                                }																		
							}
							break ;
							
						case 0x03 ://��ȡ�豸���к�
							{
								USBMSG("-->��ȡ�豸���к�\r\n");	
								
								USBCtrlPacket.mpucTxd = acUSBDeviceSerialNumber;
                                 
                                if(USBCtrlPacket.musTxLength>acUSBDeviceSerialNumber[0])
								{
                                   USBCtrlPacket.musTxLength=acUSBDeviceSerialNumber[0];
                                }
									    						
							}
							break ;
							
						default :
							break ;
					}
				}
				break  ;

			case 0x21://HID������
				{
					USBMSG("-->��ȡHID������\r\n");	
					//HID��������acUSBConDescriptor�����е�ַƫ��Ϊ18
					USBCtrlPacket.mpucTxd=(UINT8 *)&USBDescriptor.HidDesr;					
				}
				break;

			case 0x22://����������
				{
					USBCtrlPacket.mpucTxd=acUSBHidReportDescriptor;

                    if(USBCtrlPacket.musTxLength>sizeof(acUSBHidReportDescriptor))
                    {
                       USBCtrlPacket.musTxLength=sizeof(acUSBHidReportDescriptor);
                    }

			 	    USBMSG("-->��ȡHID����������\r\n");
					USBMSG("\r\n\r\n-->     USB�豸ö�ٳɹ�     <--  \r\n\r\n");
	
					USBFlags.bits.mbEnumed=TRUE;


				}
				break;

			case 0x23://����������
				break;

			default :
				break;
		}	
	
		USBDesriptorCopy();
}
/**********************************************************
* �������� ��USBPcGetConfiguration
* ��     �룺��
* ��     ������
* �������� ���������
************************************************************/
void USBPcGetConfiguration(void)
{
	 USBCtrlPacket.r.mucRequestType=USBFlags.bits.mbConfig ? 1:0;
}
/**********************************************************
* �������� ��USBPcClearFeature
* ��     �룺��
* ��     ������
* �������� ���������
************************************************************/
void USBPcClearFeature(void)
{
	if((USBCtrlPacket.r.mucRequestType&0x1F)==0X02)
	{				
		switch(LSB(USBCtrlPacket.r.musRequestIndex))
		{
			case 0x82:
				USBCiWriteSingleCmd (CMD_SET_ENDP7);				//����˵�2�ϴ�
				USBCiWriteSingleData(0x8E);                			//����������˵�
				break;
			case 0x02:
				USBCiWriteSingleCmd (CMD_SET_ENDP6);
				USBCiWriteSingleData(0x80);							//����˵�2�´�
				break;
			case 0x81:
				USBCiWriteSingleCmd (CMD_SET_ENDP5);				//����˵�1�ϴ�
				USBCiWriteSingleData(0x8E);
				break;
			case 0x01:
				USBCiWriteSingleCmd (CMD_SET_ENDP4);				//����˵�1�´�
				USBCiWriteSingleData(0x80);
				break;
			default:
				break;
		}
	}
	else
	{
		USBPcHold();//���Ϳհ�,��ʾ���ֵ�ǰ״̬
	}
}
/**********************************************************
* �������� ��USBPcGetInterface
* ��     �룺��
* ��     ������
* �������� ����ýӿ�
************************************************************/
void USBPcGetInterface(void)
{
     USBCtrlPacket.r.mucRequestType =0x01;
	 USBCtrlPacket.r.mucRequestCode =0x00;	 
}/**********************************************************
* �������� ��USBPcGetStatus
* ��     �룺��
* ��     ������
* �������� �����״̬
************************************************************/
void USBPcGetStatus(void)
{
     USBCtrlPacket.r.mucRequestType =0x00;
	 USBCtrlPacket.r.mucRequestCode =0x00;		
}
/**********************************************************
* �������� ��USBPcSetConfiguration
* ��     �룺��
* ��     ������
* �������� ����������
************************************************************/
void USBPcSetConfiguration(void)
{
	USBFlags.bits.mbConfig = FALSE;

	USBFlags.bits.mbConfig = LSB(USBCtrlPacket.r.musRequestValue)? TRUE:FALSE;
}
/**********************************************************
* �������� ��USBPcSetAddress
* ��     �룺��
* ��     ������
* �������� �����õ�ַ
************************************************************/
void USBPcSetAddress(void)
{
	ucUSBAddress=LSB(USBCtrlPacket.r.musRequestValue);//�ݴ�USB���������ĵ�ַ
}
/**********************************************************
* �������� ��USBPcGetAddress
* ��     �룺��
* ��     ������ַ
* �������� ������USB��ַ
************************************************************/
UINT8 USBPcGetAddress(void)
{
	return ucUSBAddress;
}
/**********************************************************
* �������� ��USBPcSetDescriptor
* ��     �룺��
* ��     ������
* �������� ������������
************************************************************/
void USBPcSetDescriptor(void)
{
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}
/**********************************************************
* �������� ��USBPcSetFeature
* ��     �룺��
* ��     ������
* �������� ����������
************************************************************/
void USBPcSetFeature(void)
{

    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}
/**********************************************************
* �������� ��USBPcSetInterface
* ��     �룺��
* ��     ������
* �������� �����ýӿ�
************************************************************/
void USBPcSetInterface(void)
{
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}
/**********************************************************
* �������� ��USBPcGetReport
* ��     �룺��
* ��     ������
* �������� ����ȡ����
************************************************************/
void USBPcGetReport(void) 
{
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;	
}
/**********************************************************
* �������� ��USBPcGetIdle
* ��     �룺��
* ��     ������
* �������� ����ȡ����״̬
************************************************************/
void USBPcGetIdle(void)
{

    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;	
}
/**********************************************************
* �������� ��USBPcGetProtocol
* ��     �룺��
* ��     ������
* �������� ����ȡЭ��
************************************************************/
void USBPcGetProtocol(void)
{
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}
/**********************************************************
* �������� ��USBPcSetProtocol
* ��     �룺��
* ��     ������
* �������� ������Э��
************************************************************/
void USBPcSetProtocol(void)
{
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}
/*****************************************************************************************
** ��������: USBPcSetReport				
** ��������: ���ñ���
** ��    ��: ��
** ��	 ��: ��							
******************************************************************************************/
void USBPcSetReport(void)
{
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}
/*****************************************************************************************
** ��������: USBPcSetIdle				
** ��������: ���ÿ���״̬
** ��    ��: ��
** ��	 ��: ��							
******************************************************************************************/
void USBPcSetIdle(void)
{
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}

