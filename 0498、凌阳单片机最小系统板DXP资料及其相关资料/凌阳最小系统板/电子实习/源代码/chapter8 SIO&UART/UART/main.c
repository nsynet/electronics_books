//2003-06-03
//用UART来接收PC机的RS232串行接口的数据。如果接收到值为79（大写的字符"O"）的ACSII码，就点亮和
//IOA0～IOA7相连的LED，如果接收到值为67（大写的字符"C"）的ACSII码，就熄灭和IOA0～IOA7相连的LED。
#include	"SPCE061V004.H"
main()
{
	unsigned int uiData,Ret;
	*P_IOA_Dir=0xffff;						//IOA0~IOA7初始化为输出
	*P_IOA_Attrib=0xffff;
	*P_IOA_Data=0xffff;

	*P_UART_Command1=0x20;					//Uart内部复位
	*P_UART_Command1=0x00;
	
	*P_UART_BaudScalarHigh=0x00;			//波特率设置为115200bps
	*P_UART_BaudScalarLow=0x6B;

	*P_UART_Command1=0x000C;				//允许接收
	*P_UART_Command2=0x00C0;
		
	Ret=*P_UART_Data;						// 清接收缓冲区

	while(1)	
	{
		Ret=*P_UART_Command2;
		Ret=Ret&0x0080;
		while(Ret==0)						//等待接收完毕
		{
			Ret=*P_UART_Command2;
			Ret=Ret&0x0080;
			*P_Watchdog_Clear=C_WDTCLR;
		}
		uiData=*P_UART_Data;				//读出接收的数据
		if(uiData==79)
			*P_IOA_Data=0x0000;				//点亮LED
		else if(uiData==67)
			*P_IOA_Data=0xffff;				//熄灭LED
	}
}



