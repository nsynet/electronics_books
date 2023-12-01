///////////////////////////////////////////////////////////////////////////////
// Topic: Header File for the C language that try to involve general-purposed MACRO
//
// Note that to gain CPU performance, Most MACRO are written as in-line assembly
//
// Writen by: Jacky Lin		2003/April
//
///////////////////////////////////////////////////////////////////////////////

//================================================================
//Function: Write a value to designated control register (I/O Port)
//Example:	outport(P_IOA_Data,0x8000);
#define         outport(Addr,Value)			\
			asm(				\
				"r1=%1;\n"		\
				"\t[%0]=r1;\n"		\
				:			\
				:"i"(Addr),"i"(Value)	\
				:"1"			\
			);


//================================================================
//Function: Read a value from designated control register (I/O Port)
//Example:	int	i;
//		inport(P_IOA_Data,i);
#define 	inport(Port, Data) 	asm("%0 = [%1]": "=r"(Data) : "i"(Port))





//================================================================
//Function:Get segment:offset of designated label
//Example:	int i,j;
//		long	label;
//		GetSegmentOffset(label,i,j);
#define         GetSegmentOffset(label,segment,offset)                                          \
                asm(                                                                            \
                        "%1=seg %2\n"                                                           \
                        "\t%0=offset %2\n"                                                      \
                        :"=r"(segment),"=r"(offset)                                             \
                        :"p"(&label)                                                            \
                   );
                   
//================================================================
//Function: SETB Function
//Example:	SETB(_P_IOA_Data,0x8);
#define         SETB(Addr,Num)				\
			asm(				\
				"r1=%0;\n"		\
				"r2=%1;\n"		\
				"setb \t[r1],r2\n"	\
				:			\
				:"i"(Addr),"i"(Num)	\
				:"1","2"		\
			);

//================================================================
//Function: CLRB Function
//Example:	CLRB(_P_IOA_Data,0x8);
#define         CLRB(Addr,Num)				\
			asm(				\
				"r1=%0;\n"		\
				"r2=%1;\n"		\
				"clrb \t[r1],r2\n"	\
				:			\
				:"i"(Addr),"i"(Num)	\
				:"1","2"		\
			);
//================================================================
//Function: INVB Function
//Example:	INVB(_P_IOA_Data,0x8);
#define         INVB(Addr,Num)				\
			asm(				\
				"r1=%0;\n"		\
				"r2=%1;\n"		\
				"invb \t[r1],r2\n"	\
				:			\
				:"i"(Addr),"i"(Num)	\
				:"1","2"		\
			);


//================================================================
//Function: TSTB Function
//int i
//Example:	TSTB(_P_IOA_Data,0x8,i);
#define         TSTB(Addr,Num,Data)			\
			asm(				\
				"r1=%1;\n"		\
				"r2=%2;\n"		\
				"tstb \t[r1],r2\n"	\
				"jz	2\n"		\
				"\t%0=0x0001\n"		\
				"jmp	1\n"		\
				"\t%0=0x0000\n"		\
			:"=r"(Data)			\
			:"i"(Addr),"i"(Num)		\
			:"1","2"			\
			);	
    				//"r1=0x0000\n"		\               
//================================================================
//Function: INT of CPU
//Example:	INT_OFF();
//Example:	INT_IRQ();
//Example:	INT_FIQ();
//Example:	INT_FIQ_IRQ();
#define		INT_OFF()		asm("int off\n");
#define		INT_IRQ()		asm("int irq\n");
#define		INT_FIQ()		asm("int fiq\n");
#define		INT_FIQ_IRQ()		asm("int fiq,irq\n");


//================================================================
//Function: Disable IRQ Flag of CPU
//Example:	Disable_IRQ();
#define		Disable_IRQ()		asm("irq off\n");
#define		IRQ_OFF()		asm("irq off\n");

//================================================================
//Function: Enable IRQ Flag of CPU
//Example:	Enable_IRQ();
#define		Enable_IRQ()		asm("irq on\n");
#define		IRQ_ON()		asm("irq on\n");

//================================================================
//Function: Disable FIQ Flag of CPU
//Example:	Disable_FIQ();
#define		Disable_FIQ()		asm("fiq off\n");
#define		FIQ_OFF()		asm("fiq off\n");

//================================================================
//Function: Enable FIQ Flag of CPU
//Example:	Enable_FIQ();
#define		Enable_FIQ()		asm("fiq on\n");
#define		FIQ_ON()		asm("fiq on\n");


//================================================================
//Function: Disable Movement Flag of FIR DSP Operation
//Example:	Disable_FIRMOV();
#define		Disable_FIRMOV()	asm("fir_mov off\n");


//================================================================
//Function: Enable Movement Flag of FIR DSP Operation
//Example:	Enable_FIRMOV();
#define		Enable_FIRMOV()		asm("fir_mov on\n");




//================================================================
//Function: Make CPU software interrupt (break)
//Example:	SoftwareInterrupt();
#define         SoftwareInterrupt()	asm("break\n");



//================================================================
//Function: Make CPU no operation
//Example:	NOP();
#define         NOP()			asm("nop\n");





