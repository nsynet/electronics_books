/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */
#include "stc.h"
/****************************************
*函数名称:UARTInit
*输    入:无
*输    出:无
*功    能:串口初始化
******************************************/
void UARTInit(void)                
{
     SCON =0x50;                     //8位数据位
	T2CON=0x34;                     //由T/C2作为波特率发生器
	RCAP2L=0xD9;                    //波特率为9600的低8位
	RCAP2H=0xFF;                    //波特率为9600的高8位
}
/****************************************
*函数名称:UARTSendByte
*输    入:byte 要发送的字节
*输    出:无
*功    能:串口 发送单个字节
******************************************/
void UARTSendByte(unsigned char byte)
{
	SBUF=byte;                       //缓冲区装载要发送的字节
	while(TI==0);                   //等待发送完毕,TI会置1
	TI=0;                             //清零TI
} 
/****************************************
*函数名称:UARTPrintString
*输    入:str 字符串
*输    出:无
*功    能:串口 打印字符串
******************************************/
void UARTPrintString(char *str) 
{
	while(str && *str)              //检测str是否有效
	{
		UARTSendByte(*str++);      //发送数据
	}
}
/****************************************
*函数名称:main
*输    入:无
*输    出:无
*功    能:函数主体
******************************************/
void main(void)                     
{
	UARTInit();                      //串口初始化
	P3=0xFF;                         //P3口引脚输出高电平
	IT1=0;                           //外部中断1为低电平触发
	EX1=1;                           //允许外部中断1中断
	EA=1;                            //开启全局中断
     while(1);                       //死循环
}
/****************************************
*函数名称:ExInt1IRQ
*输    入:无
*输    出:无
*功    能:外部中断1中断服务函数
******************************************/
void ExInt1IRQ(void)interrupt 2           //外部中断1中断服务函数
{
	UARTPrintString("KEY INT\r\n");        //打印信息
}

