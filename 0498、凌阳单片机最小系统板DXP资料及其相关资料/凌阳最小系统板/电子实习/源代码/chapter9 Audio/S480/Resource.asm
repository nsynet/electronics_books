
// Resource Table
// Created by IDE, Do not modify this table

.TEXT
.public _RES_Table;
.external __RES_D0_48K_sa
.public _RES_D0_48K_SA;
.external __RES_D0_48K_ea;
.public _RES_D0_48K_EA;


_RES_Table:

_RES_D0_48K_SA:
	.DW offset __RES_D0_48K_sa,seg __RES_D0_48K_sa;
_RES_D0_48K_EA:
	.DW offset __RES_D0_48K_ea,seg __RES_D0_48K_ea;


// End Table
.public T_SACM_S480_SpeechTable
T_SACM_S480_SpeechTable:
	.dw _RES_D0_48K_SA
