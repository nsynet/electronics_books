
.include	S480.inc
.INCLUDE 	hardware.inc

.external 	_Lxsum;
.external 	_LxFlag;
.external 	_g_uisum;
.external 	_g_ucIntFlag;

.PUBLIC _FIQ
.PUBLIC _IRQ5
.PUBLIC _IRQ6

.TEXT




_FIQ:
	PUSH	r1,r4 to [sp];
	r1=0x2000;
	test r1,[P_INT_Ctrl];
	jnz L_FIQ_TimerA;
	r1=0x0800;
	test r1,[P_INT_Ctrl];
	jnz L_FIQ_TimerB;
L_FIQ_PWM:
	r1=C_FIQ_PWM;
	[P_INT_Clear]=r1;
	POP R1,R4 from[sp];
	reti;
L_FIQ_TimerA:
	[P_INT_Clear]=r1;
	call F_FIQ_Service_SACM_S480;
	pop r1,r4 from [sp];
	reti;
L_FIQ_TimerB:
	[P_INT_Clear]=r1;
	pop r1,r4 from [sp];
	reti;           

	    
_IRQ5:                        //定时3秒的中断程序
	push r1,r4 to [sp];
	r1 =0x0008;						 
	test r1,[P_INT_Ctrl];				
	jnz	L_4Hz;				   // Timer A FIQ entrence 	
	
	r1 = 0x0004;
    [P_INT_Clear] = r1;        //清中断
    
    r1 = [_g_uisum]                 //取时基信号量     
    r1 += 1;
    cmp r1,6;
    jnb loop0;
    
    [_g_uisum]=r1              //保存时基信号量
    pop r1,r4 from [sp];
    reti; 

loop0: 
    r1 = 0x0001;
    [_g_ucIntFlag] = r1;      //设置中断标识
    r1 = 0
    [_g_uisum] = r1

	pop r1,r4 from [sp];
    reti;     

L_4Hz:  
 	r1 = 0x0008;
    [P_INT_Clear] = r1;   //清中断
    pop r1,r4 from [sp];
    reti;


_IRQ6:        
	
	push r1,r4 to [sp];	
	
	r1 = 0x0002;
    [P_INT_Clear] = r1;
    
	r1 = [_Lxsum]                 //取时基信号量     
    r1 += 1;
    cmp r1,64;
    jnb loop;
    
    [_Lxsum]=r1              //保存时基信号量
    pop r1,r4 from [sp];
    reti; 

loop: 
    r1 = 0x0001;
    [_LxFlag] = r1;      //设置中断标识
    r1 = 0
    [_Lxsum] = r1

	pop r1,r4 from [sp];
    reti;		
	 