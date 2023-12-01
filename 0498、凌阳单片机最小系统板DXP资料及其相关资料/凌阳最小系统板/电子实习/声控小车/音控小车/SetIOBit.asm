.INCLUDE  hardware.inc
.DATA
  Bit:   .DW 0xfffe,0xfffd,0xfffb,0xfff7,0xffef,0xffdf,0xffbf,0xff7f,0xfeff,0xfdff,0xfbff,0xf7ff,0xefff,0xdfff,0xbfff,0x7fff;//'0''1''2''3''4''5''6''7''8''9'µÄ´úÂë
  One:   .DW 0x0001,0x0002,0x0004,0x0008,0x0010,0x0020,0x0040,0x0080,0x0100,0x0200,0x0400,0x0800,0x1000,0x2000,0x4000,0x8000;

.CODE
.public _Set_IOA_Bit
.public Set_IOA_Bit
_Set_IOA_Bit: .PROC
Set_IOA_Bit:
    push bp to [sp];  
    bp = sp + 3  
    r4 = [bp+1]
    r1=  [P_IOA_Dir]
    r2= r4+Bit
    r2= [r2]
    r1= r1&r2
    r3 = [bp+2]
    cmp r3,0
    je AZeroDir
    r2= r4+One
    r2= [r2]
    r1= r1|r2
    [P_IOA_Dir]=r1
AZeroDir:
    [P_IOA_Dir]=r1 
    r1=  [P_IOA_Attrib]
    r2= r4+Bit
    r2= [r2]
    r1= r1&r2
    r3 = [bp+3]
    cmp r3,0
    je AZeroAttrib
    r2= r4+One
    r2= [r2]
    r1= r1|r2
    [P_IOA_Attrib]=r1
AZeroAttrib:
    [P_IOA_Attrib]=r1
    r1=  [P_IOA_Buffer]
    r2= r4+Bit
    r2= [r2]
    r1= r1&r2
    r3 = [bp+4]
    cmp r3,0
    je AZeroBuffer
    r2= r4+One
    r2= [r2]
    r1= r1|r2
    [P_IOA_Buffer]=r1
AZeroBuffer:
    [P_IOA_Buffer]=r1
    r1=  [P_IOA_Buffer]
    r2= r4+Bit
    r2= [r2]
    r1= r1&r2
    r3 = [bp+4]
    cmp r3,0
    je AZeroData
    r2= r4+One
    r2= [r2]
    r1= r1|r2
    [P_IOA_Data]=r1
AZeroData:
    [P_IOA_Data]=r1
    pop bp from [sp]
    retf;
.ENDP

.public _Set_IOB_Bit
.public Set_IOB_Bit
_Set_IOB_Bit: .PROC
Set_IOB_Bit:
    push bp to [sp];  
    bp = sp + 3 
    r4 = [bp+1]
    r1=  [P_IOB_Dir]
    r2= r4+Bit
    r2= [r2]
    r1= r1&r2
    r3 = [bp+2]
    cmp r3,0
    je BZeroDir
    r2= r4+One
    r2= [r2]
    r1= r1|r2
    [P_IOB_Dir]=r1
BZeroDir:
    [P_IOB_Dir]=r1 
    r1=  [P_IOB_Attrib]
    r2= r4+Bit
    r2= [r2]
    r1= r1&r2
    r3 = [bp+3]
    cmp r3,0
    je BZeroAttrib
    r2= r4+One
    r2= [r2]
    r1= r1|r2
    [P_IOB_Attrib]=r1
BZeroAttrib:
    [P_IOB_Attrib]=r1
    r1=  [P_IOB_Buffer]
    r2= r4+Bit
    r2= [r2]
    r1= r1&r2
    r3 = [bp+4]
    cmp r3,0
    je BZeroBuffer
    r2= r4+One
    r2= [r2]
    r1= r1|r2
    [P_IOB_Buffer]=r1
BZeroBuffer:
    [P_IOB_Buffer]=r1
    r1=  [P_IOB_Buffer]
    r2= r4+Bit
    r2= [r2]
    r1= r1&r2
    r3 = [bp+4]
    cmp r3,0
    je BZeroData
    r2= r4+One
    r2= [r2]
    r1= r1|r2
    [P_IOB_Data]=r1
BZeroData:
    [P_IOB_Data]=r1
    pop bp from [sp]
    retf;
.ENDP

.PUBLIC _Get_IOA_Bit
.PUBLIC Get_IOA_Bit
_Get_IOA_Bit:.PROC
Get_IOA_Bit:
    push bp to [sp];  
    bp = sp + 3 
    r3 = [bp+2]
    cmp r3,0
    je  AGetBufferBit
    r4 = [bp+1]
    r1=  [P_IOA_Data]
    r2= r4+Bit
    r2= [r2]
    r1= r1|r2
    cmp r1,r2
    je AReturnData0
    r1=1
    pop bp from [sp]
    retf;
AReturnData0:
    r1=0 
    pop bp from [sp]
    retf;
AGetBufferBit:
    r4 = [bp+1]
    r1=  [P_IOA_Buffer]
    r2= r4+Bit
    r2= [r2]
    r1= r1|r2
    cmp r1,r2
    je AReturnBuffer0
    r1=1
    pop bp from [sp]
    retf;
AReturnBuffer0:
    r1=0 
    pop bp from [sp]
    retf;  
    .ENDP
    
.PUBLIC _Get_IOB_Bit
.PUBLIC Get_IOB_Bit
_Get_IOB_Bit:.PROC
Get_IOB_Bit:
    push bp to [sp];  
    bp = sp + 3 
    r3 = [bp+2]
    cmp r3,0
    je  BGetBufferBit
    r4 = [bp+1]
    r1=  [P_IOB_Data]
    r2= r4+Bit
    r2= [r2]
    r1= r1|r2
    cmp r1,r2
    je BReturnData0
    r1=1
    pop bp from [sp]
    retf;
   
BReturnData0:
    r1=0 
    pop bp from [sp]
    retf;
BGetBufferBit:
    r4 = [bp+1]
    r1=  [P_IOB_Buffer]
    r2= r4+Bit
    r2= [r2]
    r1= r1|r2
    cmp r1,r2
    je BReturnBuffer0
    r1=1
    pop bp from [sp]
    retf;
BReturnBuffer0:
    r1=0 
    pop bp from [sp] 
    retf;
    .ENDP
    
.public _Set_IOA0_Dir0
.public Set_IOA0_Dir0
_Set_IOA0_Dir0: .PROC
Set_IOA0_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xfffe
    r1= r1&r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA0_Dir1
.public Set_IOA0_Dir1
_Set_IOA0_Dir1: .PROC
Set_IOA0_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xfffe
    r1= r1&r2
    r2=  0x0001
    r1=r1|r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA1_Dir0
.public Set_IOA1_Dir0
_Set_IOA1_Dir0: .PROC
Set_IOA1_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xfffd
    r1= r1&r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA1_Dir1
.public Set_IOA1_Dir1
_Set_IOA1_Dir1: .PROC
Set_IOA1_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xfffd
    r1= r1&r2
    r2=  0x0002
    r1=r1|r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA2_Dir0
.public Set_IOA2_Dir0
_Set_IOA2_Dir0: .PROC
Set_IOA2_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xfffb
    r1= r1&r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA2_Dir1
.public Set_IOA2_Dir1
_Set_IOA2_Dir1: .PROC
Set_IOA2_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xfffb
    r1= r1&r2
    r2=  0x0004
    r1=r1|r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA3_Dir0
.public Set_IOA3_Dir0
_Set_IOA3_Dir0: .PROC
Set_IOA3_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xfff7
    r1= r1&r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA3_Dir1
.public Set_IOA3_Dir1
_Set_IOA3_Dir1: .PROC
Set_IOA3_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xfff7
    r1= r1&r2
    r2=  0x0008
    r1=r1|r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA4_Dir0
.public Set_IOA4_Dir0
_Set_IOA4_Dir0: .PROC
Set_IOA4_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xffef
    r1= r1&r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA4_Dir1
.public Set_IOA4_Dir1
_Set_IOA4_Dir1: .PROC
Set_IOA4_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xffef
    r1= r1&r2
    r2=  0x0010
    r1=r1|r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA5_Dir0
.public Set_IOA5_Dir0
_Set_IOA5_Dir0: .PROC
Set_IOA5_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xffdf
    r1= r1&r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA5_Dir1
.public Set_IOA5_Dir1
_Set_IOA5_Dir1: .PROC
Set_IOA5_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xffdf
    r1= r1&r2
    r2=  0x0020
    r1=r1|r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA6_Dir0
.public Set_IOA6_Dir0
_Set_IOA6_Dir0: .PROC
Set_IOA6_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xffbf
    r1= r1&r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA6_Dir1
.public Set_IOA6_Dir1
_Set_IOA6_Dir1: .PROC
Set_IOA6_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xffbf
    r1= r1&r2
    r2=  0x0040
    r1=r1|r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA7_Dir0
.public Set_IOA7_Dir0
_Set_IOA7_Dir0: .PROC
Set_IOA7_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xff7f
    r1= r1&r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA7_Dir1
.public Set_IOA7_Dir1
_Set_IOA7_Dir1: .PROC
Set_IOA7_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xff7f
    r1= r1&r2
    r2=  0x0080
    r1=r1|r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA8_Dir0
.public Set_IOA8_Dir0
_Set_IOA8_Dir0: .PROC
Set_IOA8_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xfeff
    r1= r1&r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA8_Dir1
.public Set_IOA8_Dir1
_Set_IOA8_Dir1: .PROC
Set_IOA8_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xfeff
    r1= r1&r2
    r2=  0x0100
    r1=r1|r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA9_Dir0
.public Set_IOA9_Dir0
_Set_IOA9_Dir0: .PROC
Set_IOA9_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xfdff
    r1= r1&r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA9_Dir1
.public Set_IOA9_Dir1
_Set_IOA9_Dir1: .PROC
Set_IOA9_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xfdff
    r1= r1&r2
    r2=  0x0200
    r1=r1|r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA10_Dir0
.public Set_IOA10_Dir0
_Set_IOA10_Dir0: .PROC
Set_IOA10_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xfbff
    r1= r1&r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA10_Dir1
.public Set_IOA10_Dir1
_Set_IOA10_Dir1: .PROC
Set_IOA10_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xfbff
    r1= r1&r2
    r2=  0x0400
    r1=r1|r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA11_Dir0
.public Set_IOA11_Dir0
_Set_IOA11_Dir0: .PROC
Set_IOA11_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xf7ff
    r1= r1&r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA11_Dir1
.public Set_IOA11_Dir1
_Set_IOA11_Dir1: .PROC
Set_IOA11_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xf7ff
    r1= r1&r2
    r2=  0x0800
    r1=r1|r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA12_Dir0
.public Set_IOA12_Dir0
_Set_IOA12_Dir0: .PROC
Set_IOA12_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xefff
    r1= r1&r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA12_Dir1
.public Set_IOA12_Dir1
_Set_IOA12_Dir1: .PROC
Set_IOA12_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xefff
    r1= r1&r2
    r2=  0x1000
    r1=r1|r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA13_Dir0
.public Set_IOA13_Dir0
_Set_IOA13_Dir0: .PROC
Set_IOA13_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xdfff
    r1= r1&r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA13_Dir1
.public Set_IOA13_Dir1
_Set_IOA13_Dir1: .PROC
Set_IOA13_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xdfff
    r1= r1&r2
    r2=  0x2000
    r1=r1|r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA14_Dir0
.public Set_IOA14_Dir0
_Set_IOA14_Dir0: .PROC
Set_IOA14_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xbfff
    r1= r1&r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA14_Dir1
.public Set_IOA14_Dir1
_Set_IOA14_Dir1: .PROC
Set_IOA14_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0xbfff
    r1= r1&r2
    r2=  0x4000
    r1=r1|r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA15_Dir0
.public Set_IOA15_Dir0
_Set_IOA15_Dir0: .PROC
Set_IOA15_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0x7fff
    r1= r1&r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA15_Dir1
.public Set_IOA15_Dir1
_Set_IOA15_Dir1: .PROC
Set_IOA15_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Dir]
    r2= 0x7fff
    r1= r1&r2
    r2=  0x8000
    r1=r1|r2
    [P_IOA_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA0_Attrib0
.public Set_IOA0_Attrib0
_Set_IOA0_Attrib0: .PROC
Set_IOA0_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xfffe
    r1= r1&r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA0_Attrib1
.public Set_IOA0_Attrib1
_Set_IOA0_Attrib1: .PROC
Set_IOA0_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xfffe
    r1= r1&r2
    r2=  0x0001
    r1=r1|r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA1_Attrib0
.public Set_IOA1_Attrib0
_Set_IOA1_Attrib0: .PROC
Set_IOA1_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xfffd
    r1= r1&r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA1_Attrib1
.public Set_IOA1_Attrib1
_Set_IOA1_Attrib1: .PROC
Set_IOA1_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xfffd
    r1= r1&r2
    r2=  0x0002
    r1=r1|r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA2_Attrib0
.public Set_IOA2_Attrib0
_Set_IOA2_Attrib0: .PROC
Set_IOA2_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xfffb
    r1= r1&r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA2_Attrib1
.public Set_IOA2_Attrib1
_Set_IOA2_Attrib1: .PROC
Set_IOA2_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xfffb
    r1= r1&r2
    r2=  0x0004
    r1=r1|r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA3_Attrib0
.public Set_IOA3_Attrib0
_Set_IOA3_Attrib0: .PROC
Set_IOA3_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xfff7
    r1= r1&r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA3_Attrib1
.public Set_IOA3_Attrib1
_Set_IOA3_Attrib1: .PROC
Set_IOA3_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xfff7
    r1= r1&r2
    r2=  0x0008
    r1=r1|r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA4_Attrib0
.public Set_IOA4_Attrib0
_Set_IOA4_Attrib0: .PROC
Set_IOA4_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xffef
    r1= r1&r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA4_Attrib1
.public Set_IOA4_Attrib1
_Set_IOA4_Attrib1: .PROC
Set_IOA4_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xffef
    r1= r1&r2
    r2=  0x0010
    r1=r1|r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA5_Attrib0
.public Set_IOA5_Attrib0
_Set_IOA5_Attrib0: .PROC
Set_IOA5_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xffdf
    r1= r1&r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA5_Attrib1
.public Set_IOA5_Attrib1
_Set_IOA5_Attrib1: .PROC
Set_IOA5_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xffdf
    r1= r1&r2
    r2=  0x0020
    r1=r1|r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA6_Attrib0
.public Set_IOA6_Attrib0
_Set_IOA6_Attrib0: .PROC
Set_IOA6_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xffbf
    r1= r1&r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA6_Attrib1
.public Set_IOA6_Attrib1
_Set_IOA6_Attrib1: .PROC
Set_IOA6_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xffbf
    r1= r1&r2
    r2=  0x0040
    r1=r1|r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA7_Attrib0
.public Set_IOA7_Attrib0
_Set_IOA7_Attrib0: .PROC
Set_IOA7_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xff7f
    r1= r1&r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA7_Attrib1
.public Set_IOA7_Attrib1
_Set_IOA7_Attrib1: .PROC
Set_IOA7_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xff7f
    r1= r1&r2
    r2=  0x0080
    r1=r1|r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA8_Attrib0
.public Set_IOA8_Attrib0
_Set_IOA8_Attrib0: .PROC
Set_IOA8_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xfeff
    r1= r1&r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA8_Attrib1
.public Set_IOA8_Attrib1
_Set_IOA8_Attrib1: .PROC
Set_IOA8_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xfeff
    r1= r1&r2
    r2=  0x0100
    r1=r1|r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA9_Attrib0
.public Set_IOA9_Attrib0
_Set_IOA9_Attrib0: .PROC
Set_IOA9_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xfdff
    r1= r1&r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA9_Attrib1
.public Set_IOA9_Attrib1
_Set_IOA9_Attrib1: .PROC
Set_IOA9_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xfdff
    r1= r1&r2
    r2=  0x0200
    r1=r1|r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA10_Attrib0
.public Set_IOA10_Attrib0
_Set_IOA10_Attrib0: .PROC
Set_IOA10_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xfbff
    r1= r1&r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA10_Attrib1
.public Set_IOA10_Attrib1
_Set_IOA10_Attrib1: .PROC
Set_IOA10_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xfbff
    r1= r1&r2
    r2=  0x0400
    r1=r1|r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA11_Attrib0
.public Set_IOA11_Attrib0
_Set_IOA11_Attrib0: .PROC
Set_IOA11_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xf7ff
    r1= r1&r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA11_Attrib1
.public Set_IOA11_Attrib1
_Set_IOA11_Attrib1: .PROC
Set_IOA11_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xf7ff
    r1= r1&r2
    r2=  0x0800
    r1=r1|r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA12_Attrib0
.public Set_IOA12_Attrib0
_Set_IOA12_Attrib0: .PROC
Set_IOA12_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xefff
    r1= r1&r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA12_Attrib1
.public Set_IOA12_Attrib1
_Set_IOA12_Attrib1: .PROC
Set_IOA12_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xefff
    r1= r1&r2
    r2=  0x1000
    r1=r1|r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA13_Attrib0
.public Set_IOA13_Attrib0
_Set_IOA13_Attrib0: .PROC
Set_IOA13_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xdfff
    r1= r1&r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA13_Attrib1
.public Set_IOA13_Attrib1
_Set_IOA13_Attrib1: .PROC
Set_IOA13_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xdfff
    r1= r1&r2
    r2=  0x2000
    r1=r1|r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA14_Attrib0
.public Set_IOA14_Attrib0
_Set_IOA14_Attrib0: .PROC
Set_IOA14_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xbfff
    r1= r1&r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA14_Attrib1
.public Set_IOA14_Attrib1
_Set_IOA14_Attrib1: .PROC
Set_IOA14_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0xbfff
    r1= r1&r2
    r2=  0x4000
    r1=r1|r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA15_Attrib0
.public Set_IOA15_Attrib0
_Set_IOA15_Attrib0: .PROC
Set_IOA15_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0x7fff
    r1= r1&r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA15_Attrib1
.public Set_IOA15_Attrib1
_Set_IOA15_Attrib1: .PROC
Set_IOA15_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Attrib]
    r2= 0x7fff
    r1= r1&r2
    r2=  0x8000
    r1=r1|r2
    [P_IOA_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA0_Buffer0
.public Set_IOA0_Buffer0
_Set_IOA0_Buffer0: .PROC
Set_IOA0_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfffe
    r1= r1&r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA0_Buffer1
.public Set_IOA0_Buffer1
_Set_IOA0_Buffer1: .PROC
Set_IOA0_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfffe
    r1= r1&r2
    r2=  0x0001
    r1=r1|r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA1_Buffer0
.public Set_IOA1_Buffer0
_Set_IOA1_Buffer0: .PROC
Set_IOA1_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfffd
    r1= r1&r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA1_Buffer1
.public Set_IOA1_Buffer1
_Set_IOA1_Buffer1: .PROC
Set_IOA1_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfffd
    r1= r1&r2
    r2=  0x0002
    r1=r1|r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA2_Buffer0
.public Set_IOA2_Buffer0
_Set_IOA2_Buffer0: .PROC
Set_IOA2_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfffb
    r1= r1&r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA2_Buffer1
.public Set_IOA2_Buffer1
_Set_IOA2_Buffer1: .PROC
Set_IOA2_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfffb
    r1= r1&r2
    r2=  0x0004
    r1=r1|r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA3_Buffer0
.public Set_IOA3_Buffer0
_Set_IOA3_Buffer0: .PROC
Set_IOA3_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfff7
    r1= r1&r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA3_Buffer1
.public Set_IOA3_Buffer1
_Set_IOA3_Buffer1: .PROC
Set_IOA3_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfff7
    r1= r1&r2
    r2=  0x0008
    r1=r1|r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA4_Buffer0
.public Set_IOA4_Buffer0
_Set_IOA4_Buffer0: .PROC
Set_IOA4_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xffef
    r1= r1&r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA4_Buffer1
.public Set_IOA4_Buffer1
_Set_IOA4_Buffer1: .PROC
Set_IOA4_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xffef
    r1= r1&r2
    r2=  0x0010
    r1=r1|r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA5_Buffer0
.public Set_IOA5_Buffer0
_Set_IOA5_Buffer0: .PROC
Set_IOA5_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xffdf
    r1= r1&r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA5_Buffer1
.public Set_IOA5_Buffer1
_Set_IOA5_Buffer1: .PROC
Set_IOA5_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xffdf
    r1= r1&r2
    r2=  0x0020
    r1=r1|r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA6_Buffer0
.public Set_IOA6_Buffer0
_Set_IOA6_Buffer0: .PROC
Set_IOA6_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xffbf
    r1= r1&r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA6_Buffer1
.public Set_IOA6_Buffer1
_Set_IOA6_Buffer1: .PROC
Set_IOA6_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xffbf
    r1= r1&r2
    r2=  0x0040
    r1=r1|r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA7_Buffer0
.public Set_IOA7_Buffer0
_Set_IOA7_Buffer0: .PROC
Set_IOA7_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xff7f
    r1= r1&r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA7_Buffer1
.public Set_IOA7_Buffer1
_Set_IOA7_Buffer1: .PROC
Set_IOA7_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xff7f
    r1= r1&r2
    r2=  0x0080
    r1=r1|r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA8_Buffer0
.public Set_IOA8_Buffer0
_Set_IOA8_Buffer0: .PROC
Set_IOA8_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfeff
    r1= r1&r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA8_Buffer1
.public Set_IOA8_Buffer1
_Set_IOA8_Buffer1: .PROC
Set_IOA8_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfeff
    r1= r1&r2
    r2=  0x0100
    r1=r1|r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA9_Buffer0
.public Set_IOA9_Buffer0
_Set_IOA9_Buffer0: .PROC
Set_IOA9_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfdff
    r1= r1&r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA9_Buffer1
.public Set_IOA9_Buffer1
_Set_IOA9_Buffer1: .PROC
Set_IOA9_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfdff
    r1= r1&r2
    r2=  0x0200
    r1=r1|r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA10_Buffer0
.public Set_IOA10_Buffer0
_Set_IOA10_Buffer0: .PROC
Set_IOA10_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfbff
    r1= r1&r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA10_Buffer1
.public Set_IOA10_Buffer1
_Set_IOA10_Buffer1: .PROC
Set_IOA10_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfbff
    r1= r1&r2
    r2=  0x0400
    r1=r1|r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA11_Buffer0
.public Set_IOA11_Buffer0
_Set_IOA11_Buffer0: .PROC
Set_IOA11_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xf7ff
    r1= r1&r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA11_Buffer1
.public Set_IOA11_Buffer1
_Set_IOA11_Buffer1: .PROC
Set_IOA11_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xf7ff
    r1= r1&r2
    r2=  0x0800
    r1=r1|r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA12_Buffer0
.public Set_IOA12_Buffer0
_Set_IOA12_Buffer0: .PROC
Set_IOA12_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xefff
    r1= r1&r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA12_Buffer1
.public Set_IOA12_Buffer1
_Set_IOA12_Buffer1: .PROC
Set_IOA12_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xefff
    r1= r1&r2
    r2=  0x1000
    r1=r1|r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA13_Buffer0
.public Set_IOA13_Buffer0
_Set_IOA13_Buffer0: .PROC
Set_IOA13_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xdfff
    r1= r1&r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA13_Buffer1
.public Set_IOA13_Buffer1
_Set_IOA13_Buffer1: .PROC
Set_IOA13_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xdfff
    r1= r1&r2
    r2=  0x2000
    r1=r1|r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA14_Buffer0
.public Set_IOA14_Buffer0
_Set_IOA14_Buffer0: .PROC
Set_IOA14_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xbfff
    r1= r1&r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA14_Buffer1
.public Set_IOA14_Buffer1
_Set_IOA14_Buffer1: .PROC
Set_IOA14_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xbfff
    r1= r1&r2
    r2=  0x4000
    r1=r1|r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA15_Buffer0
.public Set_IOA15_Buffer0
_Set_IOA15_Buffer0: .PROC
Set_IOA15_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0x7fff
    r1= r1&r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA15_Buffer1
.public Set_IOA15_Buffer1
_Set_IOA15_Buffer1: .PROC
Set_IOA15_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0x7fff
    r1= r1&r2
    r2=  0x8000
    r1=r1|r2
    [P_IOA_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA0_Data0
.public Set_IOA0_Data0
_Set_IOA0_Data0: .PROC
Set_IOA0_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Data]
    r2= 0xfffe
    r1= r1&r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA0_Data1
.public Set_IOA0_Data1
_Set_IOA0_Data1: .PROC
Set_IOA0_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfffe
    r1= r1&r2
    r2=  0x0001
    r1=r1|r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA1_Data0
.public Set_IOA1_Data0
_Set_IOA1_Data0: .PROC
Set_IOA1_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfffd
    r1= r1&r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA1_Data1
.public Set_IOA1_Data1
_Set_IOA1_Data1: .PROC
Set_IOA1_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfffd
    r1= r1&r2
    r2=  0x0002
    r1=r1|r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA2_Data0
.public Set_IOA2_Data0
_Set_IOA2_Data0: .PROC
Set_IOA2_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfffb
    r1= r1&r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA2_Data1
.public Set_IOA2_Data1
_Set_IOA2_Data1: .PROC
Set_IOA2_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfffb
    r1= r1&r2
    r2=  0x0004
    r1=r1|r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA3_Data0
.public Set_IOA3_Data0
_Set_IOA3_Data0: .PROC
Set_IOA3_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfff7
    r1= r1&r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA3_Data1
.public Set_IOA3_Data1
_Set_IOA3_Data1: .PROC
Set_IOA3_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfff7
    r1= r1&r2
    r2=  0x0008
    r1=r1|r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA4_Data0
.public Set_IOA4_Data0
_Set_IOA4_Data0: .PROC
Set_IOA4_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xffef
    r1= r1&r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA4_Data1
.public Set_IOA4_Data1
_Set_IOA4_Data1: .PROC
Set_IOA4_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xffef
    r1= r1&r2
    r2=  0x0010
    r1=r1|r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA5_Data0
.public Set_IOA5_Data0
_Set_IOA5_Data0: .PROC
Set_IOA5_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xffdf
    r1= r1&r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA5_Data1
.public Set_IOA5_Data1
_Set_IOA5_Data1: .PROC
Set_IOA5_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xffdf
    r1= r1&r2
    r2=  0x0020
    r1=r1|r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA6_Data0
.public Set_IOA6_Data0
_Set_IOA6_Data0: .PROC
Set_IOA6_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xffbf
    r1= r1&r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA6_Data1
.public Set_IOA6_Data1
_Set_IOA6_Data1: .PROC
Set_IOA6_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xffbf
    r1= r1&r2
    r2=  0x0040
    r1=r1|r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA7_Data0
.public Set_IOA7_Data0
_Set_IOA7_Data0: .PROC
Set_IOA7_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xff7f
    r1= r1&r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA7_Data1
.public Set_IOA7_Data1
_Set_IOA7_Data1: .PROC
Set_IOA7_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xff7f
    r1= r1&r2
    r2=  0x0080
    r1=r1|r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA8_Data0
.public Set_IOA8_Data0
_Set_IOA8_Data0: .PROC
Set_IOA8_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfeff
    r1= r1&r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA8_Data1
.public Set_IOA8_Data1
_Set_IOA8_Data1: .PROC
Set_IOA8_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfeff
    r1= r1&r2
    r2=  0x0100
    r1=r1|r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA9_Data0
.public Set_IOA9_Data0
_Set_IOA9_Data0: .PROC
Set_IOA9_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfdff
    r1= r1&r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA9_Data1
.public Set_IOA9_Data1
_Set_IOA9_Data1: .PROC
Set_IOA9_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfdff
    r1= r1&r2
    r2=  0x0200
    r1=r1|r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA10_Data0
.public Set_IOA10_Data0
_Set_IOA10_Data0: .PROC
Set_IOA10_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfbff
    r1= r1&r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA10_Data1
.public Set_IOA10_Data1
_Set_IOA10_Data1: .PROC
Set_IOA10_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xfbff
    r1= r1&r2
    r2=  0x0400
    r1=r1|r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA11_Data0
.public Set_IOA11_Data0
_Set_IOA11_Data0: .PROC
Set_IOA11_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xf7ff
    r1= r1&r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA11_Data1
.public Set_IOA11_Data1
_Set_IOA11_Data1: .PROC
Set_IOA11_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xf7ff
    r1= r1&r2
    r2=  0x0800
    r1=r1|r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA12_Data0
.public Set_IOA12_Data0
_Set_IOA12_Data0: .PROC
Set_IOA12_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xefff
    r1= r1&r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA12_Data1
.public Set_IOA12_Data1
_Set_IOA12_Data1: .PROC
Set_IOA12_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xefff
    r1= r1&r2
    r2=  0x1000
    r1=r1|r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA13_Data0
.public Set_IOA13_Data0
_Set_IOA13_Data0: .PROC
Set_IOA13_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xdfff
    r1= r1&r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA13_Data1
.public Set_IOA13_Data1
_Set_IOA13_Data1: .PROC
Set_IOA13_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xdfff
    r1= r1&r2
    r2=  0x2000
    r1=r1|r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA14_Data0
.public Set_IOA14_Data0
_Set_IOA14_Data0: .PROC
Set_IOA14_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xbfff
    r1= r1&r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA14_Data1
.public Set_IOA14_Data1
_Set_IOA14_Data1: .PROC
Set_IOA14_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0xbfff
    r1= r1&r2
    r2=  0x4000
    r1=r1|r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA15_Data0
.public Set_IOA15_Data0
_Set_IOA15_Data0: .PROC
Set_IOA15_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0x7fff
    r1= r1&r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOA15_Data1
.public Set_IOA15_Data1
_Set_IOA15_Data1: .PROC
Set_IOA15_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOA_Buffer]
    r2= 0x7fff
    r1= r1&r2
    r2=  0x8000
    r1=r1|r2
    [P_IOA_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB0_Dir0
.public Set_IOB0_Dir0
_Set_IOB0_Dir0: .PROC
Set_IOB0_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xfffe
    r1= r1&r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB0_Dir1
.public Set_IOB0_Dir1
_Set_IOB0_Dir1: .PROC
Set_IOB0_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xfffe
    r1= r1&r2
    r2=  0x0001
    r1=r1|r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB1_Dir0
.public Set_IOB1_Dir0
_Set_IOB1_Dir0: .PROC
Set_IOB1_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xfffd
    r1= r1&r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB1_Dir1
.public Set_IOB1_Dir1
_Set_IOB1_Dir1: .PROC
Set_IOB1_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xfffd
    r1= r1&r2
    r2=  0x0002
    r1=r1|r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB2_Dir0
.public Set_IOB2_Dir0
_Set_IOB2_Dir0: .PROC
Set_IOB2_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xfffb
    r1= r1&r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB2_Dir1
.public Set_IOB2_Dir1
_Set_IOB2_Dir1: .PROC
Set_IOB2_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xfffb
    r1= r1&r2
    r2=  0x0004
    r1=r1|r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB3_Dir0
.public Set_IOB3_Dir0
_Set_IOB3_Dir0: .PROC
Set_IOB3_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xfff7
    r1= r1&r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB3_Dir1
.public Set_IOB3_Dir1
_Set_IOB3_Dir1: .PROC
Set_IOB3_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xfff7
    r1= r1&r2
    r2=  0x0008
    r1=r1|r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB4_Dir0
.public Set_IOB4_Dir0
_Set_IOB4_Dir0: .PROC
Set_IOB4_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xffef
    r1= r1&r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB4_Dir1
.public Set_IOB4_Dir1
_Set_IOB4_Dir1: .PROC
Set_IOB4_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xffef
    r1= r1&r2
    r2=  0x0010
    r1=r1|r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB5_Dir0
.public Set_IOB5_Dir0
_Set_IOB5_Dir0: .PROC
Set_IOB5_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xffdf
    r1= r1&r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB5_Dir1
.public Set_IOB5_Dir1
_Set_IOB5_Dir1: .PROC
Set_IOB5_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xffdf
    r1= r1&r2
    r2=  0x0020
    r1=r1|r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB6_Dir0
.public Set_IOB6_Dir0
_Set_IOB6_Dir0: .PROC
Set_IOB6_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xffbf
    r1= r1&r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB6_Dir1
.public Set_IOB6_Dir1
_Set_IOB6_Dir1: .PROC
Set_IOB6_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xffbf
    r1= r1&r2
    r2=  0x0040
    r1=r1|r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB7_Dir0
.public Set_IOB7_Dir0
_Set_IOB7_Dir0: .PROC
Set_IOB7_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xff7f
    r1= r1&r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB7_Dir1
.public Set_IOB7_Dir1
_Set_IOB7_Dir1: .PROC
Set_IOB7_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xff7f
    r1= r1&r2
    r2=  0x0080
    r1=r1|r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB8_Dir0
.public Set_IOB8_Dir0
_Set_IOB8_Dir0: .PROC
Set_IOB8_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xfeff
    r1= r1&r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB8_Dir1
.public Set_IOB8_Dir1
_Set_IOB8_Dir1: .PROC
Set_IOB8_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xfeff
    r1= r1&r2
    r2=  0x0100
    r1=r1|r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB9_Dir0
.public Set_IOB9_Dir0
_Set_IOB9_Dir0: .PROC
Set_IOB9_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xfdff
    r1= r1&r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB9_Dir1
.public Set_IOB9_Dir1
_Set_IOB9_Dir1: .PROC
Set_IOB9_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xfdff
    r1= r1&r2
    r2=  0x0200
    r1=r1|r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB10_Dir0
.public Set_IOB10_Dir0
_Set_IOB10_Dir0: .PROC
Set_IOB10_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xfbff
    r1= r1&r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB10_Dir1
.public Set_IOB10_Dir1
_Set_IOB10_Dir1: .PROC
Set_IOB10_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xfbff
    r1= r1&r2
    r2=  0x0400
    r1=r1|r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB11_Dir0
.public Set_IOB11_Dir0
_Set_IOB11_Dir0: .PROC
Set_IOB11_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xf7ff
    r1= r1&r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB11_Dir1
.public Set_IOB11_Dir1
_Set_IOB11_Dir1: .PROC
Set_IOB11_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xf7ff
    r1= r1&r2
    r2=  0x0800
    r1=r1|r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB12_Dir0
.public Set_IOB12_Dir0
_Set_IOB12_Dir0: .PROC
Set_IOB12_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xefff
    r1= r1&r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB12_Dir1
.public Set_IOB12_Dir1
_Set_IOB12_Dir1: .PROC
Set_IOB12_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xefff
    r1= r1&r2
    r2=  0x1000
    r1=r1|r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB13_Dir0
.public Set_IOB13_Dir0
_Set_IOB13_Dir0: .PROC
Set_IOB13_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xdfff
    r1= r1&r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB13_Dir1
.public Set_IOB13_Dir1
_Set_IOB13_Dir1: .PROC
Set_IOB13_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xdfff
    r1= r1&r2
    r2=  0x2000
    r1=r1|r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB14_Dir0
.public Set_IOB14_Dir0
_Set_IOB14_Dir0: .PROC
Set_IOB14_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xbfff
    r1= r1&r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB14_Dir1
.public Set_IOB14_Dir1
_Set_IOB14_Dir1: .PROC
Set_IOB14_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0xbfff
    r1= r1&r2
    r2=  0x4000
    r1=r1|r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB15_Dir0
.public Set_IOB15_Dir0
_Set_IOB15_Dir0: .PROC
Set_IOB15_Dir0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0x7fff
    r1= r1&r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB15_Dir1
.public Set_IOB15_Dir1
_Set_IOB15_Dir1: .PROC
Set_IOB15_Dir1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Dir]
    r2= 0x7fff
    r1= r1&r2
    r2=  0x8000
    r1=r1|r2
    [P_IOB_Dir]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB0_Attrib0
.public Set_IOB0_Attrib0
_Set_IOB0_Attrib0: .PROC
Set_IOB0_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xfffe
    r1= r1&r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB0_Attrib1
.public Set_IOB0_Attrib1
_Set_IOB0_Attrib1: .PROC
Set_IOB0_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xfffe
    r1= r1&r2
    r2=  0x0001
    r1=r1|r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB1_Attrib0
.public Set_IOB1_Attrib0
_Set_IOB1_Attrib0: .PROC
Set_IOB1_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xfffd
    r1= r1&r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB1_Attrib1
.public Set_IOB1_Attrib1
_Set_IOB1_Attrib1: .PROC
Set_IOB1_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xfffd
    r1= r1&r2
    r2=  0x0002
    r1=r1|r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB2_Attrib0
.public Set_IOB2_Attrib0
_Set_IOB2_Attrib0: .PROC
Set_IOB2_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xfffb
    r1= r1&r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB2_Attrib1
.public Set_IOB2_Attrib1
_Set_IOB2_Attrib1: .PROC
Set_IOB2_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xfffb
    r1= r1&r2
    r2=  0x0004
    r1=r1|r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB3_Attrib0
.public Set_IOB3_Attrib0
_Set_IOB3_Attrib0: .PROC
Set_IOB3_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xfff7
    r1= r1&r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB3_Attrib1
.public Set_IOB3_Attrib1
_Set_IOB3_Attrib1: .PROC
Set_IOB3_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xfff7
    r1= r1&r2
    r2=  0x0008
    r1=r1|r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB4_Attrib0
.public Set_IOB4_Attrib0
_Set_IOB4_Attrib0: .PROC
Set_IOB4_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xffef
    r1= r1&r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB4_Attrib1
.public Set_IOB4_Attrib1
_Set_IOB4_Attrib1: .PROC
Set_IOB4_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xffef
    r1= r1&r2
    r2=  0x0010
    r1=r1|r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB5_Attrib0
.public Set_IOB5_Attrib0
_Set_IOB5_Attrib0: .PROC
Set_IOB5_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xffdf
    r1= r1&r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB5_Attrib1
.public Set_IOB5_Attrib1
_Set_IOB5_Attrib1: .PROC
Set_IOB5_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xffdf
    r1= r1&r2
    r2=  0x0020
    r1=r1|r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB6_Attrib0
.public Set_IOB6_Attrib0
_Set_IOB6_Attrib0: .PROC
Set_IOB6_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xffbf
    r1= r1&r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB6_Attrib1
.public Set_IOB6_Attrib1
_Set_IOB6_Attrib1: .PROC
Set_IOB6_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xffbf
    r1= r1&r2
    r2=  0x0040
    r1=r1|r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB7_Attrib0
.public Set_IOB7_Attrib0
_Set_IOB7_Attrib0: .PROC
Set_IOB7_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xff7f
    r1= r1&r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB7_Attrib1
.public Set_IOB7_Attrib1
_Set_IOB7_Attrib1: .PROC
Set_IOB7_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xff7f
    r1= r1&r2
    r2=  0x0080
    r1=r1|r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB8_Attrib0
.public Set_IOB8_Attrib0
_Set_IOB8_Attrib0: .PROC
Set_IOB8_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xfeff
    r1= r1&r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB8_Attrib1
.public Set_IOB8_Attrib1
_Set_IOB8_Attrib1: .PROC
Set_IOB8_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xfeff
    r1= r1&r2
    r2=  0x0100
    r1=r1|r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB9_Attrib0
.public Set_IOB9_Attrib0
_Set_IOB9_Attrib0: .PROC
Set_IOB9_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xfdff
    r1= r1&r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB9_Attrib1
.public Set_IOB9_Attrib1
_Set_IOB9_Attrib1: .PROC
Set_IOB9_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xfdff
    r1= r1&r2
    r2=  0x0200
    r1=r1|r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB10_Attrib0
.public Set_IOB10_Attrib0
_Set_IOB10_Attrib0: .PROC
Set_IOB10_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xfbff
    r1= r1&r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB10_Attrib1
.public Set_IOB10_Attrib1
_Set_IOB10_Attrib1: .PROC
Set_IOB10_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xfbff
    r1= r1&r2
    r2=  0x0400
    r1=r1|r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB11_Attrib0
.public Set_IOB11_Attrib0
_Set_IOB11_Attrib0: .PROC
Set_IOB11_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xf7ff
    r1= r1&r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB11_Attrib1
.public Set_IOB11_Attrib1
_Set_IOB11_Attrib1: .PROC
Set_IOB11_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xf7ff
    r1= r1&r2
    r2=  0x0800
    r1=r1|r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB12_Attrib0
.public Set_IOB12_Attrib0
_Set_IOB12_Attrib0: .PROC
Set_IOB12_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xefff
    r1= r1&r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB12_Attrib1
.public Set_IOB12_Attrib1
_Set_IOB12_Attrib1: .PROC
Set_IOB12_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xefff
    r1= r1&r2
    r2=  0x1000
    r1=r1|r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB13_Attrib0
.public Set_IOB13_Attrib0
_Set_IOB13_Attrib0: .PROC
Set_IOB13_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xdfff
    r1= r1&r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB13_Attrib1
.public Set_IOB13_Attrib1
_Set_IOB13_Attrib1: .PROC
Set_IOB13_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xdfff
    r1= r1&r2
    r2=  0x2000
    r1=r1|r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB14_Attrib0
.public Set_IOB14_Attrib0
_Set_IOB14_Attrib0: .PROC
Set_IOB14_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xbfff
    r1= r1&r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB14_Attrib1
.public Set_IOB14_Attrib1
_Set_IOB14_Attrib1: .PROC
Set_IOB14_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0xbfff
    r1= r1&r2
    r2=  0x4000
    r1=r1|r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB15_Attrib0
.public Set_IOB15_Attrib0
_Set_IOB15_Attrib0: .PROC
Set_IOB15_Attrib0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0x7fff
    r1= r1&r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB15_Attrib1
.public Set_IOB15_Attrib1
_Set_IOB15_Attrib1: .PROC
Set_IOB15_Attrib1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Attrib]
    r2= 0x7fff
    r1= r1&r2
    r2=  0x8000
    r1=r1|r2
    [P_IOB_Attrib]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB0_Buffer0
.public Set_IOB0_Buffer0
_Set_IOB0_Buffer0: .PROC
Set_IOB0_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfffe
    r1= r1&r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB0_Buffer1
.public Set_IOB0_Buffer1
_Set_IOB0_Buffer1: .PROC
Set_IOB0_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfffe
    r1= r1&r2
    r2=  0x0001
    r1=r1|r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB1_Buffer0
.public Set_IOB1_Buffer0
_Set_IOB1_Buffer0: .PROC
Set_IOB1_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfffd
    r1= r1&r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB1_Buffer1
.public Set_IOB1_Buffer1
_Set_IOB1_Buffer1: .PROC
Set_IOB1_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfffd
    r1= r1&r2
    r2=  0x0002
    r1=r1|r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB2_Buffer0
.public Set_IOB2_Buffer0
_Set_IOB2_Buffer0: .PROC
Set_IOB2_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfffb
    r1= r1&r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB2_Buffer1
.public Set_IOB2_Buffer1
_Set_IOB2_Buffer1: .PROC
Set_IOB2_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfffb
    r1= r1&r2
    r2=  0x0004
    r1=r1|r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB3_Buffer0
.public Set_IOB3_Buffer0
_Set_IOB3_Buffer0: .PROC
Set_IOB3_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfff7
    r1= r1&r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB3_Buffer1
.public Set_IOB3_Buffer1
_Set_IOB3_Buffer1: .PROC
Set_IOB3_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfff7
    r1= r1&r2
    r2=  0x0008
    r1=r1|r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB4_Buffer0
.public Set_IOB4_Buffer0
_Set_IOB4_Buffer0: .PROC
Set_IOB4_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xffef
    r1= r1&r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB4_Buffer1
.public Set_IOB4_Buffer1
_Set_IOB4_Buffer1: .PROC
Set_IOB4_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xffef
    r1= r1&r2
    r2=  0x0010
    r1=r1|r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB5_Buffer0
.public Set_IOB5_Buffer0
_Set_IOB5_Buffer0: .PROC
Set_IOB5_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xffdf
    r1= r1&r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB5_Buffer1
.public Set_IOB5_Buffer1
_Set_IOB5_Buffer1: .PROC
Set_IOB5_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xffdf
    r1= r1&r2
    r2=  0x0020
    r1=r1|r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB6_Buffer0
.public Set_IOB6_Buffer0
_Set_IOB6_Buffer0: .PROC
Set_IOB6_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xffbf
    r1= r1&r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB6_Buffer1
.public Set_IOB6_Buffer1
_Set_IOB6_Buffer1: .PROC
Set_IOB6_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xffbf
    r1= r1&r2
    r2=  0x0040
    r1=r1|r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB7_Buffer0
.public Set_IOB7_Buffer0
_Set_IOB7_Buffer0: .PROC
Set_IOB7_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xff7f
    r1= r1&r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB7_Buffer1
.public Set_IOB7_Buffer1
_Set_IOB7_Buffer1: .PROC
Set_IOB7_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xff7f
    r1= r1&r2
    r2=  0x0080
    r1=r1|r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB8_Buffer0
.public Set_IOB8_Buffer0
_Set_IOB8_Buffer0: .PROC
Set_IOB8_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfeff
    r1= r1&r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB8_Buffer1
.public Set_IOB8_Buffer1
_Set_IOB8_Buffer1: .PROC
Set_IOB8_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfeff
    r1= r1&r2
    r2=  0x0100
    r1=r1|r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB9_Buffer0
.public Set_IOB9_Buffer0
_Set_IOB9_Buffer0: .PROC
Set_IOB9_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfdff
    r1= r1&r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB9_Buffer1
.public Set_IOB9_Buffer1
_Set_IOB9_Buffer1: .PROC
Set_IOB9_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfdff
    r1= r1&r2
    r2=  0x0200
    r1=r1|r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB10_Buffer0
.public Set_IOB10_Buffer0
_Set_IOB10_Buffer0: .PROC
Set_IOB10_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfbff
    r1= r1&r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB10_Buffer1
.public Set_IOB10_Buffer1
_Set_IOB10_Buffer1: .PROC
Set_IOB10_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfbff
    r1= r1&r2
    r2=  0x0400
    r1=r1|r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB11_Buffer0
.public Set_IOB11_Buffer0
_Set_IOB11_Buffer0: .PROC
Set_IOB11_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xf7ff
    r1= r1&r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB11_Buffer1
.public Set_IOB11_Buffer1
_Set_IOB11_Buffer1: .PROC
Set_IOB11_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xf7ff
    r1= r1&r2
    r2=  0x0800
    r1=r1|r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB12_Buffer0
.public Set_IOB12_Buffer0
_Set_IOB12_Buffer0: .PROC
Set_IOB12_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xefff
    r1= r1&r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB12_Buffer1
.public Set_IOB12_Buffer1
_Set_IOB12_Buffer1: .PROC
Set_IOB12_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xefff
    r1= r1&r2
    r2=  0x1000
    r1=r1|r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB13_Buffer0
.public Set_IOB13_Buffer0
_Set_IOB13_Buffer0: .PROC
Set_IOB13_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xdfff
    r1= r1&r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB13_Buffer1
.public Set_IOB13_Buffer1
_Set_IOB13_Buffer1: .PROC
Set_IOB13_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xdfff
    r1= r1&r2
    r2=  0x2000
    r1=r1|r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB14_Buffer0
.public Set_IOB14_Buffer0
_Set_IOB14_Buffer0: .PROC
Set_IOB14_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xbfff
    r1= r1&r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB14_Buffer1
.public Set_IOB14_Buffer1
_Set_IOB14_Buffer1: .PROC
Set_IOB14_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xbfff
    r1= r1&r2
    r2=  0x4000
    r1=r1|r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB15_Buffer0
.public Set_IOB15_Buffer0
_Set_IOB15_Buffer0: .PROC
Set_IOB15_Buffer0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0x7fff
    r1= r1&r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB15_Buffer1
.public Set_IOB15_Buffer1
_Set_IOB15_Buffer1: .PROC
Set_IOB15_Buffer1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0x7fff
    r1= r1&r2
    r2=  0x8000
    r1=r1|r2
    [P_IOB_Buffer]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB0_Data0
.public Set_IOB0_Data0
_Set_IOB0_Data0: .PROC
Set_IOB0_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfffe
    r1= r1&r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB0_Data1
.public Set_IOB0_Data1
_Set_IOB0_Data1: .PROC
Set_IOB0_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfffe
    r1= r1&r2
    r2=  0x0001
    r1=r1|r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB1_Data0
.public Set_IOB1_Data0
_Set_IOB1_Data0: .PROC
Set_IOB1_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfffd
    r1= r1&r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB1_Data1
.public Set_IOB1_Data1
_Set_IOB1_Data1: .PROC
Set_IOB1_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfffd
    r1= r1&r2
    r2=  0x0002
    r1=r1|r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB2_Data0
.public Set_IOB2_Data0
_Set_IOB2_Data0: .PROC
Set_IOB2_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfffb
    r1= r1&r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB2_Data1
.public Set_IOB2_Data1
_Set_IOB2_Data1: .PROC
Set_IOB2_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfffb
    r1= r1&r2
    r2=  0x0004
    r1=r1|r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB3_Data0
.public Set_IOB3_Data0
_Set_IOB3_Data0: .PROC
Set_IOB3_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfff7
    r1= r1&r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB3_Data1
.public Set_IOB3_Data1
_Set_IOB3_Data1: .PROC
Set_IOB3_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfff7
    r1= r1&r2
    r2=  0x0008
    r1=r1|r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB4_Data0
.public Set_IOB4_Data0
_Set_IOB4_Data0: .PROC
Set_IOB4_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xffef
    r1= r1&r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB4_Data1
.public Set_IOB4_Data1
_Set_IOB4_Data1: .PROC
Set_IOB4_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xffef
    r1= r1&r2
    r2=  0x0010
    r1=r1|r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB5_Data0
.public Set_IOB5_Data0
_Set_IOB5_Data0: .PROC
Set_IOB5_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xffdf
    r1= r1&r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB5_Data1
.public Set_IOB5_Data1
_Set_IOB5_Data1: .PROC
Set_IOB5_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xffdf
    r1= r1&r2
    r2=  0x0020
    r1=r1|r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB6_Data0
.public Set_IOB6_Data0
_Set_IOB6_Data0: .PROC
Set_IOB6_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xffbf
    r1= r1&r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB6_Data1
.public Set_IOB6_Data1
_Set_IOB6_Data1: .PROC
Set_IOB6_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xffbf
    r1= r1&r2
    r2=  0x0040
    r1=r1|r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB7_Data0
.public Set_IOB7_Data0
_Set_IOB7_Data0: .PROC
Set_IOB7_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xff7f
    r1= r1&r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB7_Data1
.public Set_IOB7_Data1
_Set_IOB7_Data1: .PROC
Set_IOB7_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xff7f
    r1= r1&r2
    r2=  0x0080
    r1=r1|r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB8_Data0
.public Set_IOB8_Data0
_Set_IOB8_Data0: .PROC
Set_IOB8_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfeff
    r1= r1&r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB8_Data1
.public Set_IOB8_Data1
_Set_IOB8_Data1: .PROC
Set_IOB8_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfeff
    r1= r1&r2
    r2=  0x0100
    r1=r1|r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB9_Data0
.public Set_IOB9_Data0
_Set_IOB9_Data0: .PROC
Set_IOB9_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfdff
    r1= r1&r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB9_Data1
.public Set_IOB9_Data1
_Set_IOB9_Data1: .PROC
Set_IOB9_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfdff
    r1= r1&r2
    r2=  0x0200
    r1=r1|r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB10_Data0
.public Set_IOB10_Data0
_Set_IOB10_Data0: .PROC
Set_IOB10_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfbff
    r1= r1&r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB10_Data1
.public Set_IOB10_Data1
_Set_IOB10_Data1: .PROC
Set_IOB10_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xfbff
    r1= r1&r2
    r2=  0x0400
    r1=r1|r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB11_Data0
.public Set_IOB11_Data0
_Set_IOB11_Data0: .PROC
Set_IOB11_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xf7ff
    r1= r1&r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB11_Data1
.public Set_IOB11_Data1
_Set_IOB11_Data1: .PROC
Set_IOB11_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xf7ff
    r1= r1&r2
    r2=  0x0800
    r1=r1|r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB12_Data0
.public Set_IOB12_Data0
_Set_IOB12_Data0: .PROC
Set_IOB12_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xefff
    r1= r1&r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB12_Data1
.public Set_IOB12_Data1
_Set_IOB12_Data1: .PROC
Set_IOB12_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xefff
    r1= r1&r2
    r2=  0x1000
    r1=r1|r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB13_Data0
.public Set_IOB13_Data0
_Set_IOB13_Data0: .PROC
Set_IOB13_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xdfff
    r1= r1&r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB13_Data1
.public Set_IOB13_Data1
_Set_IOB13_Data1: .PROC
Set_IOB13_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xdfff
    r1= r1&r2
    r2=  0x2000
    r1=r1|r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB14_Data0
.public Set_IOB14_Data0
_Set_IOB14_Data0: .PROC
Set_IOB14_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xbfff
    r1= r1&r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB14_Data1
.public Set_IOB14_Data1
_Set_IOB14_Data1: .PROC
Set_IOB14_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0xbfff
    r1= r1&r2
    r2=  0x4000
    r1=r1|r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB15_Data0
.public Set_IOB15_Data0
_Set_IOB15_Data0: .PROC
Set_IOB15_Data0:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0x7fff
    r1= r1&r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.public _Set_IOB15_Data1
.public Set_IOB15_Data1
_Set_IOB15_Data1: .PROC
Set_IOB15_Data1:
    push r1,r5 to [sp];
    r1=  [P_IOB_Buffer]
    r2= 0x7fff
    r1= r1&r2
    r2=  0x8000
    r1=r1|r2
    [P_IOB_Data]=r1 
    pop r1,r5 from [sp]
    retf;
    .ENDP
.PUBLIC _Get_Buffer_IOA0
.PUBLIC Get_Buffer_IOA0
_Get_Buffer_IOA0:.PROC
Get_Buffer_IOA0:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Buffer]
    r2= 0xfffe
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferA0
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferA0:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Buffer_IOA1
.PUBLIC Get_Buffer_IOA1
_Get_Buffer_IOA1:.PROC
Get_Buffer_IOA1:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Buffer]
    r2= 0xfffd
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferA1
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferA1:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Buffer_IOA2
.PUBLIC Get_Buffer_IOA2
_Get_Buffer_IOA2:.PROC
Get_Buffer_IOA2:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Buffer]
    r2= 0xfffb
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferA2
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferA2:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Buffer_IOA3
.PUBLIC Get_Buffer_IOA3
_Get_Buffer_IOA3:.PROC
Get_Buffer_IOA3:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Buffer]
    r2= 0xfff7
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferA3
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferA3:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP  
.PUBLIC _Get_Buffer_IOA4
.PUBLIC Get_Buffer_IOA4
_Get_Buffer_IOA4:.PROC
Get_Buffer_IOA4:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Buffer]
    r2= 0xffef
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferA4
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferA4:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP    
.PUBLIC _Get_Buffer_IOA5
.PUBLIC Get_Buffer_IOA5
_Get_Buffer_IOA5:.PROC
Get_Buffer_IOA5:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Buffer]
    r2= 0xffdf
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferA5
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferA5:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP 
.PUBLIC _Get_Buffer_IOA6
.PUBLIC Get_Buffer_IOA6
_Get_Buffer_IOA6:.PROC
Get_Buffer_IOA6:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Buffer]
    r2= 0xffbf
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferA6
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferA6:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP   
.PUBLIC _Get_Buffer_IOA7
.PUBLIC Get_Buffer_IOA7
_Get_Buffer_IOA7:.PROC
Get_Buffer_IOA7:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Buffer]
    r2= 0xff7f
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferA7
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferA7:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP  
.PUBLIC _Get_Buffer_IOA8
.PUBLIC Get_Buffer_IOA8
_Get_Buffer_IOA8:.PROC
Get_Buffer_IOA8:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Buffer]
    r2= 0xfeff
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferA8
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferA8:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Buffer_IOA9
.PUBLIC Get_Buffer_IOA9
_Get_Buffer_IOA9:.PROC
Get_Buffer_IOA9:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Buffer]
    r2= 0xfdff
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferA9
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferA9:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Buffer_IOA10
.PUBLIC Get_Buffer_IOA10
_Get_Buffer_IOA10:   .PROC       
Get_Buffer_IOA10:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Buffer]
    r2= 0xfbff
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferA10
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferA10:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Buffer_IOA11
.PUBLIC Get_Buffer_IOA11
_Get_Buffer_IOA11: .PROC
Get_Buffer_IOA11:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Buffer]
    r2= 0xf7ff
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferA11
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferA11:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP  
.PUBLIC _Get_Buffer_IOA12
.PUBLIC Get_Buffer_IOA12
_Get_Buffer_IOA12: .PROC
Get_Buffer_IOA12:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Buffer]
    r2= 0xefff
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferA12
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferA12:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP    
.PUBLIC _Get_Buffer_IOA13
.PUBLIC Get_Buffer_IOA13
_Get_Buffer_IOA13:   .PROC 
Get_Buffer_IOA13:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Buffer]
    r2= 0xdfff
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferA13
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferA13:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP 
.PUBLIC _Get_Buffer_IOA14
.PUBLIC Get_Buffer_IOA14
_Get_Buffer_IOA14:    .PROC 
Get_Buffer_IOA14:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Buffer]
    r2= 0xbfff
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferA14
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferA14:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP   
.PUBLIC _Get_Buffer_IOA15
.PUBLIC Get_Buffer_IOA15
_Get_Buffer_IOA15:   .PROC 
Get_Buffer_IOA15:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Buffer]
    r2= 0xff7f
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferA15
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferA15:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP  
.PUBLIC _Get_Data_IOA0
.PUBLIC Get_Data_IOA0
_Get_Data_IOA0:.PROC
Get_Data_IOA0:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Data]
    r2= 0xfffe
    r1= r1|r2
    cmp r1,r2
    je AReturnDataAA0
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataAA0:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Data_IOA1
.PUBLIC Get_Data_IOA1
_Get_Data_IOA1:.PROC
Get_Data_IOA1:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Data]
    r2= 0xfffd
    r1= r1|r2
    cmp r1,r2
    je AReturnDataAA1
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataAA1:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Data_IOA2
.PUBLIC Get_Data_IOA2
_Get_Data_IOA2:.PROC
Get_Data_IOA2:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Data]
    r2= 0xfffb
    r1= r1|r2
    cmp r1,r2
    je AReturnDataAA2
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataAA2:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Data_IOA3
.PUBLIC Get_Data_IOA3
_Get_Data_IOA3:.PROC
Get_Data_IOA3:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Data]
    r2= 0xfff7
    r1= r1|r2
    cmp r1,r2
    je AReturnDataAA3
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataAA3:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP  
.PUBLIC _Get_Data_IOA4
.PUBLIC Get_Data_IOA4
_Get_Data_IOA4:.PROC
Get_Data_IOA4:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Data]
    r2= 0xffef
    r1= r1|r2
    cmp r1,r2
    je AReturnDataAA4
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataAA4:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP    
.PUBLIC _Get_Data_IOA5
.PUBLIC Get_Data_IOA5
_Get_Data_IOA5:.PROC
Get_Data_IOA5:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Data]
    r2= 0xffdf
    r1= r1|r2
    cmp r1,r2
    je AReturnDataAA5
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataAA5:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP 
.PUBLIC _Get_Data_IOA6
.PUBLIC Get_Data_IOA6
_Get_Data_IOA6:.PROC
Get_Data_IOA6:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Data]
    r2= 0xffbf
    r1= r1|r2
    cmp r1,r2
    je AReturnDataAA6
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataAA6:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP   
.PUBLIC _Get_Data_IOA7
.PUBLIC Get_Data_IOA7
_Get_Data_IOA7:.PROC
Get_Data_IOA7:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Data]
    r2= 0xff7f
    r1= r1|r2
    cmp r1,r2
    je AReturnDataAA7
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataAA7:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP  
.PUBLIC _Get_Data_IOA8
.PUBLIC Get_Data_IOA8
_Get_Data_IOA8:.PROC
Get_Data_IOA8:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Data]
    r2= 0xfeff
    r1= r1|r2
    cmp r1,r2
    je AReturnDataAA8
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataAA8:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Data_IOA9
.PUBLIC Get_Data_IOA9
_Get_Data_IOA9:.PROC
Get_Data_IOA9:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Data]
    r2= 0xfdff
    r1= r1|r2
    cmp r1,r2
    je AReturnDataAA9
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataAA9:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Data_IOA10
.PUBLIC Get_Data_IOA10
_Get_Data_IOA10:   .PROC       
Get_Data_IOA10:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Data]
    r2= 0xfbff
    r1= r1|r2
    cmp r1,r2
    je AReturnDataAA10
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataAA10:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Data_IOA11
.PUBLIC Get_Data_IOA11
_Get_Data_IOA11: .PROC
Get_Data_IOA11:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Data]
    r2= 0xf7ff
    r1= r1|r2
    cmp r1,r2
    je AReturnDataAA11
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataAA11:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP  
.PUBLIC _Get_Data_IOA12
.PUBLIC Get_Data_IOA12
_Get_Data_IOA12: .PROC
Get_Data_IOA12:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Data]
    r2= 0xefff
    r1= r1|r2
    cmp r1,r2
    je AReturnDataAA12
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataAA12:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP    
.PUBLIC _Get_Data_IOA13
.PUBLIC Get_Data_IOA13
_Get_Data_IOA13:   .PROC 
Get_Data_IOA13:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Data]
    r2= 0xdfff
    r1= r1|r2
    cmp r1,r2
    je AReturnDataAA13
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataAA13:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP 
.PUBLIC _Get_Data_IOA14
.PUBLIC Get_Data_IOA14
_Get_Data_IOA14:   .PROC 
Get_Data_IOA14:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Data]
    r2= 0xbfff
    r1= r1|r2
    cmp r1,r2
    je AReturnDataAA14
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataAA14:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP   
.PUBLIC _Get_Data_IOA15
.PUBLIC Get_Data_IOA15
_Get_Data_IOA15:   .PROC 
Get_Data_IOA15:
    push r2,r5 to [sp];  
    r1=  [P_IOA_Data]
    r2= 0xff7f
    r1= r1|r2
    cmp r1,r2
    je AReturnDataAA15
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataAA15:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP  
.PUBLIC _Get_Buffer_IOB0
.PUBLIC Get_Buffer_IOB0
_Get_Buffer_IOB0:.PROC
Get_Buffer_IOB0:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Buffer]
    r2= 0xfffe
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferB0
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferB0:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Buffer_IOB1
.PUBLIC Get_Buffer_IOB1
_Get_Buffer_IOB1:.PROC
Get_Buffer_IOB1:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Buffer]
    r2= 0xfffd
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferB1
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferB1:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Buffer_IOB2
.PUBLIC Get_Buffer_IOB2
_Get_Buffer_IOB2:.PROC
Get_Buffer_IOB2:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Buffer]
    r2= 0xfffb
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferB2
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferB2:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Buffer_IOB3
.PUBLIC Get_Buffer_IOB3
_Get_Buffer_IOB3:.PROC
Get_Buffer_IOB3:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Buffer]
    r2= 0xfff7
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferB3
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferB3:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP  
.PUBLIC _Get_Buffer_IOB4
.PUBLIC Get_Buffer_IOB4
_Get_Buffer_IOB4:.PROC
Get_Buffer_IOB4:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Buffer]
    r2= 0xffef
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferB4
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferB4:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP    
.PUBLIC _Get_Buffer_IOB5
.PUBLIC Get_Buffer_IOB5
_Get_Buffer_IOB5:.PROC
Get_Buffer_IOB5:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Buffer]
    r2= 0xffdf
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferB5
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferB5:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP 
.PUBLIC _Get_Buffer_IOB6
.PUBLIC Get_Buffer_IOB6
_Get_Buffer_IOB6:.PROC
Get_Buffer_IOB6:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Buffer]
    r2= 0xffbf
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferB6
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferB6:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP   
.PUBLIC _Get_Buffer_IOB7
.PUBLIC Get_Buffer_IOB7
_Get_Buffer_IOB7:.PROC
Get_Buffer_IOB7:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Buffer]
    r2= 0xff7f
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferB7
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferB7:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP  
.PUBLIC _Get_Buffer_IOB8
.PUBLIC Get_Buffer_IOB8
_Get_Buffer_IOB8:.PROC
Get_Buffer_IOB8:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Buffer]
    r2= 0xfeff
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferB8
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferB8:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Buffer_IOB9
.PUBLIC Get_Buffer_IOB9
_Get_Buffer_IOB9:.PROC
Get_Buffer_IOB9:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Buffer]
    r2= 0xfdff
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferB9
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferB9:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Buffer_IOB10
.PUBLIC Get_Buffer_IOB10
_Get_Buffer_IOB10:   .PROC       
Get_Buffer_IOB10:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Buffer]
    r2= 0xfbff
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferB10
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferB10:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Buffer_IOB11
.PUBLIC Get_Buffer_IOB11
_Get_Buffer_IOB11: .PROC
Get_Buffer_IOB11:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Buffer]
    r2= 0xf7ff
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferB11
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferB11:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP  
.PUBLIC _Get_Buffer_IOB12
.PUBLIC Get_Buffer_IOB12
_Get_Buffer_IOB12: .PROC
Get_Buffer_IOB12:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Buffer]
    r2= 0xefff
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferB12
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferB12:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP    
.PUBLIC _Get_Buffer_IOB13
.PUBLIC Get_Buffer_IOB13
_Get_Buffer_IOB13:   .PROC 
Get_Buffer_IOB13:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Buffer]
    r2= 0xdfff
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferB13
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferB13:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP 
.PUBLIC _Get_Buffer_IOB14
.PUBLIC Get_Buffer_IOB14
_Get_Buffer_IOB14:   .PROC 
Get_Buffer_IOB14:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Buffer]
    r2= 0xbfff
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferB14
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferB14:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP   
.PUBLIC _Get_Buffer_IOB15
.PUBLIC Get_Buffer_IOB15
_Get_Buffer_IOB15:   .PROC 
Get_Buffer_IOB15:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Buffer]
    r2= 0xff7f
    r1= r1|r2
    cmp r1,r2
    je AReturnBufferB15
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnBufferB15:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP  
.PUBLIC _Get_Data_IOB0
.PUBLIC Get_Data_IOB0
_Get_Data_IOB0:.PROC
Get_Data_IOB0:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Data]
    r2= 0xfffe
    r1= r1|r2
    cmp r1,r2
    je AReturnDataBB0
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataBB0:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Data_IOB1
.PUBLIC Get_Data_IOB1
_Get_Data_IOB1:.PROC
Get_Data_IOB1:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Data]
    r2= 0xfffd
    r1= r1|r2
    cmp r1,r2
    je AReturnDataBB1
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataBB1:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Data_IOB2
.PUBLIC Get_Data_IOB2
_Get_Data_IOB2:.PROC
Get_Data_IOB2:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Data]
    r2= 0xfffb
    r1= r1|r2
    cmp r1,r2
    je AReturnDataBB2
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataBB2:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Data_IOB3
.PUBLIC Get_Data_IOB3
_Get_Data_IOB3:.PROC
Get_Data_IOB3:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Data]
    r2= 0xfff7
    r1= r1|r2
    cmp r1,r2
    je AReturnDataBB3
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataBB3:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP  
.PUBLIC _Get_Data_IOB4
.PUBLIC Get_Data_IOB4
_Get_Data_IOB4:.PROC
Get_Data_IOB4:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Data]
    r2= 0xffef
    r1= r1|r2
    cmp r1,r2
    je AReturnDataBB4
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataBB4:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP    
.PUBLIC _Get_Data_IOB5
.PUBLIC Get_Data_IOB5
_Get_Data_IOB5:.PROC
Get_Data_IOB5:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Data]
    r2= 0xffdf
    r1= r1|r2
    cmp r1,r2
    je AReturnDataBB5
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataBB5:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP 
.PUBLIC _Get_Data_IOB6
.PUBLIC Get_Data_IOB6
_Get_Data_IOB6:.PROC
Get_Data_IOB6:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Data]
    r2= 0xffbf
    r1= r1|r2
    cmp r1,r2
    je AReturnDataBB6
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataBB6:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP   
.PUBLIC _Get_Data_IOB7
.PUBLIC Get_Data_IOB7
_Get_Data_IOB7:.PROC
Get_Data_IOB7:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Data]
    r2= 0xff7f
    r1= r1|r2
    cmp r1,r2
    je AReturnDataBB7
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataBB7:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP  
.PUBLIC _Get_Data_IOB8
.PUBLIC Get_Data_IOB8
_Get_Data_IOB8:.PROC
Get_Data_IOB8:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Data]
    r2= 0xfeff
    r1= r1|r2
    cmp r1,r2
    je AReturnDataBB8
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataBB8:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Data_IOB9
.PUBLIC Get_Data_IOB9
_Get_Data_IOB9:.PROC
Get_Data_IOB9:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Data]
    r2= 0xfdff
    r1= r1|r2
    cmp r1,r2
    je AReturnDataBB9
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataBB9:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Data_IOB10
.PUBLIC Get_Data_IOB10
_Get_Data_IOB10:   .PROC       
Get_Data_IOB10:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Data]
    r2= 0xfbff
    r1= r1|r2
    cmp r1,r2
    je AReturnDataBB10
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataBB10:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP
.PUBLIC _Get_Data_IOB11
.PUBLIC Get_Data_IOB11
_Get_Data_IOB11: .PROC
Get_Data_IOB11:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Data]
    r2= 0xf7ff
    r1= r1|r2
    cmp r1,r2
    je AReturnDataBB11
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataBB11:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP  
.PUBLIC _Get_Data_IOB12
.PUBLIC Get_Data_IOB12
_Get_Data_IOB12: .PROC
Get_Data_IOB12:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Data]
    r2= 0xefff
    r1= r1|r2
    cmp r1,r2
    je AReturnDataBB12
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataBB12:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP    
.PUBLIC _Get_Data_IOB13
.PUBLIC Get_Data_IOB13
_Get_Data_IOB13:   .PROC 
Get_Data_IOB13:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Data]
    r2= 0xdfff
    r1= r1|r2
    cmp r1,r2
    je AReturnDataBB13
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataBB13:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP 
.PUBLIC _Get_Data_IOB14
.PUBLIC Get_Data_IOB14
_Get_Data_IOB14:   .PROC 
Get_Data_IOB14:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Data]
    r2= 0xbfff
    r1= r1|r2
    cmp r1,r2
    je AReturnDataBB14
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataBB14:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP   
.PUBLIC _Get_Data_IOB15
.PUBLIC Get_Data_IOB15
_Get_Data_IOB15:   .PROC 
Get_Data_IOB15:
    push r2,r5 to [sp];  
    r1=  [P_IOB_Data]
    r2= 0xff7f
    r1= r1|r2
    cmp r1,r2
    je AReturnDataBB15
    r1=1
    pop r2,r5 from [sp]
    retf;
AReturnDataBB15:
    r1=0 
    pop r2,r5 from [sp]
    retf;
    pop r2,r5 from [sp]
    retf;  
    .ENDP                                            