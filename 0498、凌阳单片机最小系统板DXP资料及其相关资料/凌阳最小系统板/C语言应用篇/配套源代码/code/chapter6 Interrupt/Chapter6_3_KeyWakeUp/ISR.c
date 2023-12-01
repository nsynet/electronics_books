//*******************************************************************//
//Interrupt Service Routine For C language
//*******************************************************************//
#include	"SPCE061.H"
unsigned int g_uiOutput;
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
	unsigned int uiDelay;
	if(*P_INT_Ctrl&C_IRQ3_EXT1)
	{	//IRQ3_Ext1
		*P_INT_Clear=C_IRQ3_EXT1;
	}
	else if(*P_INT_Ctrl&C_IRQ3_EXT2)
	{	//IRQ3_Ext2
		*P_INT_Clear=C_IRQ3_EXT2;
	}
	else
	{	//IRQ3_KeyWakeUp
		for(g_uiOutput=0x7fff;g_uiOutput>0x007f;g_uiOutput>>=1)
		{
			*P_IOA_Data=g_uiOutput;
			uiDelay=0x7fff;
			while(uiDelay--);
			*P_Watchdog_Clear = C_WDTCLR;
		}
		*P_INT_Clear=C_IRQ3_KEY;
	}
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

