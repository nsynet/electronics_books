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
#include "NETApplication.h"

/****************************************************************************************************
*
*                                      ������
* 
*****************************************************************************************************/
static XDATA NET_PACKET Packet;

/****************************************************************************************************
*
*                                      ������
* 
*****************************************************************************************************/

/******************************************************************
*��������:NETApDisposeData(void)
*��    ��:��
*��    ��:��
*˵    ��:NET Ӧ�ó���������
*******************************************************************/
void NETApDisposeData(void)
{
	UINT16 usnetRecvLen=0;//����������ճ��ȱ���
	UINT8  ucdatP      =0; //�����������ݰ������ݵ�λ�ñ���

	SYSPostCurMsg(RUN_NET_DISPOSE_DATA);//��ѯ��,���õ�ǰ����
	
    //��ѯ�Ƿ���յ�����
	usnetRecvLen=NETCiPacketReceive(Packet.p,MAX_FRAME_LEN);
	
	if(!usnetRecvLen) //���ճ���Ϊ0
	{
		return;        //��������
	}
	
     //У��ARP��IP
	if(NETPcEthIsArpAndMyIp(Packet.p,usnetRecvLen))
	{
		NETPcMakeArpAnswer(Packet.p);//ARPӦ��
		
		return; //��������
	}
	
//У��IP
	if(!(NETPcEthIsIpAndMyIp(Packet.p,usnetRecvLen)))
	{
		return; //��������
	}
/*
	���Ʊ���Э��:ICMP --------------------------------------    ICMPƬ��
*/	
    //����Ƿ�ICMP�����Ʊ���Э�飩
	if(IP_PROTO_ICMP_V           == Packet.icmp.ip.protocal\
	 &&ICMP_TYPE_ECHOREQUEST_V  == Packet.icmp.type )
	{
            NETPcMakeEchoReply(Packet.p,usnetRecvLen);  //Ӧ��
            return;		                                    //��������
	}
/*
	�������Э��:TCP--------------------------------------     TCPƬ��
*/	
//����Ƿ�TCP���������Э�飩
    if(IP_PROTO_TCP_V ==      Packet.tcp.ip.protocal \
	&& TCP_PORT       ==NSTOH(Packet.tcp.destport))
	{
		if(Packet.p[TCP_FLAGS_P] & TCP_FLAGS_SYN_V)//��⵽������
		{
			NETPcMakeTcpSynAck(Packet.p);//����ͬ��Ӧ����Ϣ
			return;//��������
		}		
		if(Packet.p[TCP_FLAGS_P] & TCP_FLAGS_ACK_V)//��⵽����˵�Ӧ��
		{
			NETPcInitLenInfo(Packet.p);//��ʼ�����������õ��ĳ��ȱ���
			
			ucdatP=NETPcGetTcpDataPointer();//��������λ��
			
			if(!ucdatP)//��ⲻ���������ݵ�
			{
				if(Packet.p[TCP_FLAGS_P] & TCP_FLAGS_FIN_V)//��⵽��ֹ����
				{      
                       NETPcMakeTcpAck(Packet.p,1); //������ֹӦ��
									  
				}
				
				return;//��������
			}

			NETPcMakeTcpAck(Packet.p,0);//������˷���Ӧ����Ϣ
			//54=EthHead+IPHead+TCPHead
              //������˷�������
            
			NETPcMakeTcpAckWithData(Packet.p,usnetRecvLen-54);
		}
	}  
/*
	�û����ݰ�Э��:UDP--------------------------------------     UDPƬ��
*/		
 //����Ƿ�UDP���û����ݰ�Э�飩
	if(IP_PROTO_UDP_V ==       Packet.udp.ip.protocal \
	 &&UDP_PORT       == NSTOH(Packet.udp.destport))
	{
            //UDP��������
           //42=EthHead+IPHead+UDPHead
            NETPcMakeUdpReply(Packet.p,
			                 &Packet.p[UDP_DATA_P],
				              usnetRecvLen-42,
							  UDP_PORT);	
	}
}

