//=============================================================
//  文件名称: ISR.c
//  实现功能: 读取AD的结果，进行DA，输出
//  完成日期:  2003,5,28
//==============================================================
#include	"SPCE061V004.H"
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
	unsigned int uiData;
	uiData=*P_ADC;                		//读取A/D转换的数值
	*P_DAC1 = uiData;                	//DAC输出
	*P_DAC2 = uiData; 
	*P_INT_Clear = C_IRQ1_TMA;     		//清中断标识位
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

