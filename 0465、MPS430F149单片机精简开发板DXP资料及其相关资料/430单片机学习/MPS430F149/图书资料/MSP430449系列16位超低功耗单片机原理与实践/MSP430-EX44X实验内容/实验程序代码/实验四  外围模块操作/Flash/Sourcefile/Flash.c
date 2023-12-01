/**************************************************************
*  文件名：
*         flash.c  
*  文件说明：
*      对MSP430自带Flash进行操作
***************************************************************/

#define FLASH_C 0

#ifndef MSP430F449_H
#include <msp430x44x.h>
#endif 

/**************************************************************
*  初始化 Flash
**************************************************************/
void init_Flash(void)
{
    FCTL2 = FWKEY + FSSEL0 + FN0;               // 设置时钟频率为ACLK 
}
/**************************************************************
*   读Flash
*    输入参数说明:   
*           addr:     读地址
*           length:   要读取的字节数
*           readBuf:  用以存储读取内容的缓存区地址
***************************************************************/ 
void read_Flash(char* addr,char * rbuf,int len)
{
    unsigned int cnt;
    
    while((FCTL3 & 0x01) == 0x0001);            // 等待flash空闲
    for(cnt=0;cnt<len;cnt++)
    {
        *(rbuf+ cnt) = *(addr + cnt);           // 读数据
    }
    FCTL3  = FWKEY + LOCK;                      // Lock       
}
/**************************************************************
*
*  函数功能：写数据到Flash
*  输入参数:
*             addr:    地址
*             buf:     要写数据的首地址
*             len:     写入的字节数
***************************************************************/

void write_Flash(char*addr,char*buf,int len)
{
    unsigned int cnt;
    
    while((FCTL3 & 0x01) == 0x0001);            // 等待Flash空闲
    FCTL3  = FWKEY;                             // 清除“LOCK”标识
    FCTL1  = FWKEY + WRT;                       // 准备写                      
    for(cnt=0;cnt<len;cnt++)
    {
        *(addr+cnt) = *(buf + cnt);             // 写数据
    }
    FCTL3  = FWKEY + LOCK;                      // Lock         
      
}
/**************************************************************
*
*   Erase Flash
*   intput:
*          add: address that sepecify a Segment
*
**************************************************************/
void erase_Flash(char* add)
{
    while((FCTL3 & 0x01) == 0x0001);            // 等待空闲
    FCTL3  = FWKEY;                             // 清除 "Lock" 
    FCTL1  = FWKEY + ERASE;                     // 准备擦除              
    *add   = 2;                                 // 擦除，写任意数均可
    FCTL3  = FWKEY + LOCK;                      // 置“LOCK”           
    
}
