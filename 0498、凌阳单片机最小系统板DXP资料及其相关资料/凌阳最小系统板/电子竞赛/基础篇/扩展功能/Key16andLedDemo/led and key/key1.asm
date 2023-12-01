
.define		P_IOA_DATA  	    0x7000
.define		P_IOA_DIR   	    0x7002 
.define		P_IOA_ATTRI			0x7003
.define		P_IOB_DATA  	    0x7005
.define		P_IOB_DIR   	    0x7007
.define		P_IOB_ATTRI			0x7008
.external ClearWatchDog

.ram
.var first,last,keyword;
.code
.public _key_asm1                     //IOA4---IOA7做接收线扫描线，IOA0---IOA3做扫描线
_key_asm1:
   r1=0x000f;
   [P_IOA_DIR]=r1 ;
   r1=0x0000;
   [P_IOA_ATTRI]=r1   ;        
   r1=0x0000;
   [P_IOA_DATA]=r1;
   r1=[P_IOA_DATA];
   [last]=r1;
   r1=[last];
   nop
   nop
   call ClearWatchDog;
   retf;
   
