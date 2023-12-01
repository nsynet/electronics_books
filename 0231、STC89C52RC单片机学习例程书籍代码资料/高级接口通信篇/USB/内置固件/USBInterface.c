/*
 ----------------------------------------------------
 *��    �ߣ�������
 ----------------------------------------------------
 */
#include "stc.h"
#include "global.h"
#include "USBDefine.h"
#include "USBHardware.h"
#include "USBInterface.h"
/****************************************************************************************************
*
*                                      ������
* 
*****************************************************************************************************/

/****************************************************************************************************
*
*                                      ������
* 
*****************************************************************************************************/
/****************************************************
* ��������: WriteDatToUsb
* ��    ��: UINT8 dat
* ��    ��: ��
* ��������: ��CH372д����
*****************************************************/
static void WriteDatToUsb(UINT8 dat)
{
    USB_CS=0;                    //ѡͨCH372
	USB_DATA_OUTPUT=0xFF;        //��������
	USB_A0=USB_DAT_MODE;         //����ģʽ
	USB_WR=0;                    //����д
	USB_DATA_OUTPUT=dat;         //д����
    DelayNus(3);            
	USB_CS=1;                    //��ѡͨCH372
	USB_DATA_OUTPUT=0xFF;        //��������
	USB_WR=1;                    //��ֹд
}
/****************************************************
* ��������: WriteDatToUsb
* ��    ��: UINT8 cmd
* ��    ��: ��
* ��������: ��CH372д����
*****************************************************/
static void WriteCmdToUsb(UINT8 cmd)
{
    USB_CS=0;                 //ѡͨCH372
	USB_DATA_OUTPUT=0xFF;     //��������
	USB_A0=USB_CMD_MODE;      //����ģʽ
	USB_WR=0;                 //����д       	
	USB_DATA_OUTPUT=cmd;      //д����
    DelayNus(3);           
	USB_CS=1;                 //��ѡͨCH372
	USB_DATA_OUTPUT=0xFF;     //��������
	USB_WR=1;                 //��ֹд
}
/****************************************************
* ��������: WriteDatToUsb
* ��    ��: UINT8 cmd
* ��    ��: ��
* ��������: ��CH372д����
*****************************************************/
static UINT8 ReadDatFromUsb(void)
{	
	UINT8 dat;
	USB_CS=0;                   //ѡͨCH372
	USB_DATA_INPUT=0xFF;        //��������
	USB_A0=USB_DAT_MODE;        //����ģʽ
	USB_RD=0;                   //�����         
	dat=USB_DATA_INPUT;         //��ȡ����
    DelayNus(3);	          
	USB_CS=1;                   //��ѡͨCH372
	USB_RD=1;                   //��ֹ��
	USB_DATA_INPUT=0xFF;        //��������

	return dat;                 //���ض�ȡ��������
}
/****************************************************
* ��������: USBCiWriteSingleCmd
* ��    ��: UINT8 cmd
* ��    ��: ��
* ��������: д��USB��������
*****************************************************/
void USBCiWriteSingleCmd(UINT8 cmd)
{
	 WriteCmdToUsb(cmd);     
}

/****************************************************
* ��������: USBCiWriteSingleData
* ��    ��: ���ֽ�����
* ��    ��: ��
* ��������: д��USB��������
*****************************************************/
void USBCiWriteSingleData(UINT8 dat)
{
	 WriteDatToUsb(dat);   //����WriteDatToUsb����д����
}
/****************************************************
* ��������: USBCiReadSingleData
* ��    ��: ��
* ��    ��: ���ֽ�����
* ��������: ��ȡUSB��������
*****************************************************/
UINT8 USBCiReadSingleData(void)
{
	 return ReadDatFromUsb();//����ReadDatFromUsb����д����
}
/****************************************************
* ��������: USBCiReadPortData
* ��    ��: ���ݻ�����buf
* ��    ��: ��ȡ���ݵĳ���
* ��������: ��ȡUSB�������
*****************************************************/
UINT8 USBCiReadPortData(UINT8 *buf)
{
	 UINT8 i,len; 
	 
	 USBCiWriteSingleCmd(CMD_RD_USB_DATA); //����������
	 
	 len=USBCiReadSingleData();              //��ȡ����
	 
	 for(i=0; i<len; i++)                     //for ѭ��
	 {
	 	*buf=USBCiReadSingleData();         //��ȡ����
	 		  
	 	 buf++;                                 //bufƫ��1���ֽ�
	 }
	 
	 return len;                               //���ض�ȡ�����ݳ���
}
/****************************************************
* ��������: USBCiWritePortData
* ��    ��: ���ݻ�����buf�����ݳ���len
* ��    ��: ��
* ��������: д��USB�������
*****************************************************/
void USBCiWritePortData(UINT8 *buf, UINT8 len)
{	 
	 USBCiWriteSingleData(len);				//���͵ĳ���Ϊlen
	 
	 while(len--)
	 {
		USBCiWriteSingleData(*buf);			//������ݷ���

		buf++;
	 }
}
/****************************************************
* ��������: USBCiEP1Send
* ��    ��: ���ݻ�����buf�����ݳ���len
* ��    ��: ��
* ��������: �˵�1��������������
*****************************************************/
void USBCiEP1Send(UINT8 *buf,UINT8 len)
{
	USBCiWriteSingleCmd (CMD_WR_USB_DATA5);	//��˵�1��������
	USBCiWritePortData  (buf,len);
}
/****************************************************
* ��������: USBCiEP2Send
* ��    ��: ���ݻ�����buf�����ݳ���len
* ��    ��: ��
* ��������: �˵�2��������������
*****************************************************/
void USBCiEP2Send(UINT8 *buf,UINT8 len)
{
	USBCiWriteSingleCmd (CMD_WR_USB_DATA7);	//��˵�2��������
	USBCiWritePortData  (buf,len);
}
/****************************************************
* ��������: USBCiInit
* ��    ��: ��
* ��    ��: ��
* ��������: USB ��ʼ��
*****************************************************/
void USBCiInit(void)
{    
	USBCiWriteSingleCmd (CMD_SET_USB_MODE);     //����ģʽ
	USBCiWriteSingleData(CMD_INSIDE_FIRMWARE);  //���ù̼�
	DelayNus(20);                               //��ʱһС��ʱ��
    USBHwInit();                                //USBӲ����ʼ��
}

