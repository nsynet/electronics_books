/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */
#include "stc.h"

/***************************************************
 *          类型定义，方便代码移植
 ***************************************************/
typedef unsigned char   UINT8;
typedef unsigned int	UINT16;
typedef unsigned long   UINT32; 
    
typedef char            INT8;
typedef int             INT16;
typedef long            INT32;
typedef bit             BOOL;

/***************************************************
 *          大量宏定义，便于代码移植和阅读
 ***************************************************/
//--------------------------------
                                   //----头部----
#define DCMD_CTRL_HEAD1      0x10  //PC下传控制包头部1
#define DCMD_CTRL_HEAD2      0x01  //PC下传控制包头部2

                                   //----命令码----
#define DCMD_NULL            0x00  //命令码:空操作
#define DCMD_CTRL_BELL       0x01  //命令码:控制蜂鸣器
#define DCMD_CTRL_LED        0x02  //命令码:控制LED
#define DCMD_REQ_DATA        0x03  //命令码:请求数据

                                   //----数据----
#define DCTRL_BELL_ON        0x01  //蜂鸣器响
#define DCTRL_BELL_OFF       0x02  //蜂鸣器禁鸣
#define DCTRL_LED_ON         0x03  //LED亮
#define DCTRL_LED_OFF        0x04  //LED灭

//--------------------------------
                                   //----头部----
#define UCMD_CTRL_HEAD1      0x20  //MCU上传控制包头部1
#define UCMD_CTRL_HEAD2      0x01  //MCU上传控制包头部2

                                   //----命令码----
#define UCMD_NULL            0x00  //命令码:空操作
#define UCMD_REQ_DATA        0x01  //命令码:请求数据


#define CTRL_FRAME_LEN       0x04  //帧长度(不包含数据和校验值)
#define CHECKSUM_LEN         0x01  //检验值长度

#define EN_UART()            ES=1 //允许串口中断
#define NOT_EN_UART()        ES=0 //禁止串口中断

#define BELL(x)             {if((x))P0_6=1 ;else P0_6=0;} //蜂鸣器控制宏函数
#define LED(x)              {if((x))P2=0x00;else P2=0xFF;}//LED控制宏函数    

#define TRUE                1
#define FALSE               0

#define HIGH                1
#define LOW                 0   

#define ON                  1
#define OFF                 0

#define NULL                (void *)0 

/*使用结构体对数据包进行封装
 *方便操作数据
 */
typedef  struct _PKT_SUM
{
	UINT8 m_ucHead1;       //首部1
	UINT8 m_ucHead2;       //首部2
	UINT8 m_ucOptCode;     //操作码
	UINT8 m_ucDataLength;  //数据长度
	UINT8 m_szDataBuf[16]; //数据

	UINT8 m_ucCheckSum;      //CRC16为2个字节

}PKT_SUM;

/*使用共用体再一次对数据包进行封装
 *操作数据更加方便
 */
typedef union _PKT_SUM_EX
{
	PKT_SUM r;
	UINT8 p[32];
} PKT_SUM_EX;


PKT_SUM_EX    PktSumEx; //定义数据包变量
BOOL  bLedOn=FALSE;     //定义是否点亮LED布尔变量
BOOL  bBellOn=FALSE;    //定义是否蜂鸣器响布尔变量
BOOL  bReqData=FALSE;   //定义是否请求数据布尔变量

/****************************************************
** 函数名称: CheckSum
** 输    入: buf 要校验的数据;
             len 要校验的数据的长度 
** 输    出: 校验值
** 功能描述: 计算校验和
*****************************************************/
UINT16 CheckSum(UINT8 *buf, UINT8 len) 
{
	  UINT8 i=0,Sum=0;

	  for (i=0;i<len;i++)
	  {
		  Sum+=*buf++;
	  }

	  return Sum;
} 
/*************************************************************
* 函数名称:BufCpy
* 输    入:dest目标缓冲区; 
           Src  源缓冲区
           size 复制数据的大小
* 输    出:无
* 说    明:复制缓冲区
**************************************************************/
BOOL BufCpy(UINT8 * dest,UINT8 * src,UINT32 size)
{
    if(NULL ==dest || NULL==src ||NULL==size)
    {
    	return FALSE;
    }
    
	do
	{
		*dest++ = *src++;
		
	}while(--size!=0);
	
	return TRUE;
}
/****************************************************
** 函数名称: UartInit
** 输    入: 无
** 输    出: 无
** 功能描述: 串口初始化
*****************************************************/                                                                               
void UartInit(void)
{
	SCON=0x40;
	T2CON=0x34;
	RCAP2L=0xD9;
	RCAP2H=0xFF;
	REN=1;
    ES=1;
}
/****************************************************
** 函数名称: UARTSendByte
** 输    入: b 单个字节
** 输    出: 无
** 功能描述: 串口 发送单个字节
*****************************************************/ 
void UARTSendByte(UINT8 b)
{
 	 SBUF=b;
	 while(TI==0);
	 TI=0;
}
/****************************************************
** 函数名称: UARTSendByte
** 输    入: b 单个字节
** 输    出: 无
** 功能描述: 串口 发送单个字节
*****************************************************/ 
void UartSendNBytes(UINT8 *buf,UINT8 len)
{
     while(len--)
     {
         UARTSendByte(*buf++);
     }
}
code INT8 HexTable[16]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
void UARTCiPrintfString(const INT8 *str)
{
     while(str && *str)
     {
     
        UARTSendByte(*str++); 
               
     }

}
void UARTCiPrintfVal(UINT8 *str,UINT32 val,UINT8 show)
{    
     UINT8 i=0;
     UINT8 buf[10]={0}; 
     
	 UARTCiPrintfString(str);

     if(10 == show)
     {
         for(i=0; i<10 ;i++)
         {
             buf[i]=(UINT8)('0'+val%10);   
             val/=10;   
         } 
     
         
         for(i=9;i>=0;)
         {
             if('0' == buf[i])
             {
                 i--;
             }
             else
             {
                break;
             }
         } 
         
         while(1)
         {    
             
             UARTSendByte(buf[i]); 
             
             if(!i)
             {
                 break; 
             } 
             
             i--;
         } 
         
         
     }
     
     if(16 == show)
     {
        UARTSendByte('0');
	    UARTSendByte('x');
	    
        i=28;
        
        while(i)
        {
            if(0  == ((val>>i) &0x0f))
            {   
                i=i-4;
               
            }
            else
            {
                break;
            }
        } 
        
        while(1)
        {
            UARTSendByte(HexTable[(val>>i) &0x0f]); 
            
            if(!i)
            {
                break; 
            }     
                    
            i=i-4;
        }  
        
     } 
     
     UARTCiPrintfString("\r\n");
}
#define DEBUGMSG   UARTCiPrintfString
#define DEBUGMSGEx UARTCiPrintfVal
/****************************************************
** 函数名称: main
** 输    入: 无
** 输    出: 无
** 功能描述: 函数主题
*****************************************************/
void main(void)
{
     UINT8 i=0;
	 UINT8 ucCheckSum=0;

	 UartInit();//串口初始化

	 EA=1;      //开总中断
	 
     while(1)
     {
          if(bLedOn)  //是否点亮Led
		  {
		     LED(ON);  
		  }
		  else
		  {
		     LED(OFF); 
		  }
		  
		  
		  if(bBellOn)//是否响蜂鸣器
		  {
		     BELL(ON);
		  }
		  else
		  {
		     BELL(OFF);
		  }
		  
		  if(bReqData)//是否请求数据
		  {
		     bReqData=FALSE;

			 NOT_EN_UART(); //禁止串口中断
			 
			 PktSumEx.r.m_ucHead1=UCMD_CTRL_HEAD1;//MCU上传数据帧头部1
			 PktSumEx.r.m_ucHead2=UCMD_CTRL_HEAD2;//MCU上传数据帧头部2
			 PktSumEx.r.m_ucOptCode=UCMD_REQ_DATA;//MCU上传数据帧命令码
			 
			 PktSumEx.r.m_ucCheckSum=CheckSum(PktSumEx.p,
			                                  CTRL_FRAME_LEN+
											  PktSumEx.r.m_ucDataLength);//计算校验值

  		     /*
			    这样做的原因是因为有时写数据长度不一样,
  		        导致PktSumEx.r.m_ucCheckSum会出现为0的情况
				所以使用BufCpy将校验值复制到相应的位置
			 */

			 BufCpy(&PktSumEx.p[CTRL_FRAME_LEN+PktSumEx.r.m_ucDataLength],
			        &PktSumEx.r.m_ucCheckSum,
					 CHECKSUM_LEN);
			 
			 UartSendNBytes(PktSumEx.p,
			                CTRL_FRAME_LEN+
							PktSumEx.r.m_ucDataLength+CHECKSUM_LEN);//发送数据

			 EN_UART();//允许串口中断
			 		
		  }
     }
}
/****************************************************
** 函数名称: UartIRQ
** 输    入: 无
** 输    出: 无
** 功能描述: 串口中断服务程序
*****************************************************/
void UartIRQ(void)interrupt 4
{
     static UINT8  uccnt=0;
	        UINT8  uclen;
			UINT8  ucCheckSum;
     
     if(RI) //是否接收到数据
     {
        RI=0;

        PktSumEx.p[uccnt++]=SBUF;//获取单个字节

        if(PktSumEx.r.m_ucHead1 == DCMD_CTRL_HEAD1)//是否有效的数据帧头部1
        {
           if(uccnt<CTRL_FRAME_LEN+PktSumEx.r.m_ucDataLength+CHECKSUM_LEN)//是否接收完所有数据
           {
              if(uccnt>=2 && PktSumEx.r.m_ucHead2!=DCMD_CTRL_HEAD2)//是否有效的数据帧头部2
              {
                 uccnt=0;

                 return;
              }
                    
           }
           else
           {
		      
		      uclen=CTRL_FRAME_LEN+PktSumEx.r.m_ucDataLength;//获取数据帧有效长度(不包括校验值)

			  ucCheckSum=CheckSum(PktSumEx.p,uclen);//计算校验值

  		      /*
			    这样做的原因是因为有时写数据长度不一样,
  		        导致PktSumEx.r.m_ucCheckSum会出现为0的情况
				所以使用BufCpy将校验值复制到相应的位置
			   */
			  BufCpy(&PktSumEx.r.m_ucCheckSum,&PktSumEx.p[uclen],CHECKSUM_LEN);

			  //DEBUGMSGEx("ucCheckSum:=",ucCheckSum,16);
			  //DEBUGMSGEx("PktSumEx.r.m_ucCheckSum:=",PktSumEx.r.m_ucCheckSum,16);


			  //DEBUGMSG("CheckSuming ...\r\n");

			  if(ucCheckSum!=PktSumEx.r.m_ucCheckSum)//校验值是否匹配
			  {
			      uccnt=0;

			      return;  
			  }

			 // DEBUGMSG("CheckSum OK\r\n");

              switch(PktSumEx.r.m_ucOptCode)//从命令码中获取相对应的操作
              {
                case DCMD_CTRL_BELL://控制蜂鸣器命令码
                {
					 if(DCTRL_BELL_ON==PktSumEx.r.m_szDataBuf[0])//数据部分含控制码
					 {
					    bBellOn=TRUE;
					 }
					 else
					 {
					    bBellOn=FALSE;
					 }
                }
                break;

                case DCMD_CTRL_LED://控制LED命令码
                {

					 if(DCTRL_LED_ON==PktSumEx.r.m_szDataBuf[0])//数据部分含控制码
					 {
					    bLedOn=TRUE;
					 }
					 else
					 {
					    bLedOn=FALSE;
					 }
                }
                break;

                case DCMD_REQ_DATA://请求数据命令码
                {
                     bReqData=TRUE;
                }
                break;

              }

              uccnt=0; 

              return;
           }

        }
        else
        {
            uccnt=0;
        }

     }
}
