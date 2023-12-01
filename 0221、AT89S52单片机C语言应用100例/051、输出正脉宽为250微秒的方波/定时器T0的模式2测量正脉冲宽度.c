//实例51-2：定时器T0的模式2测量正脉冲宽度
#include<reg51.h>   //包含51单片机寄存器定义的头文件
sbit ui=P3^2;  //将ui位定义为P3.0（INT0）引脚，表示输入电压
/*******************************************
函数功能：主函数
******************************************/	
void main(void)
  {
    TMOD=0x0a;   // TMOD=0000 1010B,使用定时器T0的模式2，GATE置1
    EA=1;         //开总中断
	 ET0=0;        //不使用定时器T0的中断     
	 TR0=1;        //启动T0
	 TH0=0;        //计数器T0高8位赋初值
	 TL0=0;        //计数器T0低8位赋初值
	 while(1)       //无限循环，不停地将TL0计数结果送P1口
     {
	    while(ui==0)  //INT0为低电平，T0不能启动
		   ;
		 TL0=0;       //INT0为高电平，启动T0计时，所以将TL0清0
		 while(ui==1) //在INT0高电平期间，等待，计时
		    ;
		P1=TL0;    //将计时结果送P1口显示		
	}
 }

		