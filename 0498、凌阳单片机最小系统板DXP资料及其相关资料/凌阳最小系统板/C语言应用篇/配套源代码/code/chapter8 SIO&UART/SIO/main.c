//03-06-03
//�ȶ�SPR4096����Mass Erase��Ȼ����0x5678��Ԫд��һ������0x55AA
#define		C_SIOCLOCK    0x0010; 									// CPUCLOCK/8
#include	"SPCE061V004.H"
main()
{
	long int i;	
	unsigned long int ulAddr;
	unsigned int uiData;

	//��ʼ��SIO��
	*P_IOB_Dir = 0xFFFF;
	*P_IOB_Attrib = 0xFFFF;
    *P_IOB_Data = 0x0003;  
    *P_SIO_Ctrl = 0x00C3;

	// ��SPR4096����Mass Erase
	*P_SIO_Ctrl=0x00C0+C_SIOCLOCK;  // clk=	CPUclk/8, 16λ��ַ
	*P_SIO_Addr_Low=0x0000; 		// SFLASH��ַ
	*P_SIO_Addr_Mid=0x00C0; 		
	*P_SIO_Addr_High=0x00C0; 		
	*P_SIO_Start=1;           		// ����дģʽ
	*P_SIO_Data=0;            		// A7~A0 = 0
	// �ȴ�SIO����
    i=*P_SIO_Start;
	i&=0x0080;
	while(i)
	{
	    i=*P_SIO_Start;
		i&=0x0080;
	}
 	*P_SIO_Stop=1;     				
 	i=0x7ff;						// ��ʱ
	while(i--);


	// ��0x5678��Ԫд��һ������0x55AA
	ulAddr=0x5678;
    *P_SIO_Addr_Low=ulAddr; 			// SFLASH��ַ
    ulAddr>>=8;  						
    *P_SIO_Addr_Mid=ulAddr; 			
    ulAddr>>=8;  						
    ulAddr&=0x0007;  					
    *P_SIO_Addr_High=ulAddr;
    *P_SIO_Ctrl=0x00C3+C_SIOCLOCK;  // clk=CPUclk/8, 24 λ��ַ 
    *P_SIO_Start=1;       			// ����дģʽ
 	i=0x2ff;						// ��ʱ
	while(i--);
	uiData=0x55AA;
    *P_SIO_Data=uiData; 				// ��SIO������0x55AA
	// �ȴ�SIO����	
    i=*P_SIO_Start;
	i&=0x0080;
	while(i)
	{
	    i=*P_SIO_Start;
		i&=0x0080;
	}			
	*P_SIO_Stop=1;     				
}