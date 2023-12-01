#include	"SPCE061.H"
main()
{
	*P_IOA_Dir=0xFFFF;  			   
	*P_IOA_Attrib=0xFFFF; 
	*P_IOA_Data=0xFFFF; 

	*P_TimerA_Ctrl=C_SourceA_8192Hz+C_SourceB_1; 	//TimerA:8192Hz
	*P_TimerA_Data=0xFFAF;				 			//10 ms   

	*P_INT_Ctrl=C_IRQ1_TMA;
	__asm("INT IRQ");									
	
	while(1)
	*P_Watchdog_Clear = C_WDTCLR;
}							 

		

