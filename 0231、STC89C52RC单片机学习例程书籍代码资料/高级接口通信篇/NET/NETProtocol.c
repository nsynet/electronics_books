/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */
#include "Board.h" 
#include "Global.h"
#include "NETDefine.h"
#include "NETInterface.h"
#include "NETProtocol.h"
/****************************************************************************************************
*
*                                      变量区
* 
*****************************************************************************************************/
static UINT16 usTCPPort    =TCP_PORT; //TCP端口
static UINT8  acMACAddr[6] ={0};      //MAC地址
static UINT8  acIPAddr[4]  ={0};      //IP地址
static UINT16 usInfoHdrLen = 0 ;      //设备数据长度
static UINT16 usInfoDataLen= 0 ;      //数据长度
static UINT8  ucSeqNum     =0xa;      //TCP请求
/****************************************************************************************************
*
*                                      函数区
* 
*****************************************************************************************************/
/******************************************************************
*函数名称:NETPcCheckSum
*输    入:buf  数据
          len  长度
          type 协议类型 
*输    出:UINT16 数据
*说    明:校验和
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
                sum+=len-8; // 获取UDP的真实长度
        }

        if(type==2)//TCP
        {
                sum+=IP_PROTO_TCP_V; 
                sum+=len-8; // 获取TCP的真实长度
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
*函数名称: NETPcInit
*输    入: mac地址 IP地址 端口
*输    出: 无
*说    明: 网络 初始化
*******************************************************/
void NETPcInit(UINT8 *mymac,UINT8 *myip,UINT16 port)
{
        UINT8 i=0;
        usTCPPort=port;              //保存TCP端口
        
        while(i<4)
        {

			  acIPAddr[i]=myip[i];//保存本地IP地址

                i++;
        }  
        
        i=0;         
        
        while(i<6)
        {
			  acMACAddr[i]=mymac[i];//保存本地MAC地址

                i++;
        }
}
/******************************************************
*函数名称: NETPcEthIsArpAndMyIp
*输    入: buf 数据包缓冲区；len 数据长度
*输    出: 0/1
*说    明: 检查数据包ARP是否匹配、IP是否匹配
*******************************************************/
UINT8 NETPcEthIsArpAndMyIp(UINT8 *buf,UINT16 len)
{
        UINT8 i=0;

        if (len<41)              //检测长度不符合，即以太网首部+IP首部+ARP首部
        {
                return(0);
        }     
        
        if(buf[ETH_TYPE_H_P] != ETHTYPE_ARP_H_V || 
           buf[ETH_TYPE_L_P] != ETHTYPE_ARP_L_V)           //检测以太网类型是否符合
        {
                return(0);
        }
        while(i<4)
        {
                if(buf[ETH_ARP_DST_IP_P+i] != acIPAddr[i])//检测IP地址是否符合
                {
                        return(0);
                }   
                
                i++;
        }  
        
        return(1);
}  
/******************************************************
*函数名称: NETPcEthIsIpAndMyIp
*输    入: packet 数据包缓冲区；len 数据长度
*输    出: 0/1
*说    明: 检查以太网类型、IP版本、IP地址是否符合
*******************************************************/
UINT8 NETPcEthIsIpAndMyIp(UINT8 *buf,UINT16 len)
{
        UINT8 i=0;
 
        if (len<42)                               //检测长度是否不符合
        {
                return(0);
        }   
        
        if(buf[ETH_TYPE_H_P]!=ETHTYPE_IP_H_V || 
           buf[ETH_TYPE_L_P]!=ETHTYPE_IP_L_V) //检测以太网类型是否符合
        {
                return(0);
        }
        
        if (buf[IP_HEADER_LEN_VER_P]!=0x45)    //检查IP版本是否IPV4
        {
                return(0);
        }    
        
        while(i<4)
        {
                if(buf[IP_DST_P+i]!=acIPAddr[i])//检查IP地址是否符合
                {
                        return(0);
                }  
                
                i++;
        }
        return(1);
}
/******************************************************
*函数名称: NETPcMakeEth
*输    入: buf 数据包缓冲区
*输    出: 无
*说    明: 建立以太网首部
*******************************************************/
void NETPcMakeEth(UINT8 *buf)
{
        UINT8 i=0;
        while(i<6)             //建立以太网首部，获取MAC地址
        {
                buf[ETH_DST_MAC +i]=buf[ETH_SRC_MAC +i];
                buf[ETH_SRC_MAC +i]=acMACAddr[i];
                i++;
        }
}
/******************************************************
*函数名称: NETPcFillIPHdrChkSum
*输    入: buf 数据包缓冲区
*输    出: 无
*说    明: 填充IP包校验和
*******************************************************/
void NETPcFillIPHdrChkSum(UINT8 *buf)
{
        UINT16 ck;

        buf[IP_CHECKSUM_P]=0;    //校验值低字节清零
        buf[IP_CHECKSUM_P+1]=0;  //校验值高字节清零
        buf[IP_FLAGS_P]=0x40;    //分段标志低字节设为0x40
        buf[IP_FLAGS_P+1]=0;     //分段标志高字节设为0x00
        buf[IP_TTL_P]=64;         //生存时间为64ms

        ck=NETPcCheckSum(&buf[IP_P], IP_HEADER_LEN,0);//校验IP首部

        buf[IP_CHECKSUM_P]=ck>>8;       //校验值低字节
        buf[IP_CHECKSUM_P+1]=ck& 0xff; //校验值高字节
}
/******************************************************
*函数名称: NETPcMakeIP
*输    入: buf数据包缓冲区
*输    出: 无
*说    明: 建立IP首部
*******************************************************/
void NETPcMakeIP(UINT8 *buf)
{
        UINT8 i=0;
        
        while(i<4) //建立IP首部，获取IP地址
        {
                buf[IP_DST_P+i]=buf[IP_SRC_P+i];
                buf[IP_SRC_P+i]=acIPAddr[i];
                i++;
        }  
        
        NETPcFillIPHdrChkSum(buf);
}
/******************************************************
*函数名称: NETPcMakeTcpHead
*输    入: buf数据包缓冲区
           rel_ack_num 确认号
		   mss 是否设置最大报文大小
		   cp_seq 是否设置序号
*输    出: 无
*说    明: 建立TCP首部
*******************************************************/
void NETPcMakeTcpHead(UINT8 *buf,UINT16 rel_ack_num,UINT8 mss,UINT8 cp_seq)
{
        UINT8 i=0;
        UINT8 tseq; 
        
        while(i<2)                               //获取源端口
        {
                buf[TCP_DST_PORT_H_P+i]=buf[TCP_SRC_PORT_H_P+i];
                buf[TCP_SRC_PORT_H_P+i]=0;
                i++;
        }

	   buf[TCP_SRC_PORT_H_P]=(usTCPPort>>8)&0xFF;//重新获取TCP端口
        buf[TCP_SRC_PORT_L_P]= usTCPPort    &0xFF;

        i=4;

        while(i>0) //设置32位序号和32位确认号
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

        if (cp_seq==0)                 //检测请求序号是否为0
        {       //TCP_SEQ_H_P顺序号
                buf[TCP_SEQ_H_P+0]= 0;
                buf[TCP_SEQ_H_P+1]= 0;
                buf[TCP_SEQ_H_P+2]= ucSeqNum; 
                buf[TCP_SEQ_H_P+3]= 0;
                ucSeqNum+=2;
        }

        buf[TCP_CHECKSUM_H_P]=0;//TCP首部校验值清零
        buf[TCP_CHECKSUM_L_P]=0;

        if (mss) //检查是否要设置最长报文大小，TCP首部会从20字节变为24字节        
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
*函数名称: NETPcMakeArpAnswer
*输    入: buf 数据包缓冲区
*输    出: 无
*说    明: 网络ARP应答
*******************************************************/
void NETPcMakeArpAnswer(UINT8 *buf)
{
        UINT8 i=0;

        NETPcMakeEth(buf);      //建立以太网首部
        //设置ARP操作码
        buf[ETH_ARP_OPCODE_H_P]=ETH_ARP_OPCODE_REPLY_H_V;
        buf[ETH_ARP_OPCODE_L_P]=ETH_ARP_OPCODE_REPLY_L_V;

        while(i<6)//设置MAC地址
        {
                buf[ETH_ARP_DST_MAC_P+i]=buf[ETH_ARP_SRC_MAC_P+i];
                buf[ETH_ARP_SRC_MAC_P+i]=acMACAddr[i];
                i++;
        }  
        
        i=0;  
        
        while(i<4)//设置IP地址
        {
                buf[ETH_ARP_DST_IP_P+i]=buf[ETH_ARP_SRC_IP_P+i];
                buf[ETH_ARP_SRC_IP_P+i]=acIPAddr[i];
                i++;
        }

        NETCiPacketSend(buf,42); //发送数据
}

/******************************************************
*函数名称: NETPcMakeEchoReply
*输    入: buf 数据包缓冲 ，len 发送长度
*输    出: 长度
*说    明: 网络ECHO应答
*******************************************************/
void NETPcMakeEchoReply(UINT8 *buf,UINT16 len)
{
        NETPcMakeEth(buf);//建立以太网首部
        NETPcMakeIP(buf); //建立IP包首部
        
        buf[ICMP_TYPE_P]=ICMP_TYPE_ECHOREPLY_V;//设置应答

        if (buf[ICMP_CHECKSUM_P] > (0xff-0x08))//设置校验值
        {
                buf[ICMP_CHECKSUM_P+1]++;
        }

        buf[ICMP_CHECKSUM_P]+=0x08;

        NETCiPacketSend(buf,len);//发送数据
}   
/******************************************************************
*函数名称:NETPcMakeUdpReply
*输    入:buf      本机向网络发送的数据
          sz       要添加的数据
		 datalen添加的数据的长度
		 port    端口      
*输    出:无
*说    明:填充UDP要应答的数据
*******************************************************************/
void NETPcMakeUdpReply(UINT8 *buf,UINT8 *sz,UINT8 datalen,UINT16 port) 
{
        UINT8 i=0;
        UINT16 ck;
        
        NETPcMakeEth(buf);    //建立以太网首部
        
        //设置IP包总长度
        buf[IP_TOTLEN_H_P]=0;
        buf[IP_TOTLEN_L_P]=IP_HEADER_LEN+UDP_HEADER_LEN+datalen;  
        
        NETPcMakeIP(buf);     //建立IP包
        
        buf[UDP_DST_PORT_H_P]=port>>8;//UDP目标端口高字节
        buf[UDP_DST_PORT_L_P]=port & 0xff;       //UDP目标端口低字节
        buf[UDP_LEN_H_P]=0;
        buf[UDP_LEN_L_P]=UDP_HEADER_LEN+datalen;//UDP包长度赋给低字节
        buf[UDP_CHECKSUM_H_P]=0;
        buf[UDP_CHECKSUM_L_P]=0;

        while(i<datalen)                   //UDP包数据
        {
                buf[UDP_DATA_P+i]=sz[i];
                i++;
        }  
       
        ck=NETPcCheckSum(&buf[IP_SRC_P], 16 + datalen,1);//校验数据
        buf[UDP_CHECKSUM_H_P]=ck>>8;     //校验值高字节
        buf[UDP_CHECKSUM_L_P]=ck& 0xff; //校验值低字节
        //发送UDP数据
        NETCiPacketSend(buf,UDP_HEADER_LEN+IP_HEADER_LEN+ETH_HEADER_LEN+datalen);
}
/******************************************************
*函数名称: NETPcMakeTcpSynAck
*输    入: buf 数据包缓冲区
*输    出: 无
*说    明: TCP同步应答
*******************************************************/
void NETPcMakeTcpSynAck(UINT8 *buf)
{
        UINT16 ck;
        NETPcMakeEth(buf);//建立以太网首部
        // 原本20个字节的TCP头部,现在附加上了MSS的选项,变为24字节了
        buf[IP_TOTLEN_H_P]=0;
        buf[IP_TOTLEN_L_P]=IP_HEADER_LEN+TCP_HEADER_LEN_PLAIN+4;
        NETPcMakeIP(buf); //建立IP包首部
        buf[TCP_FLAGS_P]=TCP_FLAGS_SYNACK_V;//同步应答标志
        NETPcMakeTcpHead(buf,1,1,0);//建立TCP包首部
       
        ck=NETPcCheckSum(&buf[IP_SRC_P], 8+TCP_HEADER_LEN_PLAIN+4,2); //校验数据
        buf[TCP_CHECKSUM_H_P]=ck>>8;    //校验值高字节
        buf[TCP_CHECKSUM_L_P]=ck& 0xff;//校验值低字节
    //发送TCP数据
NETCiPacketSend(buf,IP_HEADER_LEN+TCP_HEADER_LEN_PLAIN+4+ETH_HEADER_LEN);
}

/******************************************************
*函数名称: NETPcGetTcpDataPointer
*输    入: 无
*输    出: 无
*说    明: TCP包是否还有数据
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
*函数名称: NETPcInitLenInfo
*输    入: 数据包缓冲区
*输    出: 无
*说    明: 初始化响应的长度变量
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
*函数名称: NETPcMakeTcpAck
*输    入: buf  本机向网络发送的数据
           bfin 本机是否主动断开链接
*输    出: 无
*说    明: 填充TCP应答信息
*******************************************************/
void NETPcMakeTcpAck(UINT8 *buf,BOOL bfin)
{
        UINT16 j;
		
        NETPcMakeEth(buf);//建立以太网首部
     
        buf[TCP_FLAGS_P]=TCP_FLAGS_ACK_V;//TCP应答
		
	  //这里一定要加上TCP_FLAGS_FIN_V来中断TCP连接
	  //否则当客户端请求断开连接时,不加上这些头部位识别,会产生该端口无法释放.
	   if(bfin) buf[TCP_FLAGS_P]|=TCP_FLAGS_RST_V|TCP_FLAGS_FIN_V;
         
        if (usInfoDataLen==0)//数据长度是否为0
        {
                NETPcMakeTcpHead(buf,1,0,1);              //建立TCP首部
        }
        else
        {
                NETPcMakeTcpHead(buf,usInfoDataLen,0,1);//建立TCP首部
        }


        j=IP_HEADER_LEN+TCP_HEADER_LEN_PLAIN; //IP包首部长度、TCP包首部
        
        buf[IP_TOTLEN_H_P]=j>>8;     //IP数据包总长度高字节
        buf[IP_TOTLEN_L_P]=j& 0xff; //IP数据包总长度低字节
        
        NETPcMakeIP(buf);//建立IP包

        j=NETPcCheckSum(&buf[IP_SRC_P], 8+TCP_HEADER_LEN_PLAIN,2);//校验数据

        buf[TCP_CHECKSUM_H_P]=j>>8;    //校验值高字节
        buf[TCP_CHECKSUM_L_P]=j& 0xff;//校验值低字节
      //发送数据
NETCiPacketSend(buf,IP_HEADER_LEN+TCP_HEADER_LEN_PLAIN+ETH_HEADER_LEN);
}  
/******************************************************
*函数名称: NETPcMakeTcpAckWithData
*输    入: buf 数据包缓冲区，dlen 数据长度
*输    出: 无
*说    明: 发送TCP数据
*******************************************************/
void NETPcMakeTcpAckWithData(UINT8 *buf,UINT16 dlen)
{
        UINT16 j;
		
	   buf[TCP_FLAGS_P]=TCP_FLAGS_ACK_V|TCP_FLAGS_PUSH_V;//应答标志和发送数据标志
	
        j=IP_HEADER_LEN+TCP_HEADER_LEN_PLAIN+dlen;//数据长度

        buf[IP_TOTLEN_H_P]=j>>8;     //IP数据包首部总长度高字节
        buf[IP_TOTLEN_L_P]=j& 0xff; //IP数据包首部总长度低字节

        NETPcFillIPHdrChkSum(buf);   //IP数据包首部校验

        buf[TCP_CHECKSUM_H_P]=0;      //TCP首部校验值清零
        buf[TCP_CHECKSUM_L_P]=0;
        
        //校验数据
        j=NETPcCheckSum(&buf[IP_SRC_P], 8+TCP_HEADER_LEN_PLAIN+dlen,2);

        buf[TCP_CHECKSUM_H_P]=j>>8;      //校验值高字节
        buf[TCP_CHECKSUM_L_P]=j& 0xff;   //校验值低字节
 //发送TCP数据
NETCiPacketSend(buf,IP_HEADER_LEN+TCP_HEADER_LEN_PLAIN+dlen+ETH_HEADER_LEN);
}



