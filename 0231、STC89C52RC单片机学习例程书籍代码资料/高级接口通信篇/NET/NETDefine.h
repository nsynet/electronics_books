/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */
#ifndef __NETDEFINE_H__
#define __NETDEFINE_H__

#include "ENCReg.h"

// ******* ETH *******
#define ETH_HEADER_LEN	14
// values of certain bytes:
#define ETHTYPE_ARP_H_V 0x08
#define ETHTYPE_ARP_L_V 0x06
#define ETHTYPE_IP_H_V  0x08
#define ETHTYPE_IP_L_V  0x00
// byte positions in the ethernet frame:
//
// Ethernet type field (2bytes):
#define ETH_TYPE_H_P 12
#define ETH_TYPE_L_P 13
//
#define ETH_DST_MAC 0
#define ETH_SRC_MAC 6


// ******* ARP *******
#define ETH_ARP_OPCODE_REPLY_H_V 0x0
#define ETH_ARP_OPCODE_REPLY_L_V 0x02
//
//#define ETHTYPE_ARP_L_V 0x06
// arp.dst.ip
//#define ETH_ARP_DST_IP_P 0x26
// arp.opcode
#define ETH_ARP_OPCODE_H_P 0x14
#define ETH_ARP_OPCODE_L_P 0x15
// arp.src.mac
#define ETH_ARP_SRC_MAC_P 0x16
#define ETH_ARP_SRC_IP_P 0x1c
#define ETH_ARP_DST_MAC_P 0x20
#define ETH_ARP_DST_IP_P 0x26

// ******* IP *******
#define IP_HEADER_LEN	20
// ip.src
#define IP_SRC_P 0x1a
#define IP_DST_P 0x1e
#define IP_HEADER_LEN_VER_P 0xe
#define IP_CHECKSUM_P 0x18
#define IP_TTL_P 0x16
#define IP_FLAGS_P 0x14
#define IP_P 0xe
#define IP_TOTLEN_H_P 0x10
#define IP_TOTLEN_L_P 0x11

#define IP_PROTO_P 0x17  

#define IP_PROTO_ICMP_V 1
#define IP_PROTO_TCP_V 6
// 17=0x11
#define IP_PROTO_UDP_V 17
// ******* ICMP *******
#define ICMP_TYPE_ECHOREPLY_V 0
#define ICMP_TYPE_ECHOREQUEST_V 8
//
#define ICMP_TYPE_P 0x22
#define ICMP_CHECKSUM_P 0x24

// ******* UDP *******
#define UDP_HEADER_LEN	8
//
#define UDP_SRC_PORT_H_P 0x22
#define UDP_SRC_PORT_L_P 0x23
#define UDP_DST_PORT_H_P 0x24
#define UDP_DST_PORT_L_P 0x25
//
#define UDP_LEN_H_P 0x26
#define UDP_LEN_L_P 0x27
#define UDP_CHECKSUM_H_P 0x28
#define UDP_CHECKSUM_L_P 0x29
#define UDP_DATA_P 0x2a

// ******* TCP *******
#define TCP_SRC_PORT_H_P 0x22
#define TCP_SRC_PORT_L_P 0x23
#define TCP_DST_PORT_H_P 0x24
#define TCP_DST_PORT_L_P 0x25
// the tcp seq number is 4 bytes 0x26-0x29
#define TCP_SEQ_H_P 0x26
#define TCP_SEQACK_H_P 0x2a
// flags: SYN=2
#define TCP_FLAGS_P 0x2f
#define TCP_FLAGS_SYN_V 2
#define TCP_FLAGS_FIN_V 1
#define TCP_FLAGS_RST_V 4
#define TCP_FLAGS_PUSH_V 8
#define TCP_FLAGS_SYNACK_V 0x12
#define TCP_FLAGS_ACK_V 0x10
#define TCP_FLAGS_PSHACK_V 0x18
//  plain len without the options:
#define TCP_HEADER_LEN_PLAIN 20
#define TCP_HEADER_LEN_P 0x2e
#define TCP_CHECKSUM_H_P 0x32
#define TCP_CHECKSUM_L_P 0x33
#define TCP_OPTIONS_P 0x36
/*****************************************************************************
*
*                        可用用到的宏
*
******************************************************************************/

#define	MAX_FRAME_LEN	 254
#define ETH_HEAD_LEN     14
#define IP_HEAD_LEN      20 	
#define TCP_HEAD_LEN     20
#define UDP_HEAD_LEN     8
#define ICMP_HEAD_LEN    8

#define TCP_BUF_LEN      MAX_FRAME_LEN-ETH_HEAD_LEN-IP_HEAD_LEN-TCP_HEAD_LEN
#define UDP_BUF_LEN      MAX_FRAME_LEN-ETH_HEAD_LEN-IP_HEAD_LEN-UDP_HEAD_LEN
#define ICMP_BUF_LEN     MAX_FRAME_LEN-ETH_HEAD_LEN-IP_HEAD_LEN-ICMP_HEAD_LEN

#define ETHERNET_MIN_PACKET_LENGTH	0x3C

#define EN_NET_HTTP      (0)


#define TCP_PORT 80
#define UDP_PORT 2222

#ifdef __CAVR__
#define NSTOH(x) ((((UINT16)(x))<<8)|(((UINT16)(x))>>8))
#define HTONS(x) ((((UINT16)(x))<<8)|(((UINT16)(x))>>8)) 
#endif

#ifdef __C51__
#define NSTOH(x) (x)
#define HTONS(x) (x) 
#endif 
/*****************************************************************************
*
*                        可用用到的新类型
*
******************************************************************************/
//以太网首部14个字节
typedef struct _ETH_HEAD
{
	UINT8  destid[6];
	UINT8  srcid[6];
	UINT16 protocal;
}ETH_HEAD;
//IP首部20个字节
typedef struct _IP_HEAD
{
	UINT8	verandheadlen;		//版本与头长度
	UINT8	typeofserver;		//服务类型
	UINT16	totallength;	    //总长度
	UINT16	frameindex;		    //IP帧序号
	UINT16	segment;			//分段标志
	UINT8	ttl;			    //生存时间
	UINT8	protocal;			//下一层协议
	UINT16	crc;				//校验和
	UINT8	srcip[4];	        //源IP
	UINT8	destip[4];			//目的IP	
}IP_HEAD;

//TCP首部20个字节+数据
typedef struct _TCP
{
	ETH_HEAD eth;
	IP_HEAD  ip;
	//-------------------
	UINT16	srcport;			//源端口
	UINT16	destport;			//目的端口
	UINT16	seqnumH;		    //顺序号
	UINT16	seqnumL;
	UINT16	acknumH;
	UINT16	acknumL;		    //确认号
	UINT8	offset;				//数据偏移量
	UINT8	ctrl;		        //连接控制
	UINT16	window;			    //流控
	UINT16	crc;				//校验和 ，包括伪头部，TCP头部，数据
	UINT16	urg;				//紧急指针
	UINT8	tcpbuf[TCP_BUF_LEN];		//TCP数据

}TCP;
//UDP首部20个字节+数据
typedef struct _UDP
{	
    ETH_HEAD eth;
	IP_HEAD  ip;
	//-------------------
	UINT16	srcport;		//源端口
	UINT16	destport;		//目的端口
	UINT16	length;    
	UINT16	crc;			//校验和 ，包括伪头部，udp头部，数据
	UINT8	udpbuf[UDP_BUF_LEN];	//udp数据
}UDP;

typedef struct _ARP
{
	ETH_HEAD eth;
//arp报文的内容总长28字节
	UINT16	hardware;		    //以太网为0x0001
	UINT16	protocal;	       	//ip 为0X0800
	UINT8	halength;			//=0X06
	UINT8	palength;			//=0X04
	UINT16	opt;			    //操作  0X0001为请求 0X0002为应答 0X0003为反向地址请求 0X0004为反向地址应答
	UINT8	srcid[6];		    //源网卡地址
	UINT8	srcip[4];			//源IP地址
	UINT8	destid[6];		    //目的网卡地址
	UINT8	destip[4];			//目的IP地址
}ARP;

typedef struct _ICMP
{						
    ETH_HEAD eth;
	IP_HEAD  ip;
	UINT8	 type;				//0X08 PING请求 0X00 PING应答
	UINT8	 option;			//0X00 PING
	UINT16	 crc;      
	UINT16	 id;
	UINT16	 seq;
	UINT8	 icmpbuf[ICMP_BUF_LEN];
}ICMP;


typedef union _NET_PACKET
{
	struct
	{
		ETH_HEAD eth;
		IP_HEAD  ip;
    }head;

	UDP  udp;
	TCP  tcp;
	ARP  arp;
	ICMP icmp;
	
	UINT8 p[MAX_FRAME_LEN];

}NET_PACKET;



#endif
