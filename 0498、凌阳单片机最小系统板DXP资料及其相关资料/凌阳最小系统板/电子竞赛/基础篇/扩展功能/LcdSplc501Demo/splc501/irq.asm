.include hardware.inc				// include io information

.external	F_Key_Scan;

.code
.public _Init_irq5
_Init_irq5:
	int off 
	r1=0x0008			    //开中断IRQ5_4Hz和IRQ5_2Hz
	[P_INT_Ctrl]=r1 
	R1=0 
	int	irq 
    retf;
  
.public _F_Delay
_F_Delay:
    push bp to [sp];  
    r1=1024
    loop1:
	r2=0xeb;
	loop2:
	r2-=1;
	jnz loop2;
	r1-=1;
	jnz loop1     
    pop bp from [sp]
    retf;
 
 
.TEXT
.public _BREAK;
.public _FIQ;
.public	_IRQ0;
.public _IRQ1;
.public _IRQ2;
.public _IRQ3;
.public _IRQ4;
.public _IRQ5;
.public _IRQ6;
.public _IRQ7;
           
_FIQ:                                  
        push r1,r4 to [sp];
		
		pop r1,r4 from [sp];
        reti;

/////////////////////////////////////////////////////////////////////////////////////////
// Function: Interrupt Service routine Area                     
// 	Service for 	IRQ1 - IRQ7
// 	User's IRQ must hook on here                                 
/////////////////////////////////////////////////////////////////////////////////////////  

_BREAK:        
		push r1,r4 to [sp];
		
		pop r1,r4 from [sp];
        reti;  
     
_IRQ0:        
		push r1,r4 to [sp];
		
		pop r1,r4 from [sp];
        reti;  

_IRQ1:        
		push r1,r4 to [sp];
		
		pop r1,r4 from [sp];
        reti;  
        
_IRQ2:        
		push r1,r4 to [sp];
		
		pop r1,r4 from [sp];
        reti;         
        
_IRQ3:        
		push r1,r4 to [sp];
		
		pop r1,r4 from [sp];
        reti;        
         
/////////////////////////////////////////        
_IRQ4:        
		push r1,r4 to [sp];
		
		pop r1,r4 from [sp];
        reti;
L_IRQ4_2KHz:
		[P_INT_Clear] = r1;
		pop r1,r4 from [sp];
        reti;
        
L_IRQ4_1KHz:
		[P_INT_Clear] = r1;
		pop r1,r4 from [sp];
        reti;
        
////////////////////////////////////////        
        

_IRQ5:	
	push r1,r5 to [sp]		//压栈保护  
    r1=0x0008 	    
	test r1,[P_INT_Ctrl] 	//比较是否为4Hz的中断源
    jnz l_irq5_4 			//是，则转至对应程序段
   	
l_irq5_2:					//否，则进入2Hz程序段
	r1=0x0004      
	[P_INT_Clear]=r1 
    pop r1,r5 from [sp]
    RETI    
l_irq5_4:
   	r1=0x0008     
   	[P_INT_Clear]=r1
	R1 = 0x0001
    [0x7012] = R1
    pop r1,r5 from [sp]
    RETI
   
             
//////////////////////////////////////////////////////      
       
_IRQ6:        
		push r1,r4 to [sp];
		r1=0x0001;
		test r1,[P_INT_Ctrl];
		jnz  _IRQ6_TMB2;
		r1=0x0002;
		[P_INT_Clear]=r1;
		pop r1,r4 from [sp];
        reti;         
_IRQ6_TMB2:
		[P_INT_Clear]=r1;
		pop r1,r4 from [sp];
        reti;  
        
//////////////////////////////////////////////////////      
                
_IRQ7:        
		push r1,r4 to [sp];
		
		pop r1,r4 from [sp];
        reti;

//========================================================================================        
// End of isr.asm
//========================================================================================
        