//========================================================================================
// Program: Standard function definition V1.0
// Arranged by: Arthur Shieh
// Platform:  SPCE500A/060A/061A, IDE 1.63, Windows 2000
//
// Date: 	2002/10/31 V1.0 : first version
//
// Note: 1)This inc file defines the ports available for user to use SPCE series.
//         The port setting constants is also included for users' convenience. 
//       2)Naming rule:
//         C : define constant 
//         P : define I/O port
//=======================================================================================

//---------------------------------------------------------- 
//CPU Type definition : User needs to modified this according to the body used
//---------------------------------------------------------- 
.define SPCE500A 0
.define SPCE061A 1   // SPCE060A as well

//.define BODY_TYPE SPCE500A	       // SPCE500A 
.define BODY_TYPE SPCE061A	       // SPCE061A 
//---------------------------------------------------------- 

//////////////////////////////////////////////////////////////////
// Define Area for I/O									
//////////////////////////////////////////////////////////////////
//PortA,PortB contain some special functions
P_IOA_Data:			.VDEF  0x7000;		// Write Data into data register and read from IOA pad
P_IOA_Buffer:   	.VDEF  0x7001;		// Write Data into buffer register and read from buffer register
P_IOA_Dir:      	.VDEF  0x7002;     // Direction vector for IOA
P_IOA_Attrib:   	.VDEF  0x7003;     // Attribute vector for IOA
P_IOA_Latch:		.VDEF  0x7004;     // Latch PortA data for key change wake-up

P_IOB_Data:         .VDEF  0x7005      // Write Data into the data register and read from IOB pad
P_IOB_Buffer:       .VDEF  0x7006      // Write Data into buffer register and read from buffer register
P_IOB_Dir:          .VDEF  0x7007      // Direction vector for IOB
P_IOB_Attrib:       .VDEF  0x7008  	// Attribute vector for IOB

P_FeedBack:     	.VDEF  0x7009;     // Clock form external R,C
P_TimerA_Data:  	.VDEF  0x700A;     // Data port for TimerA 
P_TimerA_Ctrl:  	.VDEF  0x700B;     // Control Port for TimerA
P_TimerB_Data:  	.VDEF  0x700C;     // Data port for TimerB
P_TimerB_Ctrl:  	.VDEF  0x700D;     // Control Port for TimerB
P_TimeBase_Setup:  	.VDEF  0x700E;     // TimerBase Freq. Set
P_TimeBase_Clear:  	.VDEF  0x700F;   	// Reset Timerbase counter
P_INT_Ctrl:     	.VDEF  0x7010;     // for read INT flag(R)
P_INT_Clear:    	.VDEF  0x7011;     // Clear interrupt source
P_Watchdog_Clear:   .VDEF  0x7012;     // Watchdog Reset
P_SystemClock:      .VDEF  0x7013;     // Change system clock frequency(include go to standby mode)

P_ADC: 	        	.VDEF  0x7014;     // Data Port for AD
P_ADC_Ctrl:    		.VDEF  0x7015;     // Control Port for AD control
P_ADC_Status:   	.VDEF  0x7015;     // AD Port Status
P_DAC2:         	.VDEF  0x7016;     // Data Port for DAC2
P_PWM:          	.VDEF  0x7016;     // Data Port for PWM
P_DAC1:	        	.VDEF  0x7017;     // Data Port for DAC1
P_DAC_Ctrl:	    	.VDEF  0x702A;		// Control Port for two DAC and audio output mode

P_LVD_Ctrl:     	.VDEF  0x7019;     // Control Port for LVD

P_SIO_Data:	    	.VDEF  0x701A;		// serial interface IO	
P_SIO_Addr_Low:  	.VDEF  0x701B;		// Address Port low
P_SIO_Addr_Mid:  	.VDEF  0x701C;		// Address Port middle
P_SIO_Addr_High:    .VDEF  0x701D;		// Address Port high
P_SIO_Ctrl:    	    .VDEF  0x701E;		// Control Port
P_SIO_Start:    	.VDEF  0x701F;		// Start port for serial interface
P_SIO_Stop:     	.VDEF  0x7020;		// Stop port for serial interface

P_UART_Command1:    .VDEF 	0x7021;		// Command1 Port for UART
P_UART_Command2:    .VDEF 	0x7022;		// Command2 Port for UART
P_UART_Data: 	    .VDEF 	0x7023; 	// Data Port for UART
P_UART_BaudScalarLow:  .VDEF  	0x7024;		// Set Baud Rate scalar low
P_UART_BaudScalarHigh: .VDEF  	0x7025;		// Set Baud Rate scalar high

//SPCE061A new ports
//----------------------------------------------
.if BODY_TYPE == SPCE061A
P_ADC_MUX_Ctrl:  	.VDEF  	0x702B		// Control Port
P_ADC_LINEIN_Data:  .VDEF  	0x702C		// Line in data
P_INT_Mask:         .VDEF   0x702D		//R/W INT enable/disable
P_Flash_Ctrl:       .VDEF   0x7555		//Internal flash access enable/disable
.endif
//----------------------------------------------

//////////////////////////////////////////////////////////////////
// Define Area for constants									
//////////////////////////////////////////////////////////////////
// Define for P_INT_Ctrl 
.DEFINE C_IRQ6_TMB2             0x0001;     //TMB2 IRQ6
.DEFINE C_IRQ6_TMB1             0x0002;		//TMB1 IRQ6
.DEFINE C_IRQ5_2Hz              0x0004;     //2Hz IRQ5
.DEFINE C_IRQ5_4Hz              0x0008;     //4Hz IRQ5
.DEFINE C_IRQ4_1KHz            	0x0010;     //1024Hz IRQ4
.DEFINE C_IRQ4_2KHz            	0x0020;     //2048 IRQ4
.DEFINE C_IRQ4_4KHz            	0x0040;     //4096 IRQ4
.DEFINE C_IRQ3_KEY         		0x0080;     //Key Change IRQ3
.DEFINE C_IRQ3_Ext1             0x0100;     //Ext1 IRQ3
.DEFINE C_IRQ3_Ext2             0x0200;     //Ext2 IRQ3
.DEFINE C_IRQ2_TMB            	0x0400;     //Timer B IRQ2
.DEFINE C_FIQ_TMB           	0x0800;     //Timer B FIQ
.DEFINE C_IRQ1_TMA            	0x1000;     //Timer A IRQ1
.DEFINE C_FIQ_TMA            	0x2000;     //Timer A FIQ
.DEFINE C_IRQ0_PWM              0x4000;     //PWM IRQ0
.DEFINE C_FIQ_PWM               0x8000;     //PWM FIQ

// Define for P_TimerA_Ctrl, P_TimerB_Ctrl                               
.DEFINE	C_Timer_Fosc_2			0x0000;		// b0--b2: clock of source A
.DEFINE	C_Timer_Fosc_256		0x0001;		//
.DEFINE	C_Timer_32768Hz			0x0002;		//
.DEFINE	C_Timer_8192Hz			0x0003;		//
.DEFINE	C_Timer_4096Hz			0x0004;		//
.DEFINE	C_Timer_A1				0x0005;		//
.DEFINE C_Timer_A0				0x0006;		//
.DEFINE C_Timer_Ext1			0x0007;		//

.DEFINE	C_Timer_2048Hz			0x0000;		//b3--b5: clock of source B
.DEFINE	C_Timer_1024Hz			0x0008;		//
.DEFINE	C_Timer_256Hz			0x0000;		//
.DEFINE	C_Timer_TMB1			0x0018;		//
.DEFINE	C_Timer_4Hz				0x0020;		//
.DEFINE	C_Timer_2Hz				0x0028;		//
.DEFINE	C_Timer_B1				0x0030;		//
.DEFINE	C_Timer_Ext2			0x0038;		//

.DEFINE	C_PWMO_Off				0x0000;		//b6--b9: output pulse
.DEFINE C_PWMO_D1				0x0040;		//
.DEFINE C_PWMO_D2				0x0080;		//
.DEFINE C_PWMO_D3				0x00C0;		//
.DEFINE C_PWMO_D4				0x0100;		//
.DEFINE C_PWMO_D5				0x0140;		//
.DEFINE C_PWMO_D6				0x0180;		//
.DEFINE C_PWMO_D7				0x01C0;		//
.DEFINE C_PWMO_D8				0x0200;		//
.DEFINE C_PWMO_D9				0x0240;		//
.DEFINE C_PWMO_D10				0x0280;		//
.DEFINE C_PWMO_D11				0x02C0;		//
.DEFINE C_PWMO_D12				0x0300;		//
.DEFINE C_PWMO_D13				0x0340;		//
.DEFINE C_PWMO_D14				0x0380;		//
.DEFINE C_PWMO_Div_2			0x03C0;		// 


// Define for P_SystemClock
// SPCE 061 PLL
//----------------------------------------------
.if BODY_TYPE == SPCE061A
.DEFINE C_Fosc_49M				0x0080			// b7..b5
.DEFINE C_Fosc_41M				0x0060			//
.DEFINE C_Fosc_33M				0x0040			//
.DEFINE C_Fosc_20M				0x0020			// (default)
.DEFINE C_Fosc_24M				0x0000			//
.endif
//----------------------------------------------
.DEFINE C_Fosc					0x0000;		// b2..b0: frequency select 
.DEFINE C_Fosc_Div_2			0x0001;		//
.DEFINE C_Fosc_Div_4			0x0002;		//
.DEFINE C_Fosc_Div_8			0x0003;		// (default)
.DEFINE C_Fosc_Div_16			0x0004;		//
.DEFINE C_Fosc_Div_32			0x0005;		//
.DEFINE C_Fosc_Div_64			0x0006;		//
.DEFINE C_Sleep					0x0007;		//

.DEFINE	C_32K_Work				0x0010;		// b4 = 1: at sleep mode,32.768k still work 
.DEFINE C_32K_Off				0x0000;		// b4 = 0: at sleep mode,32.768k off 
.DEFINE C_StrongMode			0x0008;		// b3 = 1: force strong mode
.DEFINE C_AutoWeakMode			0x0000;		// b3 = 0: auto weak mode(default) 

.DEFINE	C_PLL_Freq_24M			0x0000		//b5..b7: PLL frequency select
.DEFINE	C_PLL_Freq_20M			0x0020		//
.DEFINE	C_PLL_Freq_32M			0x0040		//
.DEFINE	C_PLL_Freq_40M			0x0060		//
.DEFINE	C_PLL_Freq_49M			0x0080		//


// Define for P_ADC_Ctrl
//----------------------------------------------
.if BODY_TYPE == SPCE061A
.DEFINE	C_AD_Enable				0x0001;		//b0=1: enable A/D converter
.DEFINE C_AD_Disable			0x0000;		//b0=0: disable A/D converter
.DEFINE C_AD_Line_In			0x0002;		//b1=1: microphone disable
.DEFINE C_AD_MIC_In				0x0000;		//b1=0: microphone enable
.DEFINE C_AGC_Enable			0x0004;		//b2=1: enable AGC function
.DEFINE C_AGC_Disable			0x0000;		//b2=0: disable AGC function
.DEFINE C_AD_Sample	 			0x0004;		//b3=1: sample the analog signal(manual mode)
.DEFINE C_AD_Hold				0x0000;		//b3=0: hold(manual mode)
.DEFINE C_Auto_Mode	 			0x0010;		//b4=1: A/D auto mode
.DEFINE C_Manual_Mode	 		0x0000;		//b4=0: A/D manual mode
//b5: ADINI?
.DEFINE C_DAC_Current_2mA		0x0040;		//b6=1: DAC current = 2mA @ vdd=3V(new option)
.DEFINE C_DAC_Current_3mA		0x0000;		//b6=0: DAC current = 3mA @ vdd=3V(Default)
.DEFINE C_AD_Vref_VDD			0x0080;		//b7=1: Vref is VDD
.DEFINE C_AD_Vref_VRTPAD		0x0000;		//b7=0: Vref is from pin "VRTPAD"
.DEFINE C_AD_COMP				0x4000;		//b14=1: output voltage of DAC0<Analog input signal
											//b14=0: output voltage of DAC0>Analog input signal
.DEFINE C_AD_RDY				0x8000;		//b15=1: A/D digital data ready; 0: not ready
.endif

.if BODY_TYPE == SPCE500A
.DEFINE	C_AD					0x0001 			//
.DEFINE C_DA					0x0000 			//
.DEFINE C_MIC					0x0000 			//
.DEFINE C_LINE					0x0002 			//
.endif
//----------------------------------------------


// Define for P_DAC_Ctrl
//----------------------------------------------
.if BODY_TYPE == SPCE061A
.DEFINE	C_DAC1_Direct			0x0000;		// b8 b7: DAC1 latch
.DEFINE C_DAC1_LatchA			0x0080;		// Latch data to DAC1 by TimerA 
.DEFINE C_DAC1_LatchB			0x0100;		// Latch data to DAC1 by TimerB
.DEFINE C_DAC1_LatchAB			0x0180;		// Latch data to DAC1 by TimerA or TimerB

.DEFINE	C_DAC2_Direct			0x0000;		// b6 b5: DAC2 latch
.DEFINE C_DAC2_LatchA			0x0020;		// Latch data to DAC2 by TimerA
.DEFINE C_DAC2_LatchB			0x0040;		// Latch data to DAC2 by TimerB
.DEFINE C_DAC2_LatchAB			0x0060;		// Latch data to DAC2 by TimerA or TimerB

.DEFINE	C_ADC_Direct			0x0000;		// b4 b3: ADC latch
.DEFINE C_ADC_LatchA			0x0008;		// Latch data to ADC by TimerA
.DEFINE C_ADC_LatchB			0x0010;		// Latch data to ADC by TimerB
.DEFINE C_ADC_LatchAB			0x0018;		// Latch data to ADC by TimerA or TimerB
.endif

.if BODY_TYPE == SPCE500A
.DEFINE C_PushPull				0x0000 			// b0, (default) 
.DEFINE C_DoubleEnd				0x0001 			// b0
.DEFINE	C_DAC_Mode				0x0000 			// b1, (default)
.DEFINE C_PWM_Mode				0x0002 			// b1

.DEFINE	C_D1_Direct				0x0000 			// DAC1 latch
.DEFINE C_D1_LatchA				0x0008 			// 
.DEFINE C_D1_LatchB				0x0010 			//
.DEFINE C_D1_LatchAB			0x0018 			//

.DEFINE	C_D2_Direct				0x0000 			// DAC2 latch
.DEFINE C_D2_LatchA				0x0020 			// 
.DEFINE C_D2_LatchB				0x0040 			//
.DEFINE C_D2_LatchAB			0x00C0 			//
.endif
//----------------------------------------------

// Define for P_LVD_Ctrl
//----------------------------------------------
.if BODY_TYPE == SPCE061A
.DEFINE C_LVD24V				0x0000;		// LVD = 2.4V; b1b0 
.DEFINE C_LVD28V				0x0001;		// LVD = 2.8V
.DEFINE C_LVD32V				0x0002;		// LVD = 3.2V
.endif

.if BODY_TYPE == SPCE500A
.DEFINE C_LVD26V				0x0000 			// LVD = 2.6V 
.DEFINE C_LVD30V				0x0001 			// LVD = 3.0V
.DEFINE C_LVD36V				0x0002 			// LVD = 3.6V
.DEFINE C_LVD40V				0x0003 			// LVD = 4.0V
.endif

.DEFINE C_LVD_Result			0x8000;		// b15 = 1: below the selected LVD level
//----------------------------------------------


// SPCE061 flash operation instruction definition
//----------------------------------------------
.if BODY_TYPE == SPCE061A
.DEFINE C_EnableFlashAccess		0xAAAA;
.DEFINE C_EraseFlashPage  		0x5511;
.DEFINE C_ProgramFlash 	   		0x5533;
.endif
//----------------------------------------------



//===============================================================
// Sunplus APIs for SPCE 061A
//===============================================================
//////////////////////////////////////////////////
// Note: This register will map to the P_INT_Ctrl
//	(0x7010), The SACMvxx.lib use this register to
//	combine with user's interrupt setting.
//  In SPCE061, it is not necessary since the 
//  P_INT_Mask(0x702D) already does this. It is for 
//  compatibility to keep it here. 
//////////////////////////////////////////////////
//.EXTERNAL	R_InterruptStatus 

//========================================================================================        
// End of SPCE061A.inc
//========================================================================================


        