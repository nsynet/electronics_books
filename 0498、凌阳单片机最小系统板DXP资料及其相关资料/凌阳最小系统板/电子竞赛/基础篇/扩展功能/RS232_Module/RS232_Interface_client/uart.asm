//========================================================================================================//
// �������ƣ�uart.asm
// ����������ʵ��RS232ͨѶ��UART��ʼ����UART�Ķ�д
// ��    �ڣ�2003/7/7
//========================================================================================================//
.include hardware.inc
.CODE

//========================================================================================================
//����: F_UART_Initial
//�﷨��void F_UART_Initial()
//��������ʼ��UART
//��������
//���أ���
//========================================================================================================

.PUBLIC _F_UART_Initial;
_F_UART_Initial:		
	PUSH r1 TO [sp];	
 	r1=[P_IOB_Dir]					//����IOB7Ϊ�������룬IOB10Ϊͬ��͵�ƽ���
	r1|=0x0400;
	r1&=0xFF7F;
	[P_IOB_Dir] = r1;
    r1=[P_IOB_Attrib]
    r1|=0x0480  					
	[P_IOB_Attrib] = r1;
	r1=	[P_IOB_Buffer]
	r1&=0xFB7F;
	[P_IOB_Buffer] = r1;

   	r1 = 0x006b;	     			//���ò�����Ϊ115.2Kbps
    [P_UART_BaudScalarLow] = r1;
	r1 = 0x0000;
    [P_UART_BaudScalarHigh] = r1;
	
	r1 = 0x0000;
	[P_UART_Command1] = r1;
	r1 = 0x00C0;		    		//ʹ����������
	[P_UART_Command2] = r1;
	POP r1 FROM [sp];	
	RETF;

//========================================================================================================
//����: F_UART_Read
//�﷨��unsigned int F_UART_Read(void)
//��������UART
//��������
//���أ�r1,����ֵ��8bitΪ��Чֵ
//========================================================================================================

.public _F_UART_Read
_F_UART_Read:
	PUSH r2,r5 TO [sp];
	r4=0x00F;
	r3=0x00FF;
L_Check_RxRDY:
	r3-=1;
	r2=0x0001;
	[P_Watchdog_Clear]=r2;
	JNZ L_TestUART;
	r4-=1;
	JZ L_UART_Read_Timeout;
L_TestUART:
	r2 = [P_UART_Command2]; //����Ƿ������ݽ���
	r2 &= 0x0080;
	JZ L_Check_RxRDY;	
	r1 = [P_UART_Data];		//��������
	POP r2,r5 FROM [sp];
	retf;
L_UART_Read_Timeout:
	r1=0x0000;
	POP r2,r5 FROM [sp];
	RETF;
	
//========================================================================================================
//����: F_UART_Write
//�﷨��void F_UART_Write(unsigned int)
//������дUART
//������ΪҪд�봮�ڵ�ֵ�����8bitΪ��Чֵ��
//���أ���
//========================================================================================================
.PUBLIC _F_UART_Write
_F_UART_Write:
	PUSH r1,r5 TO [sp]
	bp=sp+1;
	r1=[bp+7];				//����
L_Check_TxRDY:
	r2=0x0001;
	[P_Watchdog_Clear]=r2;
	r2 = [P_UART_Command2];
	r2 &= 0x0040;			//�������Ƿ�READY
	JZ L_Check_TxRDY;
	[P_UART_Data] = r1;
	POP r1,r5 FROM [sp]
	RETF;

