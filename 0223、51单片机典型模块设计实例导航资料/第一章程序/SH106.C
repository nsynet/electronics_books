# include <reg51.h>
void main(void)
{ 	
unsigned char astring;
/*在11.0592MHz晶振下，设置串行口9600数据传输率，方式3*/
	TMOD=0x20; 
	TL1=0xfd;TH1=0xfd; 
SCON=0xd8;PCON=0x00; 		/*串口接收字符RI置位，允许串口接收*/	
	TR1=1;
	while(1)
	{	
while(RI==0);
		RI=0;  				/*串口接收标志位的软件清零*/
		astring=SBUF;
	}
} 

