#define	 	P_TimerA_Data      	(volatile int*)0x7000
unsigned char 	g_ucIntFlag=0;     
unsigned int  	g_uisum=0;

main()
	{
		unsigned int g_uifx=0;
		unsigned int fx=0;
		Init_IOB();
		RunTime2Hz();			//���ж�
		TmbCount();				//��ʼ����
		while(1)
		{
			while(g_ucIntFlag)		//��ʱ2��������ֵ
				{						
					g_uifx=*(P_TimerA_Data);										
					g_ucIntFlag = 0;				
					*(P_TimerA_Data)=0;
					fx=	g_uifx/2;	//������ⲿʱ��Դ��Ƶ��
				}
		}
	
	}