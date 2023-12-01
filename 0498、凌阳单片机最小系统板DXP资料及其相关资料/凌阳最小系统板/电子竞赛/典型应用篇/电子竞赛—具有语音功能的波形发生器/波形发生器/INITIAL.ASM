.define		P_DAC_Ctrl		0x702A 
.define		P_DAC1			0x7017
.define		P_DAC2			0x7016
.define     P_System_Clock  0x7013
.external _Bianxing
.external _Bianxing1
.code
.public _Gaopin;
_Gaopin:.proc
 r1=0x0098
    [P_System_Clock]=r1
    r1=0x0000;
    [P_DAC_Ctrl]=r1;
    r3=0xffff					//D/A转换为10位，即B15~B6
    r1=0x0000;
    r1=0
    [_Bianxing]=r1
    [_Bianxing1]=r1
    
retf
.endp


.public _Dipin;
_Dipin:.proc
 r1=0x0025
    [P_System_Clock]=r1
    r1=0x0000;
    [P_DAC_Ctrl]=r1;
    r3=0xffff					//D/A转换为10位，即B15~B6
    r1=0x0000;
retf
.endp

.public _DAC_FW;
_DAC_FW:.proc
 [P_DAC1]=r1
 [P_DAC2]=r1
    
retf
.endp
