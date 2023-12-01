//03-06-05
//本例要链接语音库sacmv25.lib，以及和该库对应的hardware.asm。
#define    		Speech_1 		0
#define    		DAC1 			1
#define 		DAC2 			2             
#define 		Ramp_UpDn_Off	0
#define 		Ramp_Up_On		1
#define 		Ramp_Dn_On		2
#define 		Ramp_UpDn_On	3
#include	"SPCE061V004.H"
main () 
{
	SACM_A2000_Initial(1);
	SACM_A2000_Play(Speech_1, DAC1+DAC2, Ramp_UpDn_On);	//放音
	while(SACM_A2000_Status()&0x01)
	{
		SACM_A2000_ServiceLoop();
		*P_Watchdog_Clear=C_WDTCLR;
	}
	while(1)
		*P_Watchdog_Clear=C_WDTCLR;
}
