#include <iom128.h>
/**********************************************************************
				  ������������˵��							   	
**********************************************************************/
#define uchar unsigned char 
#define uint unsigned int

//����BIT 0-7 ��1 
#define BIT0_POS (1<<0)   
#define BIT1_POS (1<<1) 
#define BIT2_POS (1<<2) 
#define BIT3_POS (1<<3) 
#define BIT4_POS (1<<4) 
#define BIT5_POS (1<<5) 
#define BIT6_POS (1<<6) 
#define BIT7_POS (1<<7) 

//����BIT 0-7 ���� 
#define BIT0_NEG ((unsigned char)(~(1<<0))) 
#define BIT1_NEG ((unsigned char)(~(1<<1))) 
#define BIT2_NEG ((unsigned char)(~(1<<2))) 
#define BIT3_NEG ((unsigned char)(~(1<<3))) 
#define BIT4_NEG ((unsigned char)(~(1<<4))) 
#define BIT5_NEG ((unsigned char)(~(1<<5))) 
#define BIT6_NEG ((unsigned char)(~(1<<6))) 
#define BIT7_NEG ((unsigned char)(~(1<<7))) 

//�����ɫLEDϨ��������ת 
#define LED_red_OFF PORTD&=BIT0_NEG 
#define LED_red_ON   PORTD|=BIT0_POS   
#define LED_red_OTN PORTD^=BIT0_POS 

//������ɫLEDϨ��������ת 
#define LED_green_OFF PORTD&=BIT1_NEG 
#define LED_green_ON PORTD|=BIT1_POS 
#define LED_green_OTN PORTD^=BIT1_POS 


/**********************************************************************
				  MS����ʱ�������򣬲���i ��ʱʱ��								   	
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
				   ������						   	
**********************************************************************/
void main(void)
{
 DDRD=0XFF;//�˿����ã�PD������Ϊ����1���
 PORTD=0XFF;
 			while(1)//����������ִ��
			{
			    LED_red_ON;
				LED_green_ON;
				DelayMS(100);//��ʱʱ��Լ100MS
				LED_red_OFF;
				LED_green_OFF;
			 	DelayMS(100);//��ʱʱ��Լ100MS
			}
}
/**********************************************************************
				                 ����					   	
**********************************************************************/