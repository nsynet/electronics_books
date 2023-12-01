#include	"SPCE061.H"
#define	TIMER_DATA_FOR_4KHZ	(0xffff - 2048)   	//0.5 second
main()
{
	*P_IOA_Dir=0xffff;							//IOA0~IOA4 initial: output
	*P_IOA_Attrib=0xffff;
	*P_IOA_Data=0x00ff;
	
	*P_IOB_Dir=0xffff;							//IOB0~IOB4 initial: output
	*P_IOB_Attrib=0xffff;
	*P_IOB_Data=0x00ff;
	
	*P_TimerB_Data=TIMER_DATA_FOR_4KHZ;			//TimerB setup
	*P_TimerB_Ctrl=C_SourceA_4096Hz;

	*P_INT_Ctrl=C_IRQ4_1KHz|C_IRQ2_TMB;			//Open interrupt
	__asm("int irq");
	while(1)
		*P_Watchdog_Clear=0x0001;
}