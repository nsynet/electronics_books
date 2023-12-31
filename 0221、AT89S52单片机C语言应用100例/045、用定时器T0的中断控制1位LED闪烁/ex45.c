//实例45：用定时器T0的中断控制1位LED闪烁
#include<reg51.h>  //  包含51单片机寄存器定义的头文件
sbit D1=P2^0;  //将D1位定义为P2.0引脚
/**************************************************************
函数功能：主函数
**************************************************************/
void main(void)
{
   EA=1;                  //开总中断
	ET0=1;                 //定时器T0中断允许         
	TMOD=0x01;             //使用定时器T0的模式2
	TH0=(65536-46083)/256; //定时器T0的高8位赋初值
	TL0=(65536-46083)%256; //定时器T0的高8位赋初值
	TR0=1;                 //启动定时器T0
	while(1)//无限循环等待中断
       ;
 }
/**************************************************************
函数功能：定时器T0的中断服务程序
**************************************************************/
void Time0(void) interrupt 1 using 0 //“interrupt”声明函数为中断服务函数
                 //其后的1为定时器T0的中断编号；0表示使用第0组工作寄存器 
 {
   D1=~D1;  //按位取反操作，将P2.0引脚输出电平取反
  	TH0=(65536-46083)/256; //定时器T0的高8位重新赋初值
	TL0=(65536-46083)%256; //定时器T0的高8位重新赋初值
 }


