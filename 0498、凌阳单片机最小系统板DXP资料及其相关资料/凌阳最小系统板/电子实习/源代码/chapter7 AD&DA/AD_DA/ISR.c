//=============================================================
//  �ļ�����: ISR.c
//  ʵ�ֹ���: ��ȡAD�Ľ��������DA�����
//  �������:  2003,5,28
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
	uiData=*P_ADC;                		//��ȡA/Dת������ֵ
	*P_DAC1 = uiData;                	//DAC���
	*P_DAC2 = uiData; 
	*P_INT_Clear = C_IRQ1_TMA;     		//���жϱ�ʶλ
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

