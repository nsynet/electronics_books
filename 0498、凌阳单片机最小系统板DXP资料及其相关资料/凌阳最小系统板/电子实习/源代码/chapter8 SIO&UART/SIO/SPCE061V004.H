//========================================================================================
// Progarm: The file be included by modules
// Arranged by: Lanin Lin
// Date: 	2002/11/20: first version
// 			2002/11/27: 2nd version ,add SIO initial
//			2003/04/30: 3nd version ,remove IRQ and FIQ prototype	
//========================================================================================
#ifndef	__SPCE061_H__
#define	__SPCE061_H__

//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
extern void Set_IOA_Dir(unsigned int);
extern unsigned int Get_IOA_Dir(void);
extern void Set_IOA_Attrib(unsigned int);
extern unsigned int Get_IOA_Attrib(void);
extern void Set_IOA_Data(unsigned int);
extern unsigned int Get_IOA_Data(void);
extern void Set_IOA_Buffer(unsigned int);
extern unsigned int Get_IOA_Buffer(void);
extern void Get_IOA_Latch(void);
//-----------------------------------------------------------------------------------//
extern void Set_IOB_Dir(unsigned int);
extern unsigned int Get_IOB_Dir(void);
extern void Set_IOB_Attrib(unsigned int);
extern unsigned int Get_IOB_Attrib(void);
extern void Set_IOB_Data(unsigned int);
extern unsigned int Get_IOB_Data(void);
extern void Set_IOB_Buffer(unsigned int);
extern unsigned int Get_IOB_Buffer(void);
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//

//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
extern void Set_TimerA_Data(unsigned int);
extern unsigned int Get_TimerA_Data(void);
extern void Set_TimerA_Ctrl(unsigned int);
//----------------Default Value-----------------------------//
	#define		C_TimerADefault				0x0036			//			
//----------------TimerA TimeBase---------------------------//
	#define		C_SourceA_Fosc2				0x0000			//
	#define		C_SourceA_Fosc256		   	0x0001			//
	#define		C_SourceA_32768Hz			0x0002			//
	#define		C_SourceA_8192Hz			0x0003			//
	#define		C_SourceA_4096Hz			0x0004			//
	#define		C_SourceA_1					0x0005			//
	#define 	C_SourceA_0					0x0006			//*
	#define 	C_SourceA_Ext1				0x0007			//
//----------------------------------------------------------//
	#define		C_SourceB_2048Hz			0x0000 			//
	#define		C_SourceB_1024Hz			0x0008 			//
	#define		C_SourceB_256Hz				0x0010 			//
	#define		C_SourceB_TMB1				0x0018 			//
	#define		C_SourceB_4Hz				0x0020 			//
	#define		C_SourceB_2Hz				0x0028 			//
	#define		C_SourceB_1					0x0030 			//*
	#define		C_SourceB_Ext2				0x0038 			//
//-----------------------------------------------------------------------------------//
extern void Set_TimerB_Data(unsigned int);
extern unsigned int Get_TimerB_Data(void);
extern void Set_TimerB_Ctrl(unsigned int);
//----------------Default Value-----------------------------//
	#define		C_TimerBDefault				0x0006			//		
//----------------TimerB TimeBase----------------------------//
	#define		C_SourceC_Fosc2				0x0000 			//
	#define		C_SourceC_Fosc256		    0x0001 			//
	#define		C_SourceC_32768Hz			0x0002 			//
	#define		C_SourceC_8192Hz			0x0003 			//
	#define		C_SourceC_4096Hz			0x0004 			//
	#define		C_SourceC_1					0x0005 			//
	#define 	C_SourceC_0					0x0006 			//*
	#define 	C_SourceC_Ext1				0x0007 			//
//-----------------TimerA TimerB TimeBase--------------------------------------------//
	#define		C_DutyOff					0x0000 			//
	#define 	C_Duty1						0x0040 			//
	#define 	C_Duty2						0x0080 			//
	#define 	C_Duty3						0x00C0 			//
	#define 	C_Duty4						0x0100 			//
	#define 	C_Duty5						0x0140 			//
	#define 	C_Duty6						0x0180 			//
	#define 	C_Duty7						0x01C0 			//
	#define 	C_Duty8						0x0200 			//
	#define 	C_Duty9						0x0240 			//
	#define 	C_Duty10					0x0280 			//
	#define 	C_Duty11					0x02C0 			//
	#define 	C_Duty12					0x0300 			//
	#define 	C_Duty13					0x0340 			//
	#define 	C_Duty14					0x0380 			//
	#define 	C_Duty_Div_2				0x03C0 			// Timer A&B
//----------------Default Value-----------------------------//
	#define		C_TimeBaseDefault			0x0000			//		
//-----------------------------------------------------------------------------------//
extern void Set_TimeBase(unsigned int);
	#define 	C_TMB1_8Hz					0x0000 			//*
	#define 	C_TMB1_16Hz					0x0001 			//
	#define 	C_TMB1_32Hz					0x0002 			//
	#define 	C_TMB1_64Hz					0x0003 			//
	#define 	C_TMB2_128Hz				0x0000 			//*
	#define 	C_TMB2_256Hz				0x0004 			//
	#define 	C_TMB2_512Hz				0x0008 			//
	#define 	C_TMB2_1024Hz				0x000C 			//
extern void Clear_TimeBase(void);
	#define 	C_TMBCLR					0x5555 			//

//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
extern void Set_FeedBack(unsigned int);
	#define		C_FBKEN3		0x08	//Enable	IOB3 and IOB5 FeedBack2
	#define		C_FBKEN2		0x04	//Enable	IOB2 and IOB4 FeedBack1
	#define		C_IRTxEN		0x01	//Enable	IOB8 and IOB10 IRTx / Tx
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
extern void Set_INT_Ctrl(unsigned int);
extern unsigned int Get_INT_Ctrl(void);

extern void Set_INT_Mask(unsigned int);
extern unsigned int Get_INT_Mask(void);
extern void INT_Clear(unsigned int);
	#define 	C_IRQ6_TMB2             0x0001         	// Timer B IRQ6
	#define 	C_IRQ6_TMB1             0x0002         	// Timer A IRQ6
	#define 	C_IRQ5_2Hz              0x0004         	// 2Hz IRQ5
	#define 	C_IRQ5_4Hz              0x0008         	// 4Hz IRQ5
	#define 	C_IRQ4_1KHz             0x0010         	// 1024Hz IRQ4
	#define 	C_IRQ4_2KHz             0x0020         	// 2048Hz IRQ4
	#define 	C_IRQ4_4KHz             0x0040         	// 4096Hz IRQ4
	#define 	C_IRQ3_KEY              0x0080         	// Key Change IRQ3
	#define 	C_IRQ3_EXT1             0x0100         	// Ext1 IRQ3
	#define 	C_IRQ3_EXT2             0x0200         	// Ext2 IRQ3
	#define 	C_IRQ2_TMB              0x0400         	// Timer B IRQ2
	#define 	C_FIQ_TMB               0x0800         	// Timer B FIQ
	#define 	C_IRQ1_TMA              0x1000         	// Timer A IRQ1
	#define 	C_FIQ_TMA               0x2000         	// Timer A FIQ
	#define 	C_IRQ0_PWM              0x4000         	// PWM IRQ0
	#define 	C_FIQ_PWM               0x8000         	// PWM FIQ
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
extern void Watchdog_Clear(void);
	#define		C_WDTCLR				0x0001			//WDT CLR CMD
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
extern void Set_SystemClock(unsigned int);				//Std061SYS.asm
//... Definition for P_SystemClock ............
	#define		C_SystemClockDefalut	0x0013			// (default value)	
//B2..B0
	#define 	C_Fosc					0x0000 			// 
	#define 	C_Fosc_Div_2			0x0001 			//
	#define 	C_Fosc_Div_4			0x0002 			//
	#define 	C_Fosc_Div_8			0x0003 			// (default)
	#define 	C_Fosc_Div_16			0x0004 			//
	#define 	C_Fosc_Div_32			0x0005 			//
	#define 	C_Fosc_Div_64			0x0006 			//
	#define 	C_Sleep					0x0007 		 	//
//-----------------------------------------------------------------------------------//
//B4
	#define		C_32K_Work				0x0010 			// (default)
	#define 	C_32K_Off				0x0000 			// 
//B3
	#define 	C_StrongMode			0x0008 			// 
	#define 	C_AutoMode				0x0000 			// (default)
//-----------------------------------------------------------------------------------//
//B7..B5
	#define 	C_Fosc_24M				0x0000 			// (default)
	#define 	C_Fosc_20M				0x0020 			//
	#define 	C_Fosc_32M				0x0040 			//
	#define 	C_Fosc_40M				0x0060 			//
	#define 	C_Fosc_49M				0x0080 			//
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
extern void Set_ADC_Data(unsigned int);
extern unsigned int Get_ADC_Data(void);
//B15-B6  --> Data
extern void Set_ADC_Ctrl(unsigned int);
extern unsigned int Get_ADC_Ctrl(void);
//... Define for P_ADC_Ctrl ....................
	#define		C_ADCE					0x0001 			//B1	//Enable ADC
	#define		C_ADCN					0x0000			//B1	//Disable ADC&MIC
	#define 	C_MIC_DIS				0x0002 			//B2	//No Mic
	#define 	C_MIC_ENB				0x0000 			//B2	//Have MIC
	#define 	C_AGCE					0x0004 			//B3	//Have AGC
	#define 	C_AGCN					0x0000 			//B3	//No AGC
	#define 	C_DAC_OUT2mA			0x0040 			//B6	//DAC current 2mA
	#define 	C_DAC_OUT3mA			0x0000 			//B6	//DAC currect 3mA
	#define 	C_VEXTREF_ENB			0x0080 			//B7	//Have Ext REF Voltage
	#define 	C_VEXTREF_DIS			0x0000 			//B7	//No Ext REF Voltag
	#define 	C_V2VREFB_DIS			0x0100 			//B8	//No 2V Voltage
	#define 	C_V2VREFB_ENB			0x0000 			//B8	//Have 2V Voltage
	
//B15	-->	RDY
//-----------------------------------------------------------------------------------//
extern void Set_ADC_MUX_Ctrl(unsigned int);
extern unsigned int Get_ADC_MUX_Ctrl(void);
//B2..B0
	#define		C_ADC_CH_MICin			0x0000 			//
	#define		C_ADC_CH1				0x0001 			//IOA0
	#define		C_ADC_CH2				0x0002 			//IOA1
	#define		C_ADC_CH3				0x0003 			//IOA2
	#define		C_ADC_CH4				0x0004 			//IOA3
	#define		C_ADC_CH5				0x0005 			//IOA4
	#define		C_ADC_CH6				0x0006 			//IOA5
	#define		C_ADC_CH7				0x0007 			//IOA6
//B15	-->	RDY
//B14	--> Fail B
//-----------------------------------------------------------------------------------//
extern unsigned int Get_ADC_LineIn_Data(void);
//B15-B6  --> Data
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
extern void Set_DAC2_Data(unsigned int);
extern unsigned int Get_DAC2_Data(void);
//B15-B6  --> Data
extern void Set_DAC1_Data(unsigned int);
extern unsigned int Get_DAC1_Data(void);
//B15-B6  --> Data
extern void Set_DAC_Ctrl(unsigned int);
//B8..B7
	#define	C_DA1_Direct				0x0000 			// DAC1 latch
	#define C_DA1_LatchA				0x0080 			// 
	#define C_DA1_LatchB				0x0100 			//
	#define C_DA1_LatchAB				0x0180 			//
//B6..B5  
	#define	C_DA2_Direct				0x0000 			// DAC2 latch
	#define C_DA2_LatchA				0x0020 			// 
	#define C_DA2_LatchB				0x0040 			//
	#define C_DA2_LatchAB				0x0060 			//
//B4..B3
	#define C_AD_Direct					0x0000 			// A/D MIC_IN latch 
	#define C_AD_LatchA					0x0008 			//
	#define	C_AD_LatchB					0x0010 			//
	#define C_AD_LatchAB				0x0018 			//
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
extern void Set_LVD_Ctrl(unsigned int);
extern unsigned int Get_LVD_Ctrl(void);
//... Define for P_LVD_Ctrl ...................
	#define 	C_LVD24V				0x0000 			// LVD = 2.4V 	(default)
	#define 	C_LVD28V				0x0001 			// LVD = 2.8V
	#define 	C_LVD32V				0x0002 			// LVD = 3.2V
//B15	Result of LVD
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
extern void Set_SIO_Ctrl(unsigned int);
extern unsigned int Get_SIO_Ctrl(void);
//B1..B0
	#define 	C_SIO_Addr8				0x0002 			// Address  = 8 
	#define 	C_SIO_Addr16			0x0000 			// Address  = 16 	(default)
	#define 	C_SIO_Addr24			0x0003 			// Address  = 24
//B4..B3
	#define 	C_SIO_Clk_Div_16		0x0000 			// CPU CLK/16 		(default)
	#define 	C_SIO_Clk_Div_4			0x0008 			// CPU CLK/4
	#define 	C_SIO_Clk_Div_8			0x0010 			// CPU CLK/8
	#define 	C_SIO_Clk_Div_32		0x0018			// CPU CLK/32
//B5
	#define		C_SIO_RW_Dis			0x0020			//	Read /Write control bit applied disable
	#define		C_SIO_RW_ENB			0x0000			//	Read /Write control bit applied 
//B6
	#define		C_SIO_RD				0x0000			//	SIO Read 
	#define		C_SIO_WR				0x0040			//	SIO Write 
//B7
	#define		C_SIO_ENB				0x0080			//	Enable SIO Configuration 
	#define		C_SIO_Dis				0x0000			//	Disable SIO
//-----------------------------------------------------------------------------------//
extern void Set_SIO_Data(unsigned int);
extern unsigned int Get_SIO_Data(void);
//B7..B0	-->	Data
extern void Set_SIO_Address(unsigned long int);
extern unsigned long int Get_SIO_Address(void);
//B7..B0	-->	Address Low
//B15..B7	--> Address Mid
//B23..B16	-->	Address High
extern void Set_SIO_Addr_Low(unsigned int);
extern unsigned int Get_SIO_Addr_Low(void);
//B7..B0	-->	Data
extern void Set_SIO_Addr_Mid(unsigned int);
extern unsigned int Get_SIO_Addr_Mid(void);
//B7..B0	-->	Data
extern void Set_SIO_Addr_High(unsigned int);
extern unsigned int Get_SIO_Addr_High(void);
//B7..B0	-->	Data
extern void Set_SIO_Start(void);
	#define		C_SIOSTARTCMD			0x5555	 
extern unsigned int Get_SIO_Start(void);
//B7	-->	Busy
extern void Set_SIO_Stop(void);
	#define		C_SIOSTOPCMD			0x5555	 

//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
extern void Set_UART_Command1(unsigned int);
//B2
	#define		C_UART_Parity_ENB			0x0004			//Enable UART	Parity Enable 
//B3
	#define		C_UART_Parity_Odd			0x0000			//Enable UART	Parity Odd 
	#define		C_UART_Parity_Even			0x0008			//Enable UART	Parity Even 
//B5
	#define		C_UART_Reset				0x0020			//UART	Internal Reset
//B6
	#define		C_UART_Tx_IRQ_ENB			0x0040			//UART	TX IRQ	Enable
//B7
	#define		C_UART_Rx_IRQ_ENB			0x0080			//UART	RX IRQ	Enable
//-----------------------------------------------------------------------------------//
extern void Set_UART_Command2(unsigned int);
//B6
	#define		C_UART_Tx_Pin_ENB			0x0040			//UART	TX Pin Enable
//B7
	#define		C_UART_Rx_Pin_ENB			0x0080			//UART	RX Pin Enable
extern unsigned int Get_UART_Command2(void);
//B3
	#define		C_UART_Parity_Error			0x0008			//UART	Parity Error 
//B4
	#define		C_UART_OverRun_Error		0x0010			//UART	Over Run Error 
//B5
	#define		C_UART_Frame_Error			0x0020			//UART	Frame Error
//B6
	#define		C_UART_Tx_RDY				0x0040			//UART	TX Ready
//B7
	#define		C_UART_Rx_RDY				0x0080			//UART	RX Ready
//-----------------------------------------------------------------------------------//
//B7..B0
extern void Set_UART_Data(unsigned int);
extern unsigned int Get_UART_Data(void);
//B15..B0
extern void Set_UART_BaudRate(unsigned int);
extern unsigned int Get_UART_BaudRate(void);
	#define		C_BaudRate_2400				0x1400			//UART	2400
	#define		C_BaudRate_4800				0x0A00			//UART	4800
	#define		C_BaudRate_9600				0x0500			//UART	9600
	#define		C_BaudRate_19200			0x0280			//UART	19200
	#define		C_BaudRate_38400			0x0140			//UART	38400
	#define		C_BaudRate_48000			0x0100			//UART	48000
//B7..B0
extern void Set_UART_BaudScalarLow(unsigned int);
extern unsigned int Get_UART_BaudScalarLow(void);
//B7..B0
extern void Set_UART_BaudScalarHigh(unsigned int);
extern unsigned int Get_UART_BaudScalarHigh(void);
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
extern void Mic_Input_Ctrl(unsigned int,unsigned int);
//	1:Set DAC trigger type
//		C_DA1_Direct				0x0000 			// DAC1 latch
//	 	C_DA1_LatchA				0x0080 			// 
//	 	C_DA1_LatchB				0x0100 			//
//	 	C_DA1_LatchAB				0x0180 			//
//------------------------------------------------------------
//		C_DA2_Direct				0x0000 			// DAC2 latch
//		C_DA2_LatchA				0x0020 			// 
//	 	C_DA2_LatchB				0x0040 			//
//	 	C_DA2_LatchAB				0x0060 			//
//-------------------------------------------------------------
//	 	C_AD_Direct					0x0000 			// A/D MIC_IN latch 
//	 	C_AD_LatchA					0x0008 			//
//		C_AD_LatchB					0x0010 			//
//	 	C_AD_LatchAB				0x0018 			//
//--------------------------------------------------------------
//	User can set 3 of above list, like 
//			C_DA1_LatchA+C_DA2_LatchB+C_AD_LatchA	or	
//			C_DA2_LatchAB+C_AD_LatchA
//
//	2:Select AGC enable/disable
// 		C_AGCE						0x0004 			//B3	//Have AGC
// 		C_AGCN						0x0000 			//B3	//No AGC
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
extern void Line_Input_Ctrl(unsigned int,unsigned int);
//	1:Set Line in channel 
//		C_ADC_CH1				0x0001 			//IOA0
//		C_ADC_CH2				0x0002 			//IOA1
//		C_ADC_CH3				0x0003 			//IOA2
//		C_ADC_CH4				0x0004 			//IOA3
//		C_ADC_CH5				0x0005 			//IOA4
//		C_ADC_CH6				0x0006 			//IOA5
//		C_ADC_CH7				0x0007 			//IOA6

//	2:Set Vextref enable/disable and V2 Ref enable/disable
//		C_VEXTREF_ENB			0x0080 			//B7	//Have Ext REF Voltage
//		C_VEXTREF_DIS			0x0000 			//B7	//No Ext REF Voltage
//		C_V2VREFB_DIS			0x0100 			//B8	//No 2V Voltage
//		C_V2VREFB_ENB			0x0000 			//B8	//Have 2V Voltage
//









//extern void	FIQ_ON();
//extern void	FIQ_OFF();
//extern void	IRQ_ON();
//extern void	IRQ_OFF();
//extern void	INT_FIQ();
//extern void	INT_IRQ();
//extern void	INT_FIQ_IRQ();
//extern void	INT_OFF();

extern void SIO_IO_Init(void);
// Set Serial IO(IB0,IB1) =(SCK,SIO) Status 
// Direct output
// Pull high
// Data low

#define	P_IOA_Data 				(volatile unsigned int *)0x7000   
#define P_IOA_Buffer 			(volatile unsigned int *)0x7001
#define P_IOA_Dir 				(volatile unsigned int *)0x7002
#define P_IOA_Attrib 			(volatile unsigned int *)0x7003
#define P_IOA_Latch 			(volatile unsigned int *)0x7004
//............................................
#define P_IOB_Data				(volatile unsigned int *)0x7005  
#define P_IOB_Buffer			(volatile unsigned int *)0x7006   
#define P_IOB_Dir				(volatile unsigned int *)0x7007   
#define P_IOB_Attrib			(volatile unsigned int *)0x7008   
//............................................
#define P_FeedBack				(volatile unsigned int *)0x7009   
#define P_TimerA_Data			(volatile unsigned int *)0x700A   
#define P_TimerA_Ctrl			(volatile unsigned int *)0x700B   
#define P_TimerB_Data			(volatile unsigned int *)0x700C   
#define P_TimerB_Ctrl			(volatile unsigned int *)0x700D   
#define P_TimeBase_Setup		(volatile unsigned int *)0x700E   
#define P_TimeBase_Clear		(volatile unsigned int *)0x700F 	
#define P_INT_Ctrl				(volatile unsigned int *)0x7010   
#define P_INT_Clear				(volatile unsigned int *)0x7011   
#define P_INT_Mask				(volatile unsigned int *)0x702D   
#define P_Watchdog_Clear		(volatile unsigned int *)0x7012   
#define P_SystemClock			(volatile unsigned int *)0x7013   
//... PA6442 New version MC52A (For EC-03)....
#define P_ADC					(volatile unsigned int *)0x7014   
#define P_ADC_Ctrl				(volatile unsigned int *)0x7015   
#define P_ADC_MUX_Ctrl			(volatile unsigned int *)0x702B   
#define P_ADC_LINEIN_Data		(volatile unsigned int *)0x702C   
#define P_DAC2					(volatile unsigned int *)0x7016   
#define P_DAC1					(volatile unsigned int *)0x7017   
#define P_DAC_Ctrl				(volatile unsigned int *)0x702A 	
//............................................
#define P_LVD_Ctrl				(volatile unsigned int *)0x7019   
//............................................
#define P_SIO_Data				(volatile unsigned int *)0x701A
#define P_SIO_Addr_Low			(volatile unsigned int *)0x701B
#define P_SIO_Addr_Mid			(volatile unsigned int *)0x701C
#define P_SIO_Addr_High			(volatile unsigned int *)0x701D
#define P_SIO_Ctrl				(volatile unsigned int *)0x701E
#define P_SIO_Start				(volatile unsigned int *)0x701F
#define P_SIO_Stop				(volatile unsigned int *)0x7020 	
//............................................
#define P_UART_Command1			(volatile unsigned int *)0x7021 	
#define P_UART_Command2			(volatile unsigned int *)0x7022 	
#define P_UART_Data				(volatile unsigned int *)0x7023  	
#define	P_UART_BaudScalarLow	(volatile unsigned int *)0x7024	
#define	P_UART_BaudScalarHigh	(volatile unsigned int *)0x7025 	

/*		
extern *P_IOA_Data;   	    	
extern *P_IOA_Buffer;       	
extern *P_IOA_Dir;           	
extern *P_IOA_Attrib;
extern *P_IOA_Latch;         	
//.....................................
extern *P_IOB_Data;         	
extern *P_IOB_Buffer;        	
extern *P_IOB_Dir;           	
extern *P_IOB_Attrib;        	
//......................................
extern *P_FeedBack;          	
extern *P_TimerA_Data;	
extern *P_TimerA_Ctrl;       	
extern *P_TimerB_Data;       	
extern *P_TimerB_Ctrl;       	
extern *P_TimeBase_Setup;  	
extern *P_TimeBase_Clear;	
extern *P_INT_Ctrl;          	
extern *P_INT_Clear;         	
extern *P_INT_Mask;          	
extern *P_Watchdog_Clear;    	
extern *P_SystemClock;       	
//.......................................
extern *P_ADC; 	        	
extern *P_ADC_Ctrl;          	
extern *P_ADC_MUX_Ctrl;      	
extern *P_ADC_LINEIN_Data;
extern *P_DAC2;              	
extern *P_DAC1;	        	
extern *P_DAC_Ctrl;
//......................................
extern *P_LVD_Ctrl;          	
//......................................
extern *P_SIO_Data;		
extern *P_SIO_Addr_Low;
extern *P_SIO_Addr_Mid;		
extern *P_SIO_Addr_High;	
extern *P_SIO_Ctrl;		
extern *P_SIO_Start;		
extern *P_SIO_Stop;		
//......................................
extern *P_UART_Command1;
extern *P_UART_Command2;	
extern *P_UART_Data;		
extern *P_UART_BaudScalarLow;
extern *P_UART_BaudScalarHigh; 	
*/			
#endif


