
// Resource Table
// Created by IDE, Do not modify this table

.TEXT
.public _RES_Table;
.external __RES_PK3_sa
.public _RES_PK3_SA;
.external __RES_PK3_ea;
.public _RES_PK3_EA;
.external __RES_PK2_sa
.public _RES_PK2_SA;
.external __RES_PK2_ea;
.public _RES_PK2_EA;
.external __RES_PK1_sa
.public _RES_PK1_SA;
.external __RES_PK1_ea;
.public _RES_PK1_EA;


_RES_Table:

_RES_PK3_SA:
	.DW offset __RES_PK3_sa,seg __RES_PK3_sa;
_RES_PK3_EA:
	.DW offset __RES_PK3_ea,seg __RES_PK3_ea;

_RES_PK2_SA:
	.DW offset __RES_PK2_sa,seg __RES_PK2_sa;
_RES_PK2_EA:
	.DW offset __RES_PK2_ea,seg __RES_PK2_ea;

_RES_PK1_SA:
	.DW offset __RES_PK1_sa,seg __RES_PK1_sa;
_RES_PK1_EA:
	.DW offset __RES_PK1_ea,seg __RES_PK1_ea;


// End Table
.public T_SACM_S240_SpeechTable
T_SACM_S240_SpeechTable:
	.dw _RES_PK3_SA
	.dw _RES_PK2_SA
	.dw _RES_PK1_SA
	
