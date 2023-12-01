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
.EXTERNAL __gIsStopRecog //变量值 = 0 辨识器忙
						 //       = 1 辨识器停止
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
	jz ?notTimerA						//当不为TIQ_TMA，则转
	R1 = [__gIsStopRecog]
	jnz ?BSR_NotBusy					//[__gIsStopRecog]为1则转至放音处理
	call _BSR_FIQ_Routine				//为0，调用辨识子程序
	jmp ?BSR_Busy						//返回中断
?BSR_NotBusy:							//放音处理
	R2 = [_PlayFlag]
	jnz ?Play2000						//[_PlayFlag]为1则是播放2000
	call F_FIQ_Service_SACM_S480;		//为0，播放480
	jmp ?BSR_Busy						//返回中断
?Play2000:								//2000播放子程序
	call F_FIQ_Service_SACM_A2000;
?BSR_Busy:								//返回中断
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
PUSH R1,R5 TO [SP]		     //压栈保护 
   R1 = 0x0100 	    
   TEST R1,[P_INT_CTRL] 	     //比较是否为IRQ3_EXT1	 
   JNZ L_IRQ3_Ext1			     //是，则转至对应程序段；
   R1 = 0x0200 	    
   TEST R1,[P_INT_CTRL] 	     //否，则比较是否为IRQ3_EXT2
   JNZ  L_IRQ3_Ext2			     //是，则转至对应程序段；
   R1 = 0x0200 	    
L_IRQ3_Key:					     //否，则进入键唤醒中断
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
