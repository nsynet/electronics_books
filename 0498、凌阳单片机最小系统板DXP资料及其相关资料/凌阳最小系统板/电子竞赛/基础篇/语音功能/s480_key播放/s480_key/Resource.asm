
// Resource Table
// Created by IDE, Do not modify this table

.TEXT
.public _RES_Table;
.external __RES_48_48K_sa
.public _RES_48_48K_SA;
.external __RES_48_48K_ea;
.public _RES_48_48K_EA;


_RES_Table:

_RES_48_48K_SA:
	.DW offset __RES_48_48K_sa,seg __RES_48_48K_sa;
_RES_48_48K_EA:
	.DW offset __RES_48_48K_ea,seg __RES_48_48K_ea;


// End Table
.PUBLIC T_SACM_S480_SpeechTable
T_SACM_S480_SpeechTable:
.DW   _RES_48_48K_SA
