
// Resource Table
// Created by IDE, Do not modify this table

.TEXT
.public _RES_Table;
.external __RES_WISH1_BIN_sa
.public _RES_WISH1_BIN_SA;
.external __RES_WISH1_BIN_ea;
.public _RES_WISH1_BIN_EA;
.external __RES_ALA1_BIN_sa
.public _RES_ALA1_BIN_SA;
.external __RES_ALA1_BIN_ea;
.public _RES_ALA1_BIN_EA;
.external __RES_ALAINS_BIN_sa
.public _RES_ALAINS_BIN_SA;
.external __RES_ALAINS_BIN_ea;
.public _RES_ALAINS_BIN_EA;
.external __RES_DECK1_BIN_sa
.public _RES_DECK1_BIN_SA;
.external __RES_DECK1_BIN_ea;
.public _RES_DECK1_BIN_EA;
.external __RES_GREEN1_BIN_sa
.public _RES_GREEN1_BIN_SA;
.external __RES_GREEN1_BIN_ea;
.public _RES_GREEN1_BIN_EA;
.external __RES_HK1_BIN_sa
.public _RES_HK1_BIN_SA;
.external __RES_HK1_BIN_ea;
.public _RES_HK1_BIN_EA;
.external __RES_LA1_BIN_sa
.public _RES_LA1_BIN_SA;
.external __RES_LA1_BIN_ea;
.public _RES_LA1_BIN_EA;
.external __RES_PP1_BIN_sa
.public _RES_PP1_BIN_SA;
.external __RES_PP1_BIN_ea;
.public _RES_PP1_BIN_EA;
.external __RES_S31_BIN_sa
.public _RES_S31_BIN_SA;
.external __RES_S31_BIN_ea;
.public _RES_S31_BIN_EA;
.external __RES_TW1_BIN_sa
.public _RES_TW1_BIN_SA;
.external __RES_TW1_BIN_ea;
.public _RES_TW1_BIN_EA;
.external __RES_WINE1_BIN_sa
.public _RES_WINE1_BIN_SA;
.external __RES_WINE1_BIN_ea;
.public _RES_WINE1_BIN_EA;
.external __RES_1231_BIN_sa
.public _RES_1231_BIN_SA;
.external __RES_1231_BIN_ea;
.public _RES_1231_BIN_EA;


_RES_Table:

_RES_WISH1_BIN_SA:
	.DW offset __RES_WISH1_BIN_sa,seg __RES_WISH1_BIN_sa;
_RES_WISH1_BIN_EA:
	.DW offset __RES_WISH1_BIN_ea,seg __RES_WISH1_BIN_ea;

_RES_ALA1_BIN_SA:
	.DW offset __RES_ALA1_BIN_sa,seg __RES_ALA1_BIN_sa;
_RES_ALA1_BIN_EA:
	.DW offset __RES_ALA1_BIN_ea,seg __RES_ALA1_BIN_ea;

_RES_ALAINS_BIN_SA:
	.DW offset __RES_ALAINS_BIN_sa,seg __RES_ALAINS_BIN_sa;
_RES_ALAINS_BIN_EA:
	.DW offset __RES_ALAINS_BIN_ea,seg __RES_ALAINS_BIN_ea;

_RES_DECK1_BIN_SA:
	.DW offset __RES_DECK1_BIN_sa,seg __RES_DECK1_BIN_sa;
_RES_DECK1_BIN_EA:
	.DW offset __RES_DECK1_BIN_ea,seg __RES_DECK1_BIN_ea;

_RES_GREEN1_BIN_SA:
	.DW offset __RES_GREEN1_BIN_sa,seg __RES_GREEN1_BIN_sa;
_RES_GREEN1_BIN_EA:
	.DW offset __RES_GREEN1_BIN_ea,seg __RES_GREEN1_BIN_ea;

_RES_HK1_BIN_SA:
	.DW offset __RES_HK1_BIN_sa,seg __RES_HK1_BIN_sa;
_RES_HK1_BIN_EA:
	.DW offset __RES_HK1_BIN_ea,seg __RES_HK1_BIN_ea;

_RES_LA1_BIN_SA:
	.DW offset __RES_LA1_BIN_sa,seg __RES_LA1_BIN_sa;
_RES_LA1_BIN_EA:
	.DW offset __RES_LA1_BIN_ea,seg __RES_LA1_BIN_ea;

_RES_PP1_BIN_SA:
	.DW offset __RES_PP1_BIN_sa,seg __RES_PP1_BIN_sa;
_RES_PP1_BIN_EA:
	.DW offset __RES_PP1_BIN_ea,seg __RES_PP1_BIN_ea;

_RES_S31_BIN_SA:
	.DW offset __RES_S31_BIN_sa,seg __RES_S31_BIN_sa;
_RES_S31_BIN_EA:
	.DW offset __RES_S31_BIN_ea,seg __RES_S31_BIN_ea;

_RES_TW1_BIN_SA:
	.DW offset __RES_TW1_BIN_sa,seg __RES_TW1_BIN_sa;
_RES_TW1_BIN_EA:
	.DW offset __RES_TW1_BIN_ea,seg __RES_TW1_BIN_ea;

_RES_WINE1_BIN_SA:
	.DW offset __RES_WINE1_BIN_sa,seg __RES_WINE1_BIN_sa;
_RES_WINE1_BIN_EA:
	.DW offset __RES_WINE1_BIN_ea,seg __RES_WINE1_BIN_ea;

_RES_1231_BIN_SA:
	.DW offset __RES_1231_BIN_sa,seg __RES_1231_BIN_sa;
_RES_1231_BIN_EA:
	.DW offset __RES_1231_BIN_ea,seg __RES_1231_BIN_ea;


// End Table
//------------------------------------------------
// SACM MS01 Song Table
// -- User nees to add in the song/speech 
//    for playback based on the _RES_Table above.
//------------------------------------------------
.public T_SACM_MS01_SongTable;
T_SACM_MS01_SongTable:
	.dw _RES_WISH1_BIN_SA
	.DW _RES_ALA1_BIN_SA
	.DW _RES_ALAINS_BIN_SA
	.DW _RES_DECK1_BIN_SA
	.DW _RES_GREEN1_BIN_SA
	.DW _RES_HK1_BIN_SA
	.DW _RES_LA1_BIN_SA
	.DW _RES_PP1_BIN_SA
	.DW _RES_S31_BIN_SA
	.DW _RES_TW1_BIN_SA
	.DW _RES_WINE1_BIN_SA
	.DW _RES_1231_BIN_SA
              
//------------------------------------------------
// SACM MS01 Drum Table
// -- User nees to add in the song/speech 
//    for playback based on the _RES_Table above.
//------------------------------------------------       
.public T_SACM_MS01_DrumTable;        
T_SACM_MS01_DrumTable:
.dw 0xFA00
//------------------------------------------------
// SACM MS01 Drum Sample Rate Table
// Table: Set the corresponding sample rate of drum speech
// Formula: N = 65536 - (Fosc/2/sample_rate), N for [P_TimerB_Data]
//------------------------------------------------
.public T_SACM_MS01_DrumSampleRate        
T_SACM_MS01_DrumSampleRate:
		.dw 0xFA00				//0
        .dw 0xFA00				//1
		.dw 0xFA00				//2
        .dw 0xFA00				//3
        .dw 0xFA00				//4
        .dw 0xFA00				//5
        .dw 0xFA00				//6
        .dw 0xFA00				//7
        .dw 0xFA00				//8
        .dw 0xFA00				//9
        .dw 0xFA00				//10
        .dw 0xFA00				//11
        .dw 0xFA00				//12
        .dw 0xFA00				//13
        .dw 0xFA00				//14
        .dw 0xFA00				//15
        .dw 0xFA00				//16
        .dw 0xFA00				//17
        .dw 0xFA00				//18
		.dw 0xFA00				//19
