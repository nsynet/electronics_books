//========================================================================================
// Progarm: The assembly inc file for UART on SPCE 500/061 V1.0
// Arranged by: Arthur Shieh
// Date: 	2002/09/27: first version
//
// Note: This inc file defines the ports available for user to use SPCE 500.
//       The UART setting constants is also included for users' convenience. 
//========================================================================================
//---------------------------------------------------------- 
//CPU Type definition
//---------------------------------------------------------- 

.define FoscForUart 24	       // SPCE500
//.define FoscForUart 49	       // SPCE061
// Include hardware information


//---------------------------------------------------------- 
//////////////////////////////////////////////////////////////////
// Definitions for UART Port
//////////////////////////////////////////////////////////////////
.if FoscForUart == 24 
// Baud Rate Setting for Fose at 24.576MHz
.DEFINE C_UARTBaudRate_1500_H        0x1F
.DEFINE C_UARTBaudRate_1500_L        0xFF
.DEFINE C_UARTBaudRate_2400_H        0x14
.DEFINE C_UARTBaudRate_2400_L        0x00
.DEFINE C_UARTBaudRate_4800_H        0x0A
.DEFINE C_UARTBaudRate_4800_L        0x00
.DEFINE C_UARTBaudRate_9600_H        0x05
.DEFINE C_UARTBaudRate_9600_L        0x00
.DEFINE C_UARTBaudRate_19200_H       0x02
.DEFINE C_UARTBaudRate_19200_L       0x80
.DEFINE C_UARTBaudRate_38400_H       0x01
.DEFINE C_UARTBaudRate_38400_L       0x40
.DEFINE C_UARTBaudRate_48000_H       0x01  // Default
.DEFINE C_UARTBaudRate_48000_L       0x00
.DEFINE C_UARTBaudRate_51200_H       0x00
.DEFINE C_UARTBaudRate_51200_L       0xF0
.DEFINE C_UARTBaudRate_57600_H       0x00
.DEFINE C_UARTBaudRate_57600_L       0xD5
.DEFINE C_UARTBaudRate_102400_H      0x00
.DEFINE C_UARTBaudRate_102400_L      0x78
.DEFINE C_UARTBaudRate_115200_H      0x00
.DEFINE C_UARTBaudRate_115200_L      0x6B
.endif

.if FoscForUart == 49 
// Baud Rate Setting for Fose at 49.152MHz
.DEFINE C_UARTBaudRate_1500_H        0x40
.DEFINE C_UARTBaudRate_1500_L        0x00
.DEFINE C_UARTBaudRate_2400_H        0x28
.DEFINE C_UARTBaudRate_2400_L        0x00
.DEFINE C_UARTBaudRate_4800_H        0x14
.DEFINE C_UARTBaudRate_4800_L        0x00
.DEFINE C_UARTBaudRate_9600_H        0x0A
.DEFINE C_UARTBaudRate_9600_L        0x00
.DEFINE C_UARTBaudRate_19200_H       0x05
.DEFINE C_UARTBaudRate_19200_L       0x00
.DEFINE C_UARTBaudRate_38400_H       0x02
.DEFINE C_UARTBaudRate_38400_L       0x80
.DEFINE C_UARTBaudRate_48000_H       0x02
.DEFINE C_UARTBaudRate_48000_L       0x00
.DEFINE C_UARTBaudRate_51200_H       0x01
.DEFINE C_UARTBaudRate_51200_L       0xE0
.DEFINE C_UARTBaudRate_57600_H       0x01
.DEFINE C_UARTBaudRate_57600_L       0xAA
.DEFINE C_UARTBaudRate_96000_H       0x01   // Daufault
.DEFINE C_UARTBaudRate_96000_L       0x00
.DEFINE C_UARTBaudRate_102400_H      0x00
.DEFINE C_UARTBaudRate_102400_L      0xF0
.DEFINE C_UARTBaudRate_115200_H      0x00
.DEFINE C_UARTBaudRate_115200_L      0xD5
.endif
// P_UART_Command1
// Write only
.DEFINE C_ParityEnable  0x0004
.DEFINE C_EvenParity    0x0008
.DEFINE C_InternalReset 0x0020
.DEFINE C_TxIRQEnable   0x0040
.DEFINE C_RxIRQEnable   0x0080

// P_UART_Command2 
// Read
.DEFINE C_ParityError   0x0008
.DEFINE C_OverrunError  0x0010
.DEFINE C_FrameError    0x0020
.DEFINE C_TxReady       0x0040
.DEFINE C_RxReady       0x0080
//Write 
.DEFINE C_EnableTx      0x0040
.DEFINE C_EnableRx      0x0080

