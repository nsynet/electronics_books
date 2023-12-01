
// Resource Table
// Created by IDE, Do not modify this table

.TEXT
.external _RES_Table;
.external _RES_2_48K_SA;
.external _RES_2_48K_EA;
.external _RES_3_48K_SA;
.external _RES_3_48K_EA;
.external _RES_5_48K_SA;
.external _RES_5_48K_EA;
.external _RES_10_48K_SA;
.external _RES_10_48K_EA;
.external _RES_11_48K_SA;
.external _RES_11_48K_EA;
.external _RES_15_48K_SA;
.external _RES_15_48K_EA;
.external _RES_S12_24K_SA;
.external _RES_S12_24K_EA;

// End Table
.PUBLIC T_SACM_S480_SpeechTable;
T_SACM_S480_SpeechTable:
.DW _RES_2_48K_SA
.DW _RES_3_48K_SA
.DW _RES_5_48K_SA
.DW _RES_11_48K_SA
.DW _RES_10_48K_SA
.DW _RES_15_48K_SA
 
.PUBLIC T_SACM_A2000_SpeechTable;
T_SACM_A2000_SpeechTable:
.DW _RES_S12_24K_SA				//0. Gun sound.
