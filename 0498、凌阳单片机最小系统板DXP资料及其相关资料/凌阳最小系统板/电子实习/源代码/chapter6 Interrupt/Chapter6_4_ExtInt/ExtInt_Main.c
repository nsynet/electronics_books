#include	"SPCE061.H"
main()
{
	*P_IOA_Dir=0xff; 				//IOA0~IOA7 output
    *P_IOA_Attrib=0xff;
    *P_IOA_Data = 0x00;

    *P_IOB_Dir=0x00;              	//IOB2,input     
	*P_IOB_Attrib=0x00; 
	*P_IOB_Data=0x04;
	*P_INT_Ctrl=C_IRQ3_EXT1; 		//Open IRQ3_EXT1 interrupt
	__asm("INT IRQ");
	while(1)
	{
		*P_Watchdog_Clear = C_WDTCLR;
	}		
}	