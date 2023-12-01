/**********************************************
File Name: ALIENTEK MINISTM32 实验2 按键输入
Revision:
Corporation:
Microcontroller Corporation:ST
Microcontroller name:STM32F103RBT6 ARM
Compiler: Keil MDK_ARM 4.11
Author: moweidong
E-mail: moweidongsabbit@21cn.com
Date : 2010.12.05
*********************************************/
//仿真仪器设备:
//ALIENTEK_MiniSTM32_REVB0开发板
//JLINK V7
/*********************************************
//库
//CMSIS:V1.20
//STM32F10x_StdPeriph_Driver:V3.1.1
*********************************************/

//本程序使用了printf用于在LCD和串口显示数据,因些对Option for Target属性有如下更改
//Target选项页:勾中Use MicroLIB(使用微库)

//LED0:PA8
//LED1:PD2

//KEY0:	 PA13 JTMS    低电平有效
//KEY1:	 PA15 JTDI	  低电平有效
//WAK_UP:PA0		  高电平有效

//注意:在禁用JTAG接后后可这样恢复:
//1.设置KEIL为JTAG或SW下载模式
//2.给板上电,按下板上的复位按键不放,点击KEIL下的FLASH下载按钮,使JTAG或SW下载工具检测完成接口后立刻放开,
//此目白在于争取IC在上电的时候有控制权,使在未进入禁用JTAG或SW生效的时候取可控制IC进行烧录


//断开18B20引脚的跳针

#include "stm32f10x.h"
//#include "GLCD.h"
//#include "USART.h"
#include "eval.h"
#include "SysTickDelay.h"
#include <stdio.h>


//以下功能请根据使用方式设置
#if !defined (USE_NO_DEBUGTOOL) &&  !defined (USE_ONLY_JLINK)  &&  !defined (USE_ONLY_ULINK)
 #define USE_NO_DEBUGTOOL	   //不使用调试工具,KEY0(PA13 JTMS), KEY1(PA15 JTDI),WAK_UP(PA0)均可使用,该实验过程需要烧录好程序后必需拔除下载工具
 //#define USE_ONLY_JLINK	   //使用JLINK,即调试用JTAG方式,KEY0(PA13 JTMS)和KEY1(PA15 JTDI)不可使用,WAK_UP(PA0)可使用
 //#define USE_ONLY_ULINK		   //使用ULINK2,即调试用SW方式,KEY0(PA13 JTMS), KEY1(PA15 JTDI),WAK_UP(PA0)均可使用,KEY0和KEY1需要修改成IO后才可使用
#endif





#define USED_COM_NUMBER COM1  //设置当前使用的串口



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

//系统中断管理
void NVIC_Configuration(void)
	{ 
	//NVIC_InitTypeDef NVIC_InitStructure;

	/* Configure the NVIC Preemption Priority Bits */  
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_0);	//设置优先级分组：先占优先级0位,从优先级4位
	
	//设置向量表的位置和偏移
	#ifdef  VECT_TAB_RAM  
		/* Set the Vector Table base location at 0x20000000 */ 
		NVIC_SetVectorTable(NVIC_VectTab_RAM, 0x0); 		//向量表位于RAM
	#else  /* VECT_TAB_FLASH  */
		/* Set the Vector Table base location at 0x08000000 */ 
		NVIC_SetVectorTable(NVIC_VectTab_FLASH, 0x0);   //向量表位于FLASH
	#endif
	}

//配置系统时钟,使能各外设时钟
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
	






//配置所有外设
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


//按键处理函数
//返回按键值
//0，没有任何按键按下
//1，KEY0按下
//2，KEY1按下
//3，KEY2按下 WK_UP
//注意此函数有响应优先级,KEY0>KEY1>KEY2!!
u8 KEY_Scan(void)
	{	 
	static u8 key_up=1;//按键按松开标志	
	if(key_up&&((STM_EVAL_PBGetState(Button_KEY0) == 0x00)||(STM_EVAL_PBGetState(Button_KEY1) == 0x00)||(STM_EVAL_PBGetState(Button_WAKEUP) == 0x01)))
		{
		delay_ms(10);//去抖动 
		key_up=0;
		if (STM_EVAL_PBGetState(Button_KEY0) == 0x00)		//按键按下:低电平有效
			{
			return 1;
			}
		if (STM_EVAL_PBGetState(Button_KEY1) == 0x00)		//按键按下:低电平有效
			{
			return 2;
			}
		if (STM_EVAL_PBGetState(Button_WAKEUP) == 0x01)		//按键按下:高电平有效
			{
			return 3;
			}
		}
		else if((STM_EVAL_PBGetState(Button_KEY0) == 0x01)&&(STM_EVAL_PBGetState(Button_KEY1) == 0x01)&&(STM_EVAL_PBGetState(Button_WAKEUP) == 0x00)) key_up=1; 	    
	return 0;// 无按键按下
	}


int main(void)
	{
	#ifdef USE_NO_DEBUGTOOL	 //不使用调试工具
	u8 Key_Vlaue;  
	#endif /*Debug */
	Init_All_Periph();
	SysTick_Initaize();
	
	STM_EVAL_LEDOff(LED1);
	STM_EVAL_LEDOff(LED2);

	while(1)
		{
		/* Define the Debug mode hardware depending on the used evaluation board */
		#ifdef USE_NO_DEBUGTOOL	 //不使用调试工具
			/* Disable the Serial Wire Jtag Debug Port SWJ-DP */
			GPIO_PinRemapConfig(GPIO_Remap_SWJ_Disable, ENABLE);	//SWJ完全失能(JTAG+SW-DP)
			STM_EVAL_PBInit(Button_KEY0, Mode_GPIO);			//设置按键GPIO属性
			STM_EVAL_PBInit(Button_KEY1, Mode_GPIO);			//设置按键GPIO属性
			STM_EVAL_PBInit(Button_WAKEUP, Mode_GPIO);			//设置按键GPIO属性
			Key_Vlaue=KEY_Scan();//得到键值
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
		
		#elif defined (USE_ONLY_JLINK) //使用JLINK作调试工具
			
			STM_EVAL_PBInit(Button_WAKEUP, Mode_GPIO);			//设置按键GPIO属性
			if (STM_EVAL_PBGetState(Button_WAKEUP) == 0x01)		//按键按下:高电平有效
				{
				STM_EVAL_LEDToggle(LED1);
				STM_EVAL_LEDToggle(LED2);
				delay_ms(300);
				}
		
		#elif defined (USE_ONLY_ULINK)	 //使用ULINK作调试工具

			/* Disable the Serial Wire Jtag Debug Port SWJ-DP */
			GPIO_PinRemapConfig(GPIO_Remap_SWJ_JTAGDisable , ENABLE);	//JTAG-DP 失能 + SW-DP使能 
			STM_EVAL_PBInit(Button_KEY0, Mode_GPIO);			//设置按键GPIO属性
			STM_EVAL_PBInit(Button_KEY1, Mode_GPIO);			//设置按键GPIO属性
			STM_EVAL_PBInit(Button_WAKEUP, Mode_GPIO);			//设置按键GPIO属性
		   	if (STM_EVAL_PBGetState(Button_WAKEUP) == 0x01)		//按键按下:高电平有效
					{
					STM_EVAL_LEDToggle(LED1);
					delay_ms(300);
					}
			if (STM_EVAL_PBGetState(Button_KEY0) == 0x00)		//按键按下:低电平有效
					{
					STM_EVAL_LEDToggle(LED2);
					delay_ms(300);
					}
			if (STM_EVAL_PBGetState(Button_KEY1) == 0x00)		//按键按下:低电平有效
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





