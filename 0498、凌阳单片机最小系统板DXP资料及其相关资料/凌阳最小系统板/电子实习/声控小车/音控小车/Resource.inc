
// Resource Table
// Created by IDE, Do not modify this table

.TEXT
.external _RES_Table;
.external _RES_DCQZY_48K_SA;
.external _RES_DCQZY_48K_EA;
.external _RES_FBF_48K_SA;
.external _RES_FBF_48K_EA;
.external _RES_GJG_48K_SA;
.external _RES_GJG_48K_EA;
.external _RES_QJ_48K_SA;
.external _RES_QJ_48K_EA;
.external _RES_SSMAY_48K_SA;
.external _RES_SSMAY_48K_EA;
.external _RES_YEAH_48K_SA;
.external _RES_YEAH_48K_EA;
.external _RES_S12_24K_SA;
.external _RES_S12_24K_EA;

// End Table
.PUBLIC T_SACM_S480_SpeechTable;
T_SACM_S480_SpeechTable:
.DW  _RES_YEAH_48K_SA  //0yeah!
.DW  _RES_QJ_48K_SA   //1前进
.DW  _RES_DCQZY_48K_SA//2倒车请注意
.DW  _RES_GJG_48K_SA//3拐就拐
.DW  _RES_FBF_48K_SA//4烦不烦
.DW  _RES_SSMAY_48K_SA//5说什么暗语呀
//.DW _RES_1_48K_SA//0
//.DW _RES_1_48K_SA//1
//.DW _RES_2_48K_SA//2
//.DW _RES_3_48K_SA//3
//.DW _RES_4_48K_SA//4
//.DW _RES_5_48K_SA//5
//.DW _RES_6_48K_SA//6
//.DW _RES_7_48K_SA//7
//.DW _RES_18_48K_SA//8//
//.DW _RES_11_48K_SA//9
//.DW _RES_10_48K_SA//10
//.DW _RES_12_48K_SA//11
//.DW _RES_17_48K_SA//12
//.DW _RES_16_48K_SA//13
//.DW _RES_15_48K_SA//14
 
//.DW _RES_GUARDINIT2_48K_SA		//0. I am your body guard, Please give me a name.
//.DW _RES_GUARDNAME_48K_SA		//1. Please give me a name.
//.DW _RES_FIRE_48K_SA			//2. Say Fire.
//.DW _RES_GUARD_48K_SA			//3. Say Guard.
//.DW _RES_SAYAGAIN_48K_SA		//4. Say again.
//.DW _RES_NOVOICEDETECTED_48K_SA	//5. No voice detected.
//.DW _RES_DIFFERENT2_48K_SA		//6. Two given names are different.
//.DW _RES_DIFFCMDS_48K_SA		//7. Two given commands are different.
//.DW _RES_STANDINGBY__48K_SA		//8. Iam standing by.
//.DW _RES_MASTER_48K_SA			//9. Master.
//.DW _RES_IAMHERE_48K_SA			//10. I'm here.
//.DW _RES_ONPATROL_48K_SA		//11. On patrol
//.DW _RES_READY_48K_SA			//12. I'm ready!
//.DW _RES_COPY_48K_SA			//13. Copy that!
//.DW _RES_NOISY_48K_SA			//14. It's too noisy.
.PUBLIC T_SACM_A2000_SpeechTable;
T_SACM_A2000_SpeechTable:
.DW _RES_S12_24K_SA				//0. Gun sound.
