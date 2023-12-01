.include   hardware.inc
.define		C_8050_RA    	    0000000000000100b;		//A口   到    数据总线
.define		C_8050_RB   		0000000000000101b;		//B口   到    数据总线
.define		C_8050_RC     		0000000000000110b;		//C口   到    数据总线
.define		C_8050_WA    	    0000000000001000b;		//数据总线   到   A口
.define		C_8050_WB   		0000000000001001b;		//数据总线   到   B口
.define		C_8050_WC     		0000000000001010b;		//数据总线   到   C口
.define		C_8050_WC     		0000000000001011b;		//数据总线   到   控制寄存器

.public	_Init_IOB
.public	Init_IOB
_Init_IOB:
Init_IOB:.proc	
	PUSH bp,bp TO [sp];
    r1=0xffff;
	[P_IOB_Dir] = r1;
	[P_IOB_Attrib] = r1;
	[P_IOB_Data] = r1;
	POP bp,bp FROM [sp];
	RETF;
	.endp
	
.public	_Read_PA
.public	Read_PA
_Read_PA:
Read_PA:.proc
	PUSH bp,bp TO [sp];
    r1=C_8050_RA;
	[P_IOB_Data] = r1;
    r1=0x0000;
	[P_IOB_Dir] = r1;
    r1=0xffff;	
	[P_IOB_Attrib] = r1;
	r1=0x0000;
	[P_IOB_Data] = r1;
	r1=[P_IOB_Data];
	POP bp,bp FROM [sp];
	RETF;
	.endp
	
.public	_Read_PB
.public	Read_PB
_Read_PB:
Read_PB:.proc
	PUSH bp,bp TO [sp];
    r1=C_8050_RB;
	[P_IOB_Data] = r1;
    r1=0x0000;
	[P_IOB_Dir] = r1;
    r1=0xffff;	
	[P_IOB_Attrib] = r1;
	r1=0x0000;
	[P_IOB_Data] = r1;
	r1=[P_IOB_Data];
	POP bp,bp FROM [sp];
	RETF;
	.endp

.public	_Read_PC
.public	Read_PC
_Read_PC:
Read_PC:.proc
	PUSH bp,bp TO [sp];
    r1=C_8050_RC;
	[P_IOB_Data] = r1;
    r1=0x0000;
	[P_IOB_Dir] = r1;
    r1=0xffff;	
	[P_IOB_Attrib] = r1;
	r1=0x0000;
	[P_IOB_Data] = r1;
	r1=[P_IOB_Data];
	POP bp,bp FROM [sp];
	RETF;
	.endp
	
.public	_Writer_PA
.public	Writer_PA
_Writer_PA:
Writer_PA:.proc
	PUSH bp,bp TO [sp];
    r1=C_8050_WA;
	[P_IOB_Data] = r1;
    r1=0x0000;
	[P_IOB_Dir] = r1;
    r1=0xffff;	
	[P_IOB_Attrib] = r1;
	r1=0x0000;
	[P_IOB_Data] = r1;
	r1=[P_IOB_Data];
	POP bp,bp FROM [sp];
	RETF;
	.endp
	
.public	_Writer_PB
.public	Writer_PB
_Writer_PB:
Writer_PB:.proc
	PUSH bp,bp TO [sp];
    r1=C_8050_WB;
	[P_IOB_Data] = r1;
    r1=0x0000;
	[P_IOB_Dir] = r1;
    r1=0xffff;	
	[P_IOB_Attrib] = r1;
	r1=0x0000;
	[P_IOB_Data] = r1;
	r1=[P_IOB_Data];
	POP bp,bp FROM [sp];
	RETF;
	.endp
	
.public	_Writer_PC
.public	Writer_PC
_Writer_PC:
Writer_PC:.proc
	PUSH bp,bp TO [sp];
    r1=C_8050_WC;
	[P_IOB_Data] = r1;
    r1=0x0000;
	[P_IOB_Dir] = r1;
    r1=0xffff;	
	[P_IOB_Attrib] = r1;
	r1=0x0000;
	[P_IOB_Data] = r1;
	r1=[P_IOB_Data];
	POP bp,bp FROM [sp];
	RETF;
	.endp