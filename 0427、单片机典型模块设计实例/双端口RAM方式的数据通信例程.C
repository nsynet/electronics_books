#include <reg52.h>
#include <absacc.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#define 	uchar unsigned char
#define 	uint unsigned int
uint numyaw,numroll,numpitch;

#define 	dsyawh 	XBYTE[0x0600] // 定义双端口RAM中的存储单元地址；
#define 	dsyawl 	XBYTE[0x0100]
#define 	dspitchh 	XBYTE[0x0200]
#define 	dspitchl 	XBYTE[0x0300]
#define 	dsrollh 	XBYTE[0x0400]
#define 	dsrolll 	XBYTE[0x0500]
sbit P1_2=P1^2;
//主函数，初始化串口和变量
main()
{	 
TMOD=0x20;
TL1=0xfd;
TH1=0xfd;
SCON=0x50;
PCON=0x00;
	 
IE=0x90;
TR1=1;
P1_2=1;
while(1);
}	

// 由于采用的是专用的通信单片机，可以使用中断方式进行串行通信，提高通信质量。
serial () interrupt 4 using 1	
{
RI=0; //软件清除中断标志位
//判断是否收到HPR格式语句的第一个字符"$"，其数值为0x24，如果收到，则开始记录数据，
if (SBUF==0x24)
{
// …… 省略数据的记录，详细内容见前文的HMR3000数字罗盘和单片机的通信实例
}
		
// numyaw=atoi(stringyaw);	
// numpitch=atoi(stringpitch); 	
// numroll=atoi(stringroll);   

// 将数据写入双端口RAM，并返回初始值；	
dsyawh=numyaw/256;
dsyawl=numyaw%256;
dspitchh=numpitch/256;
dspitchl=numpitch%256;
dsrollh=numroll/256;
dsrolll=numroll%256;
} 

