.PUBLIC _FIQ
//...............................................
.EXTERNAL _BSR_FIQ_Routine
.EXTERNAL __gIsStopRecog //变量值 = 0 辨识器忙
						 //       = 1 辨识器停止
						 

.PUBLIC _BREAK,_IRQ0, _IRQ1, _IRQ2, _IRQ3, _IRQ4, _IRQ5, _IRQ6, _IRQ7
.EXTERNAL _PlayFlag,_uiSpeed
//..................................................
.INCLUDE s480.inc;
.INCLUDE A2000.inc;
.INCLUDE resource.inc
.INCLUDE hardware.inc
.DEFINE		P_INT_CTRL		  0x7010;
.DEFINE		P_INT_CLEAR		  0x7011;
.ram
.var line=0,long=0,i,flag=0,led=0
.PUBLIC _F_Speed
_F_Speed:
	INT OFF
    R1 = [R_InterruptStatus]		//
    R1 |= 0x0310				// Enable Timer A FIQ
    [R_InterruptStatus] = R1
  	[P_INT_CTRL] = R1; 
	INT IRQ; 


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
    push r1,r5 to [sp];
    r1=0x0010;
    test r1,[P_INT_Ctrl];
    jnz l_irq4_1k;
    r1=0x0020
    test r1,[P_INT_Ctrl];
    jnz l_irq4_2k
    
 l_irq4_4k:
    R1=0x0040;
    goto exit_int;
    
 l_irq4_2k:
   goto exit_int
  
  l_irq4_1k:
    r1=[flag]
    r1+=1
    [flag]=r1
    r2=1024
    r1=[flag]
    cmp r1,r2
    je good
    r1=0x0010
    goto exit_int
    r1=0x0010
    good:
      r1=[led]
      r1+=1
      [led]=r1
      r1=[flag]
      r1=0
      [flag]=r1
       r1=0x0010
    goto exit_int
    r1=0x0010 
  exit_int:
    [P_INT_Clear]=r1;
    pop r1,r5 from [sp];
    RETI;

_IRQ5: 
_IRQ6: 
_IRQ7:
   .public _car_long
_car_long: .proc
         
         r1=[long];
         
         retf;
.endp

.public _car_time
_car_time: .proc
     r1=[led]
     retf
     .endp
.END
