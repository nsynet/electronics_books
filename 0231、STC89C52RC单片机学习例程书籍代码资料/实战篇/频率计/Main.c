/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */
#include "stc.h"
#include "global.h"
#include "74LS164.h"
#include "LCD1602.h"


#define TIMER0_INITIAL_VALUE 5000  //5ms定时

 
UINT8   TimeCount=0;                //定时计数
UINT8   Timer0IRQEvent=0;          //T/C0定时中断事件
UINT8   Timer1OverFlowCnt=0;       //T/C1计数溢出计数
UINT8   Time1SecEvent=0;            //定时1秒事件
UINT16  FreqCount=0;

UINT8   LCDString[16];             //LCD字符串缓冲区
UINT8   LCDPrintfLength;           //LCD显示数据长度

/*************************************************************
* 函数名称:TimerInit
* 输    入:无
* 输    出:无
* 说    明:T/C初始化
**************************************************************/
void TimerInit(void)               
{
   TH1 = 0;
   TL1 = 0; 
   TH0 = (65536-TIMER0_INITIAL_VALUE)/256;
   TL0 = (65536-TIMER0_INITIAL_VALUE)%256; //定时5MS
   TMOD = 0x51;
  
}
/*************************************************************
* 函数名称:Timer0Start
* 输    入:无
* 输    出:无
* 说    明:T/C0启动
**************************************************************/
void Timer0Start(void)
{
     TR0 = 1;		
	 ET0 = 1;	
}
/*************************************************************
* 函数名称:Timer0Stop
* 输    入:无
* 输    出:无
* 说    明:T/C0停止
**************************************************************/
void Timer0Stop(void)
{
     TR0 = 0;	
     ET0 = 0;  	
}
/*************************************************************
* 函数名称:Timer1Start
* 输    入:无
* 输    出:无
* 说    明:T/C1启动
**************************************************************/
void Timer1Start(void)
{

     TR1 = 1;		
	 ET1 = 1; 
     TH1=TL1=0;  	
}
/*************************************************************
* 函数名称:Timer1Stop
* 输    入:无
* 输    出:无
* 说    明:T/C1停止
**************************************************************/
void Timer1Stop(void)
{

     TR1 = 0;	
   	 ET1 = 0; 

}
/*************************************************************
* 函数名称:PortInit
* 输    入:无
* 输    出:无
* 说    明:I/O口初始化
**************************************************************/
void PortInit(void)
{
	 P0=P1=P2=P3=0xFF;
}

/*************************************************************
* 函数名称:main
* 输    入:无
* 输    出:无
* 说    明:函数主体
**************************************************************/
void main(void)
{
	PortInit();
	TimerInit();
    Timer0Start();
    Timer1Start();
    LCD1602Init();

    EA=1;      //开启全局中断

	while(1)
    {
		if(Timer0IRQEvent)  //T/C0中断事件
		{ 
            Timer0IRQEvent=0;
            TimeCount++;
  
            if(TimeCount>=200)    //定时1S到达
            {
		      TimeCount=0;      

              Timer0Stop();    //停止T/C0
              Timer1Stop();    //停止T/C1

              FreqCount=((TH1<<8)|TL1)+Timer1OverFlowCnt*65536;//计算总计数值
		      Timer1OverFlowCnt=0;

              itoa(FreqCount,LCDString,10);    //计数值变为字符串
			  LCD1602ClearScreen();	         //LCD1602清屏			
              LCD1602PrintfString(2,0,"Now Frequency");//LCD1602打印字符串
              LCDPrintfLength=LCD1602PrintfString(3,1,LCDString);//LCD1602打印字符串
              LCD1602PrintfString(LCDPrintfLength+3,1,"HZ");//LCD1602打印字符串 
  
              Timer0Start();//启动T/C0
              Timer1Start();//启动T/C1  
            }
            
			
        }
    }

}
/*************************************************************
* 函数名称:Timer0IRQ
* 输    入:无
* 输    出:无
* 说    明:T/C0中断服务函数
**************************************************************/
void Timer0IRQ(void) interrupt 1 
{
	ET0	=  0;

	TH0 = (65536-TIMER0_INITIAL_VALUE)/256;
   	TL0 = (65536-TIMER0_INITIAL_VALUE)%256; //定时1MS

	Timer0IRQEvent=1;
    
	ET0	=  1;

    P3_4=~P3_4;

}
/*************************************************************
* 函数名称:Timer1IRQ
* 输    入:无
* 输    出:无
* 说    明:T/C1中断服务函数
**************************************************************/
void Timer1IRQ(void) interrupt 3 
{
    ET1=0;
    Timer1OverFlowCnt++; //计数溢出自加1
    ET1=1;
}

