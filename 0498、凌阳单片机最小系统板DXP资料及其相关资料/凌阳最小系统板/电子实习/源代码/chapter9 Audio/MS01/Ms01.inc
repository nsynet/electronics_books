// Progarm: SACM-MS01 API external definition for sacmVxx.lib
// Writen by: Andy
// Date: 	2000/06/20
// 			2001/02/10
//			2001/10/11: Add manual mode definition
//////////////////////////////////////////////////////////////////////////////////////////

.EXTERNAL F_SACM_MS01_Initial
.EXTERNAL F_SACM_MS01_ServiceLoop				// For Auto Mode only
.EXTERNAL F_SACM_MS01_Play						// For Auto Mode only
.EXTERNAL F_SACM_MS01_Stop
.EXTERNAL F_SACM_MS01_Stop_EX					// Keep Int. enable
.EXTERNAL F_SACM_MS01_Pause
.EXTERNAL F_SACM_MS01_Resume
.EXTERNAL F_SACM_MS01_Volume
.EXTERNAL F_SACM_MS01_Status

.EXTERNAL F_SACM_MS01_ChannelOff
.EXTERNAL F_SACM_MS01_ChannelOn
.EXTERNAL F_SACM_MS01_SetInstrument

.EXTERNAL F_SACM_MS01_ADPCM_Play
.EXTERNAL F_SACM_MS01_ADPCM_Status

.EXTERNAL F_SACM_MS01_InitDecoder				// For Manual Mode only
.EXTERNAL F_SACM_MS01_Decoder					// For Manual Mode only
.EXTERNAL F_SACM_MS01_InitQueue					// For Manual Mode only
.EXTERNAL F_SACM_MS01_FillQueue					// For Manual Mode only
.EXTERNAL F_SACM_MS01_TestQueue					// For Manual Mode only

.EXTERNAL F_FIQ_Service_SACM_MS01				// Interrupt service Routine(FM)
.EXTERNAL F_ISR_Service_SACM_MS01				// Interrupt service Routine(FM)
.EXTERNAL F_IRQ2_Service_SACM_MS01				// Interrupt service Routine(ADPCM)
.EXTERNAL F_IRQ4_Service_SACM_MS01				// Interrupt service Routine(TEMPO)

//========================================================================================        
// End of MS01.inc
//========================================================================================
