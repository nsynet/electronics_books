.define		P_IOA_DATA  	    0x7000
.define		P_IOA_DIR   	    0x7002 
.define		P_IOA_ATTRI			0x7003
.define		P_IOB_DATA  	    0x7005
.define		P_IOB_DIR   	    0x7007
.define		P_IOB_ATTRI			0x7008

.external _main
.external ClearWatchDog
.ram
.var first,last,keyword;

.code
.public _key_asm

_key_asm:
    r1=0x00f0;                                    //IOA4---IOA7做扫描线，IOA0---IOA3做接收线
	[P_IOA_DIR]=r1 ;
    r1=[pc]
    r1=0x0000;
   	[P_IOA_ATTRI]=r1;        
	r1=0x0000;
	[P_IOA_DATA]=r1;
    r1=0x00f0;
    r1=[P_IOA_DATA];
    [first]=r1;
    call ClearWatchDog;
    nop
    nop
    nop
    retf;
 


