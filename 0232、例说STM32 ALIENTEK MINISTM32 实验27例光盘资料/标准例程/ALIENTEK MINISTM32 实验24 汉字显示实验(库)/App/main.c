/**********************************************
File Name: ALIENTEK MINISTM32 ʵ��24 ������ʾʵ��(��)
Revision:
Corporation:
Microcontroller Corporation:ST
Microcontroller name:STM32F103RBT6 ARM
Compiler: Keil MDK_ARM 4.11
Author: moweidong
E-mail: moweidongsabbit@21cn.com
Date : 2010.12.05
*********************************************/
//���������豸:
//ALIENTEK_MiniSTM32_REVB0������
//JLINK V7
/*********************************************
//��
//CMSIS:V1.20
//STM32F10x_StdPeriph_Driver:V3.1.1
*********************************************/

//������ʹ����printf������LCD�ʹ�����ʾ����,��Щ��Option for Target���������¸���
//Targetѡ��ҳ:����Use MicroLIB(ʹ��΢��)

//LED0:PA8
//LED1:PD2

//ע��:FLASH.H�е�#define FLASHE_WRITE_EN  //����д����Ҫʹ��

//ע��:�ڽ���JTAG�Ӻ��������ָ�:
//1.����KEILΪJTAG��SW����ģʽ
//2.�����ϵ�,���°��ϵĸ�λ��������,���KEIL�µ�FLASH���ذ�ť,ʹJTAG��SW���ع��߼����ɽӿں����̷ſ�,
//��Ŀ��������ȡIC���ϵ��ʱ���п���Ȩ,ʹ��δ�������JTAG��SW��Ч��ʱ��ȡ�ɿ���IC������¼


//ʹ��JLINK  JTAG��ʽ���س�������JLINK����

#include "stm32f10x.h"
#include "LCD.h"
//#include "USART.h"
#include "eval.h"
#include "SysTickDelay.h"
#include "UART_INTERFACE.h"
#include "flash.h"
#include "mmc_sd.h"
#include "text.h"
#include "fat.h"
#include "fontupd.h"
#include <stdio.h>




/* Private typedef -----------------------------------------------------------*/
typedef enum { FAILED = 0, PASSED = !FAILED} TestStatus;

/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
#define countof(a)   (sizeof(a) / sizeof(*(a)))

/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
void RCC_Configuration(void);
void GPIO_Configuration(void);
void NVIC_Configuration(void);


		  

void GPIO_Configuration(void)
	{
	//GPIO_InitTypeDef GPIO_InitStructure;
				
	/* Configure USART1 Tx (PA.09) as alternate function push-pull */
	//GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;
	//GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
	//GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	//GPIO_Init(GPIOA, &GPIO_InitStructure);
	
	/* Configure USART1 Rx (PA.10) as input floating */
	//GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;
	//GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
	//GPIO_Init(GPIOA, &GPIO_InitStructure);#ifdef USE_STM3210C_EVAL

	/* Initialize LEDs and Key Button mounted on STM3210X-EVAL board */       
	STM_EVAL_LEDInit(LED1);
	STM_EVAL_LEDInit(LED2);
	}

//ϵͳ�жϹ���
void NVIC_Configuration(void)
	{ 
	//NVIC_InitTypeDef NVIC_InitStructure;

	/* Configure the NVIC Preemption Priority Bits */  
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_0);	//�������ȼ����飺��ռ���ȼ�0λ,�����ȼ�4λ
	
	//�����������λ�ú�ƫ��
	#ifdef  VECT_TAB_RAM  
		/* Set the Vector Table base location at 0x20000000 */ 
		NVIC_SetVectorTable(NVIC_VectTab_RAM, 0x0); 		//������λ��RAM
	#else  /* VECT_TAB_FLASH  */
		/* Set the Vector Table base location at 0x08000000 */ 
		NVIC_SetVectorTable(NVIC_VectTab_FLASH, 0x0);   //������λ��FLASH
	#endif
	}

//����ϵͳʱ��,ʹ�ܸ�����ʱ��
void RCC_Configuration(void)
	{
	SystemInit();	
	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1 | RCC_APB2Periph_GPIOA 
	//	|RCC_APB2Periph_GPIOB | RCC_APB2Periph_GPIOC
	//	|RCC_APB2Periph_GPIOD | RCC_APB2Periph_GPIOE
	//	|RCC_APB2Periph_ADC1  | RCC_APB2Periph_AFIO 
	//	|RCC_APB2Periph_SPI1, ENABLE );
	// RCC_APB2PeriphClockCmd(RCC_APB2Periph_ALL ,ENABLE );
	//RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM4 
	//	|RCC_APB1Periph_USART3|RCC_APB1Periph_TIM2	                           
	//	, ENABLE );
	}
	




//������������
void Init_All_Periph(void)
	{
	
	RCC_Configuration();	
	
	NVIC_Configuration();

	GPIO_Configuration();
	
	//USART1_Configuration();
	USART_Configuration(9600);
	
	LCD_Init();			//��ʼ��Һ��
	}









void Delay(vu32 nCount)
	{
	for(; nCount != 0; nCount--);
	}

/**
  * @brief  Inserts a delay time.
  * @param  nTime: specifies the delay time length, in milliseconds.
  * @retval None
  */
//void Delay(__IO uint32_t nCount)
//	{
//	for(; nCount != 0; nCount--);
//	}

//���ذ���ֵ
//0��û���κΰ�������
//1��KEY0����
//2��KEY1����
//3��KEY2���� WK_UP
//ע��˺�������Ӧ���ȼ�,KEY0>KEY1>KEY2!!
u8 KEY_Scan(void)
	{	 
	static u8 key_up=1;//�������ɿ���־	
	//JTAG_Set(JTAG_SWD_DISABLE);
	if(key_up&&((STM_EVAL_PBGetState(Button_KEY0) == 0x00)||(STM_EVAL_PBGetState(Button_KEY1) == 0x00)||(STM_EVAL_PBGetState(Button_WAKEUP) == 0x01)))
		{
		delay_ms(10);//ȥ���� 
		key_up=0;
		if (STM_EVAL_PBGetState(Button_KEY0) == 0x00)		//��������:�͵�ƽ��Ч
			{
			//JTAG_Set(SWD_ENABLE);
			return 1;
			}
		if (STM_EVAL_PBGetState(Button_KEY1) == 0x00)		//��������:�͵�ƽ��Ч
			{
			//JTAG_Set(SWD_ENABLE);
			return 2;
			}
		if (STM_EVAL_PBGetState(Button_WAKEUP) == 0x01)		//��������:�ߵ�ƽ��Ч
			{
			//JTAG_Set(SWD_ENABLE);
			return 3;
			}
		}
		else if((STM_EVAL_PBGetState(Button_KEY0) == 0x01)&&(STM_EVAL_PBGetState(Button_KEY1) == 0x01)&&(STM_EVAL_PBGetState(Button_WAKEUP) == 0x00)) key_up=1; 	    
	//JTAG_Set(SWD_ENABLE);
	return 0;// �ް�������
	}

int main(void)
	{
	u32 fontcnt;		  
	u8 i,j;
	u8 fontx[2];//gbk��
	u8 key,t;	  
	Init_All_Periph();
	SysTick_Initaize();
	STM_EVAL_PBInit(Button_KEY0, Mode_GPIO);			//���ð���GPIO����
	STM_EVAL_PBInit(Button_KEY1, Mode_GPIO);			//���ð���GPIO����
	STM_EVAL_PBInit(Button_WAKEUP, Mode_GPIO);			//���ð���GPIO����
	STM_EVAL_LEDOff(LED1);
	STM_EVAL_LEDOff(LED2);
	
	SPI_Flash_Init();	//SPI FLASH��ʼ�� 
			 
	if(Font_Init())//�ֿⲻ����,������ֿ�
		{	
		UPD:
		POINT_COLOR=RED;      
		LCD_Clear(WHITE);
		LCD_ShowString(60,50,"Mini STM32");	
		LCD_ShowString(60,70,"Font Updating..."); 	 	 
		//������� 
		SD_Init();		 //��ʼ��SD��   	 	 			   
		while(FAT_Init())//FAT ����
			{
			LCD_ShowString(60,90,"FAT SYS ERROR");  
			i= SD_Init();
			if(i)//SD����ʼ�� 
				{						  
				LCD_ShowString(60,110,"SD_CARD ERROR");
				}	  
			delay_ms(500);
			LCD_Fill(60,90,240,126,WHITE);//�����ʾ			  
			delay_ms(500);
			STM_EVAL_LEDToggle(LED1); 
			}	 
		LCD_Fill(60,90,240,126,WHITE);//�����ʾ			  
		while(Update_Font()!=0)//������³���
			{						  
			LCD_ShowString(60,90,"SYSTEM FILE LOST");		  
			delay_ms(500);    
			LCD_ShowString(60,90,"Please Check....");
			delay_ms(500);    
			STM_EVAL_LEDToggle(LED1);
			};			 
		LCD_Clear(WHITE);
		}  
	POINT_COLOR=RED;      
	Show_Str(60,50,"Mini STM32������",16,0);				    	 
	Show_Str(60,70,"GBK�ֿ���Գ���",16,0);				    	 
	Show_Str(60,90,"����ԭ��@ALIENTEK",16,0);				    	 
	Show_Str(60,110,"2010��6��17��",16,0);
	Show_Str(60,130,"��KEY0,�����ֿ�",16,0);
	POINT_COLOR=BLUE;  
	Show_Str(60,150,"������ֽ�:",16,0);				    	 
	Show_Str(60,170,"������ֽ�:",16,0);				    	 
	Show_Str(60,190,"��Ӧ����Ϊ:",16,0);			 
	Show_Str(60,210,"���ּ�����:",16,0);			 
	while(1) //����GBK�ӿ�
		{	 
		fontcnt=0;
		for(i=0x81;i<0xff;i++)
			{		
			fontx[0]=i;
			LCD_ShowNum(148,150,i,3,16);//��ʾ������ֽ�    
			for(j=0x40;j<0xfe;j++)
				{
				if(j==0x7f)continue;
				fontcnt++;
				LCD_ShowNum(148,170,j,3,16);//��ʾ������ֽ�	 
				LCD_ShowNum(148,210,fontcnt,5,16);//��ʾ������ֽ�	 
				fontx[1]=j;
				Show_Font(148,190,fontx,16,0);	  
				t=200;
				while(t--)//��ʱ,ͬʱɨ�谴��
					{
					delay_ms(1);
					key=KEY_Scan();
					if(key==1)goto UPD;
					}
				STM_EVAL_LEDToggle(LED1);
				}   
			}			 		   
		}
	
	}





#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif





