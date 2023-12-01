.PUBLIC _InitIO
.PUBLIC _ShowRes
.PUBLIC _ClearWatchDog
.PUBLIC _F_Delay
.DEFINE Port_IOA_Attrib 		0x7003
.DEFINE Port_IOA_Dir 			0x7002
.DEFINE Port_IOA_Data 			0x7000

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

_F_Delay: .proc
push R1,R4 to [SP]
r1=0x0400;
loop1:
r2=0x0936;
loop2:
r2-=1;
jnz loop2;
r1-=1;
jnz loop1;
pop	R1,R4 from [SP];
	retf
.endp
.END