#ifndef __USBPROTOCOL_H__
#define __USBPROTOCOL_H__
/*
	����USBģʽ
*/
#define USB_CONFIG_MODE      CMD_INSIDE_FIRMWARE

/* device descriptor: test device type */
#define USB_CLASS_CODE_TEST_CLASS_DEVICE                    0xdc			   /* �豸������: �����豸���� */
/* HID Subclass Codes */
#define HID_SUBCLASS_NONE               0x00
#define HID_SUBCLASS_BOOT               0x01

/* HID Protocol Codes */
#define HID_PROTOCOL_NONE               0x00
#define HID_PROTOCOL_KEYBOARD           0x01
#define HID_PROTOCOL_MOUSE              0x02

//(1) Receiver: D4...D0 
#define USB_RECIPIENT            (UINT8)0x1F
#define USB_RECIPIENT_DEVICE     (UINT8)0x00
#define USB_RECIPIENT_INTERFACE  (UINT8)0x01
#define USB_RECIPIENT_ENDPOINT   (UINT8)0x02

//(2) Type: D6...D5
#define USB_REQUEST_TYPE_MASK    (UINT8)0x60
#define USB_STANDARD_REQUEST     (UINT8)0x00
#define USB_CLASS_REQUEST        (UINT8)0x20
#define USB_VENDOR_REQUEST       (UINT8)0x40
//(3) data direction: D7
#define DEVICE_ADDRESS_MASK      0x7F
//(4) USB request mask
#define USB_REQUEST_MASK         (UINT8)0x0F
/******************************************************
*       USB device request type
*******************************************************/
#define USB_DEVICE_DESCRIPTOR_TYPE                0x01
#define USB_CONFIGURATION_DESCRIPTOR_TYPE         0x02
#define USB_STRING_DESCRIPTOR_TYPE                0x03
#define USB_INTERFACE_DESCRIPTOR_TYPE             0x04
#define USB_ENDPOINT_DESCRIPTOR_TYPE              0x05
#define USB_POWER_DESCRIPTOR_TYPE                 0x06

/*******************************************************
*       correct value based on USB1.0 specification
********************************************************/
#define USB_REQUEST_GET_STATUS                    0x00
#define USB_REQUEST_CLEAR_FEATURE                 0x01

#define USB_REQUEST_SET_FEATURE                   0x03

#define USB_REQUEST_SET_ADDRESS                   0x05
#define USB_REQUEST_GET_DESCRIPTOR                0x06
#define USB_REQUEST_SET_DESCRIPTOR                0x07
#define USB_REQUEST_GET_CONFIGURATION             0x08
#define USB_REQUEST_SET_CONFIGURATION             0x09
#define USB_REQUEST_GET_INTERFACE                 0x0A
#define USB_REQUEST_SET_INTERFACE                 0x0B
#define USB_REQUEST_SYNC_FRAME                    0x0C

/*******************************************************
*       USB feather select
********************************************************/
#define USB_FEATURE_ENDPOINT_STALL         		  0x0000
#define USB_FEATURE_REMOTE_WAKEUP          		  0x0001
#define USB_FEATURE_POWER_D0                	  0x0002
#define USB_FEATURE_POWER_D1               		  0x0003
#define USB_FEATURE_POWER_D2               		  0x0004
#define USB_FEATURE_POWER_D3          		      0x0005

#define USB_DESCRIPTOR_MAKE_TYPE_AND_INDEX(d, i) ((INT16U)((INT16U)d<<8 | i))

/*******************************************************
*       USB configuration descriptor
********************************************************/
#define USB_CONFIG_POWERED_MASK                   0xc0

#define USB_CONFIG_BUS_POWERED                    0x80
#define USB_CONFIG_SELF_POWERED                   0x40
#define USB_CONFIG_REMOTE_WAKEUP                  0x20

#define BUS_POWERED                          	  0x80
#define SELF_POWERED                         	  0x40
#define REMOTE_WAKEUP                       	  0x20

/*******************************************************
*       USB endpoint descriptor structure: endpoint attribute
********************************************************/
#define USB_ENDPOINT_TYPE_MASK                    0x03

#define USB_ENDPOINT_TYPE_CONTROL                 0x00
#define USB_ENDPOINT_TYPE_ISOCHRONOUS             0x01
#define USB_ENDPOINT_TYPE_BULK                    0x02
#define USB_ENDPOINT_TYPE_INTERRUPT               0x03

/*******************************************************
*       USB  device class
********************************************************/
#define USB_DEVICE_CLASS_RESERVED           	  0x00
#define USB_DEVICE_CLASS_AUDIO              	  0x01
#define USB_DEVICE_CLASS_COMMUNICATIONS     	  0x02
#define USB_DEVICE_CLASS_HUMAN_INTERFACE          0x03
#define USB_DEVICE_CLASS_MONITOR                  0x04
#define USB_DEVICE_CLASS_PHYSICAL_INTERFACE       0x05
#define USB_DEVICE_CLASS_POWER                    0x06
#define USB_DEVICE_CLASS_PRINTER                  0x07
#define USB_DEVICE_CLASS_STORAGE                  0x08
#define USB_DEVICE_CLASS_HUB                      0x09
#define USB_DEVICE_CLASS_VENDOR_SPECIFIC          0xFF

#define NUM_ENDPOINTS	   2
#define CONFIG_DESCRIPTOR_LENGTH      sizeof(USB_CONFIGURATION_DESCRIPTOR) \
                                    + sizeof(USB_INTERFACE_DESCRIPTOR)     \
									+ sizeof(USB_HID_DESCRIPTOR)           \
									+ (NUM_ENDPOINTS * sizeof(USB_ENDPOINT_DESCRIPTOR))
/*
	USB �豸�������ṹ��
*/
typedef struct _USB_DEVICE_DESCRIPTOR 
{
    UINT8 bLength;
    UINT8 bDescriptorType;
    UINT8 bcdUSB0;
    UINT8 bcdUSB1;
    UINT8 bDeviceClass;
    UINT8 bDeviceSubClass;
    UINT8 bDeviceProtocol;
    UINT8 bMaxPacketSize;
    UINT8 idVendor0;
    UINT8 idVendor1;
    UINT8 idProduct0;
    UINT8 idProduct1;
    UINT8 bcdDevice0;
    UINT8 bcdDevice1;
    UINT8 iManufacturer;
    UINT8 iProduct;
    UINT8 iSerialNumber;
    UINT8 bNumConfigurations;
} USB_DEVICE_DESCRIPTOR, *PUSB_DEVICE_DESCRIPTOR;
/*
	USB �����������ṹ��
*/
typedef struct _USB_CONFIGURATION_DESCRIPTOR 
{
    UINT8 bLength;
    UINT8 bDescriptorType;
    UINT8 wTotalLength0;
    UINT8 wTotalLength1;
    UINT8 bNumInterfaces;
    UINT8 bConfigurationValue;
    UINT8 iConfiguration;
    UINT8 bmAttributes;
    UINT8 MaxPower;
} USB_CONFIGURATION_DESCRIPTOR, *PUSB_CONFIGURATION_DESCRIPTOR;
/*
	USB �ӿ��������ṹ��
*/
typedef struct _USB_INTERFACE_DESCRIPTOR {
    UINT8 bLength;
    UINT8 bDescriptorType;
    UINT8 bInterfaceNumber;
    UINT8 bAlternateSetting;
    UINT8 bNumEndpoints;
    UINT8 bInterfaceClass;
    UINT8 bInterfaceSubClass;
    UINT8 bInterfaceProtocol;
    UINT8 iInterface;
} USB_INTERFACE_DESCRIPTOR, *PUSB_INTERFACE_DESCRIPTOR;
/*
	USB ����ѧ�豸 �豸�������ṹ��
*/
typedef struct _USB_HID_DESCRIPTOR {
    UINT8 bLength;									/* ���������� */
    UINT8 bDescriptorType;							/* ����������: 21H */
	UINT8 bcdHID0;									/* HID��淶�汾�� */
	UINT8 bcdHID1;
    UINT8 bCountryCode;								/* ���Ҵ��� */
    UINT8 bNumDescriptors;							/* ��֧������������������ */
    UINT8 bDescriptorType1;							/* ������������1������ */
    UINT8 bDescriptorLength0;						/* ������������1�ĳ��� */
	UINT8 bDescriptorLength1;
} USB_HID_DESCRIPTOR, *PUSB_HID_DESCRIPTOR;
/*
	USB ����ѧ�豸 �˵��������ṹ��
*/
typedef struct _USB_ENDPOINT_DESCRIPTOR {
    UINT8 bLength;
    UINT8 bDescriptorType;
    UINT8 bEndpointAddress;
    UINT8 bmAttributes;
    UINT8 wMaxPacketSize0;
    UINT8 wMaxPacketSize1;
    UINT8 bInterval;
} USB_ENDPOINT_DESCRIPTOR, *PUSB_ENDPOINT_DESCRIPTOR;
/*
	USB �������ṹ��(����)
*/
typedef struct _USB_DESCRIPTOR {
	USB_CONFIGURATION_DESCRIPTOR    ConfigDescr;			/* ����������  */
	USB_INTERFACE_DESCRIPTOR 		InterfaceDescr;			/* �ӿ�������  */
	USB_HID_DESCRIPTOR				HidDesr;				/* HID�������� */
	USB_ENDPOINT_DESCRIPTOR 		EP2Descr[2];			/* �˵�2������ */
	
} USB_DESCRIPTOR, *PUSB_DESCRIPTOR;
/*
	USB �������ݰ�������
*/
#define MAX_CONTROLDATA_SIZE	8

typedef struct _USB_CTRL_PACKET	
{	
	struct
	{
		UINT8	 mucRequestType;   //��׼������
		UINT8	 mucRequestCode;	  //�������
		UINT16   musRequestValue;  //����ѡ���,���и��ֽ�Ϊ���ͣ����ֽ�Ϊ������������ֵ
		UINT16   musRequestIndex;  //����
		UINT16   musRequestLength; //���ݳ���
	}r;

	UINT16 musTxLength;
	UINT16 musTxCount;
	UINT8 *mpucTxd;
	UINT8  mucBuf[MAX_CONTROLDATA_SIZE];

} USB_CTRL_PACKET,*pUSB_CTRL_PACKET;

typedef union _USB_FLAGS
{
	UINT16    musFlags;
	struct
	{
		UINT8 mbEnumed      :1;
		UINT8 mbConfig      :1;
		UINT8 mbReset       :1;
		UINT8 mStatus       :2;
		UINT8 mbSetup       :1;
		UINT8 mbDescriptor  :1;
	    UINT8 mbAdrress     :1;
		
		UINT8 mbEP0In       :1;
		UINT8 mbEP0Out      :1;
		UINT8 mbEP1In       :1;
		UINT8 mbEP1Out      :1;
		UINT8 mbEP2In       :1;
		UINT8 mbEP2Out      :1;	
	}bits;	
}USB_FLAGS;



extern  USB_CTRL_PACKET  USBCtrlPacket;
extern  USB_FLAGS        USBFlags;

extern void USBPcCtrlSend(UINT8 *buf,UINT8 len);
extern void USBPcHold(void);
extern void USBDesriptorCopy(void);
extern void USBCtrlPacketTransmit(void);
/*
      -----------------		    usb��׼�豸����������		    -----------------
*/
extern void USBPcGetDescriptor(void);
extern void USBPcGetConfiguration(void);
extern void USBPcClearFeature(void);
extern void USBPcGetInterface(void);
extern void USBPcGetStatus(void);
extern void USBPcSetConfiguration(void);
extern void USBPcSetAddress(void);
extern UINT8 USBPcGetAddress(void);
extern void USBPcSetDescriptor(void);
extern void USBPcSetFeature(void);
extern void USBPcSetInterface(void);
extern void USBPcGetReport(void);
extern void USBPcGetIdle(void);
extern void USBPcGetProtocol(void);
extern void USBPcSetProtocol(void);
extern void USBPcSetReport(void);
extern void USBPcSetIdle(void);






#endif