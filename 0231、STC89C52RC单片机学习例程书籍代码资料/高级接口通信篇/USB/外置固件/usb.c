/************************************************************************
*��    ��:������ ����:k125008301@126.com
*��    ��:usb.c
*˵    ��:�����Ż�,�������ܹ�����Ϊ�ṹ����ʽ
*�޸�����:2009/12/06
--------------------------------------------------------------
*˵    ��:�����Ż�,��������BUG
*�޸�����:2009/12/05
--------------------------------------------------------------
*˵    ��:�ܹ������������ݺͽ�������
*�޸�����:2009/12/02
--------------------------------------------------------------
*��������:2009/11/30
*˵    ��:����USB����ö�ٳɹ�
--------------------------------------------------------------
AVR��С��ģʽ  USBС��ģʽ 51 ���ģʽ

����Ҫע��ߵ��ֽڵ�����
*************************************************************************/
#include "stc.h"
#include "global.h"
#include "usb.h"
/****************************************************************************************************
*
*                                      ������
* 
*****************************************************************************************************/
CONST USB_DEVICE_DESCRIPTOR USBDevDescriptor={
//�豸������
	sizeof(USB_DEVICE_DESCRIPTOR),					//�豸���������ȣ�= 12H
	USB_DEVICE_DESCRIPTOR_TYPE,						//�豸���������ͣ�= 01H
	0x00,0x01,										//Э��汾��= 1.10
	USB_CLASS_CODE_TEST_CLASS_DEVICE,				//�����豸���ͣ� = 0DCH	
	0, 0,											//�豸���࣬�豸Э��
	EP0_PACKET_SIZE,								//�˵�0������ݰ���С��= 10H
	0x72,0x04,										//PHILIPS��˾���豸ID	
	0x02,0x00,										//�豸�����̶��Ĳ�ƷID
	0x00,0x00,										//�豸ϵ�к�
	0x01,0x02,0x03,									//����
	1												//���ܵ�������
};

CONST USB_DESCRIPTOR USBDescriptor ={
//����������
{
	sizeof(USB_CONFIGURATION_DESCRIPTOR),			//�������������ȣ�= 09H
	USB_CONFIGURATION_DESCRIPTOR_TYPE,				//�������������ͣ�= 02H
	CONFIG_DESCRIPTOR_LENGTH,0x00,					//�������ܳ��ȣ� = 002EH
	1,												//ֻ֧��1���ӿ�
	1,												//����ֵ
	0,												//�ַ���������ָ��(��)
	0x60,											//�Թ���,֧��Զ�̻���
	0x32											//��󹦺�(100mA)	
},
//HID��ӿ�������
{
  sizeof(USB_INTERFACE_DESCRIPTOR),				   //�ӿ����������ȣ�= 09H
  USB_INTERFACE_DESCRIPTOR_TYPE,                   //�ӿ�����������
  0x00,                                            //ʶ����
  0x00,                                            //������ֵ
  0x02,                                            //֧�ֵĶ˵���
  USB_DEVICE_CLASS_HUMAN_INTERFACE,                //�����,HID�豸
  HID_SUBCLASS_NONE,                               //�������
  HID_PROTOCOL_NONE,                               //Э����
  0x00                                             //����
},
//HID�������ṹ
{
	sizeof(USB_HID_DESCRIPTOR),						//���������ȣ� = 09H
	0x21,											//���������ͣ� = 21H
	0x00, 0x01,										//HID�淶�汾�ţ� = 0100H
	0x00,											//���Ҵ���	
	0x01,											//��֧�ֵ�������������������1��
	0x22,											//�������������ͣ�22H ��ʾ����������
	0x34, 0x00										//�������������ȣ�0034H
},

{
// �߼��˵� 2 ����	
 {
	sizeof(USB_ENDPOINT_DESCRIPTOR),				// �˵�����������,= 07H  	  
	USB_ENDPOINT_DESCRIPTOR_TYPE,					// �˵�����������,= 05H  
	0x82,											// �˵�2 IN					  
	USB_ENDPOINT_TYPE_INTERRUPT,					// �жϴ���,= 03H  		
	EP2_PACKET_SIZE,0x00,							// �˵������Ĵ�С,= 0040H  
	10												// ��������ʱ��ֵ��Ч 	
 },
// �߼��˵� 2 ���
 {	
 	sizeof(USB_ENDPOINT_DESCRIPTOR),				// �˵�����������,= 07H       
	USB_ENDPOINT_DESCRIPTOR_TYPE,					// �˵�����������,= 05H		  
	0x2,											// �˵�2 OUT				  
	USB_ENDPOINT_TYPE_INTERRUPT,					// �жϴ���,= 03H			   
	EP2_PACKET_SIZE,0x00,							// �˵������Ĵ�С,= 0040H	   
	10												// ��������ʱ��ֵ��Ч
 }
}
};
CONST UINT8 acUSBHidReportDescriptor[52] = 
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
//����USB ��׼�豸���� �ṹ��
CONST FUNCTION_ARRAY StandardDeviceRequest[16]={
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
CONST FUNCTION_ARRAY HidClassRequest[16]={
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
//����������
UINT8  CONST acUSBLanguageDesCriptor[4]={0x04,0x03,0x09,0x04};	
//�ַ���������	
UINT8  CONST acUSBSerialDesriptor[18]  ={0x12,0x03,'C',0,'H',0,'3',0,'7',0,'2',0,'U',0,'S',0,'B',0};		

//�ַ������������õ��������� 
CONST UINT8 acUSBLanguageID[4]={0x04,0x03,0x09,0x04};                   

//�豸���к�										
CONST UINT8 acUSBDeviceSerialNumber[22]=
{22,0x03,'2',0,'0',0,'0',0,'7',0,'-',0,'0',0,'3',0,'-',0,'2',0,'3',0};

//�����ַ���
CONST UINT8 acUSBManufacturerString[80]=
{
 80,0x03,0x16,0x7F,0x0B,0x7A,0x0F,0x5C,0x5B,0x72,0xBA,0x4E,0x84,0x76,
 'U',0,'S',0,'B',0,0xbE,0x8b,0x07,0x59,' ',0,0x20,0x00,'k',0,'1',0,'2',0,
 '5',0,'0',0,'0',0,'8',0,'3',0,'0',0,'1',0,'@',0,'1',0,'2',0,'6',0,'.',0,'c',0,
 'o',0,'m',0
};

//��Ʒ�ַ���
CONST UINT8 acUSBProducterString[80]=
{
 80,0x03,0x16,0x7F,0x0B,0x7A,0x0F,0x5C,0x5B,0x72,0xBA,0x4E,0x84,0x76,
 'U',0,'S',0,'B',0,0xbE,0x8b,0x07,0x59,' ',0,0x20,0x00,'k',0,'1',0,'2',0,
 '5',0,'0',0,'0',0,'8',0,'3',0,'0',0,'1',0,'@',0,'1',0,'2',0,'6',0,'.',0,'c',0,
 'o',0,'m',0
 };


USB_CTRL_PACKET  USBCtrlPacket={0};
USB_FLAGS        USBFlags={0};

UINT8 ucUSBAddress=0	;		          //�ݴ�USB���������ĵ�ַ

IDATA UINT8 USBMainBuf[EP2_PACKET_SIZE]={0};

/****************************************************************************************************
*
*                                      ������
* 
*****************************************************************************************************/

/**********************************************************************************
** �������� 	: WriteDatToUsb
** �������� 	: ��CH372д����
** ��		��	: UINT8 dat
** ��		��	: ��
************************************************************************************/
static 
void WriteDatToUsb(UINT8 dat)
{
    USB_CS=0;
	USB_DATA_OUTPUT=0xff;//��������
	USB_A0=USB_DAT_MODE;
	USB_WR=0;
	DelayNus(20);
	USB_DATA_OUTPUT=dat;
	DelayNus(20);
	USB_CS=1;
	USB_DATA_OUTPUT=0xff;//��������,��ֹ���Ŷ�·
	USB_WR=1;
}
/***********************************************************************************
** �������� 	: WriteCmdToUsb
** �������� 	: ��CH372д����
** ��		��	:	 UINT8 cmd
** ��		��	:    ��
************************************************************************************/
static 
void WriteCmdToUsb(UINT8 cmd)
{
    USB_CS=0;
	USB_DATA_OUTPUT=0xff;//��������
	USB_A0=USB_CMD_MODE;
	USB_WR=0;
	DelayNus(20);
	USB_DATA_OUTPUT=cmd;
	DelayNus(20);
	USB_CS=1;
	USB_DATA_OUTPUT=0xff;//��������,��ֹ���Ŷ�·
	USB_WR=1;
}
/***********************************************************************************
** �������� 	: ReadDatFromUsb
** �������� 	: ��ȡUSB����
** ��		��	:	 ��
** ��		��	:    ��
************************************************************************************/
static 
UINT8 ReadDatFromUsb(void)
{	
	UINT8 dat;
	USB_CS=0;
	USB_DATA_INPUT=0xff;//��������
	USB_A0=USB_DAT_MODE;
	USB_RD=0;
	DelayNus(20);	   //20*0.25us=5us
	dat=USB_DATA_INPUT;
	DelayNus(20);	   //20*0.25us=5us
	USB_CS=1;
	USB_RD=1;
	USB_DATA_INPUT=0xff;//��������,��ֹ���Ŷ�·

	return dat;
}
/***********************************************************************************
** �������� 	: USBCiWriteSingleCmd
** �������� 	: USB д�뵥������
** ��		��	: ��
** ��		��	: ��
************************************************************************************/
void USBCiWriteSingleCmd(UINT8 cmd)
{
	 WriteCmdToUsb(cmd);
}
/***********************************************************************************
** �������� 	: USBCiWriteSingleData
** �������� 	: USB д�뵥������
** ��		��	: ��
** ��		��	: ��
************************************************************************************/
void USBCiWriteSingleData(UINT8 dat)
{
	 WriteDatToUsb(dat);
}
/***********************************************************************************
** �������� 	: USBCiReadSingleData
** �������� 	: USB ��ȡ��������
** ��		��	: ��
** ��		��	: ��
************************************************************************************/
UINT8 USBCiReadSingleData(void)
{
	 return ReadDatFromUsb();
}
/***********************************************************************************
** �������� 	: USBCiReadPortData
** �������� 	: ������ȡUSB����
** ��		��	:	 ��
** ��		��	:    ��
************************************************************************************/
UINT8 USBCiReadPortData(UINT8 *buf)
{
	 UINT8 i,len;
	 
	 USBCiWriteSingleCmd(CMD_RD_USB_DATA);
	 
	 len=USBCiReadSingleData();
	 
	 for(i=0; i<len; i++)
	 {
	 	*buf=USBCiReadSingleData();
	 		  
	 	 buf++;
	 }
	 
	 return len;
}
/***********************************************************************************
** �������� 	: USBCiWriteCmd
** �������� 	: USB д����
** ��		��	: ��
** ��		��	: ��
************************************************************************************/
void USBCiWritePortData(UINT8 *buf, UINT8 len)
{
	 if(buf == NULL || len ==0 )return;
	 
	 USBCiWriteSingleData(len);				//���͵ĳ���Ϊlen
	 
	 while(len--)
	 {
		USBCiWriteSingleData(*buf);			//������ݷ���

		buf++;
	 }
}
/***********************************************************************************
** �������� 	: USBCiEP0Send
** �������� 	: ��˵�0д����������
** ��		��	: buf Ҫ�������ݵĻ�����
                  len Ҫ�������ݵĳ���
** ��		��	: ��
************************************************************************************/
void USBCiEP0Send(UINT8 *buf,UINT8 len)
{
	USBCiWriteSingleCmd (CMD_WR_USB_DATA3);	//��˵�0��������	
	USBCiWritePortData  (buf ,len);
}
/***********************************************************************************
** �������� 	: USBCiEP2Send
** �������� 	: ��˵�2д����������
** ��		��	: buf Ҫ�������ݵĻ�����
                  len Ҫ�������ݵĳ���
** ��		��	: ��
************************************************************************************/
void USBCiEP2Send(UINT8 *buf,UINT8 len)
{
	USBCiWriteSingleCmd (CMD_WR_USB_DATA7);	//��˵�2��������
	USBCiWritePortData  (buf,len);
}
/***********************************************************************************
** �������� 	: USBCiInit
** �������� 	: USB��ʼ��
** ��		��	:	 ��
** ��		��	:    ��
************************************************************************************/
void USBCiInit(void)
{
    UINT8 i=0;
    
	USBCiWriteSingleCmd(0x01);

	i=USBCiReadSingleData();

	USBCiWriteSingleCmd (CMD_SET_USB_MODE);
	USBCiWriteSingleData(CMD_OUTSIDE_FIRMWARE);   //���ù̼�ģʽ

  	for (i=100;i!=0;i--)				          //�ȴ������ɹ�,ͨ����Ҫ�ȴ�10uS-20uS
	{
		if(CMD_RET_SUCCESS==USBCiReadSingleData());
		{
			break;
		}
	
	}	//if ( i==0 ) CH372/CH375����Ӳ������;

	IE1=0;
	IT1=0;//���ⲿ�ź�Ϊ�͵�ƽ����,IT1=1���ش���
	EX1=1;
}

/*
  ---------------------  USB Э��㺯��  ---------------------
*/
/***********************************************************************************
** �������� : USBPcCtrlSend
** �������� : ���ƶ˵������ϴ�
** ��	 ��	: ��
** ��	��	: ��
************************************************************************************/
void USBPcCtrlSend(UINT8 *buf,UINT8 len)
{
	 USBCiEP0Send(buf,len);
}
/***********************************************************************************
** �������� : USBPcHold
** �������� : ���ֵ�ǰ״̬
** ��	 ��	: ��
** ��	��	: ��
************************************************************************************/
void USBPcHold(void)
{
	 USBCiWriteSingleCmd (CMD_WR_USB_DATA3);	//����д�˵�0������
	 USBCiWriteSingleData(0);			        //�ϴ�0�������ݣ�����һ��״̬�׶�
}
/***********************************************************************************
** �������� : USBEP0DesriptorCopy
** �������� : �����������Ա��ϴ�
** ��	 ��	: ��
** ��	��	: ��
************************************************************************************/
void USBEP0DesriptorCopy(void)
{
	BufCpy(USBCtrlPacket.mucBuf,
		   USBCtrlPacket.mpucTxd+USBCtrlPacket.musTxCount,
		   EP0_PACKET_SIZE			
		  );
}
/***********************************************************************************
** �������� : USBEP0Up
** �������� : �˵�0�����ϴ�
** ��	 ��	: ��
** ��	��	: ��
************************************************************************************/
void USBEP0Up(void)
{
	UINT8 len;
	
	//USBMSGEx("USBCtrlPacket.musTxLength:= ",USBCtrlPacket.musTxLength,10);
	
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
/*****************************************************************************************
** ��������: USBPcGetDescriptor				
** ��������: ���������	
** ��    ��: ��
** ��	 ��: ��							
******************************************************************************************/
void USBPcGetDescriptor(void)
{
		//USBMSGEx("USBCtrlPacket.r.musRequestValue:=",USBCtrlPacket.r.musRequestValue,16);

		switch(MSB(USBCtrlPacket.r.musRequestValue))
		{
			case 0x01://�豸�������ϴ�
				 {
                    USBMSG("-->����豸������\r\n");

				 	USBCtrlPacket.mpucTxd=(UINT8 *)&USBDevDescriptor;
					USBCtrlPacket.musTxLength=USBCtrlPacket.musTxLength <=USBDevDescriptor.bLength? \
                                              USBCtrlPacket.musTxLength  :USBDevDescriptor.bLength;					
				 }
				break;

			case 0x02://�����������ϴ�
				 {
                    USBMSG("-->�������������\r\n");

				 	USBCtrlPacket.mpucTxd=(UINT8 *)&USBDescriptor.ConfigDescr;
					//���������������Ƚ�С,��ʵֻ��US���Ѿ��㹻��BDescriptor.ConfigDescr.wTotalLength0
					USBCtrlPacket.musTxLength=USBCtrlPacket.musTxLength <=(USBDescriptor.ConfigDescr.wTotalLength1<<8)|USBDescriptor.ConfigDescr.wTotalLength0? \
                                              USBCtrlPacket.musTxLength  :(USBDescriptor.ConfigDescr.wTotalLength1<<8)|USBDescriptor.ConfigDescr.wTotalLength0;

				
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
					            USBCtrlPacket.musTxLength=USBCtrlPacket.musTxLength <=acUSBLanguageDesCriptor[0]? \
                                                          USBCtrlPacket.musTxLength  :acUSBLanguageDesCriptor[0];								
												    
							}
							break ;
							
						case 0x01 ://��ó����ַ���
							{
								USBMSG("-->��ó����ַ���\r\n");
								
								USBCtrlPacket.mpucTxd = acUSBManufacturerString;
					            USBCtrlPacket.musTxLength=USBCtrlPacket.musTxLength <=acUSBManufacturerString[0]? \
                                                          USBCtrlPacket.musTxLength  :acUSBManufacturerString[0];												
							}

							break ;
							
						case 0x02 ://��ȡ��Ʒ�ַ���
							{
								USBMSG("-->��ò�Ʒ�ַ���\r\n");
								
								USBCtrlPacket.mpucTxd = acUSBProducterString;								
					            USBCtrlPacket.musTxLength=USBCtrlPacket.musTxLength <=acUSBProducterString[0]? \
                                                          USBCtrlPacket.musTxLength  :acUSBProducterString[0];										
							}
							break ;
							
						case 0x03 ://��ȡ�豸���к�
							{
								USBMSG("-->��ȡ�豸���к�\r\n");	
								
								USBCtrlPacket.mpucTxd = acUSBDeviceSerialNumber;								
					            USBCtrlPacket.musTxLength=USBCtrlPacket.musTxLength <=acUSBDeviceSerialNumber[0]? \
                                                          USBCtrlPacket.musTxLength  :acUSBDeviceSerialNumber[0];									    						
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
					USBCtrlPacket.musTxLength=USBCtrlPacket.musTxLength <=sizeof(acUSBHidReportDescriptor)?\
                                              USBCtrlPacket.musTxLength  :sizeof(acUSBHidReportDescriptor);

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
	
		USBEP0DesriptorCopy();
}
/*****************************************************************************************
** ��������: USBPcGetConfiguration				
** ��������: �������
** ��    ��: ��
** ��	 ��: ��							
******************************************************************************************/
void USBPcGetConfiguration(void)
{
	 USBCtrlPacket.r.mucRequestType=USBFlags.bits.mbConfig ? 1:0;
}
/*****************************************************************************************
** ��������: USBPcClearFeature				
** ��������: �������
** ��    ��: ��
** ��	 ��: ��							
******************************************************************************************/
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
/*****************************************************************************************
** ��������: USBPcGetInterface				
** ��������: ��ýӿ�
** ��    ��: ��
** ��	 ��: ��							
******************************************************************************************/
void USBPcGetInterface(void)
{
     USBCtrlPacket.r.mucRequestType =0x01;
	 USBCtrlPacket.r.mucRequestCode =0x00;	 
}
/*****************************************************************************************
** ��������: USBPcGetStatus				
** ��������: ���״̬
** ��    ��: ��
** ��	 ��: ��							
******************************************************************************************/
void USBPcGetStatus(void)
{
     USBCtrlPacket.r.mucRequestType =0x00;
	 USBCtrlPacket.r.mucRequestCode =0x00;		
}
/*****************************************************************************************
** ��������: USBPcSetConfiguration				
** ��������: ��������
** ��    ��: ��
** ��	 ��: ��							
******************************************************************************************/
void USBPcSetConfiguration(void)
{
	USBFlags.bits.mbConfig = FALSE;

	USBFlags.bits.mbConfig = LSB(USBCtrlPacket.r.musRequestValue)? TRUE:FALSE;
}
/*****************************************************************************************
** ��������: USBPcSetAddress				
** ��������: ���õ�ַ
** ��    ��: ��
** ��	 ��: ��							
******************************************************************************************/
void USBPcSetAddress(void)
{
	ucUSBAddress=LSB(USBCtrlPacket.r.musRequestValue);//�ݴ�USB���������ĵ�ַ
}
/*****************************************************************************************
** ��������: USBPcSetDescriptor				
** ��������: ����������
** ��    ��: ��
** ��	 ��: ��							
******************************************************************************************/
void USBPcSetDescriptor(void)
{
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}
/*****************************************************************************************
** ��������: USBPcSetFeature				
** ��������: ��������
** ��    ��: ��
** ��	 ��: ��							
******************************************************************************************/
void USBPcSetFeature(void)
{

    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}
/*****************************************************************************************
** ��������: USBPcSetInterface				
** ��������: ���ýӿ�
** ��    ��: ��
** ��	 ��: ��							
******************************************************************************************/
void USBPcSetInterface(void)
{
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}
/*****************************************************************************************
** ��������: USBPcGetReport				
** ��������: ��ȡ����
** ��    ��: ��
** ��	 ��: ��							
******************************************************************************************/
void USBPcGetReport(void) 
{
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;	
}
/*****************************************************************************************
** ��������: USBPcGetIdle				
** ��������: ��ȡ����״̬
** ��    ��: ��
** ��	 ��: ��							
******************************************************************************************/
void USBPcGetIdle(void)
{

    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;	
}
/*****************************************************************************************
** ��������: USBPcGetProtocol				
** ��������: ��ȡЭ��
** ��    ��: ��
** ��	 ��: ��							
******************************************************************************************/
void USBPcGetProtocol(void)
{
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}
/*****************************************************************************************
** ��������: USBPcSetProtocol				
** ��������: ����Э��
** ��    ��: ��
** ��	 ��: ��							
******************************************************************************************/
void USBPcSetProtocol(void)
{
	 //ucUSBProtocol = LSB(USBCtrlPacket.r.musRequestValue);
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
	/*UINT8 i ;
	i = 0x1 ;

	USBCtrlPacket.mpucTxd=&i ; //����iΪ��ʱ����,���׳���Ұָ��
	 USBCtrlPacket.musTxLength    = 1 ;*/
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
	//ucUSBIdle = USBCtrlPacket.r.musRequestValue ;
    USBCtrlPacket.mpucTxd     = NULL ;
	USBCtrlPacket.musTxLength = 0 ;
}
/*
  ---------------------  USB �жϷ������  ---------------------
*/

/***********************************************************************************
** �������� : UsbIRQ
** �������� : �жϷ������
** ��	 ��	: ��
** ��	��	: ��
************************************************************************************/
void UsbIRQ(void) interrupt 2
{
	UINT8 ucintStatus;
	UINT8 ucrecvLen,i;

	USBCiWriteSingleCmd(CMD_GET_STATUS);  								//��ȡ�ж�״̬��ȡ���ж����� 
	ucintStatus =USBCiReadSingleData();  								//��ȡ�ж�״̬,���жϱ�־,��Ӧ��INT0�ж� 
	
	switch(ucintStatus)													//�����ж�״̬
	{  
		case USB_INT_EP2_OUT: 
			 {
				//����һ��Ҫ��ȡ,����ᵼ��CH37xϵ��USB����
			 	  ucrecvLen=USBCiReadPortData(USBMainBuf);
  				  //USBMSG("\r\nCH37x USB �˵�2�յ�����\r\n");
				  USBMSG("CH37x USB���յ���������:\r\n");
				  for(i=0;i<ucrecvLen;i++)USBMSGEx("",USBMainBuf[i],16);
				  USBMSG("\r\n");
				  USBMSG("CH37x USB��PC����������---->\r\n");			 
				  USBMSG("\r\n");
				  USBCiEP2Send(USBMainBuf,64);

			 } 
			 break;

		case USB_INT_EP2_IN:										    //�����˵��ϴ��ɹ�,δ����
			 {
			 	USBMSG("\r\nCH37x USB �������ݳɹ�\r\n");
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

			  USBEP0Up();	  //�����ϴ�
			}
			break;

		case USB_INT_EP0_IN:				                        //���ƶ˵��ϴ��ɹ�	
		    {
					//��������������ʱ,���	USB_INT_EP0_IN ת�� USB_INT_EP0_SETUP��,
					//�������굱ǰ�涨���ȵ�������,�Ż����USB_INT_EP0_SETUP�ж�,
					//����һֱΪUSB_INT_EP0_IN
	    	
				if(USBFlags.bits.mbDescriptor)          //�������ϴ�
				{								
					USBEP0DesriptorCopy();                          //����������
					USBEP0Up();															
				}
				//����USB��ַ
				else if(USBFlags.bits.mbAdrress)   //���õ�ַ
				{
					USBCiWriteSingleCmd (CMD_SET_USB_ADDR);
					USBCiWriteSingleData(ucUSBAddress);				//����USB��ַ,�����´������USB��ַ
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
			 	//����һ��Ҫ��ȡ,����ᵼ��CH37xϵ��USB����
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
					USBMSG("CH37x USB ��λ\r\n");
				}

				USBCiWriteSingleCmd (CMD_UNLOCK_USB);				//�ͷŻ�����
			 }
			 break;

	 }
}
