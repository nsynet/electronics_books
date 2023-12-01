//03-06-03
//先对SPR4096进行Mass Erase，然后往0x5678单元写入一个数据0x55AA
#define		C_SIOCLOCK    0x0010; 									// CPUCLOCK/8
#include	"SPCE061V004.H"
main()
{
	long int i;	
	unsigned long int ulAddr;
	unsigned int uiData;

	//初始化SIO口
	*P_IOB_Dir = 0xFFFF;
	*P_IOB_Attrib = 0xFFFF;
    *P_IOB_Data = 0x0003;  
    *P_SIO_Ctrl = 0x00C3;

	// 对SPR4096进行Mass Erase
	*P_SIO_Ctrl=0x00C0+C_SIOCLOCK;  // clk=	CPUclk/8, 16位地址
	*P_SIO_Addr_Low=0x0000; 		// SFLASH地址
	*P_SIO_Addr_Mid=0x00C0; 		
	*P_SIO_Addr_High=0x00C0; 		
	*P_SIO_Start=1;           		// 启动写模式
	*P_SIO_Data=0;            		// A7~A0 = 0
	// 等待SIO空闲
    i=*P_SIO_Start;
	i&=0x0080;
	while(i)
	{
	    i=*P_SIO_Start;
		i&=0x0080;
	}
 	*P_SIO_Stop=1;     				
 	i=0x7ff;						// 延时
	while(i--);


	// 往0x5678单元写入一个数据0x55AA
	ulAddr=0x5678;
    *P_SIO_Addr_Low=ulAddr; 			// SFLASH地址
    ulAddr>>=8;  						
    *P_SIO_Addr_Mid=ulAddr; 			
    ulAddr>>=8;  						
    ulAddr&=0x0007;  					
    *P_SIO_Addr_High=ulAddr;
    *P_SIO_Ctrl=0x00C3+C_SIOCLOCK;  // clk=CPUclk/8, 24 位地址 
    *P_SIO_Start=1;       			// 启动写模式
 	i=0x2ff;						// 延时
	while(i--);
	uiData=0x55AA;
    *P_SIO_Data=uiData; 				// 往SIO送数据0x55AA
	// 等待SIO空闲	
    i=*P_SIO_Start;
	i&=0x0080;
	while(i)
	{
	    i=*P_SIO_Start;
		i&=0x0080;
	}			
	*P_SIO_Stop=1;     				
}