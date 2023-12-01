//03-06-05
//SACM_A2000非自动方式（编程控制）播放语音
//本例要链接语音库sacmv25.lib，以及和该库对应的hardware.asm。
#define		DAC1			1
#define		Full			1
#include	"A2000.h"
#define P_Watchdog_Clear		(volatile unsigned int *)0x7012   
main()
{ 
  extern long   RES_D1_24K_SA,RES_D1_24K_EA;    //定义语音资源的首末地址标号
  long  int Addr;								//定义地址变量
  int	Ret = 0;								//定义获取语音数据变量并初始化
  
	Addr=RES_D1_24K_SA;					  		//送入语音队列的首址
	 
	SACM_A2000_Initial(0);						//非自动方式播放的初始化
	 
    SACM_A2000_InitDecoder(DAC1);				//开始对A2000的语音数据以非自动方式解码 	
	
     while(1)
	{
		*P_Watchdog_Clear=0x0001;
		if(SACM_A2000_TestQueue()!=Full)
		{
			Ret =SP_GetResource(Addr);   
	        SACM_A2000_FillQueue(Ret);
	        Addr++;
    	}
 
         if(Addr< RES_D1_24K_EA )				//如果该段语音未播完，即未到达末地址时
         SACM_A2000_Decoder();					//获取资源并进行解码，再通过中断服务子程序送入DAC通道播放
         else
         SACM_A2000_Stop();						//否则，停止播放
    }  
}

