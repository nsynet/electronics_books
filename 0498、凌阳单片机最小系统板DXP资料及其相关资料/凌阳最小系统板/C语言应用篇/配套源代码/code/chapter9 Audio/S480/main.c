//03-06-05
//本例要链接语音库sacmv25.lib，以及和该库对应的hardware.asm。
//*******************************************************************************************/

 
#define		DAC1			1
#define		DAC2			2
#define		Ramp_UpDn_On	3
#define		Auto			1
#define P_Watchdog_Clear		(volatile unsigned int *)0x7012   

#include	"s480.h"
 main()
{ 	 
	int SpeechIndex=0;
	
	SACM_S480_Initial(Auto);	
	SACM_S480_Play(SpeechIndex,DAC1+DAC2, Ramp_UpDn_On);
	 
	while(1)
	{
		SACM_S480_ServiceLoop();	 
		*P_Watchdog_Clear=0x0001;
	}
}
