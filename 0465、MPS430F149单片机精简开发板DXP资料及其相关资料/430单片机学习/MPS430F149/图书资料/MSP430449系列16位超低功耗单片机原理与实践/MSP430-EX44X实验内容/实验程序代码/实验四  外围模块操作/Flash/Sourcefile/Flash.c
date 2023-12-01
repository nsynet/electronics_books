/**************************************************************
*  �ļ�����
*         flash.c  
*  �ļ�˵����
*      ��MSP430�Դ�Flash���в���
***************************************************************/

#define FLASH_C 0

#ifndef MSP430F449_H
#include <msp430x44x.h>
#endif 

/**************************************************************
*  ��ʼ�� Flash
**************************************************************/
void init_Flash(void)
{
    FCTL2 = FWKEY + FSSEL0 + FN0;               // ����ʱ��Ƶ��ΪACLK 
}
/**************************************************************
*   ��Flash
*    �������˵��:   
*           addr:     ����ַ
*           length:   Ҫ��ȡ���ֽ���
*           readBuf:  ���Դ洢��ȡ���ݵĻ�������ַ
***************************************************************/ 
void read_Flash(char* addr,char * rbuf,int len)
{
    unsigned int cnt;
    
    while((FCTL3 & 0x01) == 0x0001);            // �ȴ�flash����
    for(cnt=0;cnt<len;cnt++)
    {
        *(rbuf+ cnt) = *(addr + cnt);           // ������
    }
    FCTL3  = FWKEY + LOCK;                      // Lock       
}
/**************************************************************
*
*  �������ܣ�д���ݵ�Flash
*  �������:
*             addr:    ��ַ
*             buf:     Ҫд���ݵ��׵�ַ
*             len:     д����ֽ���
***************************************************************/

void write_Flash(char*addr,char*buf,int len)
{
    unsigned int cnt;
    
    while((FCTL3 & 0x01) == 0x0001);            // �ȴ�Flash����
    FCTL3  = FWKEY;                             // �����LOCK����ʶ
    FCTL1  = FWKEY + WRT;                       // ׼��д                      
    for(cnt=0;cnt<len;cnt++)
    {
        *(addr+cnt) = *(buf + cnt);             // д����
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
    while((FCTL3 & 0x01) == 0x0001);            // �ȴ�����
    FCTL3  = FWKEY;                             // ��� "Lock" 
    FCTL1  = FWKEY + ERASE;                     // ׼������              
    *add   = 2;                                 // ������д����������
    FCTL3  = FWKEY + LOCK;                      // �á�LOCK��           
    
}
