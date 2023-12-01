//03-05-25
#include	"SPCE061.H"
main()
{
	*P_IOA_Dir=0xffff;							//IOA0~IOA4 initial: output
	*P_IOA_Attrib=0xffff;
	*P_IOA_Data=0x0000;
	
	*P_IOB_Dir=0xffff;							//IOB0~IOB4 initial: output
	*P_IOB_Attrib=0xffff;
	*P_IOB_Data=0x0000;
	
	*P_TimeBase_Setup=C_TMB1_64Hz|C_TMB2_128Hz;	//Select TimeBase
	*P_INT_Ctrl=C_IRQ6_TMB1|C_IRQ6_TMB2;		//Open interrupt
	__asm("int irq");
	while(1)
		*P_Watchdog_Clear=0x0001;
}
	
	
