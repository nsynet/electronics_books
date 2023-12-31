#include <iom8v.h>
#include <macros.h> 
/**********************************************************************
				  函数数据类型说明							   	
**********************************************************************/
#define uchar unsigned char 
#define uint unsigned int
uchar KEY_PC0;
uchar KEY_PC1;
uchar KEY_PC2;
uchar KEY_PC3;
uchar KEY_PB0;
uchar KEY_PB1;
uchar KEY_PB2;
uchar KEY_PB3;
//定义BIT 0-7 置1 
#define BIT0_POS (1<<0)   
#define BIT1_POS (1<<1) 
#define BIT2_POS (1<<2) 
#define BIT3_POS (1<<3) 
//定义BIT 0-7 清零 
#define BIT0_NEG ((unsigned char)(~(1<<0))) 
#define BIT1_NEG ((unsigned char)(~(1<<1))) 
#define BIT2_NEG ((unsigned char)(~(1<<2))) 
#define BIT3_NEG ((unsigned char)(~(1<<3))) 

//定义继电器闭合、断开、翻转 
#define PB0_OFF PORTB&=BIT0_NEG 
#define PB0_ON  PORTB|=BIT0_POS   
#define PB0_OTN PORTB^=BIT0_POS 
//定义继电器闭合、断开、翻转 
#define PB1_OFF PORTB&=BIT1_NEG 
#define PB1_ON  PORTB|=BIT1_POS   
#define PB1_OTN PORTB^=BIT1_POS 
//定义继电器闭合、断开、翻转 
#define PB2_OFF PORTB&=BIT2_NEG 
#define PB2_ON  PORTB|=BIT2_POS   
#define PB2_OTN PORTB^=BIT2_POS 
//定义继电器闭合、断开、翻转 
#define PB3_OFF PORTB&=BIT3_NEG 
#define PB3_ON  PORTB|=BIT3_POS   
#define PB3_OTN PORTB^=BIT3_POS 

//定义继电器闭合、断开、翻转 
#define PC0_OFF PORTC&=BIT0_NEG 
#define PC0_ON  PORTC|=BIT0_POS   
#define PC0_OTN PORTC^=BIT0_POS 
//定义继电器闭合、断开、翻转 
#define PC1_OFF PORTC&=BIT1_NEG 
#define PC1_ON  PORTC|=BIT1_POS   
#define PC1_OTN PORTC^=BIT1_POS 
//定义继电器闭合、断开、翻转 
#define PC2_OFF PORTC&=BIT2_NEG 
#define PC2_ON  PORTC|=BIT2_POS   
#define PC2_OTN PORTC^=BIT2_POS 
//定义继电器闭合、断开、翻转 
#define PC3_OFF PORTC&=BIT3_NEG 
#define PC3_ON  PORTC|=BIT3_POS   
#define PC3_OTN PORTC^=BIT3_POS 

/**********************************************************************
				  MS级延时函数程序，参数i 延时时间								   	
**********************************************************************/
void DelayMS(uint i)
{
uint j;
for(;i!=0;i--)
{
for(j=1000;j!=0;j--);
}
}
/**********************************************************************
								看门狗初始化					   	
**********************************************************************/
void WDT_init(void)
{
 WDR();//WDT 复位 
 WDTCR = 0x0F;//使能看门狗
}
/**********************************************************************/
void init_eatdog(void)
{
 CLI(); //禁止所有中断
 WDT_init();
 SEI();//开全局中断
}

/**********************************************************************
								看门狗关闭(喂狗)				   	
**********************************************************************/
void WDT_off(void)
{
 WDR();//WDT 复位
 WDTCR |= (1<<WDTOE) | (1<<WDE); //置位 WDTOE 和 WDE
 WDTCR = 0x00;//关闭WDT 
}
/**********************************************************************
				          按键扫描函数		   	
**********************************************************************/

void get_key(void)//按键扫描函数

{
while((PIND&0X01)==0)//按下PD0,PC0闭合
{KEY_PC0=1;}
while((PIND&0X02)==0)//按下PD1,PC1闭合
{KEY_PC1=1;}
while((PIND&0X04)==0)//按下PD2,PC2闭合
{KEY_PC2=1;}
while((PIND&0X08)==0)//按下PD3,PC3闭合
{KEY_PC3=1;}
while((PIND&0X10)==0)//按下PD4,PB0闭合
{KEY_PB0=1;}
while((PIND&0X20)==0)//按下PD5,PB1闭合
{KEY_PB1=1;}
while((PIND&0X40)==0)//按下PD6,PB2闭合
{KEY_PB2=1;}
while((PIND&0X80)==0)//按下PD7,PB3闭合
{KEY_PB3=1;}
}
/**********************************************************************
				   初始化					   	
**********************************************************************/
void Init_IO(void)//初始化I/O
{
//设置B口为输出
DDRB=0x3F;
PORTB=0x3F;
//设置C口为输出
DDRC=0xFF;
PORTC=0xFF;
//设置D口为输入
DDRD=0X00;
PORTD=0x00;
}

/**********************************************************************
				  主函数				   	
**********************************************************************/
void main(void)
{
Init_IO();  //初始化I/O
while(1)
{
get_key();
if(KEY_PC0==1){PC0_OTN;DelayMS(3);KEY_PC0=0;}
if(KEY_PC1==1){PC1_OTN;DelayMS(3);KEY_PC1=0;}
if(KEY_PC2==1){PC2_OTN;DelayMS(3);KEY_PC2=0;}
if(KEY_PC3==1){PC3_OTN;DelayMS(3);KEY_PC3=0;}
if(KEY_PB0==1){PB0_OTN;DelayMS(3);KEY_PB0=0;}
if(KEY_PB1==1){PB1_OTN;DelayMS(3);KEY_PB1=0;}
if(KEY_PB2==1){PB2_OTN;DelayMS(3);KEY_PB2=0;}
if(KEY_PB3==1){PB3_OTN;DelayMS(3);KEY_PB3=0;}
}
}
