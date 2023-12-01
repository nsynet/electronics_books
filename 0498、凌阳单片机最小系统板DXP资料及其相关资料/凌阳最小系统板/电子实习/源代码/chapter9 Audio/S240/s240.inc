//////////////////////////////////////////////////////////////////////////////////////////
// Progarm: SACM_S240 API external definition for sacmVxx.lib
// Writen by: JohnWu
// Modified by Arthur Shieh
// Date: 2000/07/25
//		 2001/02/10
//       2002/12/11 : V32 , Add F_ISR_Service_SACM_S240
//////////////////////////////////////////////////////////////////////////////////////////

.EXTERNAL F_SACM_S240_Initial
.EXTERNAL F_SACM_S240_ServiceLoop					// For Auto Mode only	 
.EXTERNAL F_SACM_S240_Play							// For Auto Mode only
.EXTERNAL F_SACM_S240_Stop
.EXTERNAL F_SACM_S240_Stop_EX						// Keep Int. enable
.EXTERNAL F_SACM_S240_Pause
.EXTERNAL F_SACM_S240_Resume
.EXTERNAL F_SACM_S240_Volume
.EXTERNAL F_SACM_S240_Status

.EXTERNAL F_FIQ_Service_SACM_S240					// Interrupt service Routine(Play)
.EXTERNAL F_ISR_Service_SACM_S240                   // Interrupt service Routine(Play)
//========================================================================================        
// End of S240.inc
//========================================================================================
        