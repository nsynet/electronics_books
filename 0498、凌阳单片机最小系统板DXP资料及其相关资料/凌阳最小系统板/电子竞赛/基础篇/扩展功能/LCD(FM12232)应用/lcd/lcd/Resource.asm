
// Resource Table
// Created by IDE, Do not modify this table

.TEXT
.public _RES_Table;
.external __RES_A32_16K_A20_sa
.public _RES_A32_16K_A20_SA;
.external __RES_A32_16K_A20_ea;
.public _RES_A32_16K_A20_EA;


_RES_Table:

_RES_A32_16K_A20_SA:
	.DW offset __RES_A32_16K_A20_sa,seg __RES_A32_16K_A20_sa;
_RES_A32_16K_A20_EA:
	.DW offset __RES_A32_16K_A20_ea,seg __RES_A32_16K_A20_ea;


// End Table
//------------------------------------------------
// SACM A2000 Speech Table
// -- User nees to add in the song/speech 
//    for playback based on the _RES_Table above.
//------------------------------------------------
.public T_SACM_A2000_SpeechTable;
.Text
T_SACM_A2000_SpeechTable:
	.dw _RES_A32_16K_A20_SA;
