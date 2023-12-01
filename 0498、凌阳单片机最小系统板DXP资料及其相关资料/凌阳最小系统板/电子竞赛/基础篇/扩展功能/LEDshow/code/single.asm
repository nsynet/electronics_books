.include hardware.inc
.external _uiDelay
.data
  address: .dw 0x00bf,0x0086,0x00db,0x00cf, 0x00e6,0x00ed,0x00fc,0x0087,0x00ff,0x00ef;//'0.''1.''2.''3.''4.''5.''6.''7.''8.''9.'的代码
           .dw 0x003f,0x0006,0x005b,0x004f,0x0066,0x006d,0x007c,0x0007,0x007f,0x006f;//'0''1''2''3''4''5''6''7''8''9'的代码
    Dig:   .dw 0x8001,0x4000,0x2000,0x1000,0x0004,0x0002,0x0001;
.code
.public _F_SingleLed
_F_SingleLed: .proc
    
    
    push bp to  [sp];  
    bp = sp + 1   
 loop: 
    r1 = [bp+3]          
    r3 = [bp+4]              
    r2 =  r1 + Dig;        
    r2  = [r2]       
    r4 =  r3 + address 
    r4 = [r4] 
   

    r1=0xffff;  
    [P_IOA_Attrib]=r1;
    [P_IOA_Dir]=r1;
    [P_IOA_Data]=r1
    [P_IOA_Data] = r4; 
    
    r1=0xffff;  
    [P_IOB_Attrib]=r1;
    [P_IOB_Dir]=r1;
    [P_IOB_Data]=r1;
    [P_IOB_Data] = r2; 
    r1= 0x0001
    [0x7012]=r1 
	r1=[_uiDelay];
	loop1:
	r2=0xeb;
	loop2:
	r2-=1;
	jnz loop2;
	r1-=1;
	jnz loop1     
    pop bp from [sp]
    retf;
 .endp
 
