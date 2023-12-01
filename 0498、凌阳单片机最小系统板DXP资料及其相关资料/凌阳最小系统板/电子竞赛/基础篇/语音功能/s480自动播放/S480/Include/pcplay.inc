//========================================================================================
// Progarm: The head file for pcplay.asm
// Arranged by: Andy Hsu
// Last modified date: 
// 		2000/06/23: first version
//		2000/07/20: modified
// Functions:
//  (Assembly view)
//  F_PcPlay_Initial							// PcPlay service initialization
//	F_PcPlay_ServiceLoop						// PcPlay service loop
//	F_PcPlay_GetQueue							// Get data from queue 
//========================================================================================
.external 	F_PcPlay_Initial;				// PcPlay service initialization
.external	F_PcPlay_ServiceLoop;			// PcPlay service loop
.external   F_PcPlay_GetQueue;			// Get data from queue 

.external F_GetQueueNoChangeAddr;			// for MS01 use only
.external F_QueueAddrAdd1;					// for MS01 use only
//========================================================================================        
// End of pcplay.inc
//========================================================================================
