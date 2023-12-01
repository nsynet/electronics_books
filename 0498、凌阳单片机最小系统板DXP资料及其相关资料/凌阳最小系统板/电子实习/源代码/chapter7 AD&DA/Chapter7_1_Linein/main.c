//03-05-26
#include "SPCE061V004.H"
unsigned int AD(void);
main()
{ 
	unsigned long int uiData;
	unsigned int	i;
	float	fVoltage;
	fVoltage=0.0;
	*P_ADC_MUX_Ctrl=C_ADC_CH1;				//LINE_IN-------IOA0
	*P_ADC_Ctrl= C_ADCE;					//ADC enable 
	uiData=*P_ADC_LINEIN_Data;				//ADC start
	uiData=0;
	for(i=0;i<16;i++)						
	{
		*P_Watchdog_Clear=C_WDTCLR;
		uiData += AD();
	}
	uiData >>= 4;							
	fVoltage=(float)uiData/0xffc0*3.3;
}	
       
unsigned int AD(void)
{
	unsigned int uiData;
	while(!(*P_ADC_MUX_Ctrl&0x8000));		//wait,until ADC complete  
    uiData=*P_ADC_LINEIN_Data; 
	return(uiData&0xffc0);
}