#ifndef	__SACMV32_H__
#define	__SACMV32_H__
//	write your header here

//========================================================================================
// Progarm: SACMV32.h 
// Description: The file should be included by modules in order to use SACM library
// Arranged by: Arthur Shieh
// Date: 	2002/11/04:  modified for sacmvv32.lib
//
// For: sacmV32e.lib
//
//========================================================================================
//////////////////////////////////////////////////////////////////////////////////////////
// Progarm: SACM-S200 C API external definition for sacmVxx.lib
//////////////////////////////////////////////////////////////////////////////////////////

extern int SACM_S200_Initial();					// 
extern void SACM_S200_Play(int,int,int);			// For Auto/manual Mode 
extern void SACM_S200_Stop(void);					// 
extern void SACM_S200_Pause(void);					// 
extern void SACM_S200_Resume(void);					// 
extern void SACM_S200_Volume(int);					// 
extern unsigned int SACM_S200_Status(void);			// 
extern void SACM_S200_ServiceLoop(void);			// For Auto Mode only

extern void SACM_S200_DefaultSoundEffect(void);
extern void SACM_S200_SetVoicing(int);// -2~+2
extern void SACM_S200_SetPitch(int);// -2~+2
extern void SACM_S200_ConstPitch(int);// -2~+2
extern void SACM_S200_SetSpeed(int);  // -2~+2
//////////////////////////////////////////////////////////////////////////////////////////
// Progarm: SACM-S200 C API external definition for sacmVxx.lib
//////////////////////////////////////////////////////////////////////////////////////////

extern int SACM_S240_Initial(int);					// 
extern void SACM_S240_ServiceLoop(void);			// For Auto Mode only
extern void SACM_S240_Play(int,int,int);			// For Auto Mode only
extern void SACM_S240_Stop(void);					// 
extern void SACM_S240_Stop_EX(void);				// Keep Int. enable 
extern void SACM_S240_Pause(void);					// 
extern void SACM_S240_Resume(void);					// 
extern void SACM_S240_Volume(int);					// 
extern unsigned int SACM_S240_Status(void);			// 

//========================================================================================        
// End of S240 API
//========================================================================================

//////////////////////////////////////////////////////////////////////////////////////////
// Progarm: SACM-S480/S720 C API external definition for sacmVxx.lib
//////////////////////////////////////////////////////////////////////////////////////////

extern int SACM_S480_Initial(int);					// 
extern void SACM_S480_ServiceLoop(void);			// For Auto Mode only
extern void SACM_S480_Play(int,int,int);			// For Auto Mode only
extern void SACM_S480_Stop(void);					// 
extern void SACM_S480_Stop_EX(void);				// Keep Int. enable 
extern void SACM_S480_Pause(void);					// 
extern void SACM_S480_Resume(void);					// 
extern void SACM_S480_Volume(int);					// 
extern unsigned int SACM_S480_Status(void);			// 

extern void SACM_S480_InitDecoder(int);			// For Manual Mode only
extern void SACM_S480_Decoder(void);					// For Manual Mode only
extern void SACM_S480_InitQueue(void);				// For Manual Mode only
extern void SACM_S480_FillQueue(int);				// For Manual Mode only
extern unsigned int SACM_S480_TestQueue(void);		// For Manual Mode only

//========================================================================================        
// End of S480 API
//========================================================================================

//////////////////////////////////////////////////////////////////////////////////////////
// Progarm: SACM-S530 C API external definition for sacmVxx.lib
//////////////////////////////////////////////////////////////////////////////////////////

extern int SACM_S530_Initial(int);					// 
extern void SACM_S530_ServiceLoop(void);			// For Auto Mode only
extern void SACM_S530_Play(int,int,int);			// For Auto Mode only
extern void SACM_S530_Stop(void);					// 
extern void SACM_S530_Stop_EX(void);				// Keep Int. enable 
extern void SACM_S530_Pause(void);					// 
extern void SACM_S530_Resume(void);					// 
extern void SACM_S530_Volume(int);					// 
extern unsigned int SACM_S530_Status(void);			// 

extern void SACM_S530_InitDecoder(int);			    // For Manual Mode only
extern void SACM_S530_Decoder(void);			    // For Manual Mode only
extern void SACM_S530_InitQueue(void);				// For Manual Mode only
extern void SACM_S530_FillQueue(int);				// For Manual Mode only
extern unsigned int SACM_S530_TestQueue(void);		// For Manual Mode only

//========================================================================================        
// End of S530 API
//========================================================================================


//////////////////////////////////////////////////////////////////////////////////////////
// Progarm: SACM-A1600 C API external definition for sacmVxx.lib
//////////////////////////////////////////////////////////////////////////////////////////

extern void SACM_A1600_Initial(void);					// 
extern void SACM_A1600_ServiceLoop(void);			// For Auto Mode only
extern void SACM_A1600_Play(int,int,int);			// For Auto Mode only
extern void SACM_A1600_PlaySequence(int,int,int);
extern void SACM_A1600_Stop(void);					// 
extern void SACM_A1600_Pause(void);					// 
extern void SACM_A1600_Resume(void);				// 
extern void SACM_A1600_Volume(int);					// 
extern unsigned int SACM_A1600_Status(void);		// 


//========================================================================================        
// End of a1600 API
//========================================================================================

//////////////////////////////////////////////////////////////////////////////////////////
// Progarm: SACM-A2000 C API external definition for sacmVxx.lib
//////////////////////////////////////////////////////////////////////////////////////////

extern int SACM_A2000_Initial(int);					// 
extern void SACM_A2000_ServiceLoop(void);			// For Auto Mode only
extern void SACM_A2000_Play(int,int,int);			// For Auto Mode only
extern void SACM_A2000_Stop(void);					// 
extern void SACM_A2000_Pause(void);					// 
extern void SACM_A2000_Resume(void);				// 
extern void SACM_A2000_Volume(int);					// 
extern unsigned int SACM_A2000_Status(void);		// 

extern void SACM_A2000_Bgd_Decode(int,int);          // For Manual Mode only
extern void SACM_A2000_InitDecoder(int);			// For Manual Mode only
extern void SACM_A2000_Decoder(void);				// For Manual Mode only
extern void SACM_A2000_InitQueue(void);				// For Manual Mode only
extern void SACM_A2000_FillQueue(int);				// For Manual Mode only
extern unsigned int SACM_A2000_TestQueue(void);		// For Manual Mode only

//========================================================================================        
// End of a2000 API
//========================================================================================

//////////////////////////////////////////////////////////////////////////////////////////
// Progarm: SACM-A3200 1 channel  C API external definition for sacmVxx.lib
//////////////////////////////////////////////////////////////////////////////////////////
void SACM_A3200_StartRecord(int); 
void SACM_A3200_StartPlay(int, int);
void SACM_A3200_Pause();
void SACM_A3200_Resume();
void SACM_A3200_Volume(int);					// 0~15
void SACM_A3200_Stop(void); 
#define C_A3200_8K 0x0
#define C_A3200_9K 0x1
#define C_A3200_10K 0x2
#define C_A3200_11K 0x3
#define C_A3200_12K 0x4
#define C_A3200_20M 0x0
#define C_A3200_24M 0x1
#define C_A3200_32M 0x2
#define C_A3200_40M 0x3
#define C_A3200_49M 0x4
//========================================================================================        
// End of A3200 1CH API
//========================================================================================

//========================================================================================        
// End of a2000 API
//========================================================================================

//////////////////////////////////////////////////////////////////////////////////////////
// Progarm: SACM-A3200 2 channel  C API external definition for sacmVxx.lib
//////////////////////////////////////////////////////////////////////////////////////////
void SACM_A3200_Ch1_Record(int); 
void SACM_A3200_Ch1_Play(int, int, int);
void SACM_A3200_Ch1_Pause(void);
void SACM_A3200_Ch1_Resume(void);
void SACM_A3200_Ch1_Stop(void); 
void SACM_A3200_Ch1_Volume(int);					// 0~15

void SACM_A3200_Ch2_Record(int); 
void SACM_A3200_Ch2_Play(int, int, int);
void SACM_A3200_Ch2_Pause(void);
void SACM_A3200_Ch2_Resume(void);
void SACM_A3200_Ch2_Stop(void); 
void SACM_A3200_Ch2_Volume(int);					// 0~15

#define C_A3200_8K 0x0
#define C_A3200_9K 0x1
#define C_A3200_10K 0x2
#define C_A3200_11K 0x3
#define C_A3200_12K 0x4
#define C_A3200_20M 0x0
#define C_A3200_24M 0x1
#define C_A3200_32M 0x2
#define C_A3200_40M 0x3
#define C_A3200_49M 0x4

//========================================================================================        
// End of A3200 2CH API
//========================================================================================

//////////////////////////////////////////////////////////////////////////////////////////
// Progarm: SACM-DVR API external definition for sacmVxx.lib
//////////////////////////////////////////////////////////////////////////////////////////
extern 	int SACM_DVR_Initial(int);
extern 	void SACM_DVR_ServiceLoop(void);
extern 	void SACM_DVR_Record(int,int);
extern  void SACM_DVR_Play(void);
extern  void SACM_DVR_Stop(void);
extern  unsigned int SACM_DVR_Status(void);

extern  void SACM_DVR_InitEncoder(int,int);			// For Manual Mode
extern  void SACM_DVR_InitDecoder(int);				// For Manual Mode
extern  void SACM_DVR_Encoder(void);				// For Manual Mode
extern  void SACM_DVR_Decoder(void);				// For Manual Mode

extern  void SACM_DVR_InitQueue(void);				// For Manual Mode
extern  int SACM_DVR_FetchQueue(void);				// For Manual Mode
extern  void SACM_DVR_FillQueue(int);				// For Manual Mode
extern  unsigned int SACM_DVR_TestQueue(void);		// For Manual Mode

extern  void SACM_DVR_Switch_ADC_Channel(int);      // Switch ADC channel for SPCE 061A onlyextern 	int SACM_DVR_Initial(int);
extern 	void SACM_DVR_ServiceLoop(void);
extern 	void SACM_DVR_Record(int,int);
extern  void SACM_DVR_Play(void);
extern  void SACM_DVR_Stop(void);
extern  unsigned int SACM_DVR_Status(void);

extern  void SACM_DVR_InitEncoder(int,int);			// For Manual Mode
extern  void SACM_DVR_InitDecoder(int);				// For Manual Mode
extern  void SACM_DVR_Encoder(void);				// For Manual Mode
extern  void SACM_DVR_Decoder(void);				// For Manual Mode

extern  void SACM_DVR_InitQueue(void);				// For Manual Mode
extern  int SACM_DVR_FetchQueue(void);				// For Manual Mode
extern  void SACM_DVR_FillQueue(int);				// For Manual Mode
extern  unsigned int SACM_DVR_TestQueue(void);		// For Manual Mode

extern  void SACM_DVR_Switch_ADC_Channel(int);      // Switch ADC channel for SPCE 061A only
//========================================================================================        
// End of DVR API
//========================================================================================

//////////////////////////////////////////////////////////////////////////////////////////
// Progarm: SACM-MS01 C API external definition for sacmVxx.lib
//////////////////////////////////////////////////////////////////////////////////////////

extern int SACM_MS01_Initial(int,int);				// 
extern void SACM_MS01_ServiceLoop(void);			// For Auto Mode only
extern void SACM_MS01_Play(int,int,int);			// For Auto Mode only
extern void SACM_MS01_Stop(void);					// 
extern void SACM_MS01_Stop_EX(void);				// 
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
// End of MS01 API
//========================================================================================

//////////////////////////////////////////////////////////////////////////////////////////
// Progarm: SACM-hardware dependent C API external definition for sacmVxx.lib
//////////////////////////////////////////////////////////////////////////////////////////
extern void SP_RampUpDAC1(void);
extern void SP_RampUpDAC2(void);
extern void SP_RampDnDAC1(void);
extern void SP_RampDnDAC2(void);
//========================================================================================        
// End of SACM-hardware dependent API
//========================================================================================
#define Disable         0
#define Enable          1

// SACM Record/Play mode
#define Manual_Mode_Index			-1
#define Manual			0					
#define Auto			1
#define DVR_A2000		2

// DAC output
#define	DAC1			1					
#define DAC2			2
// Speech Type
#define A2000			1					
#define	S480_720		2
#define	S240			3
#define	MS01			4
// Ramp up/Ramp down
#define	Ramp_UpDn_Off	0					
#define Ramp_Up_On		1					
#define	Ramp_Dn_On		2
#define	Ramp_UpDn_On	3

#define	Ramp_Disable	0
#define Ramp_Up			1
#define	Ramp_Dn			2

// For Playback 
#define	Stop			0
#define	Record			1
#define Play			2	
// For DVR
#define	RceMonitorOff	0
#define	RceMonitorOn	1
// DVR AD Channel
#define	Mic	            0
#define	Line_In1        1
#define	Line_In2        2
#define	Line_In3        3
#define	Line_In4        4
#define	Line_In5        5
#define	Line_In6        6
#define	Line_In7        7

// For volume
#define Max_Volume      15                  // Max. volume
#define Min_Volume		0					// Min. volume

// For Queue
#define	Full			1					// Queue define in Manual Mode
#define	Empty			2

// For MS01
#define DAC_24K			1					// MS01 use only
#define DAC_20K			2					// MS01 use only
#define DAC_16K			3					// MS01 use only

#endif
//========================================================================================
// End of sacmv32.h
//========================================================================================
