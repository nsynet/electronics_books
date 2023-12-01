//*******************************************************************//
//Interrupt Service Routine For C language
//*******************************************************************//
#include	"SPCE061V004.H"
__asm(".external	F_FIQ_Service_SACM_A2000");
void BREAK(void) __attribute__ ((ISR));
void BREAK(void)
{
}
void FIQ(void) __attribute__ ((ISR));
void FIQ(void)
{
	if(*P_INT_Ctrl&0x2000)						//定时器A中断
	{						
		*P_INT_Clear=C_FIQ_TMA;
		__asm("call F_FIQ_Service_SACM_A2000");	//调用A2000中断服务函数    
	}
	else if(*P_INT_Ctrl&0x0800)					//定时器B中断
		*P_INT_Clear=C_FIQ_TMB;
	else										//PWM中断
		*P_INT_Clear=C_FIQ_PWM;	
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

