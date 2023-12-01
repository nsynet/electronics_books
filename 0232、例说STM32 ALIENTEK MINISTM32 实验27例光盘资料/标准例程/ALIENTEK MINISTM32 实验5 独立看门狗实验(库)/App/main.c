/**********************************************
File Name: ALIENTEK MINISTM32 ÊµÑé5 ¶ÀÁ¢¿´ÃÅ¹·ÊµÑé(¿â)
Revision:
Corporation:
Microcontroller Corporation:ST
Microcontroller name:STM32F103RBT6 ARM
Compiler: Keil MDK_ARM 4.11
Author: moweidong
E-mail: moweidongsabbit@21cn.com
Date : 2010.12.05
*********************************************/
//·ÂÕæÒÇÆ÷Éè±¸:
//ALIENTEK_MiniSTM32_REVB0¿ª·¢°å
//JLINK V7
/*********************************************
//¿â
//CMSIS:V1.20
//STM32F10x_StdPeriph_Driver:V3.1.1
*********************************************/

//±¾³ÌĞòÊ¹ÓÃÁËprintfÓÃÓÚÔÚLCDºÍ´®¿ÚÏÔÊ¾Êı¾İ,ÒòĞ©¶ÔOption for TargetÊôĞÔÓĞÈçÏÂ¸ü¸Ä
//TargetÑ¡ÏîÒ³:¹´ÖĞUse MicroLIB(Ê¹ÓÃÎ¢¿â)

//LED0:PA8
//LED1:PD2

//×¢Òâ:ÔÚ½ûÓÃJTAG½Óºóºó¿ÉÕâÑù»Ö¸´:
//1.ÉèÖÃKEILÎªJTAG»òSWÏÂÔØÄ£Ê½
//2.¸ø°åÉÏµç,°´ÏÂ°åÉÏµÄ¸´Î»°´¼ü²»·Å,µã»÷KEILÏÂµÄFLASHÏÂÔØ°´Å¥,Ê¹JTAG»òSWÏÂÔØ¹¤¾ß¼ì²âÍê³É½Ó¿ÚºóÁ¢¿Ì·Å¿ª,
//´ËÄ¿°×ÔÚÓÚÕùÈ¡ICÔÚÉÏµçµÄÊ±ºòÓĞ¿ØÖÆÈ¨,Ê¹ÔÚÎ´½øÈë½ûÓÃJTAG»òSWÉúĞ§µÄÊ±ºòÈ¡¿É¿ØÖÆIC½øĞĞÉÕÂ¼

//ËµÃ÷:	  LED1ÔÚÉÁË¸ËµÃ÷¿´ÃÅ¹·ÔÚ²»Í£µØ¸´Î»,µ±°´ÏÂWK_UPºó³£ÁÁËµÃ÷¿´ÃÅ¹·Ã»ÓĞ·¢Éú¸´Î»(¼´Èí¼şÇå¿´ÃÅ¹·¼ÆÊıÊ¹Æä¼ÆÊıÖµÃ»ÓĞ´ïµ½Òç³ö)
//Ê¹ÓÃJLINKµ÷ÊÔÊ±ÇëÔÚÏÂÔØÍê³ÌĞòºó°Î×ßJLINK

#include "stm32f10x.h"
//#include "GLCD.h"
//#include "USART.h"
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
	//STM_EVAL_LEDInit(LED2);

	STM_EVAL_PBInit(Button_WAKEUP, Mode_GPIO);			//ÉèÖÃ°´¼üGPIOÊôĞÔ
	}

//ÏµÍ³ÖĞ¶Ï¹ÜÀí
void NVIC_Configuration(void)
	{ 
	//NVIC_InitTypeDef NVIC_InitStructure;

	/* Configure the NVIC Preemption Priority Bits */  
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_0);	//ÉèÖÃÓÅÏÈ¼¶·Ö×é£ºÏÈÕ¼ÓÅÏÈ¼¶0Î»,´ÓÓÅÏÈ¼¶4Î»
	
	//ÉèÖÃÏòÁ¿±íµÄÎ»ÖÃºÍÆ«ÒÆ
	#ifdef  VECT_TAB_RAM  
		/* Set the Vector Table base location at 0x20000000 */ 
		NVIC_SetVectorTable(NVIC_VectTab_RAM, 0x0); 		//ÏòÁ¿±íÎ»ÓÚRAM
	#else  /* VECT_TAB_FLASH  */
		/* Set the Vector Table base location at 0x08000000 */ 
		NVIC_SetVectorTable(NVIC_VectTab_FLASH, 0x0);   //ÏòÁ¿±íÎ»ÓÚFLASH
	#endif
	}

//ÅäÖÃÏµÍ³Ê±ÖÓ,Ê¹ÄÜ¸÷ÍâÉèÊ±ÖÓ
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
	


//ÅäÖÃËùÓĞÍâÉè
void Init_All_Periph(void)
	{
	
	RCC_Configuration();	
	
	NVIC_Configuration();

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
	STM_EVAL_LEDOff(LED1);  //Ï¨ÃğLED1

	SysTick_Initaize();

	//·ÖÆµÊıÎª64,ÖØÔØÖµÎª625,Òç³öÊ±¼äÎª1s
	/* IWDG timeout equal to 1s (the timeout may varies due to LSI frequency
	dispersion) */
	/* Enable write access to IWDG_PR and IWDG_RLR registers */
	//IWDG_WriteAccess_Enable:Ê¹ÄÜ¶Ô¼Ä´æÆ÷IWDG_PRºÍIWDG_RLRµÄĞ´²Ù×÷
	IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);  //Ê¹ÄÜ¶Ô¼Ä´æÆ÷IWDG_PRºÍIWDG_RLRµÄĞ´²Ù×÷
	
	/* IWDG counter clock: 40KHz(LSI) / 64 = 625Hz */
	IWDG_SetPrescaler(IWDG_Prescaler_64);  //ÉèÖÃIWDGÔ¤·ÖÆµÖµ:ÉèÖÃIWDGÔ¤·ÖÆµÖµÎª64
	
	/* Set counter reload value to 625 */
	IWDG_SetReload(625);  //ÉèÖÃIWDGÖØ×°ÔØÖµ
	
	/* Reload IWDG counter */
	IWDG_ReloadCounter();  //°´ÕÕIWDGÖØ×°ÔØ¼Ä´æÆ÷µÄÖµÖØ×°ÔØIWDG¼ÆÊıÆ÷
	
	
	/* Enable IWDG (the LSI oscillator will be enabled by hardware) */
	IWDG_Enable();  //Ê¹ÄÜIWDG

	delay_ms(300);   	 //ÈÃÈË¿´µÃµ½Ãğ
	STM_EVAL_LEDOn(LED1);  //µãÁÁLED1

	while(1)
		{
		if (STM_EVAL_PBGetState(Button_WAKEUP) == 0x01)		//°´¼ü°´ÏÂ:¸ßµçÆ½ÓĞĞ§
				{
				/* Reload IWDG counter */
				IWDG_ReloadCounter();	 //°´ÕÕIWDGÖØ×°ÔØ¼Ä´æÆ÷µÄÖµÖØ×°ÔØIWDGÆı÷
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





