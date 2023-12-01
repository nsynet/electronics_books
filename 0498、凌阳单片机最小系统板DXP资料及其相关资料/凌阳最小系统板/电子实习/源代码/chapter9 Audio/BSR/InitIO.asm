.PUBLIC _InitIO
.PUBLIC _ShowRes
.PUBLIC _ClearWatchDog

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
	[Port_IOB_Attrib] = R1		//B������Ϊͬ�����
	[Port_IOB_Dir] = R1			
	R1 = 0
	[Port_IOB_Data] = R1        //B���õ͵�ƽ
	R1=0xffff
	[Port_IOA_Attrib] = R1		//A������Ϊͬ�����
	[Port_IOA_Dir] = R1			
	R1 = 0xffff
	[Port_IOA_Data] = R1        //A���øߵ�ƽ
	retf
.endp

.END