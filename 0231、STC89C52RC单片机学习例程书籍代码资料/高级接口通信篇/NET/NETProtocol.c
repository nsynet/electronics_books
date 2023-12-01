/*
 ----------------------------------------------------
 *��    �ߣ�������
 ----------------------------------------------------
 */
#include "Board.h" 
#include "Global.h"
#include "NETDefine.h"
#include "NETInterface.h"
#include "NETProtocol.h"
/****************************************************************************************************
*
*                                      ������
* 
*****************************************************************************************************/
static UINT16 usTCPPort    =TCP_PORT; //TCP�˿�
static UINT8  acMACAddr[6] ={0};      //MAC��ַ
static UINT8  acIPAddr[4]  ={0};      //IP��ַ
static UINT16 usInfoHdrLen = 0 ;      //�豸���ݳ���
static UINT16 usInfoDataLen= 0 ;      //���ݳ���
static UINT8  ucSeqNum     =0xa;      //TCP����
/****************************************************************************************************
*
*                                      ������
* 
*****************************************************************************************************/
/******************************************************************
*��������:NETPcCheckSum
*��    ��:buf  ����
          len  ����
          type Э������ 
*��    ��:UINT16 ����
*˵    ��:У���
*******************************************************************/ 
UINT16 NETPcCheckSum(UINT8 *buf, UINT16 len,UINT8 type)
{
        UINT32 sum = 0;

        if(type==0) //IP
		{
               
        }

        if(type==1)//UDP
        {
                sum+=IP_PROTO_UDP_V; 
                sum+=len-8; // ��ȡUDP����ʵ����
        }

        if(type==2)//TCP
        {
                sum+=IP_PROTO_TCP_V; 
                sum+=len-8; // ��ȡTCP����ʵ����
        }

        while(len >1)
        {
                sum += 0xFFFF & (((UINT32)*buf<<8)|*(buf+1));
                buf+=2;
                len-=2;
        }

        if (len)
        {
                sum += ((UINT32)(0xFF & *buf))<<8;
        }

        while (sum>>16)
        {
                sum = (sum & 0xFFFF)+(sum >> 16 &0xFFFF);
        }
	
        return( (UINT16) sum ^ 0xFFFF);
}

/******************************************************
*��������: NETPcInit
*��    ��: mac��ַ IP��ַ �˿�
*��    ��: ��
*˵    ��: ���� ��ʼ��
*******************************************************/
void NETPcInit(UINT8 *mymac,UINT8 *myip,UINT16 port)
{
        UINT8 i=0;
        usTCPPort=port;              //����TCP�˿�
        
        while(i<4)
        {

			  acIPAddr[i]=myip[i];//���汾��IP��ַ

                i++;
        }  
        
        i=0;         
        
        while(i<6)
        {
			  acMACAddr[i]=mymac[i];//���汾��MAC��ַ

                i++;
        }
}
/******************************************************
*��������: NETPcEthIsArpAndMyIp
*��    ��: buf ���ݰ���������len ���ݳ���
*��    ��: 0/1
*˵    ��: ������ݰ�ARP�Ƿ�ƥ�䡢IP�Ƿ�ƥ��
*******************************************************/
UINT8 NETPcEthIsArpAndMyIp(UINT8 *buf,UINT16 len)
{
        UINT8 i=0;

        if (len<41)              //��ⳤ�Ȳ����ϣ�����̫���ײ�+IP�ײ�+ARP�ײ�
        {
                return(0);
        }     
        
        if(buf[ETH_TYPE_H_P] != ETHTYPE_ARP_H_V || 
           buf[ETH_TYPE_L_P] != ETHTYPE_ARP_L_V)           //�����̫�������Ƿ����
        {
                return(0);
        }
        while(i<4)
        {
                if(buf[ETH_ARP_DST_IP_P+i] != acIPAddr[i])//���IP��ַ�Ƿ����
                {
                        return(0);
                }   
                
                i++;
        }  
        
        return(1);
}  
/******************************************************
*��������: NETPcEthIsIpAndMyIp
*��    ��: packet ���ݰ���������len ���ݳ���
*��    ��: 0/1
*˵    ��: �����̫�����͡�IP�汾��IP��ַ�Ƿ����
*******************************************************/
UINT8 NETPcEthIsIpAndMyIp(UINT8 *buf,UINT16 len)
{
        UINT8 i=0;
 
        if (len<42)                               //��ⳤ���Ƿ񲻷���
        {
                return(0);
        }   
        
        if(buf[ETH_TYPE_H_P]!=ETHTYPE_IP_H_V || 
           buf[ETH_TYPE_L_P]!=ETHTYPE_IP_L_V) //�����̫�������Ƿ����
        {
                return(0);
        }
        
        if (buf[IP_HEADER_LEN_VER_P]!=0x45)    //���IP�汾�Ƿ�IPV4
        {
                return(0);
        }    
        
        while(i<4)
        {
                if(buf[IP_DST_P+i]!=acIPAddr[i])//���IP��ַ�Ƿ����
                {
                        return(0);
                }  
                
                i++;
        }
        return(1);
}
/******************************************************
*��������: NETPcMakeEth
*��    ��: buf ���ݰ�������
*��    ��: ��
*˵    ��: ������̫���ײ�
*******************************************************/
void NETPcMakeEth(UINT8 *buf)
{
        UINT8 i=0;
        while(i<6)             //������̫���ײ�����ȡMAC��ַ
        {
                buf[ETH_DST_MAC +i]=buf[ETH_SRC_MAC +i];
                buf[ETH_SRC_MAC +i]=acMACAddr[i];
                i++;
        }
}
/******************************************************
*��������: NETPcFillIPHdrChkSum
*��    ��: buf ���ݰ�������
*��    ��: ��
*˵    ��: ���IP��У���
*******************************************************/
void NETPcFillIPHdrChkSum(UINT8 *buf)
{
        UINT16 ck;

        buf[IP_CHECKSUM_P]=0;    //У��ֵ���ֽ�����
        buf[IP_CHECKSUM_P+1]=0;  //У��ֵ���ֽ�����
        buf[IP_FLAGS_P]=0x40;    //�ֶα�־���ֽ���Ϊ0x40
        buf[IP_FLAGS_P+1]=0;     //�ֶα�־���ֽ���Ϊ0x00
        buf[IP_TTL_P]=64;         //����ʱ��Ϊ64ms

        ck=NETPcCheckSum(&buf[IP_P], IP_HEADER_LEN,0);//У��IP�ײ�

        buf[IP_CHECKSUM_P]=ck>>8;       //У��ֵ���ֽ�
        buf[IP_CHECKSUM_P+1]=ck& 0xff; //У��ֵ���ֽ�
}
/******************************************************
*��������: NETPcMakeIP
*��    ��: buf���ݰ�������
*��    ��: ��
*˵    ��: ����IP�ײ�
*******************************************************/
void NETPcMakeIP(UINT8 *buf)
{
        UINT8 i=0;
        
        while(i<4) //����IP�ײ�����ȡIP��ַ
        {
                buf[IP_DST_P+i]=buf[IP_SRC_P+i];
                buf[IP_SRC_P+i]=acIPAddr[i];
                i++;
        }  
        
        NETPcFillIPHdrChkSum(buf);
}
/******************************************************
*��������: NETPcMakeTcpHead
*��    ��: buf���ݰ�������
           rel_ack_num ȷ�Ϻ�
		   mss �Ƿ���������Ĵ�С
		   cp_seq �Ƿ��������
*��    ��: ��
*˵    ��: ����TCP�ײ�
*******************************************************/
void NETPcMakeTcpHead(UINT8 *buf,UINT16 rel_ack_num,UINT8 mss,UINT8 cp_seq)
{
        UINT8 i=0;
        UINT8 tseq; 
        
        while(i<2)                               //��ȡԴ�˿�
        {
                buf[TCP_DST_PORT_H_P+i]=buf[TCP_SRC_PORT_H_P+i];
                buf[TCP_SRC_PORT_H_P+i]=0;
                i++;
        }

	   buf[TCP_SRC_PORT_H_P]=(usTCPPort>>8)&0xFF;//���»�ȡTCP�˿�
        buf[TCP_SRC_PORT_L_P]= usTCPPort    &0xFF;

        i=4;

        while(i>0) //����32λ��ź�32λȷ�Ϻ�
        {
                rel_ack_num=buf[TCP_SEQ_H_P+i-1]+rel_ack_num;
                tseq=buf[TCP_SEQACK_H_P+i-1];
                buf[TCP_SEQACK_H_P+i-1]=0xff&rel_ack_num;

                if (cp_seq)
                {
                        buf[TCP_SEQ_H_P+i-1]=tseq;
                }
else
                {
                        buf[TCP_SEQ_H_P+i-1]= 0; 
                }
                rel_ack_num=rel_ack_num>>8;
                i--;
        }

        if (cp_seq==0)                 //�����������Ƿ�Ϊ0
        {       //TCP_SEQ_H_P˳���
                buf[TCP_SEQ_H_P+0]= 0;
                buf[TCP_SEQ_H_P+1]= 0;
                buf[TCP_SEQ_H_P+2]= ucSeqNum; 
                buf[TCP_SEQ_H_P+3]= 0;
                ucSeqNum+=2;
        }

        buf[TCP_CHECKSUM_H_P]=0;//TCP�ײ�У��ֵ����
        buf[TCP_CHECKSUM_L_P]=0;

        if (mss) //����Ƿ�Ҫ��������Ĵ�С��TCP�ײ����20�ֽڱ�Ϊ24�ֽ�        
{

                buf[TCP_OPTIONS_P]=2;
                buf[TCP_OPTIONS_P+1]=4;
                buf[TCP_OPTIONS_P+2]=0x05; 
                buf[TCP_OPTIONS_P+3]=0x80;
                buf[TCP_HEADER_LEN_P]=0x60;
        }
        else
        {
                buf[TCP_HEADER_LEN_P]=0x50;
        }
}
/******************************************************
*��������: NETPcMakeArpAnswer
*��    ��: buf ���ݰ�������
*��    ��: ��
*˵    ��: ����ARPӦ��
*******************************************************/
void NETPcMakeArpAnswer(UINT8 *buf)
{
        UINT8 i=0;

        NETPcMakeEth(buf);      //������̫���ײ�
        //����ARP������
        buf[ETH_ARP_OPCODE_H_P]=ETH_ARP_OPCODE_REPLY_H_V;
        buf[ETH_ARP_OPCODE_L_P]=ETH_ARP_OPCODE_REPLY_L_V;

        while(i<6)//����MAC��ַ
        {
                buf[ETH_ARP_DST_MAC_P+i]=buf[ETH_ARP_SRC_MAC_P+i];
                buf[ETH_ARP_SRC_MAC_P+i]=acMACAddr[i];
                i++;
        }  
        
        i=0;  
        
        while(i<4)//����IP��ַ
        {
                buf[ETH_ARP_DST_IP_P+i]=buf[ETH_ARP_SRC_IP_P+i];
                buf[ETH_ARP_SRC_IP_P+i]=acIPAddr[i];
                i++;
        }

        NETCiPacketSend(buf,42); //��������
}

/******************************************************
*��������: NETPcMakeEchoReply
*��    ��: buf ���ݰ����� ��len ���ͳ���
*��    ��: ����
*˵    ��: ����ECHOӦ��
*******************************************************/
void NETPcMakeEchoReply(UINT8 *buf,UINT16 len)
{
        NETPcMakeEth(buf);//������̫���ײ�
        NETPcMakeIP(buf); //����IP���ײ�
        
        buf[ICMP_TYPE_P]=ICMP_TYPE_ECHOREPLY_V;//����Ӧ��

        if (buf[ICMP_CHECKSUM_P] > (0xff-0x08))//����У��ֵ
        {
                buf[ICMP_CHECKSUM_P+1]++;
        }

        buf[ICMP_CHECKSUM_P]+=0x08;

        NETCiPacketSend(buf,len);//��������
}   
/******************************************************************
*��������:NETPcMakeUdpReply
*��    ��:buf      ���������緢�͵�����
          sz       Ҫ��ӵ�����
		 datalen��ӵ����ݵĳ���
		 port    �˿�      
*��    ��:��
*˵    ��:���UDPҪӦ�������
*******************************************************************/
void NETPcMakeUdpReply(UINT8 *buf,UINT8 *sz,UINT8 datalen,UINT16 port) 
{
        UINT8 i=0;
        UINT16 ck;
        
        NETPcMakeEth(buf);    //������̫���ײ�
        
        //����IP���ܳ���
        buf[IP_TOTLEN_H_P]=0;
        buf[IP_TOTLEN_L_P]=IP_HEADER_LEN+UDP_HEADER_LEN+datalen;  
        
        NETPcMakeIP(buf);     //����IP��
        
        buf[UDP_DST_PORT_H_P]=port>>8;//UDPĿ��˿ڸ��ֽ�
        buf[UDP_DST_PORT_L_P]=port & 0xff;       //UDPĿ��˿ڵ��ֽ�
        buf[UDP_LEN_H_P]=0;
        buf[UDP_LEN_L_P]=UDP_HEADER_LEN+datalen;//UDP�����ȸ������ֽ�
        buf[UDP_CHECKSUM_H_P]=0;
        buf[UDP_CHECKSUM_L_P]=0;

        while(i<datalen)                   //UDP������
        {
                buf[UDP_DATA_P+i]=sz[i];
                i++;
        }  
       
        ck=NETPcCheckSum(&buf[IP_SRC_P], 16 + datalen,1);//У������
        buf[UDP_CHECKSUM_H_P]=ck>>8;     //У��ֵ���ֽ�
        buf[UDP_CHECKSUM_L_P]=ck& 0xff; //У��ֵ���ֽ�
        //����UDP����
        NETCiPacketSend(buf,UDP_HEADER_LEN+IP_HEADER_LEN+ETH_HEADER_LEN+datalen);
}
/******************************************************
*��������: NETPcMakeTcpSynAck
*��    ��: buf ���ݰ�������
*��    ��: ��
*˵    ��: TCPͬ��Ӧ��
*******************************************************/
void NETPcMakeTcpSynAck(UINT8 *buf)
{
        UINT16 ck;
        NETPcMakeEth(buf);//������̫���ײ�
        // ԭ��20���ֽڵ�TCPͷ��,���ڸ�������MSS��ѡ��,��Ϊ24�ֽ���
        buf[IP_TOTLEN_H_P]=0;
        buf[IP_TOTLEN_L_P]=IP_HEADER_LEN+TCP_HEADER_LEN_PLAIN+4;
        NETPcMakeIP(buf); //����IP���ײ�
        buf[TCP_FLAGS_P]=TCP_FLAGS_SYNACK_V;//ͬ��Ӧ���־
        NETPcMakeTcpHead(buf,1,1,0);//����TCP���ײ�
       
        ck=NETPcCheckSum(&buf[IP_SRC_P], 8+TCP_HEADER_LEN_PLAIN+4,2); //У������
        buf[TCP_CHECKSUM_H_P]=ck>>8;    //У��ֵ���ֽ�
        buf[TCP_CHECKSUM_L_P]=ck& 0xff;//У��ֵ���ֽ�
    //����TCP����
NETCiPacketSend(buf,IP_HEADER_LEN+TCP_HEADER_LEN_PLAIN+4+ETH_HEADER_LEN);
}

/******************************************************
*��������: NETPcGetTcpDataPointer
*��    ��: ��
*��    ��: ��
*˵    ��: TCP���Ƿ�������
*******************************************************/
UINT16 NETPcGetTcpDataPointer(void)
{
        if (usInfoDataLen)
        {
                return((UINT16)TCP_SRC_PORT_H_P+usInfoHdrLen);
        }
        else
        {
                return(0);
        }
}

/******************************************************
*��������: NETPcInitLenInfo
*��    ��: ���ݰ�������
*��    ��: ��
*˵    ��: ��ʼ����Ӧ�ĳ��ȱ���
*******************************************************/
void NETPcInitLenInfo(UINT8 *buf)
{
   usInfoDataLen =(((INT16)buf[IP_TOTLEN_H_P])<<8)|(buf[IP_TOTLEN_L_P]&0xff);
   usInfoDataLen-=IP_HEADER_LEN;
   usInfoHdrLen  =(buf[TCP_HEADER_LEN_P]>>4)*4; 
   usInfoDataLen-=usInfoHdrLen;  
        
   if (usInfoDataLen<=0)
   {
        usInfoDataLen=0;
   }
}
/******************************************************
*��������: NETPcMakeTcpAck
*��    ��: buf  ���������緢�͵�����
           bfin �����Ƿ������Ͽ�����
*��    ��: ��
*˵    ��: ���TCPӦ����Ϣ
*******************************************************/
void NETPcMakeTcpAck(UINT8 *buf,BOOL bfin)
{
        UINT16 j;
		
        NETPcMakeEth(buf);//������̫���ײ�
     
        buf[TCP_FLAGS_P]=TCP_FLAGS_ACK_V;//TCPӦ��
		
	  //����һ��Ҫ����TCP_FLAGS_FIN_V���ж�TCP����
	  //���򵱿ͻ�������Ͽ�����ʱ,��������Щͷ��λʶ��,������ö˿��޷��ͷ�.
	   if(bfin) buf[TCP_FLAGS_P]|=TCP_FLAGS_RST_V|TCP_FLAGS_FIN_V;
         
        if (usInfoDataLen==0)//���ݳ����Ƿ�Ϊ0
        {
                NETPcMakeTcpHead(buf,1,0,1);              //����TCP�ײ�
        }
        else
        {
                NETPcMakeTcpHead(buf,usInfoDataLen,0,1);//����TCP�ײ�
        }


        j=IP_HEADER_LEN+TCP_HEADER_LEN_PLAIN; //IP���ײ����ȡ�TCP���ײ�
        
        buf[IP_TOTLEN_H_P]=j>>8;     //IP���ݰ��ܳ��ȸ��ֽ�
        buf[IP_TOTLEN_L_P]=j& 0xff; //IP���ݰ��ܳ��ȵ��ֽ�
        
        NETPcMakeIP(buf);//����IP��

        j=NETPcCheckSum(&buf[IP_SRC_P], 8+TCP_HEADER_LEN_PLAIN,2);//У������

        buf[TCP_CHECKSUM_H_P]=j>>8;    //У��ֵ���ֽ�
        buf[TCP_CHECKSUM_L_P]=j& 0xff;//У��ֵ���ֽ�
      //��������
NETCiPacketSend(buf,IP_HEADER_LEN+TCP_HEADER_LEN_PLAIN+ETH_HEADER_LEN);
}  
/******************************************************
*��������: NETPcMakeTcpAckWithData
*��    ��: buf ���ݰ���������dlen ���ݳ���
*��    ��: ��
*˵    ��: ����TCP����
*******************************************************/
void NETPcMakeTcpAckWithData(UINT8 *buf,UINT16 dlen)
{
        UINT16 j;
		
	   buf[TCP_FLAGS_P]=TCP_FLAGS_ACK_V|TCP_FLAGS_PUSH_V;//Ӧ���־�ͷ������ݱ�־
	
        j=IP_HEADER_LEN+TCP_HEADER_LEN_PLAIN+dlen;//���ݳ���

        buf[IP_TOTLEN_H_P]=j>>8;     //IP���ݰ��ײ��ܳ��ȸ��ֽ�
        buf[IP_TOTLEN_L_P]=j& 0xff; //IP���ݰ��ײ��ܳ��ȵ��ֽ�

        NETPcFillIPHdrChkSum(buf);   //IP���ݰ��ײ�У��

        buf[TCP_CHECKSUM_H_P]=0;      //TCP�ײ�У��ֵ����
        buf[TCP_CHECKSUM_L_P]=0;
        
        //У������
        j=NETPcCheckSum(&buf[IP_SRC_P], 8+TCP_HEADER_LEN_PLAIN+dlen,2);

        buf[TCP_CHECKSUM_H_P]=j>>8;      //У��ֵ���ֽ�
        buf[TCP_CHECKSUM_L_P]=j& 0xff;   //У��ֵ���ֽ�
 //����TCP����
NETCiPacketSend(buf,IP_HEADER_LEN+TCP_HEADER_LEN_PLAIN+dlen+ETH_HEADER_LEN);
}



