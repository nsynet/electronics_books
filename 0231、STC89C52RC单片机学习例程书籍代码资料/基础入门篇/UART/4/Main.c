/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */

#include "stc.h"

#define RXD P3_0              //宏定义:接收数据的引脚
#define TXD P3_1              //宏定义:发送数据的引脚
#define RECEIVE_MAX_BYTES 16//宏定义:最大接收字节数

#define TIMER_ENABLE()  {TL0=TH0;TR0=1;fTimeouts=0;}//使能T/C
#define TIMER_DISABLE() {TR0=0;fTimeouts=0;}//禁止T/C
#define TIMER_WAIT()    {while(!fTimeouts);fTimeouts=0;}//等待T/C超时


unsigned char fTimeouts=0;//T/C超时溢出标志位
unsigned char RecvBuf[16];//接收数据缓冲区
unsigned char RecvCount=0;//接收数据计数器


/****************************************
*函数名称:SendByte
*输    入:byte 要发送的字节
*输    出:无
*功    能:串口发送单个字节
******************************************/
void SendByte(unsigned char b)
{
     unsigned char i=8;
     
     TXD=0;

     TIMER_ENABLE();
     TIMER_WAIT();
     

     while(i--)
	 {
        if(b&1)TXD=1;
        else    TXD=0;

        TIMER_WAIT();
        
        b>>=1;

     }

     
     TXD=1;

     TIMER_WAIT();
     TIMER_DISABLE();
}
/****************************************
*函数名称:RecvByte
*输    入:无
*输    出:单个字节
*功    能:串口 接收单个字节
******************************************/
unsigned char RecvByte(void)
{
     unsigned char i;
	 unsigned char b=0;
     
     TIMER_ENABLE();
     TIMER_WAIT();

     for(i=0;i<8;i++)
	 {
	     if(RXD)b|=(1<<i);

		 TIMER_WAIT();
	 }

     TIMER_WAIT();  //等待结束位
     TIMER_DISABLE();
  
	 return b;

}
/****************************************
*函数名称:PrintfStr
*输    入:pstr 字符串
*输    出:无
*功    能:串口 打印字符串
******************************************/
void PrintfStr(char * pstr)
{
      while(pstr && *pstr)
	 {
	       SendByte(*pstr++);
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
     TMOD=0x02; 
     TR0=0;
     TF0=0;
     TH0=(256-99);
     TL0=TH0;
     ET0=1;
     EA=1;
}
/****************************************
*函数名称:StartBitCome
*输    入:无
*输    出:0/1
*功    能:是否有起始位到达
******************************************/
unsigned char StartBitCome(void)
{
         return (RXD==0);
}
/****************************************
*函数名称:main
*输    入:无
*输    出:无
*功    能:函数主体
******************************************/
void main(void)
{
     unsigned char i;

     TimerInit();

	 PrintfStr("Hello 8051\r\n");

	 while(1)
	 {
	    if(StartBitCome())
	    {	                 
           RecvBuf[RecvCount++]=RecvByte();
           
           if(RecvCount>=RECEIVE_MAX_BYTES)
           {
              RecvCount=0;

              for(i=0;i<RECEIVE_MAX_BYTES;i++)
              {
                  SendByte(RecvBuf[i]);
              }
           }  	 
        }
 
	 }
}
/****************************************
*函数名称:Timer0IRQ
*输    入:无
*输    出:无
*功    能:T/C0中断服务函数
******************************************/
void Timer0IRQ(void) interrupt 1 using 0
{
     fTimeouts=1;
} 

