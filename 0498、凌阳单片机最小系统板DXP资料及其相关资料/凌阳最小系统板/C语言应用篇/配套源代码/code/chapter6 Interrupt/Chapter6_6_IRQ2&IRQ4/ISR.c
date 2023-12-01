//*******************************************************************//
//Interrupt Service Routine For C language
//*******************************************************************//
#include	"SPCE061.H"
unsigned int g_uiIOA_LED=0xff,g_uiIOB_LED=0xff,g_uiClockCnt=0;
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
	*P_IOB_Data=g_uiIOB_LED;          
   	g_uiIOB_LED ^= 0xffff;
   	*P_INT_Clear=0x0400;  
}
void IRQ3(void) __attribute__ ((ISR));
void IRQ3(void)
{
}
void IRQ4(void) __attribute__ ((ISR));
void IRQ4(void)
{
	if(*P_INT_Ctrl&C_IRQ4_1KHz)
	{
   		if(g_uiClockCnt<1024)
   		   g_uiClockCnt++;
		else
		{
			*P_IOA_Data=g_uiIOA_LED;          
	   		g_uiIOA_LED ^= 0xffff;
   			g_uiClockCnt = 0x0000;            
			*P_INT_Clear=C_IRQ4_1KHz;
		}	
	}
	if(*P_INT_Ctrl&C_IRQ4_2KHz)
	{
		*P_INT_Clear=C_IRQ4_2KHz;
	}
	if(*P_INT_Ctrl&C_IRQ4_4KHz)
	{
		*P_INT_Clear=C_IRQ4_4KHz;
	}
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

