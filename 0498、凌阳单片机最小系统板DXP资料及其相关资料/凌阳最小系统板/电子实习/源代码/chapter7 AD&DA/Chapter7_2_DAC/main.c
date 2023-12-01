#include "SPCE061V004.H"
main()
{
	unsigned int uiData,i;
	__asm("int off");                   //disable interrupt
    *P_DAC_Ctrl=C_DA1_Direct;			//Latch to DAC1 directly
    uiData=0x0;
	while(1)
	{
	    *P_Watchdog_Clear=C_WDTCLR;		
	    *P_DAC1=uiData;               	//output
	    i=32;
	    while(i--);			        
	    uiData+=0x0040;                 
	}
}	

