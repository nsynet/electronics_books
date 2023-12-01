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
	INT OFF;
	r1 = 0x0000;			//δʹ���κ��ж�
	[P_INT_Ctrl] = r1;
	r1 = 0x0480;	        //����IOB7Ϊ����IOB10Ϊ���
	[P_IOB_Attrib] = r1;
	R1 = 0x0400;
	[P_IOB_Dir] = R1;
	R1 = 0x0000;	
	[P_IOB_Data] = R1;

   	R1 = 0x006b;	     	//���ò�����Ϊ115.2Kbps
    [P_UART_BaudScalarLow] = R1;
	R1 = 0x0000;
    [P_UART_BaudScalarHigh] = R1;
	
	
	R1 = 0x0080;
	[P_UART_Command1] = R1;
	R4 = 0x00C0;		    //ʹ����������
	[P_UART_Command2] = R4;
	IRQ ON	
	RETF
	
//========================================================================================================
//����: F_UART_Write
//�﷨��void F_UART_Write(unsigned int)
//������дUART
//������ΪҪд�봮�ڵ�ֵ�����8bitΪ��Чֵ��
//���أ���
//========================================================================================================
.PUBLIC _F_UART_WriteByteData
_F_UART_WriteByteData:
	PUSH r1,r5 TO [sp]
	bp=sp+1;
	r1=[bp+7];//command value
	r4=0xFFFF;
L_Check_TxRDY:
	r3=0x0001;
	[P_Watchdog_Clear]=r3;
	r4-=1;
	JZ L_UART_Write_Timeout;
	r2 = [P_UART_Command2];
	r2 &= 0x0040;			//�������Ƿ�READY
	JZ L_Check_TxRDY;
	[P_UART_Data] = r1;//send data
L_UART_Write_Timeout:	
	POP r1,r5 FROM [SP]
	RETF;


