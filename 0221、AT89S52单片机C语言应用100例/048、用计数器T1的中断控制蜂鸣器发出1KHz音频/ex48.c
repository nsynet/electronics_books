//实例48：用计数器T1的中断控制蜂鸣器发出1KHz音频
#include<reg51.h>  //  包含51单片机寄存器定义的头文件
sbit sound=P3^7;  //将sound位定义为P3.7引脚
/**************************************************************
函数功能：主函数
**************************************************************/
void main(void)
{
   EA=1;                  //开总中断
	ET1=1;                 //定时器T1中断允许         
	TMOD=0x10;             //TMOD=0001 000B，使用定时器T1的模式1
	TH1=(65536-921)/256;   //定时器T1的高8位赋初值
   TL1=(65536-921)%256;  //定时器T1的高8位赋初值
	TR1=1;                 //启动定时器T1
	while(1)//无限循环等待中断
       ;
 }
/**************************************************************
函数功能：定时器T1的中断服务程序
**************************************************************/
void Time1(void) interrupt 3 using 0 //“interrupt”声明函数为中断服务函数
 {
   sound=~sound;
  	TH1=(65536-921)/256;   //定时器T1的高8位重新赋初值
   TL1=(65536-921)%256;  //定时器T1的高8位重新赋初值
 }

