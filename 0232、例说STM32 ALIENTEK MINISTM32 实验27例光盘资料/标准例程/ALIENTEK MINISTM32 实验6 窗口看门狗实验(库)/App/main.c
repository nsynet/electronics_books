/**********************************************
File Name: ALIENTEK MINISTM32 ʵ��6 ���ڿ��Ź�ʵ��(��)
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

//ע��:�ڽ���JTAG�Ӻ��������ָ�:
//1.����KEILΪJTAG��SW����ģʽ
//2.�����ϵ�,���°��ϵĸ�λ��������,���KEIL�µ�FLASH���ذ�ť,ʹJTAG��SW���ع��߼����ɽӿں����̷ſ�,
//��Ŀ��������ȡIC���ϵ��ʱ���п���Ȩ,ʹ��δ�������JTAG��SW��Ч��ʱ��ȡ�ɿ���IC������¼

//ʵ����:���¸�λ����,DS0(LED1)��һ�º�Ϩ��,DS1(LED2)��ͣ������˸

#include "stm32f10x.h"
//#include "GLCD.h"
#include "eval.h"
#include "SysTickDelay.h"
#include "UART_INTERFACE.h"
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

	//STM_EVAL_PBInit(Button_WAKEUP, Mode_GPIO);			//���ð���GPIO����
	}

//ϵͳ�жϹ���
void NVIC_Configuration(void)
	{ 
	NVIC_InitTypeDef NVIC_InitStructure;

	/* Configure the NVIC Preemption Priority Bits */  
	//NVIC_PriorityGroupConfig(NVIC_PriorityGroup_0);	//�������ȼ����飺��ռ���ȼ�0λ,�����ȼ�4λ
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);	  //�������ȼ����飺��ռ���ȼ�2λ,�����ȼ�2λ

	
	//�����������λ�ú�ƫ��
	#ifdef  VECT_TAB_RAM  
		/* Set the Vector Table base location at 0x20000000 */ 
		NVIC_SetVectorTable(NVIC_VectTab_RAM, 0x0); 		//������λ��RAM
	#else  /* VECT_TAB_FLASH  */
		/* Set the Vector Table base location at 0x08000000 */ 
		NVIC_SetVectorTable(NVIC_VectTab_FLASH, 0x0);   //������λ��FLASH
	#endif

	//WWDG���ڿ��Ź��ж�����
	NVIC_InitStructure.NVIC_IRQChannel = WWDG_IRQn;    //WWDG�ж�
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 1;   //ռ��ʽ���ȼ�1��
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;	 //��Ӧ���ȼ�0��
	NVIC_Init(&NVIC_InitStructure);

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
	
	//NVIC_Configuration();

	GPIO_Configuration();
	
	//USART1_Configuration();
	//USART_Configuration(9600);
	

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



int main(void)
	{  
	Init_All_Periph();
	STM_EVAL_LEDOn(LED1);  //����LED1
	STM_EVAL_LEDOff(LED2);  //Ϩ��LED2

	SysTick_Initaize();

	delay_ms(300);   	 //���˿��õ���

	/* Check if the system has resumed from WWDG reset */
	if (RCC_GetFlagStatus(RCC_FLAG_WWDGRST) != RESET)
		{ /* WWDGRST flag set */
		/* Clear reset flags */
		RCC_ClearFlag();
		}
	else
		{ /* WWDGRST flag is not set */

		}

	NVIC_Configuration();

	/* WWDG configuration */
	/* Enable WWDG clock */
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_WWDG, ENABLE);
	
	/* WWDG clock counter = (PCLK1/4096)/8 = 244 Hz (~4 ms)  */
	WWDG_SetPrescaler(WWDG_Prescaler_8);
	
	/* Set Window value to 95 */
	WWDG_SetWindowValue(95);
	
	/* Enable WWDG and set counter value to 127, WWDG timeout = ~4 ms * 95 = 380 ms */
	WWDG_Enable(127);
	
	/* Clear EWI flag */
	WWDG_ClearFlag();
	
	/* Enable EW interrupt */
	WWDG_EnableIT();



	while(1)
		{
		STM_EVAL_LEDOff(LED1);  //Ϩ��LED1
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





