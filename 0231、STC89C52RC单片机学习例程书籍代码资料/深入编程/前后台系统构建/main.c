/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */
#include "stc.h"
#include "Typedef.h"
#include "Process.h"

/****************************************
*函数名称:UARTInit
*输    入:无
*输    出:无
*功    能:串口初始化
******************************************/
static void UARTInit(void)        
{
     SCON =0x40;             
	T2CON =0x34;            
	RCAP2L=0xD9;           
	RCAP2H=0xFF;           
}
/****************************************
*函数名称:UARTSendByte
*输    入:byte 要发送的字节
*输    出:无
*功    能:串口数据发送
******************************************/
static void UARTSendByte(UINT8 byte)
{
	SBUF=byte;             
	while(TI==0);           
	TI=0;                   
}
/****************************************
*函数名称:PROC_SetData
*输    入:Wp  参数1
          Lp  参数2
*输    出:无
*功    能:进程-设置数据
******************************************/
PROC_API void PROC_SetData(WPARAM Wp,LPARAM Lp)
{
      static UINT8 cnt=1;
	  static UINT8 buf[8],i;

	  Wp=Wp;  //若不使用该变量,就自赋值,以免出现编译警告
	  Lp=Lp;  //若不使用该变量,就自赋值,以免出现编译警告

	  for(i=0; i<8; i++)
	  {
	      buf[i]=cnt+'0';
           	  
	  }

	  if(++cnt>9)
      {
	       cnt=1;
	  }

      SetCurProcIsAlive(FALSE);     //当前进程无效

	  SetProcIsAlive(PROC_SEND_DATA,//发送数据进程序号
	                 TRUE,          //激活
			 (WPARAM)buf,           //传入buf指针
			 (LPARAM)8);            //数据长度为8

}

/****************************************
*函数名称:PROC_SendData
*输    入:Wp  参数1
          Lp  参数2
*输    出:无
*功    能:进程-发送数据
******************************************/
PROC_API void PROC_SendData(WPARAM Wp,LPARAM Lp)
{
     UINT8  i;

	 UINT8 *pbuf=(UINT8 *)Wp;     //获取要发送的数据

	 UINT8  j=(UINT8)Lp;          //获取发送数据长度

	 for(i=0; i<j; i++)
	 {
	     UARTSendByte(*(pbuf+i)); //发送数据
	 }

	 for(i=0;i<255;i++)
	     for(j=0;j<255;j++);      //延时一会儿

	 for(i=0;i<255;i++)
	     for(j=0;j<255;j++);      //延时一会儿

     SetCurProcIsAlive(FALSE);    //当前进程无效

	 SetProcIsAlive(PROC_SET_DATA,//设置数据进程序号
	                TRUE,         //激活
			(WPARAM)0,            //参数1
			(LPARAM)0);           //参数2

}

/****************************************
*函数名称:main
*输    入:无
*输    出:无
*功    能:函数主体
******************************************/
void main(void)
{
     UARTInit();                //串口初始化

     while(1)
	 {
	 
	    ProcPerform();          //进程调度
	 
	 }
}

