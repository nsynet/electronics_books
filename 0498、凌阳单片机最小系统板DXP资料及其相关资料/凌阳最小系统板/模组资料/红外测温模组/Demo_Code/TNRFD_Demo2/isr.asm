//==========================================================
//�ļ�����:isr.asm
//��������:��FIQ�ж�������������ź�����������
//         ��IRQ4_4KHz������������ʾ��������
//ά����¼ 2005.12.2 by hongyan.Feng
//==========================================================
.INCLUDE SPCE061A.inc
.INCLUDE s480.inc
.EXTERNAL F_DIG_Drive
.text
.PUBLIC _FIQ
_FIQ:
	push r1,r5 to [sp]
	r1 = C_FIQ_TMA
	test r1,[P_INT_Ctrl]
	jnz L_FIQ_TimerA
	r1 = C_FIQ_TMB
	test r1,[P_INT_Ctrl]
	jnz L_FIQ_TimerB
L_FIQ_PWM:
	r1 = C_FIQ_PWM
	[P_INT_Clear] = r1
	pop r1,r5 from [sp]
	reti
L_FIQ_TimerA:
	[P_INT_Clear] = r1
	call F_FIQ_Service_SACM_S480
	pop r1,r5 from [sp]
	reti
L_FIQ_TimerB:
	[P_INT_Clear] = r1
	pop r1,r5 from [sp]
	reti
	
.PUBLIC _IRQ0
_IRQ0:	
	reti
.PUBLIC _IRQ1
_IRQ1:	
	reti
.PUBLIC _IRQ2
_IRQ2:	
	reti	
.PUBLIC _IRQ3
_IRQ3:	
	reti		  
.PUBLIC _IRQ4
_IRQ4:
	reti
.PUBLIC _IRQ5
_IRQ5:	
	reti
.PUBLIC _IRQ6
_IRQ6:	
	reti
.PUBLIC _IRQ7
_IRQ7:	
	reti
.PUBLIC _BREAK
_BREAK:	
	reti

.END
