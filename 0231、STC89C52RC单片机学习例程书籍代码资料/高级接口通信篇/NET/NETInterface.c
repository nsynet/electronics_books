/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */
#include "Board.h" 
#include "Global.h"
#include "NETDefine.h" 
#include "NETHardware.h"
#include "NETInterface.h"


/****************************************************************************************************
*
*                                      变量区
* 
*****************************************************************************************************/
static  DATA UINT8   Enc28j60Bank =0;
static IDATA UINT16  NextPacketPtr=0;
/****************************************************************************************************
*
*                                      函数区
* 
*****************************************************************************************************/
/*
						               函数声明
*/

/******************************************************
*函数名称: SPISend
*输    入: 单个字节 d
*输    出: 无
*说    明: SPI发送单个字节
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
*函数名称: SPIRecv
*输    入: 无
*输    出: 单个字节
*说    明: SPI 接收单个字节
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
*函数名称: NETCiWriteOp
*输    入: op 操作码,addr 地址, dat 数据
*输    出:无
*说    明: 网络 写控制寄存器
*******************************************************/
void NETCiWriteOp(UINT8 op,UINT8 addr,UINT8 dat)
{
	CS=0;                                     //选通ENC28J60

	SPISend(op | (addr & ADDR_MASK));   //SPI指令集：写控制寄存器
	SPISend(dat);                           //SPI 发送数据

	CS=1;                                     //禁止ENC28J60
}
/******************************************************
*函数名称: NETCiReadOp
*输    入: op 操作码,addr 地址
*输    出: 数据
*说    明: 网络 读控制寄存器
*******************************************************/
UINT8 NETCiReadOp (UINT8 op,UINT8 addr)
{
  	UINT8 d;
   
	CS=0;                                     //选通ENC28J60

	SPISend(op | (addr & ADDR_MASK));   //SPI指令：读控制寄存器
	
	d=SPIRecv();                            //读数据

	if(addr & 0x80)                         //若addr最高位为1
	{
		d=SPIRecv();                        //读数据
	}

	CS=1;                                     //禁止ENC28J60

	return d;                                //返回读取到的数据
}

/******************************************************
*函数名称: NETCiReadBuffer
*输    入: len 长度 , buf 接收的数据
*输    出: 无
*说    明: 网络 读取缓冲区
*******************************************************/
void NETCiReadBuffer(UINT16 len, UINT8 *buf)
{
	CS=0;                                  //选通ENC28J60
	
	SPISend(ENC28J60_READ_BUF_MEM);  //SPI指令集：读缓冲区

	while(len--)
	{
		 *buf++ = SPIRecv();		  //连续接收数据
	}
	
    *buf='\0';	                         
	CS=1;                                 //禁止ENC28J60
}

/******************************************************
*函数名称: NETCiWriteBuffer
*输    入: len 长度 ,buf 要发送的数据
*输    出: 无
*说    明: 网络 写缓冲区
*******************************************************/
void NETCiWriteBuffer(UINT16 len,UINT8 *buf)
{
	CS=0;                                        //选通ENC28J60
	
	SPISend(ENC28J60_WRITE_BUF_MEM);       //SPI指令集：写缓冲区

	while(len--)
	{
		SPISend(*buf++);                     //连续写入数据
	}
		
	CS=1;                                      //禁止ENC28J60
}

/******************************************************
*函数名称: NETCiSetBank
*输    入: addr 地址
*输    出: 无
*说    明: 设置存储区
*******************************************************/
void NETCiSetBank(UINT8 addr)
{
    if((addr & BANK_MASK) != Enc28j60Bank) // 检查是否有效的存储区
    {
     //清零ECON寄存器的BSEL1和BSEL0
	 NETCiWriteOp(ENC28J60_BIT_FIELD_CLR,ECON1, (ECON1_BSEL1|ECON1_BSEL0)); 
     //设置ECON寄存器值为(addr & BANK_MASK)>>5
	 NETCiWriteOp(ENC28J60_BIT_FIELD_SET, ECON1, (addr & BANK_MASK)>>5); 	
     //获取当前BANK存储区
     Enc28j60Bank = (addr & BANK_MASK);
    }
}
 	
/******************************************************
*函数名称:NETCiRead
*输    入:addr 地址
*输    出:一字节数据
*说    明:从某一个地址读取1字节数据
******************************************************/     
UINT8 NETCiRead(UINT8 addr)
{

	NETCiSetBank(addr);

	return NETCiReadOp(ENC28J60_READ_CTRL_REG, addr);

}  		 
/******************************************************
*函数名称: NETCiClkOut
*输    入: clk值
*输    出: 无
*说    明: 设置CLKOUT
*******************************************************/
void NETCiClkOut(UINT8 clk)
{
    NETCiWrite(ECOCON,clk&0x07); //设置CLKOUT
}

/******************************************************
*函数名称: NETCiWrite
*输    入: addr 地址 ，dat 要写入的数据
*输    出: 无
*说    明: 设置寄存器
*******************************************************/
void NETCiWrite(UINT8 addr,
                   UINT8 dat)
{
	NETCiSetBank(addr);         //选择存储区
	NETCiWriteOp(ENC28J60_WRITE_CTRL_REG, addr, dat);//设置控制寄存器
}
/******************************************************
*函数名称: NETCiPhyWrite
*输    入: addr 地址, dat 16位数据
*输    出: 无
*说    明: 设置PHY
*******************************************************/
void NETCiPhyWrite(UINT8  addr, UINT16 dat)
{
	NETCiWrite(MIREGADR, addr); //写MIREAGDR值为dat
	NETCiWrite(MIWRL, dat);      //写MIWRL值为dat(即低8位)
	NETCiWrite(MIWRH, dat>>8);  //写MIWRH值为dat>>8(即高8位)
	while(NETCiRead(MISTAT) & MISTAT_BUSY) //检测MISTAT寄存器的BUSY位
	{
	      DelayNus(15);//延时15us（微妙）
	}
}
/******************************************************
*函数名称: NETCiInit
*输    入: mac 地址
*输    出: 无
*说    明: 网络设备初始化
*******************************************************/
void NETCiInit(UINT8 *mac)
{
	NETHwInit();	//网络低层IO初始化

	NETCiWriteOp(ENC28J60_SOFT_RESET, 0, ENC28J60_SOFT_RESET);//ENC28J60软复位
	DelayNms(50);//延时50ms
	while(!(NETCiRead(ESTAT) & ESTAT_CLKRDY));//检测是否就绪

	NextPacketPtr = RXSTART_INIT;
	NETCiWrite(ERXSTL, RXSTART_INIT&0xFF);   //设置接收缓冲区起始地址低字节
	NETCiWrite(ERXSTH, RXSTART_INIT>>8);     //设置接收缓冲区起始地址高字节
	NETCiWrite(ERXRDPTL, RXSTART_INIT&0xFF);//设置接收缓冲区读指针低字节
	NETCiWrite(ERXRDPTH, RXSTART_INIT>>8);   //设置接收缓冲器读指针高字节
	NETCiWrite(ERXNDL, RXSTOP_INIT&0xFF);    //设置接收缓冲器结束地址低字节
	NETCiWrite(ERXNDH, RXSTOP_INIT>>8);       //设置接收缓冲区结束地址高字节

	NETCiWrite(ETXSTL, TXSTART_INIT&0xFF);   //设置发送缓冲区起始地址低字节
	NETCiWrite(ETXSTH, TXSTART_INIT>>8);     //设置发送缓冲区起始地址高字节   
    NETCiWrite(ETXNDL, TXSTOP_INIT&0xFF);   //设置发送缓冲区结束地址低字节
	NETCiWrite(ETXNDH, TXSTOP_INIT>>8);      //设置发送缓冲区结束地址高字节  

     //设置接收发送过滤器ERXFCON使能单播过滤器、CRC、格式匹配过滤
	NETCiWrite(ERXFCON, ERXFCON_UCEN|ERXFCON_CRCEN|ERXFCON_PMEN);

	NETCiWrite(EPMM0, 0x3f);//设置格式匹配屏蔽字节0寄存器，屏蔽低6位
	NETCiWrite(EPMM1, 0x30);//设置格式匹配屏蔽字节1寄存器，屏蔽高2位
	NETCiWrite(EPMCSL, 0xf9);//设置格式匹配校验和低字节
	NETCiWrite(EPMCSH, 0xf7);//设置格式匹配校验和高字节	

     //设置MAC控制寄存器1使能MAC允许接收、暂停控制帧发送允许、暂停控制帧接收允许
	NETCiWrite(MACON1, MACON1_MARXEN|MACON1_TXPAUS|MACON1_RXPAUS);

	NETCiWrite(MACON2, 0x00); //不设置MAC控制寄存器2

    //设置MAC控制寄存器3使能帧校验长度、发送CRC、自动填充和配置CRC
    NETCiWriteOp(ENC28J60_BIT_FIELD_SET,MACON3,MACON3_PADCFG0|MACON3_TXCRCEN |MACON3_FRMLNEN);
    
	NETCiWrite(MAIPGL, 0x12);//配置非背对背包间间隔寄存器的低字节
	NETCiWrite(MAIPGH, 0x0C);//配置非背对背包间间隔寄存器的高字节
	NETCiWrite(MABBIPG,0x12);//配置背对背包间间隔寄存器
	NETCiWrite(MAMXFLL, MAX_FRAME_LEN&0xFF);//最大帧长度低字节	
	NETCiWrite(MAMXFLH, MAX_FRAME_LEN>>8);  //最大帧长度高字节

    NETCiWrite(MAADR5, mac[0]); //设置MAC地址字节5
    NETCiWrite(MAADR4, mac[1]); //设置MAC地址字节4
    NETCiWrite(MAADR3, mac[2]); //设置MAC地址字节3
    NETCiWrite(MAADR2, mac[3]); //设置MAC地址字节2
    NETCiWrite(MAADR1, mac[4]); //设置MAC地址字节1
    NETCiWrite(MAADR0, mac[5]); //设置MAC地址字节0

//设置PHY控制寄存器2发送的数据仅通过双绞线的接口发出
	NETCiPhyWrite(PHCON2, PHCON2_HDLDIS);

    //选择BANK为以太网控制寄存器1
	NETCiSetBank(ECON1);

     //设置中断使能
	NETCiWriteOp(ENC28J60_BIT_FIELD_SET, EIE, EIE_INTIE|EIE_PKTIE);
     //设置以太网控制寄存器1接收使能
	NETCiWriteOp(ENC28J60_BIT_FIELD_SET, ECON1, ECON1_RXEN);

}
/******************************************************
*函数名称: NETCiPacketSend
*输    入: packet 数据包缓冲区；len 数据长度
*输    出: 无
*说    明: 网络设备发送数据
*******************************************************/
void NETCiPacketSend(UINT8 *packet,UINT16 len)
{
    
	NETCiWrite(EWRPTL, TXSTART_INIT&0xFF);        //设置发送缓冲区起始地址低字节
	NETCiWrite(EWRPTH, TXSTART_INIT>>8);          //设置发送缓冲区起始地址高字节
	NETCiWrite(ETXNDL, (TXSTART_INIT+len)&0xFF);//设置发送缓冲区结束地址低字节
	NETCiWrite(ETXNDH, (TXSTART_INIT+len)>>8);  //设置发送缓冲区结束地址高字节

	NETCiWriteOp(ENC28J60_WRITE_BUF_MEM, 0, 0x00);//清空发送缓冲区

	NETCiWriteBuffer(len, packet); //发送数据
	NETCiWriteOp(ENC28J60_BIT_FIELD_SET, ECON1, ECON1_TXRTS);//发送逻辑复位
      
	if( (NETCiRead(EIR) & EIR_TXERIF) )//检测发送是否结束
	{
         NETCiWriteOp(ENC28J60_BIT_FIELD_CLR, ECON1, ECON1_TXRTS); //发送逻辑复位
        
    }
}
/******************************************************
*函数名称: NETCiPacketReceive
*输    入: packet 数据包缓冲区；len 数据长度
*输    出: 长度
*说    明: 网络设备接收数据
*******************************************************/
UINT16 NETCiPacketReceive(UINT8 *packet,UINT16 maxlen)
{
	UINT16 rxstat;
	UINT16 len;

	if( NETCiRead(EPKTCNT) ==0 )//读取以太网数据包长度
	{
		return(0);
    }
    

NETCiWrite(ERDPTL, (NextPacketPtr));     //写缓冲区读指针低字节
NETCiWrite(ERDPTH, (NextPacketPtr)>>8); //写缓冲区读指针高字节
//保存读缓冲区读指针低字节
NextPacketPtr= NETCiReadOp(ENC28J60_READ_BUF_MEM, 0);
//保存读缓冲区读指针高字节
NextPacketPtr|=NETCiReadOp(ENC28J60_READ_BUF_MEM,0)<<8;

	len  = NETCiReadOp(ENC28J60_READ_BUF_MEM, 0);     //读缓冲区读指针低字节
	len |= NETCiReadOp(ENC28J60_READ_BUF_MEM, 0)<<8; //读缓冲区读指针高字节
len -=4; //移除CRC校验

//读缓冲区读指针低字节
	rxstat  = NETCiReadOp(ENC28J60_READ_BUF_MEM, 0); 
     //读缓冲区读指针高字节
	rxstat |= (UINT16)(NETCiReadOp(ENC28J60_READ_BUF_MEM, 0)<<8); 

    if (len>maxlen-1) //检测是否符合最大长度
    {
        len=maxlen-1;
}

    if ((rxstat & 0x80)==0)//检测是否接收完毕
    {
        len=0;// 清零len
    }
    else
    {
         
        NETCiReadBuffer(len, packet); //接收数据
        
    }

	NETCiWrite(ERXRDPTL, (NextPacketPtr));     //写接收缓冲区读指针低字节
	NETCiWrite(ERXRDPTH, (NextPacketPtr)>>8); //写接收缓冲区读指针高字节

    //清空以太网控制寄存器2中的数据包递减位
	NETCiWriteOp(ENC28J60_BIT_FIELD_SET, ECON2, ECON2_PKTDEC);
	
	return(len);//返回接收数据的长度
}

