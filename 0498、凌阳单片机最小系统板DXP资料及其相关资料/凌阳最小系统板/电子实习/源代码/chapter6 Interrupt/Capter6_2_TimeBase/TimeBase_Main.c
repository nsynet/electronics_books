#include	"SPCE061.H"
main()
{
	asm("INT OFF");					
									//output 
	*P_IOA_Dir=0x00FF;		
	*P_IOA_Attrib=0x00FF;	
	*P_IOA_Data=0x0000;		
	
	*P_INT_Ctrl=C_IRQ5_2Hz;			//Setup interrupt

	__asm("INT IRQ");					

	while(1)						
		*P_Watchdog_Clear = C_WDTCLR;
}
			


