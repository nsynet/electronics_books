#ifndef	__MS01_H__
#define	__MS01_H__
//	write your header here
extern int SACM_MS01_Initial();				// define in ms01.lib
extern int SACM_MS01_ServiceLoop();			// define in ms01.lib

extern int SACM_MS01_Play();				// define in ms01.lib
extern int SACM_MS01_Stop();				// define in ms01.lib
extern int SACM_MS01_Pause();				// define in ms01.lib
extern int SACM_MS01_Resume();				// define in ms01.lib
extern int SACM_MS01_Volume();				// define in ms01.lib

extern void SACM_MS01_ChannelOff();
extern void SACM_MS01_ChannelOn();
extern void SACM_MS01_SetInstrument();
#endif
