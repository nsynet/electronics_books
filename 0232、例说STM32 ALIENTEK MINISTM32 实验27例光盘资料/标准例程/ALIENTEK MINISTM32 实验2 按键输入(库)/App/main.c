/**********************************************
File Name: ALIENTEK MINISTM32 ʵ��2 ��������
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

//KEY0:	 PA13 JTMS    �͵�ƽ��Ч
//KEY1:	 PA15 JTDI	  �͵�ƽ��Ч
//WAK_UP:PA0		  �ߵ�ƽ��Ч

//ע��:�ڽ���JTAG�Ӻ��������ָ�:
//1.����KEILΪJTAG��SW����ģʽ
//2.�����ϵ�,���°��ϵĸ�λ��������,���KEIL�µ�FLASH���ذ�ť,ʹJTAG��SW���ع��߼����ɽӿں����̷ſ�,
//��Ŀ��������ȡIC���ϵ��ʱ���п���Ȩ,ʹ��δ�������JTAG��SW��Ч��ʱ��ȡ�ɿ���IC������¼


//�Ͽ�18B20���ŵ�����

#include "stm32f10x.h"
//#include "GLCD.h"
//#include "USART.h"
#include "eval.h"
#include "SysTickDelay.h"
#include <stdio.h>


//���¹��������ʹ�÷�ʽ����
#if !defined (USE_NO_DEBUGTOOL) &&  !defined (USE_ONLY_JLINK)  &&  !defined (USE_ONLY_ULINK)
 #define USE_NO_DEBUGTOOL	   //��ʹ�õ��Թ���,KEY0(PA13 JTMS), KEY1(PA15 JTDI),WAK_UP(PA0)����ʹ��,��ʵ�������Ҫ��¼�ó�������γ����ع���
 //#define USE_ONLY_JLINK	   //ʹ��JLINK,��������JTAG��ʽ,KEY0(PA13 JTMS)��KEY1(PA15 JTDI)����ʹ��,WAK_UP(PA0)��ʹ��
 //#define USE_ONLY_ULINK		   //ʹ��ULINK2,��������SW��ʽ,KEY0(PA13 JTMS), KEY1(PA15 JTDI),WAK_UP(PA0)����ʹ��,KEY0��KEY1��Ҫ�޸ĳ�IO��ſ�ʹ��
#endif





#define USED_COM_NUMBER COM1  //���õ�ǰʹ�õĴ���



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
	//USART_Configuration();
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


//����������
//���ذ���ֵ
//0��û���κΰ�������
//1��KEY0����
//2��KEY1����
//3��KEY2���� WK_UP
//ע��˺�������Ӧ���ȼ�,KEY0>KEY1>KEY2!!
u8 KEY_Scan(void)
	{	 
	static u8 key_up=1;//�������ɿ���־	
	if(key_up&&((STM_EVAL_PBGetState(Button_KEY0) == 0x00)||(STM_EVAL_PBGetState(Button_KEY1) == 0x00)||(STM_EVAL_PBGetState(Button_WAKEUP) == 0x01)))
		{
		delay_ms(10);//ȥ���� 
		key_up=0;
		if (STM_EVAL_PBGetState(Button_KEY0) == 0x00)		//��������:�͵�ƽ��Ч
			{
			return 1;
			}
		if (STM_EVAL_PBGetState(Button_KEY1) == 0x00)		//��������:�͵�ƽ��Ч
			{
			return 2;
			}
		if (STM_EVAL_PBGetState(Button_WAKEUP) == 0x01)		//��������:�ߵ�ƽ��Ч
			{
			return 3;
			}
		}
		else if((STM_EVAL_PBGetState(Button_KEY0) == 0x01)&&(STM_EVAL_PBGetState(Button_KEY1) == 0x01)&&(STM_EVAL_PBGetState(Button_WAKEUP) == 0x00)) key_up=1; 	    
	return 0;// �ް�������
	}


int main(void)
	{
	#ifdef USE_NO_DEBUGTOOL	 //��ʹ�õ��Թ���
	u8 Key_Vlaue;  
	#endif /*Debug */
	Init_All_Periph();
	SysTick_Initaize();
	
	STM_EVAL_LEDOff(LED1);
	STM_EVAL_LEDOff(LED2);

	while(1)
		{
		/* Define the Debug mode hardware depending on the used evaluation board */
		#ifdef USE_NO_DEBUGTOOL	 //��ʹ�õ��Թ���
			/* Disable the Serial Wire Jtag Debug Port SWJ-DP */
			GPIO_PinRemapConfig(GPIO_Remap_SWJ_Disable, ENABLE);	//SWJ��ȫʧ��(JTAG+SW-DP)
			STM_EVAL_PBInit(Button_KEY0, Mode_GPIO);			//���ð���GPIO����
			STM_EVAL_PBInit(Button_KEY1, Mode_GPIO);			//���ð���GPIO����
			STM_EVAL_PBInit(Button_WAKEUP, Mode_GPIO);			//���ð���GPIO����
			Key_Vlaue=KEY_Scan();//�õ���ֵ
			if(Key_Vlaue)
				{						   
				switch(Key_Vlaue)
					{				 
					case 1:
						STM_EVAL_LEDToggle(LED1);
						break;
					case 2:
						STM_EVAL_LEDToggle(LED2);
						break;
					case 3:				
						STM_EVAL_LEDToggle(LED1);
						STM_EVAL_LEDToggle(LED2);
						break;
					}
				} 
		
		#elif defined (USE_ONLY_JLINK) //ʹ��JLINK�����Թ���
			
			STM_EVAL_PBInit(Button_WAKEUP, Mode_GPIO);			//���ð���GPIO����
			if (STM_EVAL_PBGetState(Button_WAKEUP) == 0x01)		//��������:�ߵ�ƽ��Ч
				{
				STM_EVAL_LEDToggle(LED1);
				STM_EVAL_LEDToggle(LED2);
				delay_ms(300);
				}
		
		#elif defined (USE_ONLY_ULINK)	 //ʹ��ULINK�����Թ���

			/* Disable the Serial Wire Jtag Debug Port SWJ-DP */
			GPIO_PinRemapConfig(GPIO_Remap_SWJ_JTAGDisable , ENABLE);	//JTAG-DP ʧ�� + SW-DPʹ�� 
			STM_EVAL_PBInit(Button_KEY0, Mode_GPIO);			//���ð���GPIO����
			STM_EVAL_PBInit(Button_KEY1, Mode_GPIO);			//���ð���GPIO����
			STM_EVAL_PBInit(Button_WAKEUP, Mode_GPIO);			//���ð���GPIO����
		   	if (STM_EVAL_PBGetState(Button_WAKEUP) == 0x01)		//��������:�ߵ�ƽ��Ч
					{
					STM_EVAL_LEDToggle(LED1);
					delay_ms(300);
					}
			if (STM_EVAL_PBGetState(Button_KEY0) == 0x00)		//��������:�͵�ƽ��Ч
					{
					STM_EVAL_LEDToggle(LED2);
					delay_ms(300);
					}
			if (STM_EVAL_PBGetState(Button_KEY1) == 0x00)		//��������:�͵�ƽ��Ч
					{
					STM_EVAL_LEDToggle(LED1);
					STM_EVAL_LEDToggle(LED2);
					delay_ms(300);
					}

		#endif /*Debug */
	
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





