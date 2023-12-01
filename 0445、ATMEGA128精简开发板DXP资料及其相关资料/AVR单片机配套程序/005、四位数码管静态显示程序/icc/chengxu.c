#include <iom128.h>
/********************************************************************
                数据类型定义
*********************************************************************/
#define uchar unsigned char 
#define uint unsigned int
/********************************************************************
                数码管段码定义0123456789ABCDEF
*********************************************************************/
uchar Table[16]={0xc0,0Xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0X08,0x03,0xC6,0xA1,0x06,0x0E};	 //所需的段的位码
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
//设置D口为输出
DDRD=0xFF;
PORTD=0xFF;
//设置E口为输出
DDRE=0xFF;
PORTE=0xFF;
}
/**********************************************************************
				           主函数						   	
**********************************************************************/
void main(void)
{
Init_IO();  //初始化I/O

while(1)
{
PORTD=Table[0];//显示0；
PORTE=0x0F;
DelayMS(100);
PORTD=Table[1];//显示1；
PORTE=0x0F;
DelayMS(100);
PORTD=Table[2];//显示2；
PORTE=0x0F;
DelayMS(100);
PORTD=Table[3];//显示3；
PORTE=0x0F;
DelayMS(100);
PORTD=Table[4];//显示4；
PORTE=0x0F;
DelayMS(100);
PORTD=Table[5];//显示5；
PORTE=0x0F;
DelayMS(100);
PORTD=Table[6];//显示6；
PORTE=0x0F;
DelayMS(100);
PORTD=Table[7];//显示7；
PORTE=0x0F;
DelayMS(100);
PORTD=Table[8];//显示8；
PORTE=0x0F;
DelayMS(100);
PORTD=Table[9];//显示9；
PORTE=0x0F;
DelayMS(100);
PORTD=Table[10];//显示A；
PORTE=0x0F;
DelayMS(100);
PORTD=Table[11];//显示b；
PORTE=0x0F;
DelayMS(100);
PORTD=Table[12];//显示C；
PORTE=0x0F;
DelayMS(100);
PORTD=Table[13];//显示d；
PORTE=0x0F;
DelayMS(100);
PORTD=Table[14];//显示E；
PORTE=0x0F;
DelayMS(100);
PORTD=Table[15];//显示F；
PORTE=0x0F;
DelayMS(100);
}
}

/**********************************************************************
		                   结束						   	
**********************************************************************/