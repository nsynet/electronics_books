.PUBLIC _FIQ

.DEFINE		P_IOB_DATA          	0x7005;
.DEFINE		P_IOB_DIR           	0x7007;
.DEFINE		P_IOB_ATTRI	        	0x7008;
.DEFINE		P_INT_CTRL	        	0x7010;
.DEFINE 	P_INT_CTRL_NEW      	0x702D;
.DEFINE		P_INT_CLEAR	        	0x7011;
.DEFINE		P_Watchdog_Clear		0x7012;
//...............................................
.EXTERNAL _BSR_FIQ_Routine
.EXTERNAL __gIsStopRecog //����ֵ = 0 ��ʶ��æ
						 //       = 1 ��ʶ��ֹͣ
.EXTERNAL _PlayFlag,_uiSpeed						 

.PUBLIC _BREAK,_IRQ0, _IRQ1, _IRQ2, _IRQ3, _IRQ4, _IRQ5, _IRQ6, _IRQ7

.ram
.var _IRQFlag=0
//..................................................
.INCLUDE s480.inc;
.INCLUDE A2000.inc;
.INCLUDE resource.inc
.INCLUDE hardware.inc
//.DEFINE		P_INT_CTRL		  0x7010;
//.DEFINE		P_INT_CLEAR		  0x7011;
.code
.PUBLIC _F_Speed
_F_Speed:
	INT OFF
    R1 = [R_InterruptStatus]		//
    R1 |= 0x0300				// Enable Timer A FIQ
    [R_InterruptStatus] = R1
  	[P_INT_CTRL] = R1; 
	INT IRQ; 
	retf


.TEXT
_FIQ:
	push R1,R4 to [SP]
	R1 = [P_INT_Ctrl]
	R1 &= 0x2000
	jz ?notTimerA						//����ΪTIQ_TMA����ת
	R1 = [__gIsStopRecog]
	jnz ?BSR_NotBusy					//[__gIsStopRecog]Ϊ1��ת����������
	call _BSR_FIQ_Routine				//Ϊ0�����ñ�ʶ�ӳ���
	jmp ?BSR_Busy						//�����ж�
?BSR_NotBusy:							//��������
	R2 = [_PlayFlag]
	jnz ?Play2000						//[_PlayFlag]Ϊ1���ǲ���2000
	call F_FIQ_Service_SACM_S480;		//Ϊ0������480
	jmp ?BSR_Busy						//�����ж�
?Play2000:								//2000�����ӳ���
	call F_FIQ_Service_SACM_A2000;
?BSR_Busy:								//�����ж�
	R1 = 0x2000
	[P_INT_Clear] = R1
	pop	R1,R4 from [SP];
	reti;
?notTimerA:
	R1 = 0x8800;
    [P_INT_Clear] = R1;
	pop	R1,R4 from [SP];
	reti;

_BREAK: 
_IRQ0:
_IRQ1: 
_IRQ2: 
_IRQ3: 
PUSH R1,R5 TO [SP]		     //ѹջ���� 
   R1 = 0x0100 	    
   TEST R1,[P_INT_CTRL] 	     //�Ƚ��Ƿ�ΪIRQ3_EXT1	 
   JNZ L_IRQ3_Ext1			     //�ǣ���ת����Ӧ����Σ�
   R1 = 0x0200 	    
   TEST R1,[P_INT_CTRL] 	     //����Ƚ��Ƿ�ΪIRQ3_EXT2
   JNZ  L_IRQ3_Ext2			     //�ǣ���ת����Ӧ����Σ�
   R1 = 0x0200 	    
L_IRQ3_Key:					     //�������������ж�
	R1 = 0x0080 	     
	[P_INT_CLEAR] = R1 
	POP R1,R5 FROM [SP]   
	RETI
L_IRQ3_Ext2:		
    r1=[_uiSpeed];
    r1=r1+1;
    [_uiSpeed]=r1;
   R1 = 0x0200 	     
   [P_INT_CLEAR] = R1 
   POP R1,R5 FROM [SP]
   RETI
L_IRQ3_Ext1:
   
   R1 = 0x0100 	     
   [P_INT_CLEAR] = R1 
   POP R1,R5 FROM [SP]
   RETI
_IRQ4: 
_IRQ5: 
	push r1,r5 to [sp]
	r1 = 0x0008     
   	[P_INT_CLEAR] = r1 
   	r1=[_IRQFlag]
   	r2=0
   	cmp r1,r2
   	je SetHig
   	r1=0
   	[_IRQFlag]=r1
   	r1=[P_IOB_DATA]
   	r2=0x00c0
   	r1=r1&r2;
   	r2=0x2800
	r1=r1|r2;
   	[P_IOB_DATA]=r1
   	pop r1,r5 from [sp]
    reti
SetHig:
    r1=1
   	[_IRQFlag]=r1
   	r1=[P_IOB_DATA]
   	r2=0x00c0
   	r1=r1&r2;
   	r2=0x0000
	r1=r1|r2;
   	[P_IOB_DATA]=r1
   	pop r1,r5 from [sp]
    reti
   
_IRQ6: 
_IRQ7:
.END
