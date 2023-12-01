//========================================================
//SPLC501C Library Pin Definition
//==========================================================
//6800 Control Pin
//-----------------------------------------------------------------------------
//User can change  any of control pins at any bit, except user select the IO port 
//of control pin the same as control bus. 
//=======================================================
//								FEDCBA9876543210					
//.define		C_AOP_Pin    	00100000000000b;		//IO AOP
//.define		C_EP_Pin   		01000000000000b;		//IO EP
//.define		C_RWP_Pin     	10000000000000b;		//IO as RWP
//								FEDCBA9876543210
.define		C_AOP_Pin    	    0000000100000000b;		//IO AOP
.define		C_EP_Pin   			0000001000000000b;		//IO EP
.define		C_RWP_Pin     		0000010000000000b;		//IO as RWP
//========================================================
//Define the SPLC Data Bus Pin
//Only Two Type Can Select
//=====================================================
//							FEDCBA9876543210
.define		C_DataBus		1111111100000000b;		//IO Data Bus
.define		C_BusHighLow	1;			//Set Data High/Low Byte 1:High	
//.define	C_AddressBus	0000000011111111b;		//IO Data Bus
//.define	C_DataBus		0000000011111111b;		//IO Data Bus
//.define	C_BusHighLow	0;			//Set Data High/Low Byte 0:Low
//=====================================================
//================================================
//Set Control Pins Port
//================================================
//Set Control Pins At Port A
.define	P_IO_Control_Data			0x7000;		//P_IOA_Data
.define	P_IO_Control_Buffer			0x7001;		//P_IOA_Buffer
.define	P_IO_Control_Dir			0x7002;		//P_IOA_Dir
.define	P_IO_Control_Attrib			0x7003;		//P_IOA_Attrib
//=========================================================
//Set Control Pins At Port B
//.define	P_IO_Control_Data		0x7005;		//P_IOB_Data
//.define	P_IO_Control_Buffer		0x7006;		//P_IOB_Buffer
//.define	P_IO_Control_Dir		0x7007;		//P_IOB_Dir
//.define	P_IO_Control_Attrib		0x7008;		//P_IOB_Attrib
//========================================================
//=========================================================
//Set Control Bus Port
//==========================================================
//Set Control Bus At Port A
//.define	P_IO_Data_Data				0x7000;		//P_IOA_Data
//.define	P_IO_Data_Buffer			0x7001;		//P_IOA_Buffer
//.define	P_IO_Data_Dir				0x7002;		//P_IOA_Dir
//.define	P_IO_Data_Attrib			0x7003;		//P_IOA_Attrib
//==========================================================
//Set Control Bus At Port B
.define	P_IO_Data_Data			0x7005;		//P_IOB_Data
.define	P_IO_Data_Buffer		0x7006;		//P_IOB_Buffer
.define	P_IO_Data_Dir			0x7007;		//P_IOB_Dir
.define	P_IO_Data_Attrib		0x7008;		//P_IOB_Attrib
//=========================================================
