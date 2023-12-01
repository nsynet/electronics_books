//==========================================================
//�ļ�����:TNDriverUser.c
//��������:���������ݵ��û�����
//ά����¼ 2005.12.2 v1.0
//==========================================================

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
#define P_UART_Command1			(volatile unsigned int *)0x7021 	
#define P_UART_Command2			(volatile unsigned int *)0x7022 	
#define P_UART_Data				(volatile unsigned int *)0x7023  	
#define	P_UART_BaudScalarLow	(volatile unsigned int *)0x7024	
#define	P_UART_BaudScalarHigh	(volatile unsigned int *)0x7025 
#define P_SystemClock			(volatile unsigned int *)0x7013 

extern unsigned int TN_Data_Buff[3];
extern void TN_IRACK_EN(void);
extern int TN_ReadData(void);
extern void TN_IRACK_UN(void);

extern float iTemp;

void Delay(unsigned int timers);
//======================================================================//
//Program:TN���⴫����Ŀ�����ݲ����ӳ���
//InPut:NULL
//OutPut:unsigned int returnData	��������ĳ����ʶ
//Note:
//Edit by xinqiang 20050324
//======================================================================//
unsigned int TN_IR_GetData(unsigned int Item)
{
	unsigned int iItem,MSB,LSB;
	unsigned int Back_Data;                          //���巵�ر���,����0��ʾ������ȷ����
	Back_Data = 0xaaaa;

	TN_IRACK_EN();				                     //enable the TN	
	*P_Watchdog_Clear = 0x0001;
	TN_ReadData();
	iItem = (TN_Data_Buff[0]&0x00ff);                //ȡ������һ���ֽ�����
	if(Item == iItem)                                //�жϵ�һ���ֽ������Ƿ���ȷ
	{
		MSB = (TN_Data_Buff[1])&0xff00;              //ȡ�����ڶ����ֽ�����
		LSB = (TN_Data_Buff[1])&0x00ff;              //ȡ�����������ֽ�����
		if(((TN_Data_Buff[2])&0x00ff) == 0x000d)     //�ж��Ƿ����������־
		{
			iTemp = MSB | LSB;                       //�����¶�ֵ�����㷽����ο��������ģ��
			iTemp = iTemp/16 - 273.15;
			Back_Data = 0;		                     //���ر�����0
		}
	}
	Delay(6);                                        //��ʱ
//	__asm("nop");
	TN_IRACK_UN();				                     //Unable the TN
	__asm("IRQ on");                                 //��IRQ�ж�,��FIQ�ж�
	return Back_Data;                                //����Back_Data
}

//======================================================================//
//Program:������ʱ����
//InPut:unsigned int timers		Ҫ��ʱ�ĺ�����
//OutPut:NULL
//Note:CPUClk 49MHz
//Edit by xinqiang 20050324
//======================================================================//
void Delay(unsigned int timers)
{
	unsigned int i,j;
	for(i=0;i<timers;i++)
		for(j=0;j<0x020f;j++)
			*P_Watchdog_Clear = 0x0001;
}
