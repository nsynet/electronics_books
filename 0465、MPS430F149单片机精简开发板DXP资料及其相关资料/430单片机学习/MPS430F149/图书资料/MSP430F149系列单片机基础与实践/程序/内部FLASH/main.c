#include  <msp430x14x.h>
#define uchar unsigned char
#define uint  unsigned int
void  write_Seg (unsigned char value,unsigned int add);
unsigned char temp[128];
void int_clk()
{
    uchar i;
    BCSCTL1&=~XT2OFF;  //打开XT振荡器
    BCSCTL2|=SELM1+SELS;//MCLK 8M and SMCLK 1M  
    do
	{
        IFG1 &= ~OFIFG;                 //清除振荡错误标志 
        for(i = 0; i < 100; i++)
	  _NOP();			//延时等待
        }
    while ((IFG1 & OFIFG) != 0);	//如果标志为1继续循环等待
    IFG1&=~OFIFG;
}
delay()
{
  unsigned int i=0;
  for(i=0;i<=1000;i++)
    ;
}
void EraseFlashSegment( unsigned int add )
{
        unsigned char *ptrFlash; 
        ptrFlash=(unsigned char *)add;
	FCTL1 = FWKEY + ERASE;          // Set Erase bit
	FCTL3 = FWKEY;                  // Clear Lock bit
	*ptrFlash=0x00;
	delay();
	delay();
	FCTL3 = FWKEY + LOCK;           // Reset LOCK bit
	
}
void write_Seg (unsigned char value,unsigned int add)
{
  unsigned char *Flash_ptr;                          // Flash pointer
  Flash_ptr = (unsigned char *) add;              // Initialize Flash pointer
  FCTL3 = FWKEY;                            // Clear Lock bit
  FCTL1 = FWKEY + WRT;                      // Set WRT bit for write operation
  while(BUSY & FCTL3);
  *Flash_ptr=value;  
  FCTL1 = FWKEY;                            // Clear WRT bit
  FCTL3 = FWKEY + LOCK;                     // Set LOCK bit
}

void main(void)
{
 WDTCTL = WDTPW + WDTHOLD;                 // Stop watchdog timer
 int_clk()  ;
 FCTL2 = FWKEY + FSSEL0 + FN0;             // MCLK/2 for Flash Timing Generator                              
 EraseFlashSegment( 0x1080 );              //Erase SegmentA FLASH
 write_Seg(1,0x1080);                      //write address 0x1080 as 1
 write_Seg(2,0x1083);                      //write address 0x1083 as 2
 write_Seg(3,0x1087);                     //write address 0x1087 as 3
 while(1);
 
}

