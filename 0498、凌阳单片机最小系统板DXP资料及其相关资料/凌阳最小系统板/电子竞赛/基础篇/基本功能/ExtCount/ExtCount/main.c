#define	 	P_TimerA_Data      	(volatile int*)0x7000
unsigned char 	g_ucIntFlag=0;     
unsigned int  	g_uisum=0;

main()
	{
		unsigned int g_uifx=0;
		unsigned int fx=0;
		Init_IOB();
		RunTime2Hz();			//开中断
		TmbCount();				//开始计数
		while(1)
		{
			while(g_ucIntFlag)		//定时2秒后读计数值
				{						
					g_uifx=*(P_TimerA_Data);										
					g_ucIntFlag = 0;				
					*(P_TimerA_Data)=0;
					fx=	g_uifx/2;	//计算出外部时钟源的频率
				}
		}
	
	}