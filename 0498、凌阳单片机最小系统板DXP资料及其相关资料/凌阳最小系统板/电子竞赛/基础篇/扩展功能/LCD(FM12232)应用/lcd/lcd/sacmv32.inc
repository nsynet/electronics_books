//========================================================================================
// Progarm: SACMV32.inc The file be included by modules
// Arranged by: Arthur Shieh
// Date: 	
//		2002/11/04: V32 for sacmV32.lib
//  
//
// For: sacmV32.lib
//
//========================================================================================
.ifndef __SACMV32_INC__
.define __SACMV32_INC__

//////////////////////////////////////////////////////////////////
// Definitions for I/O Port
//////////////////////////////////////////////////////////////////
//.include spce.inc
//////////////////////////////////////////////
// Note: This register will map to the P_INT_Ctrl
//	(0x7010), The SACMvxx.lib use this register to
//	combine with user's interrupt setting
//////////////////////////////////////////////////
//.EXTERNAL	R_InterruptStatus 
//////////////////////////////////////////////////

.EXTERNAL	F_SP_Send_PWM					// Get RAW data 
.EXTERNAL	F_SP_Send_DAC1 					// 
.EXTERNAL	F_SP_Send_DAC2 					//

.EXTERNAL 	F_SP_RampUpDAC1
.EXTERNAL 	F_SP_RampDnDAC1
.EXTERNAL 	F_SP_RampUpDAC2
.EXTERNAL 	F_SP_RampDnDAC2

.EXTERNAL 	F_SP_InitQueue
.EXTERNAL 	F_SP_InitQueue_A2000
.EXTERNAL 	F_SP_InitQueue_S530
.EXTERNAL 	F_SP_InitQueue_S480
.EXTERNAL 	F_SP_InitQueue_S240
.EXTERNAL 	F_SP_InitQueue_MS01
.EXTERNAL 	F_SP_InitQueue_DVR

.EXTERNAL 	F_SP_ReadQueue
.EXTERNAL 	F_SP_ReadQueue_A2000
.EXTERNAL 	F_SP_ReadQueue_S530
.EXTERNAL 	F_SP_ReadQueue_S480
.EXTERNAL 	F_SP_ReadQueue_S240
.EXTERNAL 	F_SP_ReadQueue_MS01
.EXTERNAL 	F_SP_ReadQueue_DVR

.EXTERNAL 	F_SP_WriteQueue
.EXTERNAL 	F_SP_WriteQueue_A2000
.EXTERNAL 	F_SP_WriteQueue_S530
.EXTERNAL 	F_SP_WriteQueue_S480
.EXTERNAL 	F_SP_WriteQueue_S240
.EXTERNAL 	F_SP_WriteQueue_MS01
.EXTERNAL 	F_SP_WriteQueue_DVR

.EXTERNAL 	F_SP_TestQueue
.EXTERNAL 	F_SP_TestQueue_A2000
.EXTERNAL 	F_SP_TestQueue_S530
.EXTERNAL 	F_SP_TestQueue_S480
.EXTERNAL 	F_SP_TestQueue_S240
.EXTERNAL 	F_SP_TestQueue_MS01
.EXTERNAL 	F_SP_TestQueue_DVR

.EXTERNAL	F_SP_ReadQueue_NIC		// Read queue with no index change
.EXTERNAL	F_SP_ReadQueue_NIC_A2000
.EXTERNAL	F_SP_ReadQueue_NIC_S530
.EXTERNAL	F_SP_ReadQueue_NIC_S480
.EXTERNAL	F_SP_ReadQueue_NIC_S240
.EXTERNAL	F_SP_ReadQueue_NIC_MS01
.EXTERNAL	F_SP_ReadQueue_NIC_DVR


.EXTERNAL	F_SP_SACM_A2000_Init_
.EXTERNAL   F_SP_SACM_A2000_Init_EN_
.EXTERNAL	F_SP_SACM_S530_Init_
.EXTERNAL	F_SP_SACM_S480_Init_
.EXTERNAL	F_SP_SACM_S240_Init_
.EXTERNAL	F_SP_SACM_S200_Init_

.EXTERNAL	F_SP_SACM_MS01_Init_
.EXTERNAL	F_SP_PlayMode0_
.EXTERNAL	F_SP_PlayMode1_
.EXTERNAL	F_SP_PlayMode2_
.EXTERNAL	F_SP_PlayMode3_

.EXTERNAL	F_SP_SACM_DVR_Init_
.EXTERNAL 	F_SP_SACM_DVR_Rec_Init_
.EXTERNAL 	F_SP_SACM_DVR_Play_Init_
.EXTERNAL 	F_SP_SACM_SwitchChannel
//////////////////////////////////////////////////////////////////
// Reserve old defintion
// Note: Some user who use old library may use the old name
//////////////////////////////////////////////////////////////////
.EXTERNAL   F_SP_GetADC
.EXTERNAL   F_SP_SwitchChannel
.EXTERNAL	F_STD_Send_DAC1 				// reserved old
.EXTERNAL	F_STD_Send_DAC2 				// reserved old
.EXTERNAL	F_SP_IRQ2_ON
.EXTERNAL	F_SP_IRQ2_OFF

.EXTERNAL 	F_RampUpDAC1					// reserved old
.EXTERNAL 	F_RampDnDAC1					// reserved old
.EXTERNAL 	F_RampUpDAC2					// reserved old
.EXTERNAL  	F_RampDnDAC2					// reserved old
///////////////////////////////////////////////////////////////////



//
.endif
	
//========================================================================================        
// End of hardware.inc
//========================================================================================
