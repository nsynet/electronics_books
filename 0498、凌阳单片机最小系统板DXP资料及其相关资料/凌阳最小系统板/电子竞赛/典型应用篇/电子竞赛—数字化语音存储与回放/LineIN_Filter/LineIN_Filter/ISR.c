//*******************************************************************//
//Interrupt Service Routine For C language
//*******************************************************************//
extern	unsigned	int	g_Flag_Status;
extern	unsigned	long	int	g_ulAddr;

extern	void	SP_SIOSendAWord(unsigned long int Addr,unsigned int data);
extern	unsigned	int		SP_SIOReadAWord(unsigned long int Addr);
extern	unsigned	int		Fir();

#define		M_RECORD		1
#define		M_STOP			2
#define		M_PLAY			4


#define		M_MEMORY_SIZE		0xffff			//4096的存储空间（byte）
#define		P_ADC_MUX_Data		0x702c

#include	"SPCE061V004.H"
void BREAK(void) __attribute__ ((ISR));
void BREAK(void)
{
}
void FIQ(void) __attribute__ ((ISR));
void FIQ(void)
{
	unsigned	int	uiData;
	long int	lFilterOut;

	if(g_Flag_Status&M_RECORD)						//RECORD
	{
		if(g_ulAddr>=M_MEMORY_SIZE)
		{
			g_ulAddr=0;
			g_Flag_Status=M_STOP;
		}
		else
		{
			lFilterOut=Fir();
			uiData = lFilterOut;
			SP_SIOSendAWord(g_ulAddr,uiData);
			g_ulAddr+=2;
		}		
	}
	else if(g_Flag_Status&M_PLAY)					//PLAY
	{
		uiData=SP_SIOReadAWord(g_ulAddr);
		*P_DAC1 = uiData;
		g_ulAddr+=2;
		if(g_ulAddr>=M_MEMORY_SIZE)
		{
			g_ulAddr=0;
			g_Flag_Status=M_STOP;
		}
	}	
	
 	*P_INT_Clear = 0x2000;        	//清中断
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
}
void IRQ7(void) __attribute__ ((ISR));
void IRQ7(void)
{
}

