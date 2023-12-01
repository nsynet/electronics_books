#include <iom128.h>
/**********************************************************************
				  函数数据类型说明							   	
**********************************************************************/
#define uchar unsigned char 
#define uint unsigned int

//定义BIT 0-7 置1 
#define BIT0_POS (1<<0)   
#define BIT1_POS (1<<1) 
#define BIT2_POS (1<<2) 
#define BIT3_POS (1<<3) 
#define BIT4_POS (1<<4) 
#define BIT5_POS (1<<5) 
#define BIT6_POS (1<<6) 
#define BIT7_POS (1<<7) 

//定义BIT 0-7 清零 
#define BIT0_NEG ((unsigned char)(~(1<<0))) 
#define BIT1_NEG ((unsigned char)(~(1<<1))) 
#define BIT2_NEG ((unsigned char)(~(1<<2))) 
#define BIT3_NEG ((unsigned char)(~(1<<3))) 
#define BIT4_NEG ((unsigned char)(~(1<<4))) 
#define BIT5_NEG ((unsigned char)(~(1<<5))) 
#define BIT6_NEG ((unsigned char)(~(1<<6))) 
#define BIT7_NEG ((unsigned char)(~(1<<7))) 

//定义红色LED熄灭、亮、翻转 
#define LED_red_OFF PORTD&=BIT0_NEG 
#define LED_red_ON   PORTD|=BIT0_POS   
#define LED_red_OTN PORTD^=BIT0_POS 

//定义绿色LED熄灭、亮、翻转 
#define LED_green_OFF PORTD&=BIT1_NEG 
#define LED_green_ON PORTD|=BIT1_POS 
#define LED_green_OTN PORTD^=BIT1_POS 


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
 			while(1)//程序无条件执行
			{
			    LED_red_ON;
				LED_green_ON;
				DelayMS(100);//延时时间约100MS
				LED_red_OFF;
				LED_green_OFF;
			 	DelayMS(100);//延时时间约100MS
			}
}
/**********************************************************************
				                 结束					   	
**********************************************************************/