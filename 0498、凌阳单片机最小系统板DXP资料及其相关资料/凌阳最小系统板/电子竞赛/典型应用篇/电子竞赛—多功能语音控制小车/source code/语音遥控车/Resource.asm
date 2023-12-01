
// Resource Table
// Created by IDE, Do not modify this table

.TEXT
.public _RES_Table;
.external __RES_2_48K_sa
.public _RES_2_48K_SA;
.external __RES_2_48K_ea;
.public _RES_2_48K_EA;
.external __RES_3_48K_sa
.public _RES_3_48K_SA;
.external __RES_3_48K_ea;
.public _RES_3_48K_EA;
.external __RES_5_48K_sa
.public _RES_5_48K_SA;
.external __RES_5_48K_ea;
.public _RES_5_48K_EA;
.external __RES_10_48K_sa
.public _RES_10_48K_SA;
.external __RES_10_48K_ea;
.public _RES_10_48K_EA;
.external __RES_11_48K_sa
.public _RES_11_48K_SA;
.external __RES_11_48K_ea;
.public _RES_11_48K_EA;
.external __RES_15_48K_sa
.public _RES_15_48K_SA;
.external __RES_15_48K_ea;
.public _RES_15_48K_EA;
.external __RES_S12_24K_sa
.public _RES_S12_24K_SA;
.external __RES_S12_24K_ea;
.public _RES_S12_24K_EA;


_RES_Table:

_RES_2_48K_SA:
	.DW offset __RES_2_48K_sa,seg __RES_2_48K_sa;
_RES_2_48K_EA:
	.DW offset __RES_2_48K_ea,seg __RES_2_48K_ea;

_RES_3_48K_SA:
	.DW offset __RES_3_48K_sa,seg __RES_3_48K_sa;
_RES_3_48K_EA:
	.DW offset __RES_3_48K_ea,seg __RES_3_48K_ea;

_RES_5_48K_SA:
	.DW offset __RES_5_48K_sa,seg __RES_5_48K_sa;
_RES_5_48K_EA:
	.DW offset __RES_5_48K_ea,seg __RES_5_48K_ea;

_RES_10_48K_SA:
	.DW offset __RES_10_48K_sa,seg __RES_10_48K_sa;
_RES_10_48K_EA:
	.DW offset __RES_10_48K_ea,seg __RES_10_48K_ea;

_RES_11_48K_SA:
	.DW offset __RES_11_48K_sa,seg __RES_11_48K_sa;
_RES_11_48K_EA:
	.DW offset __RES_11_48K_ea,seg __RES_11_48K_ea;

_RES_15_48K_SA:
	.DW offset __RES_15_48K_sa,seg __RES_15_48K_sa;
_RES_15_48K_EA:
	.DW offset __RES_15_48K_ea,seg __RES_15_48K_ea;

_RES_S12_24K_SA:
	.DW offset __RES_S12_24K_sa,seg __RES_S12_24K_sa;
_RES_S12_24K_EA:
	.DW offset __RES_S12_24K_ea,seg __RES_S12_24K_ea;


// End Table
