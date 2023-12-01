
.define		P_IOA_DATA  	    0x7000
.define		P_IOA_DIR   	    0x7002 
.define		P_IOA_ATTRI			0x7003
.define		P_IOB_DATA  	    0x7005
.define		P_IOB_DIR   	    0x7007
.define		P_IOB_ATTRI			0x7008


.ram
.var first,last,keyword;

.code
.public _key_asm1

_key_asm1:
    
/////////////////////////////////////
  
 
  r1=0x000f;
		[P_IOA_DIR]=r1 ;
   
    r1=0x0000;
		[P_IOA_ATTRI]=r1   ;        
	
	r1=0x0000;
		[P_IOA_DATA]=r1;
   r3=0x0000;
Scan_loop1:		

  r2=[P_IOA_DATA];
  r1=0x000f;
 // test r1,r2;
  //jz Scan_loop1;
 Scan_loop2: 
cmp r1,r2;
	je reset;

 	r3+=1;
  
  cmp r3,8;
  jb  Scan_loop2;
   r1=[P_IOA_DATA];
   [last]=r1;
   ////////////////////////////////
  r1=[last];
	nop
	nop
   retf;
   
reset: 
       nop;
       nop;
     
  	   retf;
   ///////////////////////////////
 
 aa_wait:
   jmp aa_wait; 