#include "SPCE061.h"
#define count0 0xffffff;
#define count1 0xfff;
int main()
{
	unsigned long int Delay;
	//设置B口为同相低电平输出 
	*P_IOA_Dir =0xffff;
	*P_IOA_Attrib =0xffff;
	*P_IOA_Data =0; 						

	Delay=5000;
	while(Delay--);

	*P_IOA_Data =0xffff; 
	while(1)
	{
		*P_Watchdog_Clear=1;
		Delay=count0;
		while(Delay--);
	}
}
