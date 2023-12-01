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
#define TIMER0_INITIAL_VALUE 5000 //5Ms定时

#define SEG_PORT            P0    //数码管占用的I/O口

#define KEY_PORT            P1    //按键占用的I/O口
#define KEY_MASK            0x0F //按键掩码

#define KEY_SEARCH_STATUS    0 //查询按键状态
#define KEY_ACK_STATUS       1 //确认按键状态
#define KEY_REALEASE_STATUS 2 //释放按键状态

#define KEY1                1     //按键1键值
#define KEY2                2     //按键2键值
#define KEY3                3     //按键3键值
#define KEY4                4     //按键4键值

#define HIGH                1     
#define LOW                 0
#define ON                  1
#define OFF                 0


#define LS164_DATA(x)      {if((x))P0_4=1;else P0_4=0;}         
#define LS164_CLK(x)       {if((x))P0_5=1;else P0_5=0;} 


UINT8  Timer0IRQEvent=0;   //T/C0中断事件
UINT8  Time1SecEvent=0;    //1秒定时事件
UINT8  TimeCount=0;         //T/C0计数器，用于计数产生1秒定时事件
UINT8  SegCurPosMark=0;    //被选中的数码管
UINT16 CounterValue=0;     //计数器

      UINT8  SegCurSel  = 0 ; //当前选中的数码管
      UINT8  SegBuf[4]  ={0}; //数码管显示缓冲区
//共阳极数码管字型码，并且保存在程序存储区，节省RAM资源
code UINT8  SegCode[10]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90};
//共阳极数码管片选数组，并且保存在程序存储区，节省RAM资源
code UINT8  SegSelTbl[4]={0x07,0x0b,0x0d,0x0e};

UINT8  bSetTime=0;  //标志位：是否要设置计数值

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
* 输    入: 无
* 输    出: 无
* 功能描述: 刷新显示缓存
*****************************************************/
void SegRefreshDisplayBuf(void)	 
{
		
	SegBuf[0] =CounterValue%10;       //个位
	SegBuf[1] =CounterValue/10%10;   //十位 
	SegBuf[2] =CounterValue/100%10;  //百位
	SegBuf[3] =CounterValue/1000%10; //千位

}
/****************************************************
* 函数名称: SegDisplay
* 输    入: 无
* 输    出: 无
* 功能描述: 显示数据
*****************************************************/
void SegDisplay(void)
{
      
   UINT8  t;
       
   SEG_PORT = 0x0F;  //熄灭所有数码管
  
   if(bSetTime)       //检测是否设置计数值
   {
	   if(SegCurSel==SegCurPosMark)
        {
			 
             t = SegCode[SegBuf[SegCurSel]]&0x7F; //加上小数点标识   
			
        }
	    else
        {
			 t = SegCode[SegBuf[SegCurSel]]; //正常显示当前数值
        }		
   }
   else
   {
		 t = SegCode[SegBuf[SegCurSel]]; //正常显示当前数值
   }
	
   
   LS164Send(t); 

   SEG_PORT = SegSelTbl[SegCurSel];	//点亮当前要显示的数码管	
		
   if(++SegCurSel>=4) 
   {				
 	    SegCurSel=0;
   }	 
}
/****************************************************
* 函数名称: TimerInit
* 输    入: 无
* 输    出: 无
* 功能描述: 定时器初始化
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
* 函数名称: Timer0Stop
* 输    入: 无
* 输    出: 无
* 功能描述: T/C0停止
*****************************************************/
void Timer0Stop(void)
{
     TR0 = 0;		 
     ET0 = 0;  	
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
* 函数名称: KeyRead
* 输    入: 无
* 输    出: 当前按下的按键
* 功能描述: 读取按键值
*****************************************************/
UINT8 KeyRead(void)
{
//KeyStatus:静态变量，保存按键状态
//KeyCurPress:静态变量，保存当前按键的键值
static UINT8 KeyStatus=KEY_SEARCH_STATUS,KeyCurPress=0;
           UINT8 KeyValue;
           UINT8 i=0;
	
	KeyValue=(~KEY_PORT)&KEY_MASK;//检测哪一个按键按下
  
    switch(KeyStatus)
    {
		case KEY_SEARCH_STATUS:   //按键查询状态
        {
             if(KeyValue)
             {
				 KeyStatus=KEY_ACK_STATUS;//按键下一个状态为确认状态
             }
         
             return 0;
      
        }
        break;

		case KEY_ACK_STATUS:    //按键确认状态
        {
             if(!KeyValue)         //没有按键按下
             {
                KeyStatus=KEY_SEARCH_STATUS; ;//按键下一个状态为查询状态

             }
             else
             {
			 for(i=0;i<4;i++)         //搜索哪个按键按下
               {
				if(KeyValue & (1<<i))
                   {
				   KeyCurPress=KEY1+i;
                      break;
                   }
                 
               }

               KeyStatus=KEY_REALEASE_STATUS; //按键下一个状态为释放状态
             }

             return 0;
        }
        break;

	    case KEY_REALEASE_STATUS:      //按键释放状态
        {
		    if(!KeyValue)      //按键释放
             {
				KeyStatus=KEY_SEARCH_STATUS; //按键下一个状态为释放状态

                   return KeyCurPress;//返回当前按键
             }
            
             return 0;
            
        }

        default:break;
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

PortInit();
TimerInit();
    Timer0Start();
    SegRefreshDisplayBuf();
    EA=1;

	while(1)
    {

        SegRefreshDisplayBuf(); //刷新显示缓冲区

		if(Timer0IRQEvent)      //定时器中断事件
		{ 
			Timer0IRQEvent=0;

		   switch(KeyRead())    //扫描按键，获取键值
            {
			  case KEY1:         //按键1
                {
				  bSetTime=~bSetTime;//标志位：是否设置计数值
                     SegCurPosMark=0;
                }
                break;

                case KEY2:        //按键2
                {
                      if(++SegCurPosMark>=4) //选择哪一个位要修改
                      {
                           SegCurPosMark=0;
                      }
                }
                break;

                case KEY3:       //按键3
                {
                      if(!bSetTime)break; //不是设置计数模式，跳出switch

                      //根据被选择的位进行自加操作
                      if(CounterValue>=9999)CounterValue=0;

                      if      (SegCurPosMark==0)CounterValue+=1;
                      else if(SegCurPosMark==1)CounterValue+=10;
                      else if(SegCurPosMark==2)CounterValue+=100;
                      else                         CounterValue+=1000;

                      

                }
                break;

                case KEY4:                 //按键4
                {
                      if(!bSetTime)break; //不是设置计数模式，跳出switch

//根据被选择的位进行自减操作
                      if(CounterValue<=0)CounterValue=9999;

                      if      (SegCurPosMark==0)CounterValue-=1;
                      else if(SegCurPosMark==1)CounterValue-=10;
                      else if(SegCurPosMark==2)CounterValue-=100;
                      else                         CounterValue-=1000;

                      
                }
                break;

                default:break;
            }
            
        }
	    else if(Time1SecEvent)//一秒定时事件产生
	    {
	 	    Time1SecEvent=0;
		
		    if(!bSetTime)      //不是设置计数值模式
		    {
		       if(++CounterValue>=9999)//计数值自加1，同时计数值不能大于9999
		       {
			        CounterValue=0;
		       }		
		    }
	    } 	
    }

}
/****************************************************
** 函数名称: Timer0IRQ
** 输    入: 无
** 输    出: 无
** 功能描述: T/C0中断服务函数
*****************************************************/
void Timer0IRQ(void) interrupt 1 
{
	TH0 = (65536-TIMER0_INITIAL_VALUE)/256;
   	TL0 = (65536-TIMER0_INITIAL_VALUE)%256; //重载初值

	Timer0IRQEvent=1;
    
    SegDisplay();         //数码管显示
 
    if(++TimeCount>=200)
    {
	    TimeCount=0;
         Time1SecEvent=1;
    }

}

