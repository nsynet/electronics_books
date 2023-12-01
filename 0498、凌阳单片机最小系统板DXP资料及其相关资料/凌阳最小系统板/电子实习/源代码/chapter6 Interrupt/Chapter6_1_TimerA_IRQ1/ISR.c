//*******************************************************************//
//Interrupt Service Routine For C language
//*******************************************************************//
#include	"SPCE061.H"
unsigned int uiOutput=0xFFFF;
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
	uiOutput ^= 0xFFFF;			 		//reverse
	*P_IOA_Data=uiOutput;         		//output rectangle
	*P_INT_Clear=C_IRQ1_TMA;         	//clear INT flag
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
}
void IRQ7(void) __attribute__ ((ISR));
void IRQ7(void)
{
}

