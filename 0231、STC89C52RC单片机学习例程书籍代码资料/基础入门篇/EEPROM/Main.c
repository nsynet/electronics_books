/*
 ----------------------------------------------------
 *��    �ߣ�������
 ----------------------------------------------------
 */
#include "stc.h"
#include <intrins.h>

/***************************************************
 *          ���Ͷ��壬���������ֲ
 ***************************************************/
typedef unsigned char            UINT8;
typedef unsigned int	         UINT16;
typedef unsigned long            UINT32;  
typedef char                     INT8;
typedef int                      INT16;
typedef long                     INT32;

#define NOP()                    _nop_()
#define EEPROM_START_ADDRESS     0x2000 
#define LED_PORT                 P2

/****************************************************
* ��������: DelayNus
* ��    ��: t ��ʱʱ��
* ��    ��: ��
* ��������: ΢�뼶��ʱ
*****************************************************/
void DelayNus(UINT16 t)
{
	UINT16 d=0;

	d=t;

	do
	{
		NOP();
	}while(--d >0);	
}
/****************************************************
* ��������: DelayNms
* ��    ��: t ��ʱʱ��
* ��    ��: ��
* ��������: ������ʱ
*****************************************************/
void DelayNms(UINT16 t)
{
	 do
	 {
	 	DelayNus(1000);

	 }while(--t >0);
}
/****************************************************
* ��������: EEPROMEnable
* ��    ��: ��
* ��    ��: ��
* ��������: EEPROMʹ��
*****************************************************/
void EEPROMEnable(void)
{
	ISP_CONTR=0x81;//ʹ�ܲ����úõȴ�ʱ��
}
/****************************************************
* ��������: EEPROMDisable
* ��    ��: ��
* ��    ��: ��
* ��������: EEPROM����
*****************************************************/
void EEPROMDisable(void)
{
    ISP_CONTR=0x00;  //��ֹEEPROM
    ISP_CMD=0x00;    //��ISP����
    ISP_TRIG=0x00;   //����
    ISP_ADDRH=0x00;  //����
    ISP_ADDRL=0x00;  //����
}
/****************************************************
* ��������: EEPROMSetAddress
* ��    ��: addr 16λ��ַ
* ��    ��: ��
* ��������: EEPROM ���ö�д��ַ����Ե�ַ��
*****************************************************/
void EEPROMSetAddress(UINT16 addr)
{
    addr+=EEPROM_START_ADDRESS; //��ʼ����ַΪ0x2000
    ISP_ADDRH=(UINT8)(addr>>8); //���ö�д��ַ���ֽ�
    ISP_ADDRL=(UINT8) addr;      //���ö�д��ַ���ֽ�
}
/****************************************************
* ��������: EEPROMStart
* ��    ��: ��
* ��    ��: ��
* ��������: EEPROM ����
*****************************************************/
void EEPROMStart(void)
{
    ISP_TRIG=0x46; //����д��0x46
    ISP_TRIG=0xB9; //Ȼ��д��0xB9
}
/****************************************************
* ��������: EEPROMReadByte
* ��    ��: addr 16λ ��ַ
* ��    ��: �����ֽ�
* ��������: EEPROM ��ȡ�����ֽ�
*****************************************************/
UINT8 EEPROMReadByte(UINT16 addr)
{

    ISP_DATA=0x00;              //���ISP_DATA
    ISP_CMD=0x01;               //��ģʽ
    
    EEPROMEnable();             //EEPROMʹ��
    EEPROMSetAddress(addr);   //����EEPROM��ַ
    EEPROMStart();              //EEPROM����

	DelayNus(10);              //��ȡһ���ֽ�Ҫ10us

    EEPROMDisable();           //��ֹEEPROM
	
    return (ISP_DATA);        //���ض�ȡ��������
}
/****************************************************
* ��������: EEPROMWriteByte
* ��    ��: addr 16λ ��ַ
byte �����ֽ�
* ��    ��: ��
* ��������: EEPROM д�뵥���ֽ�
*****************************************************/
void EEPROMWriteByte(UINT16 addr,UINT8 byte)
{
    EEPROMEnable();           //EERPOMʹ��

    ISP_CMD=0x02;             //дģʽ
    
    EEPROMSetAddress(addr); //����EEPROM��ַ

    ISP_DATA=byte;            //д������

    EEPROMStart();            //EEPROM����

	DelayNus(60);            //дһ���ֽ���Ҫ60us

    EEPROMDisable();         //��ֹEEPROM
}
/****************************************************
* ��������: EEPROMSectorErase
* ��    ��: addr 16λ ��ַ
* ��    ��: ��
* ��������: EEPROM ��������
*****************************************************/
void EEPROMSectorErase(UINT16 addr)
{
    ISP_CMD=0x03;            //��������ģʽ
    
    EEPROMEnable();          //EEPROMʹ��
    EEPROMSetAddress(addr);//����EEPROM��ַ
    EEPROMStart();           //EEPROM����

    DelayNms(10);             //����һ������Ҫ10ms

    EEPROMDisable();         //��ֹEEPROM

}
/****************************************************
* ��������: main
* ��    ��: ��
* ��    ��: ��
* ��������: ��������
*****************************************************/
void main(void)
{
    UINT8 i=0;

    EEPROMSectorErase(0);    //��EEPROM�����0��ַ��������
    EEPROMWriteByte(0,0x88);//��EEPROM�����0��ַд��0x88
    i=EEPROMReadByte(0);     //��EERPOM�����0��ַ��ȡ����

    LED_PORT=~i;               //��ȡ�����ݴ�I/O����ʾ

	while(1);                  //��ѭ��
}

