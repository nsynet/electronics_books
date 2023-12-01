#include <stdio.h>
#include <stdlib.h>
#include <absacc.h>
#include <reg51.h>                          
#define uchar unsigned char
#define uint unsigned int
sbit P1_0=P1^0;
void INITIAL(void);					/*液晶显示初始化*/
void CLEAR(void);					/*液晶显示清屏*/
void locate(uchar page, uchar column);			/*指定首字符显示位置*/
void show(void);						/*从当前位置开始显示显示缓冲区BUFFER中的内容*/
char data 	BUFFER[15];				/*显示缓冲区*/
uchar data 	NDIG;					/*待显示的字符数*/
int xdata 	sumup=0;					/*测试用的变量*/
uchar idata 	stringgps[8];
uint k,i,j,k1;
uint record,number;
uint igps;
uint numbercoma;
uint len1,len2,len3;
uint numgps;

// main()主函数， 初始化变量和液晶的初始显示内容。
void main(void)
{	
TMOD=0x20; 					// 初始化串口
TL1=0xfd;
TH1=0xfd;
SCON=0x50;
PCON=0x00;
IE=0x90;
TR1=1;
P1_0=0;

	INITIAL();						/*显示初始化*/
	CLEAR();						/*清屏*/
	/*从page 3，column 4开始显示"sumup=rdy"*/
	/*固定长度的字符串显示*/
	locate(3,4);
	NDIG=sprintf(BUFFER,"sumup=rdy");
	show();						//显示子函数
	sumup=12345;
	/*从page 2，column 4开始显示"sumup=12345"，为含数值的长度不确定的字符串显示*/
	locate(2,4);
	NDIG=sprintf(BUFFER,"sumup=%d",sumup);
	show(); 						//显示子函数
	/*按键查询方式显示初始内容*/
	for (;;)
	{
		locate(0,2); 				/*从page 0，column 2开始显示"k1:<被按下的次数>"*/
		NDIG=sprintf(BUFFER,"k1=%d    ",k1);
		show();
	}
}

serial () interrupt 4 using 1	
{
RI=0; 					//软件清除中断标志位
//判断是否收到GPRMC格式语句的第一个字符"$"，其数值为0x24，收到后开始记录数据，
//并设置记录标志record＝1。*/
if (SBUF==0x24)
{
record=1;
i=0;
igps=0; 				// 记录纬度数据字符数量的变量
numbercoma=0; 		// 记录逗号数量的变量
}
		
if (record==1)  // 开始处理GPRMC中的数据信息
{
	//利用GPRMC数据中的逗号间隔，区分接收到的字符处于何种数据中。
	if(SBUF==0x2c)	{numbercoma++;}
	// 第三个逗号之后的字符属于纬度数据
	if (numbercoma==3) 
	{
	stringgps[igps]=SBUF; 		// 将字符放入字符串"stringgps "中
	igps++;
	}

	//判断是否收到GPRMC格式语句的字符"*"，如果收到，则结束记录，开始处理。
	if (SBUF=='*')
	{		
		stringgps[igps]='\0';   		// 给出结束数据字符串的结束符
					
		// 开始处理俯仰数据的相关字符，转化为数据格式
		j=0;
		len2=sprintf(stringgps,"%s",stringgps+1);
		         NDIG=sprintf(BUFFER,"k1:%d    ",k1);
		         show();
		if (len2!=0)
{
 numgps=atoi(stringgps); 	
}

// 返回初始值；	
numgps=0;
numbercoma=0;
record=0;
igps=0;
	}
}
}
 

