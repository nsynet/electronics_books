//*******************************************************************//
//Interrupt Service Routine For C language
//*******************************************************************//
#include	"SPCE061.H"
unsigned int g_uiOutput=0xffff;
void BREAK(void) __attribute__ ((ISR));
void BREAK(void)
{
}
void FIQ(void) __attribute__ ((ISR));
void FIQ(void)
{
}
void IRQ0(void) __attribute__ ((ISR));
void IRQ0(void)
{
}
void IRQ1(void) __attribute__ ((ISR));
void IRQ1(void)
{
}
void IRQ2(void) __attribute__ ((ISR));
void IRQ2(void)
{
}
void IRQ3(void) __attribute__ ((ISR));
void IRQ3(void)
{
}
void IRQ4(void) __attribute__ ((ISR));
void IRQ4(void)
{
}
void IRQ5(void) __attribute__ ((ISR));
void IRQ5(void)
{
}
void IRQ6(void) __attribute__ ((ISR));
void IRQ6(void)
{
	unsigned int i;
	g_uiOutput=~g_uiOutput;			//reverse
	if(!(*P_INT_Ctrl&0x0001))
	{	//IRQ_TMB2
		*P_INT_Clear=0x0001;		//clear INT flag
	}
	else
	{	//IRQ_TMB1
		*P_IOB_Data=g_uiOutput;		//output
		i=100;
		while(i--);			//delay
		*P_INT_Clear=0x0002;		//clear INT flag
	}
}
void IRQ7(void) __attribute__ ((ISR));
void IRQ7(void)
{
}

