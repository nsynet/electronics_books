//实例33：用函数型指针控制P1口灯花样
#include<reg51.h>   //包含51单片机寄存器定义的头文件
unsigned char code Tab[]={0xFE,0xFD,0xFB,0xF7,0xEF,0xDF,0xBF,0x7F};
//流水灯控制码，该数组被定义为全局变量
/**************************************************************
函数功能：延时约150ms
**************************************************************/
 void delay(void)   
{
   unsigned char m,n;
	 for(m=0;m<200;m++)
	  for(n=0;n<250;n++)	   
           ;
 }
/**************************************************************
函数功能：流水灯左移
**************************************************************/
void led_flow(void)
{
  unsigned char i;
  for(i=0;i<8;i++)  //8位控制码
    {
 	   P0=Tab[i];
		delay();
	  }
	
}
/**************************************************************
函数功能：主函数
**************************************************************/ 
 void main(void)
 {
   void (*p)(void); //定义函数型指针，所指函数无参数，无返回值	
	p=led_flow;  //将函数的入口地址赋给函数型指针p
	while(1)
	 (*p)();     //通过函数的指针p调用函数led_flow（）
}