.TEXT
.include hardware.inc				
.include	S480.inc
.include	Resource.inc

.public	_FIQ;
_FIQ:
	PUSH	r1,r5 to [sp];
	r1=0x2000;
	test r1,[P_INT_Ctrl];
	jnz L_FIQ_TimerA;
	r1=0x0800;
	test r1,[P_INT_Ctrl];
	jnz L_FIQ_TimerB;
L_FIQ_PWM:
	r1=C_FIQ_PWM;
	[P_INT_Clear]=r1;
	POP R1,R5 from[sp];
	reti;
L_FIQ_TimerA:
	[P_INT_Clear]=r1;
   
	call F_FIQ_Service_SACM_S480;
	pop r1,r5 from [sp];
	reti;
L_FIQ_TimerB:
	[P_INT_Clear]=r1;
	pop r1,r5 from [sp];
	reti
