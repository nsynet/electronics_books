//*******************************************************************//
//Interrupt Service Routine For C language
//*******************************************************************//
#include	"SPCE061.H"
unsigned int g_uiOutput=0x0000;
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
	if(*P_INT_Ctrl&0x0004)
	{	//IRQ5_2Hz
		*P_IOA_Data=g_uiOutput;
		g_uiOutput^= 0xffff;
		*P_INT_Clear=0x0004;
	}
	else
	{	//IRQ5_4Hz
		*P_INT_Clear=0x0008;
	}
}
   
void IRQ6(void) __attribute__ ((ISR));
void IRQ6(void)
{
}
void IRQ7(void) __attribute__ ((ISR));
void IRQ7(void)
{
}

