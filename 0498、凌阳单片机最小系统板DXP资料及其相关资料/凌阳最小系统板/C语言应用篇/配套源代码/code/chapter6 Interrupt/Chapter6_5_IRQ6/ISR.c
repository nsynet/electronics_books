//*******************************************************************//
//Interrupt Service Routine For C language
//*******************************************************************//
#include	"SPCE061.H"
unsigned int g_uiTime1,g_uiTime2;
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
	if(*P_INT_Ctrl&0x0001)
	{	//TMB2
		g_uiTime2+=1;
		if(g_uiTime2<=64)				//g_uiTime2=64----0.5 second
			*P_IOB_Data=0x0000;			
		else if(g_uiTime2>128)			//g_uiTime2=128-----1 second
			g_uiTime2=0;
		else
			*P_IOB_Data=0x000f;
		*P_INT_Clear=C_IRQ6_TMB2;
	}
	else
	{	//TMB1
		g_uiTime1+=1;
		if(g_uiTime1<=64)				//g_uiTime1=64----1 second
			*P_IOA_Data=0x0000;
		else if(g_uiTime1>128)			//g_uiTime1=128---2 second
			g_uiTime1=0;
		else
			*P_IOA_Data=0x000f;
		*P_INT_Clear=C_IRQ6_TMB1;	
	}
}
void IRQ7(void) __attribute__ ((ISR));
void IRQ7(void)
{
}

