#ifndef	__MAIN_H__
#define	__MAIN_H__
//	write your header here

typedef struct _Sys_Flags
{
		unsigned int uiSelectSample 	: 1;
		unsigned int uiCircleSample    	: 1;
		unsigned int uiEnterKey			: 1;
		unsigned int uiCancelKey		: 1;
		unsigned int uiPlaySpeechKey	: 1;
		unsigned int uiSampleOk			: 1;
		unsigned int uiChannelNumber;
		unsigned int uiSysFaultNumber;
	//	unsigned int uiChannelData;
		unsigned int uiChannelVoltageValue;
		unsigned int uiDisplayVoltageValue;
		
}SYSFLAGS;
#endif
