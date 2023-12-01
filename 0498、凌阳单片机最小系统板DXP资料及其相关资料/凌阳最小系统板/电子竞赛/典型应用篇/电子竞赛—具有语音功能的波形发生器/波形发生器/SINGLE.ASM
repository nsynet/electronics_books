.include hardware.inc
.data
    address: .dw 0x00bf,0x0086,0x00db,0x00cf, 0x00e6,0x00ed,0x00fc,0x0087,0x00ff,0x00ef;//'0''1''2''3''4''5''6''7''8''9'µÄ´úÂë
    Dig:     .dw 0x0200,0x0400,0x1000,0x2000,0x4000,0x8000;

.public _singleled
_singleled:
    
    
    push bp to  [sp];  
    bp = sp + 1   
 loop: 
    r1 = [bp+3]          
    r3 = [bp+4]              
    r2 =  r1 + Dig;        
    r2  = [r2]       
    r4 =  r3 + address 
    r4 = [r4] 
   
    r4 = r4 lsl 4;
    r4 = r4 lsl 4; 
  
  r1=0xffff;  
  [P_IOA_Attrib]=r1;
  [P_IOA_Dir]=r1;
  [P_IOA_Data]=r1
    [P_IOA_Data] = r4; 
    
       r1=0xffff;  
  [P_IOB_Attrib]=r1;
  [P_IOB_Dir]=r1;
  [P_IOB_Data]=r2;
    [P_IOB_Data] = r2;  
    pop bp from [sp]
    retf;
 .end 