/*
 ----------------------------------------------------
 *��    �ߣ�������
 ----------------------------------------------------
 */
#include "Board.h" 
#include "Global.h"
#include "NETDefine.h" 
#include "NETHardware.h"
#include "NETInterface.h"


/****************************************************************************************************
*
*                                      ������
* 
*****************************************************************************************************/
static  DATA UINT8   Enc28j60Bank =0;
static IDATA UINT16  NextPacketPtr=0;
/****************************************************************************************************
*
*                                      ������
* 
*****************************************************************************************************/
/*
						               ��������
*/

/******************************************************
*��������: SPISend
*��    ��: �����ֽ� d
*��    ��: ��
*˵    ��: SPI���͵����ֽ�
*******************************************************/
static void SPISend(UINT8 d)
{
  UINT8 i;

  for(i=0;i<8;i++)
  {
	SCLK=0;
     MOSI = d & 0x80;
	SCLK=1;
	d <<=1;
  }

  SCLK=0;

}
/******************************************************
*��������: SPIRecv
*��    ��: ��
*��    ��: �����ֽ�
*˵    ��: SPI ���յ����ֽ�
*******************************************************/
static UINT8 SPIRecv(void)
{
  UINT8 i,d;

  SCLK=0;
  d=0;

  for(i=0;i<8;i++)
  {	
	SCLK=1;
	d <<=1;
    d |= MISO; 
	SCLK=0;	
  }

  return d;
}


/******************************************************
*��������: NETCiWriteOp
*��    ��: op ������,addr ��ַ, dat ����
*��    ��:��
*˵    ��: ���� д���ƼĴ���
*******************************************************/
void NETCiWriteOp(UINT8 op,UINT8 addr,UINT8 dat)
{
	CS=0;                                     //ѡͨENC28J60

	SPISend(op | (addr & ADDR_MASK));   //SPIָ���д���ƼĴ���
	SPISend(dat);                           //SPI ��������

	CS=1;                                     //��ֹENC28J60
}
/******************************************************
*��������: NETCiReadOp
*��    ��: op ������,addr ��ַ
*��    ��: ����
*˵    ��: ���� �����ƼĴ���
*******************************************************/
UINT8 NETCiReadOp (UINT8 op,UINT8 addr)
{
  	UINT8 d;
   
	CS=0;                                     //ѡͨENC28J60

	SPISend(op | (addr & ADDR_MASK));   //SPIָ������ƼĴ���
	
	d=SPIRecv();                            //������

	if(addr & 0x80)                         //��addr���λΪ1
	{
		d=SPIRecv();                        //������
	}

	CS=1;                                     //��ֹENC28J60

	return d;                                //���ض�ȡ��������
}

/******************************************************
*��������: NETCiReadBuffer
*��    ��: len ���� , buf ���յ�����
*��    ��: ��
*˵    ��: ���� ��ȡ������
*******************************************************/
void NETCiReadBuffer(UINT16 len, UINT8 *buf)
{
	CS=0;                                  //ѡͨENC28J60
	
	SPISend(ENC28J60_READ_BUF_MEM);  //SPIָ�����������

	while(len--)
	{
		 *buf++ = SPIRecv();		  //������������
	}
	
    *buf='\0';	                         
	CS=1;                                 //��ֹENC28J60
}

/******************************************************
*��������: NETCiWriteBuffer
*��    ��: len ���� ,buf Ҫ���͵�����
*��    ��: ��
*˵    ��: ���� д������
*******************************************************/
void NETCiWriteBuffer(UINT16 len,UINT8 *buf)
{
	CS=0;                                        //ѡͨENC28J60
	
	SPISend(ENC28J60_WRITE_BUF_MEM);       //SPIָ���д������

	while(len--)
	{
		SPISend(*buf++);                     //����д������
	}
		
	CS=1;                                      //��ֹENC28J60
}

/******************************************************
*��������: NETCiSetBank
*��    ��: addr ��ַ
*��    ��: ��
*˵    ��: ���ô洢��
*******************************************************/
void NETCiSetBank(UINT8 addr)
{
    if((addr & BANK_MASK) != Enc28j60Bank) // ����Ƿ���Ч�Ĵ洢��
    {
     //����ECON�Ĵ�����BSEL1��BSEL0
	 NETCiWriteOp(ENC28J60_BIT_FIELD_CLR,ECON1, (ECON1_BSEL1|ECON1_BSEL0)); 
     //����ECON�Ĵ���ֵΪ(addr & BANK_MASK)>>5
	 NETCiWriteOp(ENC28J60_BIT_FIELD_SET, ECON1, (addr & BANK_MASK)>>5); 	
     //��ȡ��ǰBANK�洢��
     Enc28j60Bank = (addr & BANK_MASK);
    }
}
 	
/******************************************************
*��������:NETCiRead
*��    ��:addr ��ַ
*��    ��:һ�ֽ�����
*˵    ��:��ĳһ����ַ��ȡ1�ֽ�����
******************************************************/     
UINT8 NETCiRead(UINT8 addr)
{

	NETCiSetBank(addr);

	return NETCiReadOp(ENC28J60_READ_CTRL_REG, addr);

}  		 
/******************************************************
*��������: NETCiClkOut
*��    ��: clkֵ
*��    ��: ��
*˵    ��: ����CLKOUT
*******************************************************/
void NETCiClkOut(UINT8 clk)
{
    NETCiWrite(ECOCON,clk&0x07); //����CLKOUT
}

/******************************************************
*��������: NETCiWrite
*��    ��: addr ��ַ ��dat Ҫд�������
*��    ��: ��
*˵    ��: ���üĴ���
*******************************************************/
void NETCiWrite(UINT8 addr,
                   UINT8 dat)
{
	NETCiSetBank(addr);         //ѡ��洢��
	NETCiWriteOp(ENC28J60_WRITE_CTRL_REG, addr, dat);//���ÿ��ƼĴ���
}
/******************************************************
*��������: NETCiPhyWrite
*��    ��: addr ��ַ, dat 16λ����
*��    ��: ��
*˵    ��: ����PHY
*******************************************************/
void NETCiPhyWrite(UINT8  addr, UINT16 dat)
{
	NETCiWrite(MIREGADR, addr); //дMIREAGDRֵΪdat
	NETCiWrite(MIWRL, dat);      //дMIWRLֵΪdat(����8λ)
	NETCiWrite(MIWRH, dat>>8);  //дMIWRHֵΪdat>>8(����8λ)
	while(NETCiRead(MISTAT) & MISTAT_BUSY) //���MISTAT�Ĵ�����BUSYλ
	{
	      DelayNus(15);//��ʱ15us��΢�
	}
}
/******************************************************
*��������: NETCiInit
*��    ��: mac ��ַ
*��    ��: ��
*˵    ��: �����豸��ʼ��
*******************************************************/
void NETCiInit(UINT8 *mac)
{
	NETHwInit();	//����Ͳ�IO��ʼ��

	NETCiWriteOp(ENC28J60_SOFT_RESET, 0, ENC28J60_SOFT_RESET);//ENC28J60��λ
	DelayNms(50);//��ʱ50ms
	while(!(NETCiRead(ESTAT) & ESTAT_CLKRDY));//����Ƿ����

	NextPacketPtr = RXSTART_INIT;
	NETCiWrite(ERXSTL, RXSTART_INIT&0xFF);   //���ý��ջ�������ʼ��ַ���ֽ�
	NETCiWrite(ERXSTH, RXSTART_INIT>>8);     //���ý��ջ�������ʼ��ַ���ֽ�
	NETCiWrite(ERXRDPTL, RXSTART_INIT&0xFF);//���ý��ջ�������ָ����ֽ�
	NETCiWrite(ERXRDPTH, RXSTART_INIT>>8);   //���ý��ջ�������ָ����ֽ�
	NETCiWrite(ERXNDL, RXSTOP_INIT&0xFF);    //���ý��ջ�����������ַ���ֽ�
	NETCiWrite(ERXNDH, RXSTOP_INIT>>8);       //���ý��ջ�����������ַ���ֽ�

	NETCiWrite(ETXSTL, TXSTART_INIT&0xFF);   //���÷��ͻ�������ʼ��ַ���ֽ�
	NETCiWrite(ETXSTH, TXSTART_INIT>>8);     //���÷��ͻ�������ʼ��ַ���ֽ�   
    NETCiWrite(ETXNDL, TXSTOP_INIT&0xFF);   //���÷��ͻ�����������ַ���ֽ�
	NETCiWrite(ETXNDH, TXSTOP_INIT>>8);      //���÷��ͻ�����������ַ���ֽ�  

     //���ý��շ��͹�����ERXFCONʹ�ܵ�����������CRC����ʽƥ�����
	NETCiWrite(ERXFCON, ERXFCON_UCEN|ERXFCON_CRCEN|ERXFCON_PMEN);

	NETCiWrite(EPMM0, 0x3f);//���ø�ʽƥ�������ֽ�0�Ĵ��������ε�6λ
	NETCiWrite(EPMM1, 0x30);//���ø�ʽƥ�������ֽ�1�Ĵ��������θ�2λ
	NETCiWrite(EPMCSL, 0xf9);//���ø�ʽƥ��У��͵��ֽ�
	NETCiWrite(EPMCSH, 0xf7);//���ø�ʽƥ��У��͸��ֽ�	

     //����MAC���ƼĴ���1ʹ��MAC������ա���ͣ����֡����������ͣ����֡��������
	NETCiWrite(MACON1, MACON1_MARXEN|MACON1_TXPAUS|MACON1_RXPAUS);

	NETCiWrite(MACON2, 0x00); //������MAC���ƼĴ���2

    //����MAC���ƼĴ���3ʹ��֡У�鳤�ȡ�����CRC���Զ���������CRC
    NETCiWriteOp(ENC28J60_BIT_FIELD_SET,MACON3,MACON3_PADCFG0|MACON3_TXCRCEN |MACON3_FRMLNEN);
    
	NETCiWrite(MAIPGL, 0x12);//���÷Ǳ��Ա��������Ĵ����ĵ��ֽ�
	NETCiWrite(MAIPGH, 0x0C);//���÷Ǳ��Ա��������Ĵ����ĸ��ֽ�
	NETCiWrite(MABBIPG,0x12);//���ñ��Ա��������Ĵ���
	NETCiWrite(MAMXFLL, MAX_FRAME_LEN&0xFF);//���֡���ȵ��ֽ�	
	NETCiWrite(MAMXFLH, MAX_FRAME_LEN>>8);  //���֡���ȸ��ֽ�

    NETCiWrite(MAADR5, mac[0]); //����MAC��ַ�ֽ�5
    NETCiWrite(MAADR4, mac[1]); //����MAC��ַ�ֽ�4
    NETCiWrite(MAADR3, mac[2]); //����MAC��ַ�ֽ�3
    NETCiWrite(MAADR2, mac[3]); //����MAC��ַ�ֽ�2
    NETCiWrite(MAADR1, mac[4]); //����MAC��ַ�ֽ�1
    NETCiWrite(MAADR0, mac[5]); //����MAC��ַ�ֽ�0

//����PHY���ƼĴ���2���͵����ݽ�ͨ��˫���ߵĽӿڷ���
	NETCiPhyWrite(PHCON2, PHCON2_HDLDIS);

    //ѡ��BANKΪ��̫�����ƼĴ���1
	NETCiSetBank(ECON1);

     //�����ж�ʹ��
	NETCiWriteOp(ENC28J60_BIT_FIELD_SET, EIE, EIE_INTIE|EIE_PKTIE);
     //������̫�����ƼĴ���1����ʹ��
	NETCiWriteOp(ENC28J60_BIT_FIELD_SET, ECON1, ECON1_RXEN);

}
/******************************************************
*��������: NETCiPacketSend
*��    ��: packet ���ݰ���������len ���ݳ���
*��    ��: ��
*˵    ��: �����豸��������
*******************************************************/
void NETCiPacketSend(UINT8 *packet,UINT16 len)
{
    
	NETCiWrite(EWRPTL, TXSTART_INIT&0xFF);        //���÷��ͻ�������ʼ��ַ���ֽ�
	NETCiWrite(EWRPTH, TXSTART_INIT>>8);          //���÷��ͻ�������ʼ��ַ���ֽ�
	NETCiWrite(ETXNDL, (TXSTART_INIT+len)&0xFF);//���÷��ͻ�����������ַ���ֽ�
	NETCiWrite(ETXNDH, (TXSTART_INIT+len)>>8);  //���÷��ͻ�����������ַ���ֽ�

	NETCiWriteOp(ENC28J60_WRITE_BUF_MEM, 0, 0x00);//��շ��ͻ�����

	NETCiWriteBuffer(len, packet); //��������
	NETCiWriteOp(ENC28J60_BIT_FIELD_SET, ECON1, ECON1_TXRTS);//�����߼���λ
      
	if( (NETCiRead(EIR) & EIR_TXERIF) )//��ⷢ���Ƿ����
	{
         NETCiWriteOp(ENC28J60_BIT_FIELD_CLR, ECON1, ECON1_TXRTS); //�����߼���λ
        
    }
}
/******************************************************
*��������: NETCiPacketReceive
*��    ��: packet ���ݰ���������len ���ݳ���
*��    ��: ����
*˵    ��: �����豸��������
*******************************************************/
UINT16 NETCiPacketReceive(UINT8 *packet,UINT16 maxlen)
{
	UINT16 rxstat;
	UINT16 len;

	if( NETCiRead(EPKTCNT) ==0 )//��ȡ��̫�����ݰ�����
	{
		return(0);
    }
    

NETCiWrite(ERDPTL, (NextPacketPtr));     //д��������ָ����ֽ�
NETCiWrite(ERDPTH, (NextPacketPtr)>>8); //д��������ָ����ֽ�
//�������������ָ����ֽ�
NextPacketPtr= NETCiReadOp(ENC28J60_READ_BUF_MEM, 0);
//�������������ָ����ֽ�
NextPacketPtr|=NETCiReadOp(ENC28J60_READ_BUF_MEM,0)<<8;

	len  = NETCiReadOp(ENC28J60_READ_BUF_MEM, 0);     //����������ָ����ֽ�
	len |= NETCiReadOp(ENC28J60_READ_BUF_MEM, 0)<<8; //����������ָ����ֽ�
len -=4; //�Ƴ�CRCУ��

//����������ָ����ֽ�
	rxstat  = NETCiReadOp(ENC28J60_READ_BUF_MEM, 0); 
     //����������ָ����ֽ�
	rxstat |= (UINT16)(NETCiReadOp(ENC28J60_READ_BUF_MEM, 0)<<8); 

    if (len>maxlen-1) //����Ƿ������󳤶�
    {
        len=maxlen-1;
}

    if ((rxstat & 0x80)==0)//����Ƿ�������
    {
        len=0;// ����len
    }
    else
    {
         
        NETCiReadBuffer(len, packet); //��������
        
    }

	NETCiWrite(ERXRDPTL, (NextPacketPtr));     //д���ջ�������ָ����ֽ�
	NETCiWrite(ERXRDPTH, (NextPacketPtr)>>8); //д���ջ�������ָ����ֽ�

    //�����̫�����ƼĴ���2�е����ݰ��ݼ�λ
	NETCiWriteOp(ENC28J60_BIT_FIELD_SET, ECON2, ECON2_PKTDEC);
	
	return(len);//���ؽ������ݵĳ���
}

