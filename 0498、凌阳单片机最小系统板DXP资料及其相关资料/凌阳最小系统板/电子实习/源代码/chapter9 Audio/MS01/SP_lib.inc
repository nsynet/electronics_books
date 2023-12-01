//========================================================================================
// Progarm: The head file for sp_lib.asm V1.0
// Wrote by: Arthur Shieh
// Last modified date: 
// 		2002/10/03 V1.0: first version
//========================================================================================

.EXTERNAL  F_Key_Scan_Initial;
.EXTERNAL  F_Key_Scan_ServiceLoop;			// 1 scan line +Vcc
.EXTERNAL  F_Key_Scan_ServiceLoop_2;		// 2 scan line +Vcc / IOA
.EXTERNAL  F_Key_DebounceCnt_Down;
.EXTERNAL  F_SP_GetCh;