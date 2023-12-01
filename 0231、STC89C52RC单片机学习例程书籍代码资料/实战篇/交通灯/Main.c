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
typedef char               INT8;
typedef int                INT16;
typedef long               INT32;

/***************************************************
 *          大量宏定义，便于代码移植和阅读
 ***************************************************/
#define TIMER0_INITIAL_VALUE 5000

#define HIGH               1
#define LOW                0

#define ON                 1
#define OFF                0

#define SEG_PORT           P0

/**************************************
74LS164操作宏函数
 **************************************/

#define LS164_DATA(x)      {if((x))P0_4=1;else P0_4=0;}         
#define LS164_CLK(x)       {if((x))P0_5=1;else P0_5=0;} 
//-----------------------------------------------------

/**************************************
*                交通灯操作宏函数
*NORTH：北方向
*SOUTH：南方向
 **************************************/
#define NORTH_R_LIGHT(x)   {if((x))P2_0=0;else P2_0=1;}
#define NORTH_Y_LIGHT(x)   {if((x))P2_1=0;else P2_1=1;}
#define NORTH_G_LIGHT(x)   {if((x))P2_2=0;else P2_2=1;}

#define SOUTH_R_LIGHT(x)   {if((x))P2_3=0;else P2_3=1;}
#define SOUTH_Y_LIGHT(x)   {if((x))P2_4=0;else P2_4=1;}
#define SOUTH_G_LIGHT(x)   {if((x))P2_5=0;else P2_5=1;}
//-----------------------------------------------------

#define UART_MARKER         0xEE    //数据帧首部标识

UINT8  Timer0IRQEvent=0;            //T/C0中断事件
UINT8  Time1SecEvent=0;             //定时1秒事件
UINT8  Time500MsEvent=0;            //定时500毫秒事件
UINT8  TimeCount=0;                  //计数器

UINT8  SegCurPosition=0;            //数码管

UINT8  LightOrgCount[4]={15,5,15,5};//交通灯计数初始值
UINT8  LightCurCount[4]={15,5,15,5};//交通灯计数当前值

UINT8  TrafficLightStatus=0;          //当前交通灯状态

//共阳极数码管字型码，并且保存在程序存储区，节省RAM资源
code UINT8  SegCode[10]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90};
//共阳极数码管片选数组，并且保存在程序存储区，节省RAM资源
code UINT8  SegSelTbl[4]={0x07,0x0b,0x0d,0x0e};
UINT8  SegBuf[4]   ={0};         //数码管显示缓冲区

/**************************************
*              交通灯数据帧格式
**************************************/
typedef struct _LIGHT_VAL
{
    UINT8 Head;   
    UINT8 val[4]; 
}LIGHT_VAL;

typedef union _LIGHT_VAL_EX
{
     LIGHT_VAL lv;
     UINT8    p[5]; 
}LIGHT_VAL_EX;
//-----------------------------------------------------

/****************************************************
* 函数名称: LS164Send
* 输    入: byte 要发送的字节
* 输    出: 无
* 功能描述: 74LS164发送数据函数
*****************************************************/
void LS164Send(UINT8 byte)
{
   UINT8 j;

   for(j=0;j<=7;j++)
   {

     if(byte&(1<<(7-j)))
     {
	    LS164_DATA(HIGH);
	 }
	 else
	 {
	    LS164_DATA(LOW);
	 }

     LS164_CLK(LOW); 
     LS164_CLK(HIGH);
   }
}
/****************************************************
* 函数名称: SegRefreshDisplayBuf
* 输    入: s1 计数值
* 输    出: 无
* 功能描述: 刷新显示缓存
*****************************************************/
void SegRefreshDisplayBuf(UINT8 s1)
{
	SegBuf[0] = s1%10;
	SegBuf[1] = s1/10;
	SegBuf[2] = s1%10;
	SegBuf[3] = s1/10;

}
/****************************************************
* 函数名称: SegDisplay
* 输    入: 无
* 输    出: 无
* 功能描述: 显示数据
*****************************************************/
void SegDisplay(void)
{
   unsigned char  t;

   SEG_PORT = 0x0F;  //熄灭所有数码管
   
   t = SegCode[SegBuf[SegCurPosition]];   //确定当前的字型码

   LS164Send(t); 

   SEG_PORT = SegSelTbl[SegCurPosition];//选中一个数码管来显示	
		
   if(++SegCurPosition>=4) 
   {				
	    SegCurPosition=0;
   }		  
}
/****************************************************
* 函数名称: TimerInit
* 输    入: 无
* 输    出: 无
* 功能描述: T/C初始化
*****************************************************/
void TimerInit(void)
{ 
   TH0 = (65536-TIMER0_INITIAL_VALUE)/256;
   TL0 = (65536-TIMER0_INITIAL_VALUE)%256; //定时5MS
   TMOD = 0x01;	
  
}
/****************************************************
* 函数名称: Timer0Start
* 输    入: 无
* 输    出: 无
* 功能描述: T/C0启用
*****************************************************/
void Timer0Start(void)
{
      TR0 = 1;		 
	 ET0 = 1;	
}
/****************************************************
* 函数名称: PortInit
* 输    入: 无
* 输    出: 无
* 功能描述: 单片机I/O口初始化
*****************************************************/
void PortInit(void)
{
	 P0=P1=P2=P3=0xFF;
}
/****************************************************
* 函数名称: UartInit
* 输    入: 无
* 输    出: 无
* 功能描述: 串口初始化
*****************************************************/
void UartInit(void)
{
	SCON=0x40;    //10位异步收发
	T2CON=0x34;   //使用T/C2为波特率发生器
	RCAP2L=0xD9; //9600波特率
	RCAP2H=0xFF;
	REN=1;        //允许串口接收
     ES=1;         //允许串口中断
}
/****************************************************
* 函数名称: UartSendByte
* 输    入: byte 单个字节
* 输    出: 无
* 功能描述: 串口 发送单个字节
*****************************************************/
void UartSendByte(UINT8 byte)
{
	SBUF=byte;
     while(TI==0);
     TI=0;
}
/****************************************************
* 函数名称: UartPrintfString
* 输    入: str 字符串
* 输    出: 无
* 功能描述: 串口 打印字符串
*****************************************************/
void UartPrintfString(INT8 *str)
{
	while(str && *str)
    {
		UartSendByte(*str++);
    }
}
/****************************************************
* 函数名称: main
* 输    入: 无
* 输    出: 无
* 功能描述: 函数主体
*****************************************************/
void main(void)
{
    UINT8 i=0;
    PortInit();
    TimerInit();
    Timer0Start();
    UartInit();
    SegRefreshDisplayBuf (LightCurCount[0]);
    EA=1;
    NORTH_R_LIGHT(ON);
    SOUTH_G_LIGHT(ON);

    while(1)
    {
		if(Timer0IRQEvent)//T/C0中断事件
		{ 
            Timer0IRQEvent=0;
            TimeCount++;
  
            if(TimeCount>=200)//计数到1秒
            {
			  TimeCount=0;
				
			  if(LightCurCount[0])
                {
                    TrafficLightStatus=0;//状态0
                }
			  else if(LightCurCount[1])
                {
                    TrafficLightStatus=1; //状态1
                }
			  else if(LightCurCount[2])
                {   
                    TrafficLightStatus=2; //状态2
                }
                else if(LightCurCount[3])
                {
				  TrafficLightStatus=3; //状态3
                }
                else //所有计数值为0时，交通灯当前计数值重载初值
                {
                   for(i=0;i<4;i++)
                   {
                     LightCurCount[i]=LightOrgCount[i];
                   }
                   TrafficLightStatus=0;
                }	
			
				switch(TrafficLightStatus)//根据不同的交通灯状态进行相对应的亮灯操作
				{
				  case 0:
                    {
                        NORTH_R_LIGHT(ON);
                        SOUTH_R_LIGHT(OFF);
                        NORTH_G_LIGHT(OFF);
                        SOUTH_G_LIGHT(ON);
					    NORTH_Y_LIGHT(OFF);
                        SOUTH_Y_LIGHT(OFF);
                    }
                    break;
                    
                    case 1:
                    {
                        if(LightCurCount[1]%2)//状态切换，闪烁操作
                        {
					       NORTH_R_LIGHT(ON);
                           SOUTH_G_LIGHT(ON);
                        }
                        else
                        {
					       NORTH_R_LIGHT(OFF);
                           SOUTH_G_LIGHT(OFF);		
                        }

                        NORTH_Y_LIGHT(ON);
                        SOUTH_Y_LIGHT(ON);

                    }
                    break;

                    case 2:
                    {
                        NORTH_R_LIGHT(OFF);
                        SOUTH_R_LIGHT(ON);
                        NORTH_G_LIGHT(ON);
                        SOUTH_G_LIGHT(OFF);
                        NORTH_Y_LIGHT(OFF);
                        SOUTH_Y_LIGHT(OFF);
                    }
                    break;
                       
                    case 3:
                    {
                        if(LightCurCount[3]%2) //状态切换，闪烁操作
                        {
                           NORTH_G_LIGHT(ON);
                           SOUTH_R_LIGHT(ON);
                        }
                        else
                        {
                           NORTH_G_LIGHT(OFF);
                           SOUTH_R_LIGHT(OFF);		
                        }

                        NORTH_Y_LIGHT(ON);
                        SOUTH_Y_LIGHT(ON);

                    }
                    break;  
                    
                   default:break;                  
                }

             SegRefreshDisplayBuf (LightCurCount[TrafficLightStatus]);
             LightCurCount[TrafficLightStatus]--;//按照不同的状态，进行当前计数值自减
            }
            
			SegDisplay();//显示数码管数值
        }
        
		

    }

}
/****************************************************
* 函数名称: UartIRQ
* 输    入: 无
* 输    出: 无
* 功能描述: 串口 中断服务函数
*****************************************************/
void UartIRQ(void)interrupt 4 
{
  static UINT8 cnt=0;              //接收数据计数器
  static LIGHT_VAL_EX LightValEx;//定义交通灯数据帧类型变量，并且为静态变量

  if(RI)  
  {  
     RI=0;
	 LightValEx.p[cnt++]=SBUF;//获取数据

     if(LightValEx.lv.Head == UART_MARKER)//检测帧头部是否匹配
     {  						
	    if(cnt>=5)
        {
		  for(cnt=0;cnt<4;cnt++)//当接收正确接收字节数为5字节时，进行数码管初值、
                                          //计数值重新赋值
            {
			  LightOrgCount[cnt]=LightValEx.lv.val[cnt]; 
                LightCurCount[cnt]=LightValEx.lv.val[cnt];
               
            }

            cnt=0;
            UartPrintfString("设置交通灯完成\r\n");//设置成功后，打印信息
        }
     }
     else
     {
		cnt=0;
     }
  
  }

}
/****************************************************
* 函数名称: Timer0IRQ
* 输    入: 无
* 输    出: 无
* 功能描述: T/C0 中断服务函数
*****************************************************/
void Timer0IRQ(void) interrupt 1 
{
	
	TH0 = (65536-TIMER0_INITIAL_VALUE)/256;//T/C初值重载
   	TL0 = (65536-TIMER0_INITIAL_VALUE)%256; 
	Timer0IRQEvent=1;
    

}

