/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */
#include "stc.h"            //加载"stc.h"
/****************************************
*函数名称:UARTInit
*输    入:无
*输    出:无
*功    能:串口初始化
******************************************/
void UARTInit(void)        
{
    SCON =0x50;              //8位数据位，允许接收
    T2CON=0x34;              //由T/C2作为波特率发生器
    RCAP2L=0xD9;             //波特率为9600的低8位
    RCAP2H=0xFF;             //波特率为9600的高8位
}
/****************************************
*函数名称:UARTSendByte
*输    入:byte 要发送的字节
*输    出:无
*功    能:串口发送单个字节
******************************************/
void UARTSendByte(unsigned char byte)
{
     SBUF=byte;               //缓冲区装载要发送的字节
     while(TI==0);            //等待发送完毕,TI标志位会置1
     TI=0;                     //清零发送中断标志位
} 
/****************************************
*函数名称:main
*输    入:无
*输    出:无
*功    能:函数主体
******************************************/
void main(void)          
{
    unsigned char recv;       //声明变量recv
    UARTInit();                 //串口初始化
    while(1)                    //进入死循环
    {
       if(RI)                      //检测RI标志位置1
       {
          RI=0;                     //清零RI标志位
          recv=SBUF;               //读取接收到的数据
          UARTSendByte(recv);    //返回接收到的数据
       }
    }
}
