.include   hardware.inc
.define		C_8255_RA    	    0000000000000100b;		//A口   到    数据总线
.define		C_8255_RB   		0000000000000101b;		//B口   到    数据总线
.define		C_8255_RC     		0000000000000110b;		//C口   到    数据总线
.define		C_8255_WA    	    0000000000001000b;		//数据总线   到   A口
.define		C_8255_WB   		0000000000001001b;		//数据总线   到   B口
.define		C_8255_WC     		0000000000001010b;		//数据总线   到   C口
.define		C_8255_WR     		0000000000001011b;		//数据总线   到   控制寄存器
.define		C_8255_CtrlOneRABC  0000000010011011b;		//工作方式0，全为输入
.define		C_8255_CtrlOneWABC  0000000010000000b;		//工作方式0，全为输出
.RAM
.VAR  _Write_Data
.code
.public	_ClearWatchDog
_ClearWatchDog: .proc
 push R1 to [SP]
 R1 = 0x0001
 [0x7012] = R1
 pop R1 from [SP]
 retf
.endp	
	
.public	_Init_IOB
//.public	Init_IOB
_Init_IOB:.proc
//Init_IOB:.proc	
	push r1,r4 to [sp];
    r1=0xffff;
	[P_IOB_Dir] = r1;
	[P_IOB_Attrib] = r1;
	[P_IOB_Data] = r1;
	[_Write_Data]=r1;
	pop r1,r4 from [sp];
	RETF;
	.endp
	
.public	_Init_WR_InABC
.public	Init_WR_InABC
_Init_WR_InABC:
Init_WR_InABC:.proc	
	PUSH bp,bp TO [sp];
	r1=[C_8255_WR];
	[P_IOB_Data] = r1;
	r1=0xffff;
	[P_IOA_Dir] = r1;
	[P_IOA_Attrib] = r1;
	[P_IOA_Data] = r1;
	r1=[C_8255_CtrlOneRABC];
	[P_IOA_Data] = r1;
	POP bp,bp FROM [sp];
	RETF;
	.endp
	
.public	_Init_WR_OutABC
.public	Init_WR_OutABC
_Init_WR_OutABC:
Init_WR_OutABC:.proc	
	PUSH bp,bp TO [sp];
	r1=[C_8255_WR];
	[P_IOB_Data] = r1;
	r1=0xffff;
	[P_IOA_Dir] = r1;
	[P_IOA_Attrib] = r1;
	[P_IOA_Data] = r1;
	r1=[C_8255_CtrlOneWABC];
	[P_IOA_Data] = r1;
	POP bp,bp FROM [sp];
	RETF;
	.endp
	
.public	_Read_PA
.public	Read_PA
_Read_PA:
Read_PA:.proc
	PUSH bp,bp TO [sp];
    r1=[C_8255_RA];
	[P_IOB_Data] = r1;
    r1=0x0000;
	[P_IOA_Dir] = r1;
    r1=0xffff;	
	[P_IOA_Attrib] = r1;
	r1=0x0000;
	[P_IOA_Data] = r1;
	r1=[P_IOA_Data];
	POP bp,bp FROM [sp];
	RETF;
	.endp
	
.public	_Read_PB
.public	Read_PB
_Read_PB:
Read_PB:.proc
	PUSH bp,bp TO [sp];
    r1=[C_8255_RB];
	[P_IOB_Data] = r1;
    r1=0x0000;
	[P_IOA_Dir] = r1;
    r1=0xffff;	
	[P_IOA_Attrib] = r1;
	r1=0x0000;
	[P_IOA_Data] = r1;
	r1=[P_IOA_Data];
	POP bp,bp FROM [sp];
	RETF;
	.endp

.public	_Read_PC
.public	Read_PC
_Read_PC:
Read_PC:.proc
	PUSH bp,bp TO [sp];
    r1=[C_8255_RC];
	[P_IOB_Data] = r1;
    r1=0x0000;
	[P_IOA_Dir] = r1;
    r1=0xffff;	
	[P_IOA_Attrib] = r1;
	r1=0x0000;
	[P_IOA_Data] = r1;
	r1=[P_IOA_Data];
	POP bp,bp FROM [sp];
	RETF;
	.endp
	
.public	_Writer_PA
.public	Writer_PA
_Writer_PA:
Writer_PA:.proc
	PUSH bp,bp TO [sp];
	[_Write_Data]=r1
    r1=[C_8255_WA];
	[P_IOB_Data] = r1;
    r1=0xffff;
	[P_IOA_Dir] = r1;
    r1=0xffff;	
	[P_IOA_Attrib] = r1;
	r1=0xffff;
	[P_IOA_Data] = r1;
	r1=[_Write_Data]
	[P_IOA_Data]=r1;
	POP bp,bp FROM [sp];
	RETF;
	.endp
	
.public	_Writer_PB
.public	Writer_PB
_Writer_PB:
Writer_PB:.proc
	PUSH bp,bp TO [sp];
	[_Write_Data]=r1
    r1=[C_8255_WB];
	[P_IOB_Data] = r1;
    r1=0xffff;
	[P_IOA_Dir] = r1;
    r1=0xffff;	
	[P_IOA_Attrib] = r1;
	r1=0xffff;
	[P_IOA_Data] = r1;
	r1=[P_IOA_Data];
	r1=[_Write_Data]
	[P_IOA_Data]=r1;
	POP bp,bp FROM [sp];
	RETF;
	.endp
	
.public	_Writer_PC
.public	Writer_PC
_Writer_PC:
Writer_PC:.proc
	PUSH bp,bp TO [sp];
	[_Write_Data]=r1
    r1=[C_8255_WC];
	[P_IOB_Data] = r1;
    r1=0x0000;
	[P_IOA_Dir] = r1;
    r1=0xffff;	
	[P_IOA_Attrib] = r1;
	r1=0x0000;
	[P_IOA_Data] = r1;
	r1=[P_IOB_Data];
	r1=[_Write_Data]
	[P_IOA_Data]=r1;
	POP bp,bp FROM [sp];
	RETF;
	.endp