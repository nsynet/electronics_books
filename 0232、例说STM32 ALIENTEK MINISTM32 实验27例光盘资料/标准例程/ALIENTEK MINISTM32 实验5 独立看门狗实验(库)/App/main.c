/**********************************************
File Name: ALIENTEK MINISTM32 实验5 独立看门狗实验(库)
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

//注意:在禁用JTAG接后后可这样恢复:
//1.设置KEIL为JTAG或SW下载模式
//2.给板上电,按下板上的复位按键不放,点击KEIL下的FLASH下载按钮,使JTAG或SW下载工具检测完成接口后立刻放开,
//此目白在于争取IC在上电的时候有控制权,使在未进入禁用JTAG或SW生效的时候取可控制IC进行烧录

//说明:	  LED1在闪烁说明看门狗在不停地复位,当按下WK_UP后常亮说明看门狗没有发生复位(即软件清看门狗计数使其计数值没有达到溢出)
//使用JLINK调试时请在下载完程序后拔走JLINK

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

	STM_EVAL_PBInit(Button_WAKEUP, Mode_GPIO);			//设置按键GPIO属性
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
	STM_EVAL_LEDOff(LED1);  //熄灭LED1

	SysTick_Initaize();

	//分频数为64,重载值为625,溢出时间为1s
	/* IWDG timeout equal to 1s (the timeout may varies due to LSI frequency
	dispersion) */
	/* Enable write access to IWDG_PR and IWDG_RLR registers */
	//IWDG_WriteAccess_Enable:使能对寄存器IWDG_PR和IWDG_RLR的写操作
	IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);  //使能对寄存器IWDG_PR和IWDG_RLR的写操作
	
	/* IWDG counter clock: 40KHz(LSI) / 64 = 625Hz */
	IWDG_SetPrescaler(IWDG_Prescaler_64);  //设置IWDG预分频值:设置IWDG预分频值为64
	
	/* Set counter reload value to 625 */
	IWDG_SetReload(625);  //设置IWDG重装载值
	
	/* Reload IWDG counter */
	IWDG_ReloadCounter();  //按照IWDG重装载寄存器的值重装载IWDG计数器
	
	
	/* Enable IWDG (the LSI oscillator will be enabled by hardware) */
	IWDG_Enable();  //使能IWDG

	delay_ms(300);   	 //让人看得到灭
	STM_EVAL_LEDOn(LED1);  //点亮LED1

	while(1)
		{
		if (STM_EVAL_PBGetState(Button_WAKEUP) == 0x01)		//按键按下:高电平有效
				{
				/* Reload IWDG counter */
				IWDG_ReloadCounter();	 //按照IWDG重装载寄存器的值重装载IWDG讫�
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





