#include <iom8v.h>
/********************************************************************
                数据类型定义
*********************************************************************/
#define uchar unsigned char 
#define uint unsigned int
/********************************************************************
                数码管段码定义0123456789ABCDEF
*********************************************************************/
uchar Table[16]={0xc0,0Xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0X88,0x83,0xC6,0xA1,0x86,0x8E};	 //所需的段的位码
/**********************************************************************
				  MS级延时函数程序，参数i 延时时间								   	
**********************************************************************/
void DelayMS(uint i)
{
uint j;
for(;i!=0;i--)
{
for(j=8000;j!=0;j--);
}
}
//////////////////////////////初始化////////////////////////////////////
void Init_IO(void)//初始化I/O
{
//设置B口为输出
DDRB=0xFF;
PORTB=0xFF;
//设置C口为输出
DDRC=0xFF;
PORTC=0xFF;
}
/**********************************************************************
				           主函数						   	
**********************************************************************/
void main(void)
{
Init_IO();  //初始化I/O

while(1)
{
PORTB=Table[0];//显示0；
PORTC=0x0F;
DelayMS(100);
PORTB=Table[1];//显示1；
PORTC=0x0F;
DelayMS(100);
PORTB=Table[2];//显示2；
PORTC=0x0F;
DelayMS(100);
PORTB=Table[3];//显示3；
PORTC=0x0F;
DelayMS(100);
PORTB=Table[4];//显示4；
PORTC=0x0F;
DelayMS(100);
PORTB=Table[5];//显示5；
PORTC=0x0F;
DelayMS(100);
PORTB=Table[6];//显示6；
PORTC=0x0F;
DelayMS(100);
PORTB=Table[7];//显示7；
PORTC=0x0F;
DelayMS(100);
PORTB=Table[8];//显示8；
PORTC=0x0F;
DelayMS(100);
PORTB=Table[9];//显示9；
PORTC=0x0F;
DelayMS(100);
PORTB=Table[10];//显示A；
PORTC=0x0F;
DelayMS(100);
PORTB=Table[11];//显示b；
PORTC=0x0F;
DelayMS(100);
PORTB=Table[12];//显示C；
PORTC=0x0F;
DelayMS(100);
PORTB=Table[13];//显示d；
PORTC=0x0F;
DelayMS(100);
PORTB=Table[14];//显示E；
PORTC=0x0F;
DelayMS(100);
PORTB=Table[15];//显示F；
PORTC=0x0F;
DelayMS(100);
}
}

/**********************************************************************
		                   结束						   	
**********************************************************************/