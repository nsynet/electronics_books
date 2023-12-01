
#include "SysTickDelay.h"


#define SYSTICK_COUNTFLAG           16

static u8  fac_us=0;//us��ʱ������
static u16 fac_ms=0;//ms��ʱ������

//SYSTICK��ʱ�ӹ̶�ΪHCLKʱ�ӵ�1/8
//SYSCLK:ϵͳʱ��
void SysTick_Initaize(void)
	{                                                       
	SysTick->CTRL  &=		(~SYSTICK_CLKSOURCE);				//0xfffffffb;		//bit2���,ѡ���ⲿʱ��  HCLK/8
	
	fac_us=(SystemFrequency/1000000)/8;	 //1us�������������,����(SystemFrequency/1000000)����1US���������,8����Ҫ8��Ƶ		 
	fac_ms=(u16)fac_us*1000;           //1ms�������������
	}

//��ʱnms
//ע��nms�ķ�Χ
//SysTick->LOADΪ24λ�Ĵ���,����,�����ʱΪ:
//nms<=0xffffff*8*1000/SYSCLK
//SYSCLK��λΪHz,nms��λΪms
//��72M������,nms<=1864 
void delay_ms(u16 nms)
	{	 		  	  
	u32 temp;	
	SysTick->LOAD=(u32)nms*fac_ms;//ʱ�����(SysTick->LOADΪ24bit)
	SysTick->VAL   =  (0x00);                     /* Load the SysTick Counter Value */         //��ռ�����
	SysTick->CTRL =  (1<<SYSTICK_ENABLE); /* Enable SysTick and SysTick Timer */      //��ʼ����  
	do
		{
		temp=SysTick->CTRL;
		}
	while((temp&0x01)&&(!(temp&(1<<SYSTICK_COUNTFLAG))));//�ȴ�ʱ�䵽��   
	SysTick->CTRL	&=  (~(1<<SYSTICK_ENABLE));    //�رռ�����
	SysTick->VAL   =  (0x00);                     /* Load the SysTick Counter Value */         //��ռ�����
	}   
	
	
//��ʱnus
//nusΪҪ��ʱ��us��.		    								   
void delay_us(u32 nus)
	{		
	u32 temp;	    	 
	SysTick->LOAD=nus*fac_us; //ʱ�����	  		 
	SysTick->VAL   =  (0x00);                     /* Load the SysTick Counter Value */         //��ռ�����
	SysTick->CTRL = (1<<SYSTICK_ENABLE); 		/* Enable SysTick and SysTick Timer */  //��ʼ���� 	 
	do
		{
		temp=SysTick->CTRL;
		}
	while(temp&0x01&&!(temp&(1<<SYSTICK_COUNTFLAG)));//�ȴ�ʱ�䵽��   
	//SysTick->CTRL	&=  (~(1<<SYSTICK_ENABLE));    //�رռ�����
	SysTick->CTRL = 0x00;
	SysTick->VAL   =  (0x00);                     /* Load the SysTick Counter Value */         //��ռ�����
	}















