//*****************************************************************************/
// 描述： 1)选择不同Fosc信号频率,观察发光二极管亮灭快慢
//        2)改变CPUClk频率,观察发光二极管亮灭快慢
//*****************************************************************************/

#include "SPCE061.H"
void	Delay();
#define Fosc_CLK_RATE 		C_Fosc_49M;     	//select Fosc
#define CPU_CLK_RATE    	C_Fosc_Div_2;    	//select CPUClk

main()
{
	unsigned int Fosc_CLK,CPU_CLK;	
   	*P_IOA_Dir = 0x00FF;			     	 	// IOA: [7..0] output
   	*P_IOA_Attrib = 0x00FF;
   	*P_IOA_Data = 0;
   	Fosc_CLK = Fosc_CLK_RATE;
	CPU_CLK = CPU_CLK_RATE;
   	*P_SystemClock = Fosc_CLK|CPU_CLK;	
												
	while(1)
	{
       *P_IOA_Data = 0x00FF; 					//LED off
       Delay();
       *P_IOA_Data = 0;							//LED on
       Delay();
    }          
}

void Delay(void)
{
	unsigned int j;
	for(j=0x7fff;j>0;j--);
	*P_Watchdog_Clear=1;
}	