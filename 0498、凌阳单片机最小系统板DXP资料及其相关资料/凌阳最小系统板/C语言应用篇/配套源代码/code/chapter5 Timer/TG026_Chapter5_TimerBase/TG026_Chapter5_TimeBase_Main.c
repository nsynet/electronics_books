#include	"SPCE061.H"
main()
{
	asm("INT OFF");					
									//output 
	*P_IOB_Dir=0xFFFF;		
	*P_IOB_Attrib=0xFFFF;	
	*P_IOB_Data=0xFFFF;		
	
	*P_TimeBase_Setup=0;			//timebase=8Hz
	*P_INT_Ctrl=C_IRQ6_TMB2;		//Setup interrupt

	__asm("INT IRQ");					

	while(1)						
		*P_Watchdog_Clear = C_WDTCLR;
}
			

