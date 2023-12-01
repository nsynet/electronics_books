/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */
#include "stc.h"
#include "global.h"
#include "74LS164.h"
#include "LCD1602.h"
/***************************************************
 *          大量宏定义，便于代码移植和阅读
 ***************************************************/
#define LCD1602_LINE1         0         
#define LCD1602_LINE2         1         
#define LCD1602_LINE1_HEAD   0x80      
#define LCD1602_LINE2_HEAD   0xC0
#define LCD1602_DATA_MODE    0x38     
#define LCD1602_OPEN_SCREEN  0x0C
#define LCD1602_DISP_ADDRESS 0x80

#define LCD1602_RS(x)      {if((x))P0_0=1;else P0_0=0;}//控制RS引脚
#define LCD1602_RW(x)      {if((x))P0_1=1;else P0_1=0;}//控制RW引脚
#define LCD1602_EN(x)      {if((x))P0_2=1;else P0_2=0;}//控制EN引脚
#define LCD1602_PORT(x)    LS164Send((x))//写数据

/*************************************************************
* 函数名称:LCD1602WriteByte
* 输    入:byte 数据
* 输    出:无
* 说    明:LCD1602 写单个字节数据
**************************************************************/
void LCD1602WriteByte(UINT8 byte)
{
     LCD1602_PORT(byte);
     LCD1602_RS(HIGH);
     LCD1602_RW(LOW);
     LCD1602_EN(LOW);
     DelayNus(50);
     LCD1602_EN(HIGH);
}
/*************************************************************
* 函数名称:LCD1602WriteCommand
* 输    入:command 命令
* 输    出:无
* 说    明:LCD1602 写单个字节命令
**************************************************************/
void LCD1602WriteCommand(UINT8 command)
{
     LCD1602_PORT(command);
     LCD1602_RS(LOW);       
     LCD1602_RW(LOW);
     LCD1602_EN(LOW);
     DelayNus(50);
     LCD1602_EN(HIGH);
}
/*************************************************************
* 函数名称:LCD1602SetXY
* 输    入:x 横坐标
           y 纵坐标
* 输    出:无
* 说    明:LCD1602 设置x，y坐标
**************************************************************/
void LCD1602SetXY(UINT8 x,UINT8 y)
{
	 UINT8 address;

     if(y == LCD1602_LINE1) //第一行
     {
        address=LCD1602_LINE1_HEAD+x;
     }
     else                       //第二行
     {
        address=LCD1602_LINE2_HEAD+x;
     }
	 LCD1602WriteCommand(address);
}
/*************************************************************
* 函数名称:LCD1602PrintfString
* 输    入:x  横坐标
           y  纵坐标
		   *s 字符串
* 输    出:无
* 说    明:LCD1602 打印字符串
**************************************************************/
UINT8 LCD1602PrintfString(UINT8 x,
                          UINT8 y,
                          UINT8 *s)
{
     UINT8 i=0;

	 LCD1602SetXY(x,y);
	 
     while(s && *s)
     {
        LCD1602WriteByte(*s);
        s++;
        i++;
        
     }

     return i;
}

/*************************************************************
* 函数名称:LCD1602ClearScreen
* 输    入:无
* 输    出:无
* 说    明:LCD1602 清屏
**************************************************************/ 
void LCD1602ClearScreen(void)
{
	 LCD1602WriteCommand(0x01);//清屏命令
     DelayNus(50);
}

/*************************************************************
* 函数名称:LCD1602Init
* 输    入:无
* 输    出:无
* 说    明:LCD1602 初始化
**************************************************************/ 
void LCD1602Init(void)
{
	 LCD1602ClearScreen();
     LCD1602WriteCommand(LCD1602_DATA_MODE);    //显示模式设置，设置16x2显示，5x7点阵，
                                                //8位数据接口
     LCD1602WriteCommand(LCD1602_OPEN_SCREEN);  //开显示
     LCD1602WriteCommand(LCD1602_DISP_ADDRESS); //起始显示地址
     LCD1602ClearScreen();
}
