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
#include "NETApplication.h"

/****************************************************************************************************
*
*                                      变量区
* 
*****************************************************************************************************/
static XDATA NET_PACKET Packet;

/****************************************************************************************************
*
*                                      函数区
* 
*****************************************************************************************************/

/******************************************************************
*函数名称:NETApDisposeData(void)
*输    入:无
*输    出:无
*说    明:NET 应用程序处理数据
*******************************************************************/
void NETApDisposeData(void)
{
	UINT16 usnetRecvLen=0;//声明网络接收长度变量
	UINT8  ucdatP      =0; //声明网络数据包中数据的位置变量

	SYSPostCurMsg(RUN_NET_DISPOSE_DATA);//查询法,设置当前任务
	
    //查询是否接收到数据
	usnetRecvLen=NETCiPacketReceive(Packet.p,MAX_FRAME_LEN);
	
	if(!usnetRecvLen) //接收长度为0
	{
		return;        //函数返回
	}
	
     //校验ARP和IP
	if(NETPcEthIsArpAndMyIp(Packet.p,usnetRecvLen))
	{
		NETPcMakeArpAnswer(Packet.p);//ARP应答
		
		return; //函数返回
	}
	
//校验IP
	if(!(NETPcEthIsIpAndMyIp(Packet.p,usnetRecvLen)))
	{
		return; //函数返回
	}
/*
	控制报文协议:ICMP --------------------------------------    ICMP片段
*/	
    //检测是否ICMP（控制报文协议）
	if(IP_PROTO_ICMP_V           == Packet.icmp.ip.protocal\
	 &&ICMP_TYPE_ECHOREQUEST_V  == Packet.icmp.type )
	{
            NETPcMakeEchoReply(Packet.p,usnetRecvLen);  //应答
            return;		                                    //函数返回
	}
/*
	传输控制协议:TCP--------------------------------------     TCP片段
*/	
//检测是否TCP（传输控制协议）
    if(IP_PROTO_TCP_V ==      Packet.tcp.ip.protocal \
	&& TCP_PORT       ==NSTOH(Packet.tcp.destport))
	{
		if(Packet.p[TCP_FLAGS_P] & TCP_FLAGS_SYN_V)//检测到新连接
		{
			NETPcMakeTcpSynAck(Packet.p);//发送同步应答信息
			return;//函数返回
		}		
		if(Packet.p[TCP_FLAGS_P] & TCP_FLAGS_ACK_V)//检测到请求端的应答
		{
			NETPcInitLenInfo(Packet.p);//初始化关于网络用到的长度变量
			
			ucdatP=NETPcGetTcpDataPointer();//返回数据位置
			
			if(!ucdatP)//检测不是请求数据的
			{
				if(Packet.p[TCP_FLAGS_P] & TCP_FLAGS_FIN_V)//检测到终止连接
				{      
                       NETPcMakeTcpAck(Packet.p,1); //发送终止应答
									  
				}
				
				return;//函数返回
			}

			NETPcMakeTcpAck(Packet.p,0);//对请求端发送应答信息
			//54=EthHead+IPHead+TCPHead
              //对请求端发送数据
            
			NETPcMakeTcpAckWithData(Packet.p,usnetRecvLen-54);
		}
	}  
/*
	用户数据包协议:UDP--------------------------------------     UDP片段
*/		
 //检测是否UDP（用户数据包协议）
	if(IP_PROTO_UDP_V ==       Packet.udp.ip.protocal \
	 &&UDP_PORT       == NSTOH(Packet.udp.destport))
	{
            //UDP发送数据
           //42=EthHead+IPHead+UDPHead
            NETPcMakeUdpReply(Packet.p,
			                 &Packet.p[UDP_DATA_P],
				              usnetRecvLen-42,
							  UDP_PORT);	
	}
}

