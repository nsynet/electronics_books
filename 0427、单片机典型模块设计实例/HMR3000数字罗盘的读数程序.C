#include <reg52.h>
#include <absacc.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#define 	uchar unsigned char
#define 	uint unsigned int
#define 	dsyawh 	XBYTE[0x0600] // 定义双端口RAM中的存储单元地址；
#define 	dsyawl 	XBYTE[0x0100]
#define 	dspitchh 	XBYTE[0x0200]
#define 	dspitchl 	XBYTE[0x0300]
#define 	dsrollh 	XBYTE[0x0400]
#define 	dsrolll 	XBYTE[0x0500]

sbit P1_0=P1^0;
sbit P1_2=P1^2;
uchar idata 	stringyaw[6];
uchar idata 	stringpitch[6];
uchar idata 	stringroll[6];
uint k, i,j;
uint yaw0,yaw0flag;
uint record,number;
uint iyaw, ipitch, iroll;
uint numbercoma;
uint len1,len2,len3;
uint numyaw,numroll,numpitch;


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
P1_0=0;
k=2;
	 
dsyawh=0;	
dsyawl=0;	
dspitchh=0;
dspitchl=0;
dsrollh=0;	
dsrolll=0;
yaw0flag=0;
i=0;
P1_2=1;
while(1);
}	
// 由于采用的是专用的通信单片机，可以使用中断方式进行串行通信，提高通信质量。
serial () interrupt 4 using 1	
{
RI=0; //软件清除中断标志位
//判断是否收到HPR格式语句的第一个字符"$"，其数值为0x24，如果收到，则开始记录数据，
//并设置记录标志record＝1。*/
if (SBUF==0x24)
{
record=1;
i=0;
iyaw=0; 			//记录航向数据字符数量的变量
ipitch=0; 			//记录俯仰数据字符数量的变量
iroll=0; 			//记录横滚数据字符数量的变量
numbercoma=0; 		// 记录逗号数量的变量
}
		
if (record==1)  // 开始处理HPR中的数据信息
{
	//利用HPR数据中的逗号间隔，区分接收到的字符处于何种姿态数据中。
	if(SBUF==0x2c)	{numbercoma++;}
					
	// 第一个逗号之后的字符属于航向数据，参见HRP语句
	if (numbercoma==1)
	{	
	stringyaw[iyaw]=SBUF; 		// 将字符放入航向字符串"stringyaw[ ]"中
	iyaw++;  
	}

	// 第三个逗号之后的字符属于俯仰数据
	if (numbercoma==3) 
	{
	stringpitch[ipitch]=SBUF; 		// 将字符放入俯仰字符串"stringpitch[ ]"中
	ipitch++;
	}

	// 第五个逗号之后的字符属于滚转数据
	if (numbercoma==5)
	{
stringroll[iroll]=SBUF; // 将字符放入横滚字符串"stringroll[ ]"中
		iroll++;
	}

	//判断是否收到HPR格式语句的字符"*"，如果收到，则结束记录，开始处理。
	if (SBUF=='*')
	{		
		stringyaw[iyaw]='\0';   		// 给出结束航向数据字符串的结束符
		stringpitch[ipitch]='\0';
		stringroll[iroll]='\0';
					
		// 开始处理航向数据的相关字符，转化为数据格式
		j=0;			
		// 将航向字符用sprintf()函数连接成字符串，并舍掉最后一个逗号
		len1=sprintf(stringyaw,"%s",stringyaw+1);   
		
//用atoi()函数将字符串转化为数据格式
		if (len1!=0)
{
numyaw=atoi(stringyaw);	
}	
					
		// 开始处理俯仰数据的相关字符，转化为数据格式
		j=0;
		len2=sprintf(stringpitch,"%s",stringpitch+1);
		if (len2!=0)
{
 numpitch=atoi(stringpitch); 	
}
					
		// 开始处理滚转数据的相关字符，转化为数据格式  
		j=0;      
		len3=sprintf(stringroll,"%s",stringroll+1);
		if (len3!=0)
{
 numroll=atoi(stringroll);   
}

// 返回初始值；	
numyaw=0;
numroll=0;
numpitch=0;
numbercoma=0;
record=0;
ipitch=0;
iroll=0;
iyaw=0;
	}
}
} 


