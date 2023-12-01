/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */
#include "stc.h"
#include <intrins.h>

/***************************************************
 *          类型定义，方便代码移植
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
* 函数名称: DelayNus
* 输    入: t 延时时间
* 输    出: 无
* 功能描述: 微秒级延时
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
* 函数名称: DelayNms
* 输    入: t 延时时间
* 输    出: 无
* 功能描述: 毫秒延时
*****************************************************/
void DelayNms(UINT16 t)
{
	 do
	 {
	 	DelayNus(1000);

	 }while(--t >0);
}
/****************************************************
* 函数名称: EEPROMEnable
* 输    入: 无
* 输    出: 无
* 功能描述: EEPROM使能
*****************************************************/
void EEPROMEnable(void)
{
	ISP_CONTR=0x81;//使能并设置好等待时间
}
/****************************************************
* 函数名称: EEPROMDisable
* 输    入: 无
* 输    出: 无
* 功能描述: EEPROM禁用
*****************************************************/
void EEPROMDisable(void)
{
    ISP_CONTR=0x00;  //禁止EEPROM
    ISP_CMD=0x00;    //无ISP操作
    ISP_TRIG=0x00;   //清零
    ISP_ADDRH=0x00;  //清零
    ISP_ADDRL=0x00;  //清零
}
/****************************************************
* 函数名称: EEPROMSetAddress
* 输    入: addr 16位地址
* 输    出: 无
* 功能描述: EEPROM 设置读写地址（相对地址）
*****************************************************/
void EEPROMSetAddress(UINT16 addr)
{
    addr+=EEPROM_START_ADDRESS; //初始化地址为0x2000
    ISP_ADDRH=(UINT8)(addr>>8); //设置读写地址高字节
    ISP_ADDRL=(UINT8) addr;      //设置读写地址低字节
}
/****************************************************
* 函数名称: EEPROMStart
* 输    入: 无
* 输    出: 无
* 功能描述: EEPROM 启动
*****************************************************/
void EEPROMStart(void)
{
    ISP_TRIG=0x46; //首先写入0x46
    ISP_TRIG=0xB9; //然后写入0xB9
}
/****************************************************
* 函数名称: EEPROMReadByte
* 输    入: addr 16位 地址
* 输    出: 单个字节
* 功能描述: EEPROM 读取单个字节
*****************************************************/
UINT8 EEPROMReadByte(UINT16 addr)
{

    ISP_DATA=0x00;              //清空ISP_DATA
    ISP_CMD=0x01;               //读模式
    
    EEPROMEnable();             //EEPROM使能
    EEPROMSetAddress(addr);   //设置EEPROM地址
    EEPROMStart();              //EEPROM启动

	DelayNus(10);              //读取一个字节要10us

    EEPROMDisable();           //禁止EEPROM
	
    return (ISP_DATA);        //返回读取到的数据
}
/****************************************************
* 函数名称: EEPROMWriteByte
* 输    入: addr 16位 地址
byte 单个字节
* 输    出: 无
* 功能描述: EEPROM 写入单个字节
*****************************************************/
void EEPROMWriteByte(UINT16 addr,UINT8 byte)
{
    EEPROMEnable();           //EERPOM使能

    ISP_CMD=0x02;             //写模式
    
    EEPROMSetAddress(addr); //设置EEPROM地址

    ISP_DATA=byte;            //写入数据

    EEPROMStart();            //EEPROM启动

	DelayNus(60);            //写一个字节需要60us

    EEPROMDisable();         //禁止EEPROM
}
/****************************************************
* 函数名称: EEPROMSectorErase
* 输    入: addr 16位 地址
* 输    出: 无
* 功能描述: EEPROM 扇区擦除
*****************************************************/
void EEPROMSectorErase(UINT16 addr)
{
    ISP_CMD=0x03;            //扇区擦除模式
    
    EEPROMEnable();          //EEPROM使能
    EEPROMSetAddress(addr);//设置EEPROM地址
    EEPROMStart();           //EEPROM启动

    DelayNms(10);             //擦除一个扇区要10ms

    EEPROMDisable();         //禁止EEPROM

}
/****************************************************
* 函数名称: main
* 输    入: 无
* 输    出: 无
* 功能描述: 函数主体
*****************************************************/
void main(void)
{
    UINT8 i=0;

    EEPROMSectorErase(0);    //从EEPROM的相对0地址扇区擦除
    EEPROMWriteByte(0,0x88);//从EEPROM的相对0地址写入0x88
    i=EEPROMReadByte(0);     //从EERPOM的相对0地址读取数据

    LED_PORT=~i;               //读取的数据从I/O口显示

	while(1);                  //死循环
}

