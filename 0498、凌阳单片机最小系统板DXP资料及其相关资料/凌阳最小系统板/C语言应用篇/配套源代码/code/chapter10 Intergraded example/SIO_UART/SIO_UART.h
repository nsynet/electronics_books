#ifndef	__SIO_UART_H__
#define	__SIO_UART_H__
//	write your header here

enum BaseType{UartOpen=0,UartClose};
enum SubStatus{Stop=0,Record,Play,Download,Upload,Receive_data,RePlay_All,RePlay};


#define		DAC1			1
#define		DAC2			2
#define		Ramp_UpDn_Off	0
#define		Ramp_Up_On		1
#define		Ramp_Dn_On		2
#define		Ramp_UpDn_On	3
#define		Auto			1
#define 	Manual 			0
#define		Full			1
#define		Empty			2
#define		RceMonitorOff	0
#define		RceMonitorOn	1

                   
// Size Definition for SPR4096
#define		C_SflashSize	0x80000-148//(144(Queue Length)+4(FFFF 00FF))

unsigned int 	Keycode; 
unsigned int 	Ret,i,Segment,internal_addr;
unsigned int	BaseType,SubStatus;
unsigned long int	Addr,Addr0,Addr1,Tem;
unsigned long int 	Buffer[21];
//	Buffer[0]-----SegFlag
//	Buffer[1]-----Seg1_Start_Addr	
//	Buffer[2]-----Seg1_Stop_Addr
//	Buffer[3]-----Seg2_Start_Addr
//	Buffer[4]-----Seg2_Stop_Addr
//	Buffer[5]-----Seg3_Start_Addr
//	Buffer[6]-----Seg3_Stop_Addr
//	---------
//	---------
//	Buffer[19]----Seg10_Start_Addr
//	Buffer[20]----Seg10_Stop_Addr


void Modify_Index(void);
void DVR_Stop(void);
void Send_QueueData_to_Sflash(void);
void Play_Initial(void);
void Fill_A_Word_To_Queue(void);
void According_to_Keycode(void);
void According_to_SubStatus(void);

extern 	SP_SIOMassErase(void);	
extern 	SP_SIOSendAWord(unsigned long int,unsigned int);
extern 	SP_SIOReadAWord(unsigned long int);
extern	SIOSendAByte(unsigned long int,unsigned int);
extern	SIOReadAByte(unsigned long int);
extern	SIOMassErase(void);

extern 	SP_PageErase(unsigned int);	
extern 	SP_WriteWord(unsigned int,unsigned long int);
extern 	SP_ReadWord(unsigned int);
extern 	EmbedFlashROM_PageErase(unsigned int);
extern 	EmbedFlashROM_WriteWord(unsigned int ,unsigned int );
extern 	EmbedFlashROM_ReadWord(unsigned int);

extern 	SP_UartSentByte(unsigned int);
extern 	SP_UartReadByte(void);
extern 	UART_Download(void);
extern 	Open_Interrupt(void);
extern 	UART_Init(void);
extern	UartSendByte(unsigned int);
extern	UartReadByte(void);

#endif
