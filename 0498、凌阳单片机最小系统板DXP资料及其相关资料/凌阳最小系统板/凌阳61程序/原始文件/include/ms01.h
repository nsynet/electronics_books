#ifndef	__MS01_H__
#define	__MS01_H__
//	write your header here
//////////////////////////////////////////////////////////////////////////////////////////
// Progarm: SACM-MS01 C API external definition for sacmV26e.lib
// Writen by: Andy
// 	Date: 2000/06/20
// 	Date: 2001/10/11 	Add Manual mode definition
//	Date: 2005/10/20	Modified by xinqiang zhang  
//	V1.0
//////////////////////////////////////////////////////////////////////////////////////////

extern int SACM_MS01_Initial(int,int);				// 
extern void SACM_MS01_ServiceLoop(void);			// For Auto Mode only
extern void SACM_MS01_Play(int,int,int);			// For Auto Mode only
extern void SACM_MS01_Stop(void);					// 
extern void SACM_MS01_Pause(void);					// 
extern void SACM_MS01_Resume(void);					// 
extern void SACM_MS01_Volume(int);					// 
extern unsigned int SACM_MS01_Status(void);			// 

extern void SACM_MS01_ChannelOff(int);
extern void SACM_MS01_ChannelOn(int);
extern void SACM_MS01_SetInstrument(int,int,int);

extern void SACM_MS01_ADPCM_Play(int,int);
extern unsigned int SACM_MS01_ADPCM_Status(void);

extern int SACM_MS01_EventPolling(void);
extern void SACM_MS01_EventClear(void);

extern int SACM_MS01_InitDecoder(int);				// For Manual Mode only
extern void SACM_MS01_Decoder(void);				// For Manual Mode only
extern void SACM_MS01_InitQueue(void);				// For Manual Mode only
extern void SACM_MS01_FillQueue(int);				// For Manual Mode only
extern int SACM_MS01_TestQueue(void);				// For Manual Mode only

//========================================================================================        
// End of MS01.h
//========================================================================================
#endif
