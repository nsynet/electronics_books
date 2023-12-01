


.text
.include	hardware.inc
.include	S480.inc
.include	Resource.inc


.public	_FIQ;
_FIQ:
	PUSH	R1,R4 to [sp];
	R1 = 0x0001;
    [P_Watchdog_Clear] = R1;
	R1 = 0x2000;
	test R1,[P_INT_Ctrl];
	jnz L_FIQ_TimerA;
	R1 = 0x0800;
	test R1,[P_INT_Ctrl];
	jnz L_FIQ_TimerB;
L_FIQ_PWM:
	R1 = C_FIQ_PWM;
	[P_INT_Clear] = R1;
	POP R1,R4 from[sp];
	reti;
L_FIQ_TimerA:
	[P_INT_Clear] = R1;
	call F_FIQ_Service_SACM_S480;
	pop R1,R4 from [sp];
	RETI;
L_FIQ_TimerB:
	[P_INT_Clear] = R1;
	pop R1,R4 from [sp];
	RETI;
