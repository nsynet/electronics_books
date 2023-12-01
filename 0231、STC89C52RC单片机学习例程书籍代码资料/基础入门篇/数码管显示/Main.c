/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */
#include "stc.h"

/***************************************************
 *          大量宏定义，便于代码移植和阅读
 ***************************************************/
#define HIGH               1
#define LOW                0
#define LS164_DATA(x)    {if((x))P0_4=1;else P0_4=0;}         
#define LS164_CLK(x)     {if((x))P0_5=1;else P0_5=0;} 
#define SEG_PORT          P0    //控制数码管字型码端口

unsigned char   Timer0IRQEvent=0; //T/C0中断事件
unsigned char   Time1SecEvent=0;  //定时1秒事件
unsigned int    TimeCount=0;       //时间计数值
unsigned char   SegCurPosition=0; //当前点亮的数码管

//为了验证共阳极的字型码是共阴极的反码，共阳极字型码为共阴极的反码
//共阳极字型码存储在代码区，用关键字"code"声明
code unsigned char SegCode[10]={~0x3F,~0x06,~0x5B,~0x4F,~0x66,~0x6D,~0x7D,
~0x07,~0x7F,~0x6F};

//片选数码管数组，存储在代码区，用关键字"code"声明
code unsigned char  SegPosition[4]={0xf7,0xfb,0xfd,0xfe};
//数码管显示数据缓冲区
  unsigned char  SegBuf[4]  ={0};

/****************************************
*函数名称:LS164Send
*输    入:byte 单个字节
*输    出:无
*功    能:74LS164发送单个字节
******************************************/
void LS164Send(unsigned char byte)
{
   unsigned char j;

   for(j=0;j<=7;j++)//对输入数据进行移位检测
   {

     if(byte&(1<<(7-j))) //检测字节当前位
     {
	        LS164_DATA(HIGH); //串行数据输入引脚为高电平
	 }
	 else
	 {
	        LS164_DATA(LOW); //串行数据输入引脚为低电平
	 }

     LS164_CLK(LOW); 
     LS164_CLK(HIGH);
       
   }
}

/****************************************
*函数名称:SegRefreshDisplayBuf
*输    入:无
*输    出:无
*功    能:数码管刷新显示缓存
******************************************/
void SegRefreshDisplayBuf(void)	 
{
		
	SegBuf[0] =TimeCount%10;       //个位
	SegBuf[1] =TimeCount/10%10;   //十位
	SegBuf[2] =TimeCount/100%10;  //百位
	SegBuf[3] =TimeCount/1000%10; //千位

}
/****************************************
*函数名称:SegDisplay
*输    入:无
*输    出:无
*功    能:数码管显示数据
******************************************/
void SegDisplay(void)
{

   unsigned char  t;

   SEG_PORT = 0x0F;  //熄灭所有数码管
   
   t = SegCode[SegBuf[SegCurPosition]];   //确定当前的字型码

   LS164Send(t); 

   SEG_PORT = SegPosition[SegCurPosition];//选中一个数码管来显示	
		
   if(++SegCurPosition>=4) //下次要点亮的数码管
   {				
	    SegCurPosition=0;
   }
		  
}
/****************************************
*函数名称:TimerInit
*输    入:无
*输    出:无
*功    能:T/C初始化
******************************************/
void TimerInit(void)
{
   TH0 = (65536-5000)/256;
   TL0 = (65536-5000)%256; //定时5MS
   TMOD = 0x01;	             //T/C0模式1
}
/****************************************
*函数名称:Timer0Start
*输    入:无
*输    出:无
*功    能: T/C0启动
******************************************/
void Timer0Start(void)    
{
   TR0 = 1;		 
   ET0 = 1;	
}
/****************************************
*函数名称:PortInit
*输    入:无
*输    出:无
*功    能:I/O口初始化
******************************************/
void PortInit(void)         
{
   P0=P1=P2=P3=0xFF;
}
/****************************************
*函数名称:main
*输    入:无
*输    出:无
*功    能:函数主体
******************************************/
void main(void)
{
    PortInit();
    TimerInit();
    Timer0Start();
    SegRefreshDisplayBuf();
    EA=1;

    while(1)
    {
		if(Timer0IRQEvent)       //检测T/C0中断事件是否产生
		{ 
            Timer0IRQEvent=0;

		    if(Time1SecEvent)     //检测1秒事件是否产生
         	    {
				Time1SecEvent=0;

				if(++TimeCount>=9999)//计数值自加
                   {
					 TimeCount=0;
                   }

                   SegRefreshDisplayBuf();//刷新缓冲区
               }

               SegDisplay();	          //点亮选中的数码管

            }
    }
}
/****************************************
*函数名称:Timer0IRQ
*输    入:无
*输    出:无
*功    能:T/C0中断服务函数
******************************************/
void Timer0IRQ(void) interrupt 1 
{
     static unsigned int cnt=0;

     TH0 = (65536-5000)/256;
     TL0 = (65536-5000)%256; //重载初值

     Timer0IRQEvent=1;        //T/C0中断事件标志位置1

     if(++cnt>=200)           
     {
	     cnt=0;
          Time1SecEvent=1;   //定时1秒事件置1
     }
}

