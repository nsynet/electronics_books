.include hardware.inc
.define RUN_2HZ_TimeBase_INT 0x0004
.iram
.var flag=0,led=0


.code
.public  _delay10s
_delay10s:.proc
      
      
     r1=RUN_2HZ_TimeBase_INT;
     [P_INT_Ctrl]=r1;
     INT IRQ;
    // r1=[flag];
    
    //[flag]=r1;
   //  cmp r1,2;
    // jb reset;
   //   r1=[flag];
    // r1=0x0000;
    //  [flag]=r1;
   //   retf;
    reset:
      nop;
      nop;
    goto reset;
    .endp
    
    
.TEXT
.PUBLIC _IRQ5
_IRQ5:
    push r1,r5 to [sp];
    r1=0x0004;
    test r1,[P_INT_Ctrl];
    jnz IRQ5_2HZ;
 IRQ5_4HZ:
    R1=0x0008;
    goto Exit_INT;
 IRQ5_2HZ:
   r1=[flag];
   r1+=1;
   [flag]=r1;
    cmp r1,60;
    jb Exit_INT;
  irq on;
  irq off;
     /////////////////
     
  Exit_INT:
    [P_INT_Clear]=r1;
    pop r1,r5 from [sp];
    RETI;
    