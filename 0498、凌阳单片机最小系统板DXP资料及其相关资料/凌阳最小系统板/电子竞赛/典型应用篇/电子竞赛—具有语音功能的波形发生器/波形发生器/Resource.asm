
// Resource Table
// Created by IDE, Do not modify this table

.TEXT
.public _RES_Table;
.external __RES_T022_48K_sa
.public _RES_T022_48K_SA;
.external __RES_T022_48K_ea;
.public _RES_T022_48K_EA;
.external __RES_T023_48K_sa
.public _RES_T023_48K_SA;
.external __RES_T023_48K_ea;
.public _RES_T023_48K_EA;
.external __RES_T024_48K_sa
.public _RES_T024_48K_SA;
.external __RES_T024_48K_ea;
.public _RES_T024_48K_EA;
.external __RES_T025_48K_sa
.public _RES_T025_48K_SA;
.external __RES_T025_48K_ea;
.public _RES_T025_48K_EA;
.external __RES_T026_48K_sa
.public _RES_T026_48K_SA;
.external __RES_T026_48K_ea;
.public _RES_T026_48K_EA;
.external __RES_T027_48K_sa
.public _RES_T027_48K_SA;
.external __RES_T027_48K_ea;
.public _RES_T027_48K_EA;
.external __RES_T028_48K_sa
.public _RES_T028_48K_SA;
.external __RES_T028_48K_ea;
.public _RES_T028_48K_EA;
.external __RES_T029_48K_sa
.public _RES_T029_48K_SA;
.external __RES_T029_48K_ea;
.public _RES_T029_48K_EA;
.external __RES_T030_48K_sa
.public _RES_T030_48K_SA;
.external __RES_T030_48K_ea;
.public _RES_T030_48K_EA;
.external __RES_T031_48K_sa
.public _RES_T031_48K_SA;
.external __RES_T031_48K_ea;
.public _RES_T031_48K_EA;
.external __RES_T066_48K_sa
.public _RES_T066_48K_SA;
.external __RES_T066_48K_ea;
.public _RES_T066_48K_EA;
.external __RES_T016_48K_sa
.public _RES_T016_48K_SA;
.external __RES_T016_48K_ea;
.public _RES_T016_48K_EA;


_RES_Table:

_RES_T022_48K_SA:
	.DW offset __RES_T022_48K_sa,seg __RES_T022_48K_sa;
_RES_T022_48K_EA:
	.DW offset __RES_T022_48K_ea,seg __RES_T022_48K_ea;

_RES_T023_48K_SA:
	.DW offset __RES_T023_48K_sa,seg __RES_T023_48K_sa;
_RES_T023_48K_EA:
	.DW offset __RES_T023_48K_ea,seg __RES_T023_48K_ea;

_RES_T024_48K_SA:
	.DW offset __RES_T024_48K_sa,seg __RES_T024_48K_sa;
_RES_T024_48K_EA:
	.DW offset __RES_T024_48K_ea,seg __RES_T024_48K_ea;

_RES_T025_48K_SA:
	.DW offset __RES_T025_48K_sa,seg __RES_T025_48K_sa;
_RES_T025_48K_EA:
	.DW offset __RES_T025_48K_ea,seg __RES_T025_48K_ea;

_RES_T026_48K_SA:
	.DW offset __RES_T026_48K_sa,seg __RES_T026_48K_sa;
_RES_T026_48K_EA:
	.DW offset __RES_T026_48K_ea,seg __RES_T026_48K_ea;

_RES_T027_48K_SA:
	.DW offset __RES_T027_48K_sa,seg __RES_T027_48K_sa;
_RES_T027_48K_EA:
	.DW offset __RES_T027_48K_ea,seg __RES_T027_48K_ea;

_RES_T028_48K_SA:
	.DW offset __RES_T028_48K_sa,seg __RES_T028_48K_sa;
_RES_T028_48K_EA:
	.DW offset __RES_T028_48K_ea,seg __RES_T028_48K_ea;

_RES_T029_48K_SA:
	.DW offset __RES_T029_48K_sa,seg __RES_T029_48K_sa;
_RES_T029_48K_EA:
	.DW offset __RES_T029_48K_ea,seg __RES_T029_48K_ea;

_RES_T030_48K_SA:
	.DW offset __RES_T030_48K_sa,seg __RES_T030_48K_sa;
_RES_T030_48K_EA:
	.DW offset __RES_T030_48K_ea,seg __RES_T030_48K_ea;

_RES_T031_48K_SA:
	.DW offset __RES_T031_48K_sa,seg __RES_T031_48K_sa;
_RES_T031_48K_EA:
	.DW offset __RES_T031_48K_ea,seg __RES_T031_48K_ea;

_RES_T066_48K_SA:
	.DW offset __RES_T066_48K_sa,seg __RES_T066_48K_sa;
_RES_T066_48K_EA:
	.DW offset __RES_T066_48K_ea,seg __RES_T066_48K_ea;

_RES_T016_48K_SA:
	.DW offset __RES_T016_48K_sa,seg __RES_T016_48K_sa;
_RES_T016_48K_EA:
	.DW offset __RES_T016_48K_ea,seg __RES_T016_48K_ea;


// End Table
.public  T_SACM_S480_SpeechTable;
   T_SACM_S480_SpeechTable:
     .dw _RES_T022_48K_SA;
 .dw _RES_T023_48K_SA;
     .dw _RES_T024_48K_SA;
 .dw _RES_T025_48K_SA;
  .dw _RES_T026_48K_SA;
 .dw _RES_T027_48K_SA;
    .dw _RES_T028_48K_SA;
 .dw _RES_T029_48K_SA;
 .dw _RES_T030_48K_SA;
 .dw _RES_T031_48K_SA;
    .dw _RES_T022_48K_SA;
.dw _RES_T066_48K_SA;
//.dw _RES_T001_48K_SA;
.dw _RES_T016_48K_SA;
