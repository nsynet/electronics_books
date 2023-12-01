/*****************************************************
*文件名称：DAC082Main.c
*文件功能：实验板上da转换模块dac0832测试程序
*版本：    V0.0.1 
*作者：	   yd
*时间：	   09.07.22
*****************************************************/
#include <AT89X52.h>
#define uchar unsigned char
#define uint  unsigned int
//------------DAC0832端口定义-----------------------
#define  CHOOSE0832  {P2_5 =0;P2_6 =0;P2_7 =0;}	 //0832片选择
#define  PORT0832    P0   //0832数据端口
//--------------------------------------------------
/********************************************************************************************
* 函数名称：Delay(uint a)
* 功    能：延迟时间=a*1ms
* 入口参数：
* 出口参数：无
*********************************************************************************************/
void Delay(uint a)
{
   uchar  i;
   while(a--)
   for(i=0;i<125;i++);
}
/*******************************************************
*函数名称：write0832(uchar a)
*函数功能：写DA转换芯片0832数据
*入口参数：a,要写的数据
*出口参数：无
*******************************************************/
void write0832(uchar a)
{
  CHOOSE0832;
  Delay(5);
  PORT0832 =a; 
}
void main()
{
   uchar temp;
   temp=0x00;
   while(1)
   {
     write0832(temp);
	 Delay(50);
	 if(temp<0xff)
	 {
	   temp++;
	 }
	 else
	 {
	   temp=0x00;
	 }
   }
}