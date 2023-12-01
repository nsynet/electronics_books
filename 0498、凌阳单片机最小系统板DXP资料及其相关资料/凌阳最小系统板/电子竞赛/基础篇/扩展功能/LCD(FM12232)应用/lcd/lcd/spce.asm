//========================================================================================
// 
//
// Last modified date: 
// 		2002/09/27: first version
// Note: This file contains a variable declaration for SPCE 500A to keep track of the 
//       interrupt setting status. 
//========================================================================================

.IRAM
.public	R_InterruptStatus;	
.VAR	R_InterruptStatus = 0;					// for feature using, not necessary for SPCE061				
////////////////////////////////////////////////////
// Note: This register should always map to the P_INT_Ctrl(W)
//	(0x7010), The SACMvxx.lib use this register to
//	combine with user's interrupt setting.
//  In SPCE061A, it is not necessary since the 
//  P_INT_Mask(0x702D) already does this. It is for 
//  compatibility to keep it here. 
//////////////////////////////////////////////////
  
              
//========================================================================================        
// End of SPCE.asm
//========================================================================================



        
        
        