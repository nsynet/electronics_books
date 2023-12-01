//实例51-1：输出正脉宽为250微秒的方波
#include<reg51.h>   //包含51单片机寄存器定义的头文件
sbit u=P1^4;    //将u位定义为P1.4
/*******************************************
函数功能：主函数
******************************************/	
void main(void)
  {
   TMOD=0x02;            //TMOD=0000 0010B，使用定时器T0的模式2
   EA=1;                    //开总中断
	ET0=1;                  //定时器T0中断允许         
	TH0=256-250;   //定时器T0的高8位赋初值
	TL0=256-250;  //定时器T0的高8位赋初值
	TR0=1;                 //启动定时器T0
	while(1)                //无限循环，等待中断
       ;
 }
/**************************************************************
函数功能：定时器T0的中断服务程序
**************************************************************/
void Time0(void) interrupt 1 using 0 //"interrupt"声明函数为中断服务函数
{
   u=~u;  //将P1.4引脚输出电平取反，产生方波

 }
		