#include	"SPCE061.H"
main()
{
    unsigned int uiTem;
    __asm("INT OFF");                
                    			
    *P_IOA_Dir = 0xff00;			//IOA0~IOA7:input;IOA8~IOA15:output          
    *P_IOA_Attrib = 0xff00;    
	*P_IOA_Data = 0x0000;  

    *P_INT_Ctrl = C_IRQ3_KEY;		//Open IRQ3_Key interrupt
    __asm("INT IRQ");                  		        

    uiTem = *P_IOA_Latch;			//Latch IOA0~IOA7            		

	while(1)                      	
	{
		*P_IOA_Data = 0xff00;  		//Turn off LED
    	*P_SystemClock = C_Sleep;	//Sleep;Wakeup when Key change
	}
}