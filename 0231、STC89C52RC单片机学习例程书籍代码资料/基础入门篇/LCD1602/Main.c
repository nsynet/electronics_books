/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */


#include "stc.h"
#include <intrins.h>
/***************************************************
 *          大量宏定义，便于代码移植和阅读
 ***************************************************/
#define NOP()             _nop_() 
#define HIGH               1
#define LOW                0
#define LS164_DATA(x)      {if((x))P0_4=1;else P0_4=0;}         
#define LS164_CLK(x)       {if((x))P0_5=1;else P0_5=0;} 
#define LCD1602_LINE1        0
#define LCD1602_LINE2        1
#define LCD1602_LINE1_HEAD   0x80
#define LCD1602_LINE2_HEAD   0xC0
#define LCD1602_DATA_MODE    0x38
#define LCD1602_OPEN_SCREEN  0x0C
#define LCD1602_DISP_ADDRESS 0x80
#define LCD1602_RS(x)      {if((x))P0_0=1;else P0_0=0;}//RS引脚控制
#define LCD1602_RW(x)      {if((x))P0_1=1;else P0_1=0;}//RW引脚控制
#define LCD1602_EN(x)      {if((x))P0_2=1;else P0_2=0;}//EN引脚控制
#define LCD1602_PORT         LS164Send                     //发送数据


/********************************************
*函数名称:DelayNus
*输    入:t 延时时间
*输    出:无
*说    明:微秒级延时
********************************************/
void DelayNus(unsigned int t)
{
	unsigned int d=0;

	d=t;

	do
	{
		NOP();

	}while(--d >0);	
}
/********************************************
*函数名称:LS164Send
*输    入:byte 要发送的字节
*输    出:无
*说    明:74LS164发送数据
********************************************/
void LS164Send(unsigned char byte)
{
   unsigned char j;

   for(j=0;j<=7;j++)
   {

     if(byte&(1<<(7-j)))
     {
	    LS164_DATA(HIGH);
	 }
	 else
	 {
	    LS164_DATA(LOW);
	 }

     LS164_CLK(LOW); 
     LS164_CLK(HIGH);
       
   }

}
/********************************************
*函数名称:LCD1602WriteByte
*输    入:byte 要写入的字节
*输    出:无
*说    明:LCD1602 写字节
********************************************/
void LCD1602WriteByte(unsigned char byte)
{
     LCD1602_PORT(byte);
     LCD1602_RS(HIGH);
     LCD1602_RW(LOW);
     LCD1602_EN(LOW);
     DelayNus(50);
     LCD1602_EN(HIGH);
}
/********************************************
*函数名称:LCD1602WriteCommand
*输    入:command 要写入的命令
*输    出:无
*说    明:LCD1602 写命令
********************************************/
void LCD1602WriteCommand(unsigned char command)
{
     LCD1602_PORT(command);
     LCD1602_RS(LOW);
     LCD1602_RW(LOW);
     LCD1602_EN(LOW);
     DelayNus(50);
     LCD1602_EN(HIGH);
}
/********************************************
*函数名称:LCD1602SetXY
*输    入:x 横坐标 y 纵坐标
*输    出:无
*说    明:LCD1602 设置坐标
********************************************/
void LCD1602SetXY(unsigned char x,unsigned char y)
{
	 unsigned char address;

     if(y == LCD1602_LINE1)
     {
        address=LCD1602_LINE1_HEAD+x;
     }
     else
     {
        address=LCD1602_LINE2_HEAD+x;
     }

	 LCD1602WriteCommand(address);
}
/********************************************
*函数名称:LCD1602PrintfString
*输    入:x 横坐标 y 纵坐标 s字符串
*输    出:无
*说    明:LCD1602 打印字符串
********************************************/
void LCD1602PrintfString(unsigned char x,
                         unsigned char y,
                         unsigned char *s)
{
	 LCD1602SetXY(x,y);
	 
     while(s && *s)
     {
        LCD1602WriteByte(*s);
        s++;
        
     }
}
/********************************************
*函数名称:LCD1602ClearScreen
*输    入:无
*输    出:无
*说    明:LCD1602 清屏
********************************************/ 
void LCD1602ClearScreen(void)
{
	 LCD1602WriteCommand(0x01);
     DelayNus(50);
}
/********************************************
*函数名称:LCD1602Init
*输    入:无
*输    出:无
*说    明:LCD1602 初始化
********************************************/
void LCD1602Init(void)
{
	 LCD1602ClearScreen();
     LCD1602WriteCommand(LCD1602_DATA_MODE);//显示模式设置，设置16x2显示，5x7点阵，
                                              //8位数据接口
     LCD1602WriteCommand(LCD1602_OPEN_SCREEN);//开显示
     LCD1602WriteCommand(LCD1602_DISP_ADDRESS); //起始显示地址
     LCD1602ClearScreen();
}
/********************************************
*函数名称:PortInit
*输    入:无
*输    出:无
*说    明:I/O口初始化
********************************************/
void PortInit(void)
{
	 P0=P1=P2=P3=0xFF;
}
/********************************************
*函数名称:main
*输    入:无
*输    出:无
*说    明:函数主体
********************************************/
void main(void)
{
     PortInit();
     LCD1602Init();
     LCD1602PrintfString(0,LCD1602_LINE1,"0123456789");
	 LCD1602PrintfString(0,LCD1602_LINE2,"ABCDEFGHIJ");	

     while(1)
     {
		;//空操作
     }
}

