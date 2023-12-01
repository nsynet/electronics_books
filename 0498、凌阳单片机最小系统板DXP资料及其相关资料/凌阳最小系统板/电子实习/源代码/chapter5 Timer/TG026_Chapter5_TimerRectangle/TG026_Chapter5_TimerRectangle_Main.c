//TimerA, 0.5 second, IOB output
#include	"SPCE061.H"
main()
{
	unsigned int uiOutput;
	uiOutput=0x0000;
					 
	*P_IOB_Dir=0xFFFF;  				//IOB Initial: OutPut			   
	*P_IOB_Attrib=0xFFFF; 
	*P_IOB_Data=0x0000; 

	*P_INT_Ctrl=C_IRQ1_TMA;				//Open Interrupt
	__asm("INT OFF");									
	
	*P_TimerA_Ctrl=C_SourceA_1+C_SourceB_1024Hz; 	//TimerA:1024Hz
	*P_TimerA_Data=0xFDFF;				 			//0.5 Second   
	while(1)						 
	{
		*P_Watchdog_Clear = C_WDTCLR;
		if(*P_INT_Ctrl&C_IRQ1_TMA)
		{			 
			*P_INT_Clear=C_IRQ1_TMA;         		//clear INT flag
			uiOutput ^= 0xFFFF;			 			//reverse
			*P_IOB_Data=uiOutput;         			//output rectangle
		}
	}
}	