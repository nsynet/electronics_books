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

	//INT OFF;
	//r1 = 0x0000;				//δʹ���κ��ж�
	//[P_INT_Ctrl] = r1;
    r1=[P_IOB_Attrib]
    r1|=0x0480  				//����IOB7Ϊ����IOB10Ϊ���
	[P_IOB_Attrib] = r1;
	
	r1=[P_IOB_Dir]
	r1|=0x0400;
	r1&=0xFF7F;
	[P_IOB_Dir] = R1;
	
	r1=	[P_IOB_Buffer]
	r1&=0xFB7F;
	[P_IOB_Buffer] = R1;

   	R1 = 0x006b;	     		//���ò�����Ϊ115.2Kbps
    [P_UART_BaudScalarLow] = R1;
	R1 = 0x0000;
    [P_UART_BaudScalarHigh] = R1;
	
	
	R1 = 0x0000;
	R4 = 0x00C0;		    	//ʹ����������
	[P_UART_Command1] = R1;
	[P_UART_Command2] = R4;
	
	retf

//========================================================================================================
//����: F_UART_Read
//�﷨��unsigned int F_UART_Read(void)
//��������UART
//��������
//���أ�r1,����ֵ��8bitΪ��Чֵ
//========================================================================================================
.public _F_UART_ReadByte
_F_UART_ReadByte:
	PUSH r2,r5 TO [sp];
	r4=0x00FF;
	r3=0xFFFF;
L_Check_RxRDY:
	r3-=1;
	JNZ L_TestUART;
	r4-=1;
	JZ L_UART_Read_Timeout;
L_TestUART:
	r2 = [P_UART_Command2]; 	//����Ƿ������ݽ���
	r2 &= 0x0080;
	JZ L_Check_RxRDY;	

	r1 = [P_UART_Data];			//��������

	POP r2,r5 FROM [sp]	
	retf;

L_UART_Read_Timeout:
	r1=0xffff;
	POP r2,r5 FROM [sp]	
	retf;

//========================================================================================================
//����: F_UART_SendCommand
//�﷨��void F_UART_SendCommand(unsigned int)
//������дUART
//������ΪҪд�봮�ڵ�ֵ�����8bitΪ��Чֵ��
//���أ���
//========================================================================================================
.PUBLIC _F_UART_SendCommand
_F_UART_SendCommand:
	PUSH r1,r5 TO [sp]
	bp=sp+1;
	r1=[bp+7];					//����ֵ
	
L_Check_TxRDY:
	R2 = [P_UART_Command2];
	R2 &= 0x0040;				//�������Ƿ�READY
	JZ L_Check_TxRDY;
	[P_UART_Data] = r1;			//
	
	POP r1,r5 FROM [SP]
	RETF;

