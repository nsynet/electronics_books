//2003-06-03
//��UART������PC����RS232���нӿڵ����ݡ�������յ�ֵΪ79����д���ַ�"O"����ACSII�룬�͵�����
//IOA0��IOA7������LED��������յ�ֵΪ67����д���ַ�"C"����ACSII�룬��Ϩ���IOA0��IOA7������LED��
#include	"SPCE061V004.H"
main()
{
	unsigned int uiData,Ret;
	*P_IOA_Dir=0xffff;						//IOA0~IOA7��ʼ��Ϊ���
	*P_IOA_Attrib=0xffff;
	*P_IOA_Data=0xffff;

	*P_UART_Command1=0x20;					//Uart�ڲ���λ
	*P_UART_Command1=0x00;
	
	*P_UART_BaudScalarHigh=0x00;			//����������Ϊ115200bps
	*P_UART_BaudScalarLow=0x6B;

	*P_UART_Command1=0x000C;				//�������
	*P_UART_Command2=0x00C0;
		
	Ret=*P_UART_Data;						// ����ջ�����

	while(1)	
	{
		Ret=*P_UART_Command2;
		Ret=Ret&0x0080;
		while(Ret==0)						//�ȴ��������
		{
			Ret=*P_UART_Command2;
			Ret=Ret&0x0080;
			*P_Watchdog_Clear=C_WDTCLR;
		}
		uiData=*P_UART_Data;				//�������յ�����
		if(uiData==79)
			*P_IOA_Data=0x0000;				//����LED
		else if(uiData==67)
			*P_IOA_Data=0xffff;				//Ϩ��LED
	}
}



