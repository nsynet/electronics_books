//ex99  单片机数据发送程序
#include<reg51.h>       //包含单片机寄存器的头文件
/*****************************************************
函数功能：向PC发送一个字节数据
***************************************************/
void Send(unsigned char dat)
{
   SBUF=dat;
   while(TI==0)
      ;
    TI=0;
}
/*****************************************************
函数功能：延时1ms
(3j+2)i=(3×33+2) ×10=1010(微秒)，可以认为是1毫秒
***************************************************/
void delay1ms()
{
   unsigned char i,j;	
	 for(i=0;i<10;i++)
	  for(j=0;j<33;j++)
	   ;		 
 }
/*****************************************************
函数功能：延时若干毫秒
***************************************************/
void delaynms(unsigned char x)
{
 unsigned char i;
  for(i=0;i<x;i++)
     delay1ms();
}
/*****************************************************
函数功能：主函数
***************************************************/
void main(void)
{
   unsigned char i;
   TMOD=0x20;  //定时器T1工作于方式2 
   TH1=0xfd;   //根据规定给定时器T1赋初值
   TL1=0xfd;   //根据规定给定时器T1赋初值
   PCON=0x00;  //波特率9600
   TR1=1;      //启动定时器t1
   SCON=0x40;  //串口工作方式1
  while(1)
   {
	  for(i=0;i<200;i++)   //模拟检测数据
	     {
		    Send(i);        //发送数据i
			 delaynms(100);   //100ms发送一次检测数据			  
		  }		
   }
}



	     