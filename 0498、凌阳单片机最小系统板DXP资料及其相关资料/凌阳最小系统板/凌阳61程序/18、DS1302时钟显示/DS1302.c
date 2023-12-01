//	工程名称：	1602.spj
//	功能描述：	语音电子时钟的制作
//	涉及的库：	CMacro1016.lib
//	组成文件：	main.c
//				LCD1602_Driver.asm
//				LCD1602_User.h/
//	硬件连接：	IOA8-IOA15 ---- D0-D7（1602液晶）
//				IOB12 ---- EP(1602液晶)       实时时钟时钟线引脚  IOB11    CLK
//				IOB14 ---- RS（1602液晶）     实时时钟数据线引脚  IOB15    IO
//				IOB13 ---- R/w（1602液晶）    实时时钟复位线引脚  IOB10    RST
#include<SPCE061A.h>
#include<DS1302.h>    //DS1302时钟驱动
#include<1602.h>      //1602液晶显示驱动
#define	uchar unsigned char  
char d[32]={'D', 'a', 't', 'a', ':', ' ','0', '0', '-', '0',  '0', '-', '0', '0', ' ',' ', 	

       	    'T', 'i', 'm', 'e', ':', ' ','0', '0', ':', '0',  '0', ':', '0', '0', ' ',' ', };
unsigned char now_time_date[8]={0x00,0x19,0x14,0x31,0x07,0x05,0x09,0x00};//秒，分，时，日,月，星期，年,禁止写

//========================================================
//	语法格式：	void Delay(unsigned int uiTime)
//	实现功能：	延时，在调用Delay(1)时,延时时间小于1us
//	参数：		uiTime
//	返回值：	无
//========================================================

void Delay(unsigned int uiTime)
{
	while(uiTime > 0)
	{
		uiTime -= 1;
	}
}

//========================================================
//	语法格式：	void PowerOn(void)
//	实现功能：	开机画面
//	参数：		无
//	返回值：	无
//========================================================
void PowerOn(void)
{	
	int i;
    uchar h,v;
	LCD1602_Initial();			//调用初始化程序，包括进行端口初始化和LCD初始化
	Write_Command(0x0080);		//设置当前DDRAM地址为0x00
	for(h=0;h<16;h++)
    {
   	   Write_Data(d[h]);  
    }
    
	Write_Command(0x00c0);		//在第二行显示
	
	for(v=(16);v<32;v++)
    {
    	Write_Data(d[v]);  ///n表示有写几位数据
     }
	for(i=0;i<20;i++)
	{
		Delay(65535);						//延时
		*P_Watchdog_Clear = 0x0001;			//清看门狗
	}
	Write_Command(0x0001);
}

void Print(unsigned char *str0,unsigned char *str1)               //  输出当前所取得的时间
{   
	uchar h,v;
	
	Write_Command(0x0080);		//设置当前DDRAM地址为0x00，显示Data:
	for(h=0;h<5;h++)
    {
   	   Write_Data(d[h]);  
    }
    
	Write_Command(0x00c0);		//在第二行显示,显示Time：            
	
	for(v=(16);v<21;v++)
    {
    	Write_Data(d[v]);  ///n表示有写几位数据
     }
     
   	*P_Watchdog_Clear = 0x0001;			//清看门狗
	
	Write_Command(0x0086);		//设置当前DDRAM地址为0x86，显示日期
	
	
	while(*str0!='\0')
	{
		Write_Data(*str0);
		str0++;
	}
	
	Write_Command(0x00C6);		//设置当前DDRAM地址为0xc6，显示时间
	
	while(*str1!='\0')
	{
		Write_Data(*str1);
		str1++;
	}
	
	Write_Command(0x00ce);		//在第二行显示,最后显示为空字符
	
	for(v=(30);v<32;v++)
    {
    	Write_Data(d[v]);  ///n表示有写几位数据
     }
}
int main(void)
{   
	SYSTEMTIME CurrentTime;  //定义CurrentTime为结构体类型
	
	*P_SystemClock = 0x0000;			//初始化，调整系统时钟24.576MHz/1，强振模式
	*P_IOB_Attrib = 0xffff;				//初始化IOB同相低电平输出口
	*P_IOB_Dir = 0xffff;
	*P_IOB_Data = 0x0000;
	
	PowerOn();							//开机界面：Data:  Time:
	
	LCD1602_Initial();					//调用初始化程序，包括进行端口初始化和LCD初始化
    Initial_DS1302();
    set_ds1302(0x80,now_time_date,8);   //设置初始时间，日期，年月
   	*P_Watchdog_Clear = 0x0001;		    //清看门狗
	while(1)
	{
	   	DS1302_GetTime(&CurrentTime);  //读取ds1302内部数据，并存储变量（结构体中定义的变量）
		DateToStr(&CurrentTime);       //将日期存储于DateString[]数组中（结构体中定义的数组）
		TimeToStr(&CurrentTime);       //将时间存储于TimeString[]数组中（结构体中定义的数组）
       	 
       	Print(CurrentTime.DateString,CurrentTime.TimeString);		               //输出时间
		*P_Watchdog_Clear = 0x0001;		//清看门狗
	}
}