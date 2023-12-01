.include hardware.inc
.PUBLIC _InitIO
.PUBLIC _ShowRes
.PUBLIC _ClearWatchDog
.PUBLIC _InterruptOff
.DEFINE Port_IOA_Attrib 		0x7003
.DEFINE Port_IOA_Dir 			0x7002
.DEFINE Port_IOA_Data 			0x7000
.PUBLIC _Interrupt
.DEFINE Port_IOB_Attrib 		0x7008
.DEFINE Port_IOB_Dir 			0x7007
.DEFINE Port_IOB_Data 			0x7005

.CODE

_ClearWatchDog: .proc
 push R1 to [SP]
 R1 = 0x0001
 [0x7012] = R1
 pop R1 from [SP]
 retf
.endp

_Interrupt:.proc
r1=[R_InterruptStatus]
r1|=0x0008 
[R_InterruptStatus]=r1
[P_INT_Ctrl]=r1
retf
.endp

_InterruptOff:.proc
r1=[R_InterruptStatus]
r1&=0xfff7 
[R_InterruptStatus]=r1
[P_INT_Ctrl]=r1
retf
.endp


_ShowRes: .proc
	push R1, R5 to [SP]
	R5 = SP + 5
	R4 = [R5+3]				
	[0x7005] = R4
	pop R1, R5 from [SP]
	retf
.endp

_InitIO: .proc
	R1=0xffff
//	[Port_IOB_Attrib] = R1		//B口设置为同向输出
//	[Port_IOB_Dir] = R1			
	R1 = 0
//	[Port_IOB_Data] = R1        //B口置低电平
//	R1=0xffff
//	[Port_IOA_Attrib] = R1		//A口设置为同向输出
//	[Port_IOA_Dir] = R1			
//	R1 = 0xffff
//	[Port_IOA_Data] = R1        //A口置高电平
	retf
.endp

.PUBLIC  _F_Delay               //传入参数为1延时2.5ms              
_F_Delay: .proc
    push r1,r5 to  [sp];
    bp=sp+3  
    
L_Loop1:
	R2=r1;
	r3=1
	r4=0x7012
	[r4]=r3
	
L_Loop2:  
    R2-=1;
    JNZ L_Loop2;
    R1-=1;
    JNZ L_Loop1;
    pop r1,r5 from  [sp];
    retf
    .endp



.END