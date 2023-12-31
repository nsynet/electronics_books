//========================================================================================
// Progarm: The file be included by modules
// Arranged by: Lanin Lin
// Date: 	2002/11/20: first version
//
//========================================================================================

//////////////////////////////////////////////////////////////////
// Definitions for I/O Port
//////////////////////////////////////////////////////////////////
.DEFINE	P_IOA_Data   	    	0x7000         // Write Data into data register and read from IOA pad
.DEFINE P_IOA_Buffer       	 	0x7001         // Write Data into buffer register and read from buffer register
.DEFINE P_IOA_Dir           	0x7002         // Direction vector for IOA
.DEFINE P_IOA_Attrib        	0x7003         // Attribute vector for IOA
.DEFINE P_IOA_Latch         	0x7004         // Latch PortA data for key change wake-up
//............................................
.DEFINE P_IOB_Data         		0x7005         // Write Data into the data register and read from IOB pad
.DEFINE P_IOB_Buffer        	0x7006         // Write Data into buffer register and read from buffer register
.DEFINE P_IOB_Dir           	0x7007         // Direction vector for IOB
.DEFINE P_IOB_Attrib        	0x7008         // Attribute vector for IOB
//............................................
.DEFINE P_FeedBack          	0x7009         // Clock form external R,C
.DEFINE P_TimerA_Data       	0x700A         // Data port for TimerA 
.DEFINE P_TimerA_Ctrl       	0x700B         // Control Port for TimerA
.DEFINE P_TimerB_Data       	0x700C         // Data port for TimerB
.DEFINE P_TimerB_Ctrl       	0x700D         // Control Port for TimerB
.DEFINE P_TimeBase_Setup    	0x700E         // TimerBase Freq. Set
.DEFINE P_TimeBase_Clear		0x700F 		   // Reset Timerbase counter
.DEFINE P_INT_Ctrl          	0x7010         // Control port for interrupt source
.DEFINE P_INT_Clear         	0x7011         // Clear interrupt source
.DEFINE P_INT_Mask          	0x702D         // interrupt source imformation
.DEFINE P_Watchdog_Clear    	0x7012         // Watchdog Reset
.DEFINE P_SystemClock       	0x7013         // Change system clock frequency(include go to standby mode)
//... PA6442 New version MC52A (For EC-03)....
.DEFINE P_ADC 	        		0x7014         	// Data Port for AD
.DEFINE P_ADC_Ctrl          	0x7015         	// Control Port for AD control
.DEFINE P_ADC_MUX_Ctrl      	0x702B         	// Control Port for AD control
.DEFINE P_ADC_LINEIN_Data   	0x702C         	// AD Line In Data
.DEFINE P_DAC2              	0x7016         	// Data Port for DAC2
.DEFINE P_DAC1	        		0x7017         	// Data Port for DAC1
.DEFINE P_DAC_Ctrl				0x702A 			// Control Port for two DAC and audio output mode
//............................................
.DEFINE P_LVD_Ctrl          	0x7019         	// Control Port for LVD
//............................................
.DEFINE P_SIO_Data				0x701A 			// Data port for serial IO
.DEFINE P_SIO_Addr_Low			0x701B 			// Address Port low
.DEFINE P_SIO_Addr_Mid			0x701C 			// Address Port middle
.DEFINE P_SIO_Addr_High	 		0x701D 			// Address Port high
.DEFINE P_SIO_Ctrl				0x701E 			// Control Port
.DEFINE P_SIO_Start				0x701F 			// Start port for serial interface
.DEFINE P_SIO_Stop				0x7020 			// Stop port for serial interface
//............................................
.DEFINE P_UART_Command1		 	0x7021 		// Command1 Port for UART
.DEFINE P_UART_Command2		 	0x7022 		// Command2 Port for UART
.DEFINE P_UART_Data			 	0x7023  		// Data Port for UART
.DEFINE	P_UART_BaudScalarLow 	0x7024 		// Set Baud Rate scalar low
.DEFINE	P_UART_BaudScalarHigh 	0x7025 		// Set Baud Rate scalar high
//========================================================================================        
// End of hardware061.inc
//========================================================================================















//----------------TimerA TimerB TimeBase----------------------------//
	.define		C_SourceA_Fosc2				0x0000;			//
	.define		C_SourceA_Fosc256		   	0x0001;			//
	.define		C_SourceA_32768Hz			0x0002;			//
	.define		C_SourceA_8192Hz			0x0003;			//
	.define		C_SourceA_4096Hz			0x0004;			//
	.define		C_SourceA_1					0x0005;			//
	.define 	C_SourceA_0					0x0006;			//
	.define 	C_SourceA_Ext1				0x0007;			//
//-----------------------------------------------------------------------------------//
	.define		C_SourceB_2048Hz			0x0000 			//
	.define		C_SourceB_1024Hz			0x0008 			//
	.define		C_SourceB_256Hz				0x0010 			//
	.define		C_SourceB_TMB1				0x0018 			//
	.define		C_SourceB_4Hz				0x0020 			//
	.define		C_SourceB_2Hz				0x0028 			//
	.define		C_SourceB_1					0x0030 			//
	.define		C_SourceB_Ext2				0x0038 			//
//-----------------------------------------------------------------------------------//
	.define		C_SourceC_Fosc2				0x0000 			//
	.define		C_SourceC_Fosc256		    0x0001 			//
	.define		C_SourceC_32768Hz			0x0002 			//
	.define		C_SourceC_8192Hz			0x0003 			//
	.define		C_SourceC_4096Hz			0x0004 			//
	.define		C_SourceC_1					0x0005 			//
	.define 	C_SourceC_0					0x0006 			//
	.define 	C_SourceC_Ext1				0x0007 			//
//-----------------------------------------------------------------------------------//
	.define		C_DutyOff					0x0000 			//
	.define 	C_Duty1						0x0040 			//
	.define 	C_Duty2						0x0080 			//
	.define 	C_Duty3						0x00C0 			//
	.define 	C_Duty4						0x0100 			//
	.define 	C_Duty5						0x0140 			//
	.define 	C_Duty6						0x0180 			//
	.define 	C_Duty7						0x01C0 			//
	.define 	C_Duty8						0x0200 			//
	.define 	C_Duty9						0x0240 			//
	.define 	C_Duty10					0x0280 			//
	.define 	C_Duty11					0x02C0 			//
	.define 	C_Duty12					0x0300 			//
	.define 	C_Duty13					0x0340 			//
	.define 	C_Duty14					0x0380 			//
	.define 	C_Duty_Div_2				0x03C0 			// Timer A&B
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
//	TimeBase Setting
	.define 	C_TMB1_8Hz					0x0000 			//
	.define 	C_TMB1_16Hz					0x0001 			//
	.define 	C_TMB1_32Hz					0x0002 			//
	.define 	C_TMB1_64Hz					0x0003 			//
	.define 	C_TMB2_128Hz				0x0000 			//
	.define 	C_TMB2_256Hz				0x0004 			//
	.define 	C_TMB2_512Hz				0x0008 			//
	.define 	C_TMB2_1024Hz				0x000C 			//
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
//  FeedBack Setting
	.define		C_FBKEN3		0x08	//Enable	IOB3 and IOB5 FeedBack2
	.define		C_FBKEN2		0x04	//Enable	IOB2 and IOB4 FeedBack1
	.define		C_IRTxEN		0x01	//Enable	IOB8 and IOB10 IRTx / Tx
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
//	INT 
	.define 	C_IRQ6_TMB2             0x0001         	// Timer B IRQ6
	.define 	C_IRQ6_TMB1             0x0002         	// Timer A IRQ6
	.define 	C_IRQ5_2Hz              0x0004         	// 2Hz IRQ5
	.define 	C_IRQ5_4Hz              0x0008         	// 4Hz IRQ5
	.define 	C_IRQ4_1KHz             0x0010         	// 1024Hz IRQ4
	.define 	C_IRQ4_2KHz             0x0020         	// 2048Hz IRQ4
	.define 	C_IRQ4_4KHz             0x0040         	// 4096Hz IRQ4
	.define 	C_IRQ3_KEY              0x0080         	// Key Change IRQ3
	.define 	C_IRQ3_EXT1             0x0100         	// Ext1 IRQ3
	.define 	C_IRQ3_EXT2             0x0200         	// Ext2 IRQ3
	.define 	C_IRQ2_TMB              0x0400         	// Timer B IRQ2
	.define 	C_FIQ_TMB               0x0800         	// Timer B FIQ
	.define 	C_IRQ1_TMA              0x1000         	// Timer A IRQ1
	.define 	C_FIQ_TMA               0x2000         	// Timer A FIQ
	.define 	C_IRQ0_PWM              0x4000         	// PWM IRQ0
	.define 	C_FIQ_PWM               0x8000         	// PWM FIQ
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
//... Definition for P_SystemClock ............
//B2..B0
	.define 	C_Fosc					0x0000 			// 
	.define 	C_Fosc_Div_2			0x0001 			//
	.define 	C_Fosc_Div_4			0x0002 			//
	.define 	C_Fosc_Div_8			0x0003 			// (default)
	.define 	C_Fosc_Div_16			0x0004 			//
	.define 	C_Fosc_Div_32			0x0005 			//
	.define 	C_Fosc_Div_64			0x0006 			//
	.define 	C_Sleep					0x0007 		 	//
//-----------------------------------------------------------------------------------//
//B4
	.define		C_32K_Work				0x0010 			// (default)
	.define 	C_32K_Off				0x0000 			// 
//B3
	.define 	C_StrongMode			0x0008 			// 
	.define 	C_AutoMode				0x0000 			// (default)
//-----------------------------------------------------------------------------------//
//B7..B5
	.define 	C_Fosc_24M				0x0000 			// (default)
	.define 	C_Fosc_20M				0x0020 			//
	.define 	C_Fosc_32M				0x0040 			//
	.define 	C_Fosc_40M				0x0060 			//
	.define 	C_Fosc_49M				0x0080 			//
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
//... Define for P_ADC_Ctrl ....................
	.define		C_ADCE					0x0001 			//B1	//Enable ADC
	.define		C_ADCN					0x0000			//B1	//Disable ADC&MIC
	.define 	C_MIC_DIS				0x0002 			//B2	//No Mic
	.define 	C_MIC_ENB				0x0000 			//B2	//Have MIC
	.define 	C_AGCE					0x0004 			//B3	//Have AGC
	.define 	C_AGCN					0x0000 			//B3	//No AGC
	.define 	C_DAC_OUT2mA			0x0040 			//B6	//DAC current 2mA
	.define 	C_DAC_OUT3mA			0x0000 			//B6	//DAC currect 3mA
	.define 	C_VEXTREF_ENB			0x0080 			//B7	//Have Ext REF Voltage
	.define 	C_VEXTREF_DIS			0x0000 			//B7	//No Ext REF Voltag
	.define 	C_V2VREFB_DIS			0x0100 			//B8	//No 2V Voltag2
	.define 	C_V2VREFB_ENB			0x0000 			//B8	//Have 2V Voltag2
//B15	-->	RDY
//-----------------------------------------------------------------------------------//
//... Define for P_ADC_MUX_Ctrl ....................
//B2..B0
	.define		C_ADC_CH_MICin			0x0000 			//
	.define		C_ADC_CH1				0x0001 			//IOA0
	.define		C_ADC_CH2				0x0002 			//IOA1
	.define		C_ADC_CH3				0x0003 			//IOA2
	.define		C_ADC_CH4				0x0004 			//IOA3
	.define		C_ADC_CH5				0x0005 			//IOA4
	.define		C_ADC_CH6				0x0006 			//IOA5
	.define		C_ADC_CH7				0x0007 			//IOA6
//B15	-->	RDY
//B14	--> Fail B
//-----------------------------------------------------------------------------------//
//... Define for P_DAC_Ctrl ....................
//B8..B7
	.define	C_DA1_Direct				0x0000 			// DAC1 latch
	.define C_DA1_LatchA				0x0080 			// 
	.define C_DA1_LatchB				0x0100 			//
	.define C_DA1_LatchAB				0x0180 			//
//B6..B5  
	.define	C_DA2_Direct				0x0000 			// DAC2 latch
	.define C_DA2_LatchA				0x0020 			// 
	.define C_DA2_LatchB				0x0040 			//
	.define C_DA2_LatchAB				0x0060 			//
//B4..B3
	.define C_AD_Direct					0x0000 			// A/D MIC_IN latch 
	.define C_AD_LatchA					0x0008 			//
	.define	C_AD_LatchB					0x0010 			//
	.define C_AD_LatchAB				0x0018 			//
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
//... Define for P_LVD_Ctrl ...................
	.define 	C_LVD24V				0x0000 			// LVD = 2.4V 	(default)
	.define 	C_LVD28V				0x0001 			// LVD = 2.8V
	.define 	C_LVD32V				0x0002 			// LVD = 3.2V
//B15	Result of LVD
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
//... Define for P_SIO_Ctrl ....................
//B1..B0
	.define 	C_SIO_Addr8				0x0002 			// Address  = 8 
	.define 	C_SIO_Addr16			0x0000 			// Address  = 16 	(default)
	.define 	C_SIO_Addr24			0x0003 			// Address  = 24
//B4..B3
	.define 	C_SIO_Clk_Div_16		0x0000 			// CPU CLK/16 		(default)
	.define 	C_SIO_Clk_Div_4			0x0008 			// CPU CLK/4
	.define 	C_SIO_Clk_Div_8			0x0010 			// CPU CLK/8
	.define 	C_SIO_Clk_Div_32		0x0018			// CPU CLK/32
//B5
	.define		C_SIO_RW_Dis			0x0020			//	Read /Write control bit applied disable
	.define		C_SIO_RW_ENB			0x0000			//	Read /Write control bit applied 
//B6
	.define		C_SIO_RD				0x0000			//	SIO Read 
	.define		C_SIO_WR				0x0040			//	SIO Write 
//B7
	.define		C_SIO_ENB				0x0080			//	Enable SIO Configuration 
	.define		C_SIO_Dis				0x0000			//	Disable SIO	
	
	
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//
//	Set_UART_Command1(unsigned int);
//B2
	.define		C_UART_Parity_ENB			0x0004			//Enable UART	Parity Enable 
//B3
	.define		C_UART_Parity_Odd			0x0000			//Enable UART	Parity Odd 
	.define		C_UART_Parity_Even			0x0008			//Enable UART	Parity Even 
//B5
	.define		C_UART_Reset				0x0020			//UART	Internal Reset
//B6
	.define		C_UART_Tx_IRQ_ENB			0x0040			//UART	TX IRQ	Enable
//B7
	.define		C_UART_Rx_IRQ_ENB			0x0080			//UART	RX IRQ	Enable
//-----------------------------------------------------------------------------------//
//	Set_UART_Command2
//B6
	.define		C_UART_Tx_Pin_ENB			0x0040			//UART	TX Pin Enable
//B7
	.define		C_UART_Rx_Pin_ENB			0x0080			//UART	RX Pin Enable
// 	Get_UART_Command2
//B3
	.define		C_UART_Parity_Error			0x0008			//UART	Parity Error 
//B4
	.define		C_UART_OverRun_Error		0x0010			//UART	Over Run Error 
//B5
	.define		C_UART_Frame_Error			0x0020			//UART	Frame Error
//B6
	.define		C_UART_Tx_RDY				0x0040			//UART	TX Ready
//B7
	.define		C_UART_Rx_RDY				0x0080			//UART	RX Ready
//-----------------------------------------------------------------------------------//
//	Set Baud Rate
	.define		C_BaudRate_2400				0x1400			//UART	2400
	.define		C_BaudRate_4800				0x0A00			//UART	4800
	.define		C_BaudRate_9600				0x0500			//UART	9600
	.define		C_BaudRate_19200			0x0280			//UART	19200
	.define		C_BaudRate_38400			0x0140			//UART	38400
	.define		C_BaudRate_48000			0x0100			//UART	48000
//-----------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------//


