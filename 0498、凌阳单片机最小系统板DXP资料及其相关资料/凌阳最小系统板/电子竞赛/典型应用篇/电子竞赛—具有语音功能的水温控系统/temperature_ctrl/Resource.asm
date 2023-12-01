
// Resource Table
// Created by IDE, Do not modify this table

.TEXT
.public _RES_Table;
.external __RES_T034_16K_sa
.public _RES_T034_16K_SA;
.external __RES_T034_16K_ea;
.public _RES_T034_16K_EA;
.external __RES_T046_16K_sa
.public _RES_T046_16K_SA;
.external __RES_T046_16K_ea;
.public _RES_T046_16K_EA;
.external __RES_T047_16K_sa
.public _RES_T047_16K_SA;
.external __RES_T047_16K_ea;
.public _RES_T047_16K_EA;
.external __RES_T048_16K_sa
.public _RES_T048_16K_SA;
.external __RES_T048_16K_ea;
.public _RES_T048_16K_EA;
.external __RES_T049_16K_sa
.public _RES_T049_16K_SA;
.external __RES_T049_16K_ea;
.public _RES_T049_16K_EA;
.external __RES_T050_16K_sa
.public _RES_T050_16K_SA;
.external __RES_T050_16K_ea;
.public _RES_T050_16K_EA;
.external __RES_T051_16K_sa
.public _RES_T051_16K_SA;
.external __RES_T051_16K_ea;
.public _RES_T051_16K_EA;
.external __RES_T052_16K_sa
.public _RES_T052_16K_SA;
.external __RES_T052_16K_ea;
.public _RES_T052_16K_EA;
.external __RES_T053_16K_sa
.public _RES_T053_16K_SA;
.external __RES_T053_16K_ea;
.public _RES_T053_16K_EA;
.external __RES_T054_16K_sa
.public _RES_T054_16K_SA;
.external __RES_T054_16K_ea;
.public _RES_T054_16K_EA;
.external __RES_T055_16K_sa
.public _RES_T055_16K_SA;
.external __RES_T055_16K_ea;
.public _RES_T055_16K_EA;
.external __RES_T056_16K_sa
.public _RES_T056_16K_SA;
.external __RES_T056_16K_ea;
.public _RES_T056_16K_EA;


_RES_Table:

_RES_T034_16K_SA:
	.DW offset __RES_T034_16K_sa,seg __RES_T034_16K_sa;
_RES_T034_16K_EA:
	.DW offset __RES_T034_16K_ea,seg __RES_T034_16K_ea;

_RES_T046_16K_SA:
	.DW offset __RES_T046_16K_sa,seg __RES_T046_16K_sa;
_RES_T046_16K_EA:
	.DW offset __RES_T046_16K_ea,seg __RES_T046_16K_ea;

_RES_T047_16K_SA:
	.DW offset __RES_T047_16K_sa,seg __RES_T047_16K_sa;
_RES_T047_16K_EA:
	.DW offset __RES_T047_16K_ea,seg __RES_T047_16K_ea;

_RES_T048_16K_SA:
	.DW offset __RES_T048_16K_sa,seg __RES_T048_16K_sa;
_RES_T048_16K_EA:
	.DW offset __RES_T048_16K_ea,seg __RES_T048_16K_ea;

_RES_T049_16K_SA:
	.DW offset __RES_T049_16K_sa,seg __RES_T049_16K_sa;
_RES_T049_16K_EA:
	.DW offset __RES_T049_16K_ea,seg __RES_T049_16K_ea;

_RES_T050_16K_SA:
	.DW offset __RES_T050_16K_sa,seg __RES_T050_16K_sa;
_RES_T050_16K_EA:
	.DW offset __RES_T050_16K_ea,seg __RES_T050_16K_ea;

_RES_T051_16K_SA:
	.DW offset __RES_T051_16K_sa,seg __RES_T051_16K_sa;
_RES_T051_16K_EA:
	.DW offset __RES_T051_16K_ea,seg __RES_T051_16K_ea;

_RES_T052_16K_SA:
	.DW offset __RES_T052_16K_sa,seg __RES_T052_16K_sa;
_RES_T052_16K_EA:
	.DW offset __RES_T052_16K_ea,seg __RES_T052_16K_ea;

_RES_T053_16K_SA:
	.DW offset __RES_T053_16K_sa,seg __RES_T053_16K_sa;
_RES_T053_16K_EA:
	.DW offset __RES_T053_16K_ea,seg __RES_T053_16K_ea;

_RES_T054_16K_SA:
	.DW offset __RES_T054_16K_sa,seg __RES_T054_16K_sa;
_RES_T054_16K_EA:
	.DW offset __RES_T054_16K_ea,seg __RES_T054_16K_ea;

_RES_T055_16K_SA:
	.DW offset __RES_T055_16K_sa,seg __RES_T055_16K_sa;
_RES_T055_16K_EA:
	.DW offset __RES_T055_16K_ea,seg __RES_T055_16K_ea;

_RES_T056_16K_SA:
	.DW offset __RES_T056_16K_sa,seg __RES_T056_16K_sa;
_RES_T056_16K_EA:
	.DW offset __RES_T056_16K_ea,seg __RES_T056_16K_ea;


// End Table
.PUBLIC T_SACM_A2000_SpeechTable
.PUBLIC _T_SACM_A2000_SpeechTable
T_SACM_A2000_SpeechTable:
_T_SACM_A2000_SpeechTable:
   .DW _RES_T046_16K_SA      //0
   .DW _RES_T047_16K_SA      //1
   .DW _RES_T048_16K_SA      //2
   .DW _RES_T049_16K_SA      //3
   .DW _RES_T050_16K_SA      //4
   .DW _RES_T051_16K_SA      //5
   .DW _RES_T052_16K_SA      //6
   .DW _RES_T053_16K_SA      //7
   .DW _RES_T054_16K_SA      //8
   .DW _RES_T055_16K_SA      //9
   .DW _RES_T056_16K_SA      //10
   .DW _RES_T034_16K_SA      //…„ œ∂»
