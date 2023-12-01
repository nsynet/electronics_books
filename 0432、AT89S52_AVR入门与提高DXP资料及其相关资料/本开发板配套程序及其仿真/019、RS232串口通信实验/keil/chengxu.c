/*******************************************************/
/*RS232接收显示实验 				        		   */
/*目标器件：AT89S52						        	   */
/*晶振:11.0592MHZ							    	   */
/*编译环境：Keil    						    	   */
/*******************************************************/

#include "reg52.h"		

unsigned char code tab[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};

unsigned char dat;				//定义全局变量

//串行口初始化程序
void Init_Com(void)
{
     TMOD = 0x20;
     PCON = 0x00;
     SCON = 0x50;			
     TH1 = 0xFd;
     TL1 = 0xFd;
     TR1 = 1;				
}

//LED数码管延时程序
void delay(void)
{
	int k;
	for(k=0;k<600;k++);
}

//串行中断服务程序
serial()interrupt 4 using 1
{
	if(RI)
	RI=0;
	dat=SBUF;
}

//LED数码管显示程序
void display(int k)
{
	P2=0xef;								//位选			
	P0=tab[k/1000];							//显示千位数字
	delay();								//延时
	P2=0xdf;								//位选
	P0=tab[k%1000/100];						//显示百位数字
	delay();								//延时
	P2=0xbf;								//位选
	P0=tab[k%100/10];						//显示十位数字
	delay();								//延时
	P2=0x7f;								//位选
	P0=tab[k%10];							//显示个位数字
	delay();								//延时
	P2=0xff;								//位选
}

//主程序
void main()
{   
   	P2=0xff;
  	P0=0xff;
	P1=0xff;
	EA=1;
	ES=1;
   	Init_Com();
   	while(1)
   {
      display(dat);							//显示数据
   }
}



