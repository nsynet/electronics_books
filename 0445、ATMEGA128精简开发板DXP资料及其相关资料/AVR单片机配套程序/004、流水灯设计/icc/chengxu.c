#include <iom128.h>
/**********************************************************************
				  函数数据类型说明							   	
**********************************************************************/
#define uchar unsigned char 
#define uint unsigned int
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
/**********************************************************************
				   主函数						   	
**********************************************************************/
void main(void)
{
DDRD=0XFF;//端口设置，PD口设置为推挽1输出
PORTD=0XFF;
PORTD=0XFF;//PORTD初始化为1,灭掉所有的LED

 while(1)
{//***IO口输出低电平有效，如：0X01为十六进制数，二进制表示为00000001B，再取反
    ////////A口输出//////
	PORTD=~0X01; //  ～表示取反 
    DelayMS(100);//延时100MS
	PORTD=~0X02; //  ～表示取反 
    DelayMS(100);//延时100MS
	PORTD=~0X04; //  ～表示取反 
    DelayMS(100);//延时100MS
	PORTD=~0X08; //  ～表示取反 
    DelayMS(100);//延时100MS
	PORTD=~0X10; //  ～表示取反 
    DelayMS(100);//延时100MS
	PORTD=~0X20; //  ～表示取反 
    DelayMS(100);//延时100MS
	PORTD=~0X40; //  ～表示取反 
    DelayMS(100);//延时100MS
	PORTD=~0X80; //  ～表示取反 
    DelayMS(100);//延时100MS
    }
}
/**********************************************************************
				                 结束					   	
**********************************************************************/
