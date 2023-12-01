
.define		P_IOA_DATA  	    0x7000
.define		P_IOA_DIR   	    0x7002 
.define		P_IOA_ATTRI			0x7003
.define		P_IOB_DATA  	    0x7005
.define		P_IOB_DIR   	    0x7007
.define		P_IOB_ATTRI			0x7008
.define		P_INT_CLEAR		0x7011;
.external _main
.ram
.var first,last,keyword;

.code
.public Scan_loop10;
.public _key_asm

_key_asm:
    
/////////////////////////////////////
    r1=0x00f0;
		[P_IOA_DIR]=r1 ;
   r1=[pc]
    r1=0x0000;
		[P_IOA_ATTRI]=r1   ;        
	
	r1=0x0000;
		[P_IOA_DATA]=r1;
 Scan_loop10:  r3=0x0000;
Scan_loop0:		
 
  r2=[P_IOA_DATA];
  r1=0x00f0;
cmp r1,r2;
  jcs Scan_loop10;
  r3+=1;
  sr=0x0000;
  cmp r3,8;
  jcc Scan_loop0;
   r1=[P_IOA_DATA];
   [first]=r1;

 
        nop
        nop
        nop
        retf;
 aa_wait:
   jmp aa_wait; 
 
 
.public _baab

_baab:.proc
    
   reti
   .endp


//retf
//.endp