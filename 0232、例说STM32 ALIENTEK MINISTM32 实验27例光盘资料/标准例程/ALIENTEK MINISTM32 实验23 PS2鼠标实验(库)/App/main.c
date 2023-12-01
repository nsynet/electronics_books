/**********************************************
File Name: ALIENTEK MINISTM32 实验23 PS2鼠标实验(库)
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

//PA15: JTDI PS2_CLK KEY1
//PA13: JTMS PS2_DAT KEY0

//这个代码不能用JTAG/SWD调试.鼠标和SWD公用数据线了.

//注意:在禁用JTAG接后后可这样恢复:
//1.设置KEIL为JTAG或SW下载模式
//2.给板上电,按下板上的复位按键不放,点击KEIL下的FLASH下载按钮,使JTAG或SW下载工具检测完成接口后立刻放开,
//此目的在于争取IC在上电的时候有控制权,使在未进入禁用JTAG或SW生效的时候取可控制IC进行烧录

//使用JLINK JTAG方式下载程序时请在下载完毕后拔走JLINK

#include "stm32f10x.h"
#include "LCD.h"
//#include "USART.h"
#include "eval.h"
#include "SysTickDelay.h"
#include "UART_INTERFACE.h"
#include "mouse.h"
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

//系统中断管理
void NVIC_Configuration(void)
	{ 
	//NVIC_InitTypeDef NVIC_InitStructure;

	/* Configure the NVIC Preemption Priority Bits */  
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);	//设置优先级分组：先占优先级2级,从优先级2级
	
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
	USART_Configuration(9600);
	
	LCD_Init();			//初始化液晶	
	}









//void Delay(vu32 nCount)
//	{
//	for(; nCount != 0; nCount--);
//	}

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
	u8 t;
	u8 errcnt=0;
	Init_All_Periph();
	SysTick_Initaize();
	STM_EVAL_LEDOff(LED1);
	STM_EVAL_LEDOff(LED2);
	
	POINT_COLOR=RED;//设置字体为红色	   
	LCD_ShowString(60,50,"Mini STM32");	
	LCD_ShowString(60,70,"PS2 Mouse TEST");	
	LCD_ShowString(60,90,"ATOM@ALIENTEK");
	LCD_ShowString(60,110,"2010/6/17");			  
	RST:t=Init_Mouse();
	STM_EVAL_LEDToggle(LED2);	
	delay_ms(300);
	if(t==0)LCD_ShowString(60,130,"Mouse Init OK!");
	else
		{
		printf("ERROR_CODE:%d\n",t);
		LCD_ShowString(60,130,"Error CODE:");
		LCD_ShowNum(148,130,t,3,16);//填充模式
		STM_EVAL_LEDToggle(LED1);
		//delay_ms(500);
		goto RST;
		}  
	POINT_COLOR=BLUE;
	LCD_ShowString(60,150,"Mouse ID:");
	LCD_ShowNum(132,150,MOUSE_ID,3,16);//填充模式
	
	
	LCD_ShowString(30,170,"BUF[0]:");
	LCD_ShowString(30,186,"BUF[1]:");
	LCD_ShowString(30,202,"BUF[2]:"); 
	if(MOUSE_ID==3)LCD_ShowString(30,218,"BUF[3]:"); 
	
	LCD_ShowString(90+30,170,"X  POS:");
	LCD_ShowString(90+30,186,"Y  POS:");
	LCD_ShowString(90+30,202,"Z  POS:"); 
	if(MOUSE_ID==3)LCD_ShowString(90+30,218,"BUTTON:"); 
	t=0;
	while(1)
		{
		if(PS2_Status&0x80)//得到了一次数据
			{		  
			LCD_ShowNum(56+30,170,PS2_DATA_BUF[0],3,16);//填充模式
			LCD_ShowNum(56+30,186,PS2_DATA_BUF[1],3,16);//填充模式
			LCD_ShowNum(56+30,202,PS2_DATA_BUF[2],3,16);//填充模式
			if(MOUSE_ID==3)LCD_ShowNum(56+30,218,PS2_DATA_BUF[3],3,16);//填充模式
			
			Mouse_Data_Pro();//处理数据
			LCD_ShowNum(146+30,170,MouseX.x_pos,5,16);//填充模式
			LCD_ShowNum(146+30,186,MouseX.y_pos,5,16);//填充模式
			if(MOUSE_ID==3)LCD_ShowNum(146+30,202,MouseX.z_pos,5,16);//填充模式
			
			if(MouseX.bt_mask&0x01)LCD_ShowString(146+30,218,"LEFT"); 
			else LCD_ShowString(146+30,218,"    "); 
			if(MouseX.bt_mask&0x02)LCD_ShowString(146+30,234,"RIGHT"); 
			else LCD_ShowString(146+30,234,"     "); 				    
			if(MouseX.bt_mask&0x04)LCD_ShowString(146+30,250,"MIDDLE"); 
			else LCD_ShowString(146+30,250,"      ");   		 
			PS2_Status=MOUSE;
			PS2_En_Data_Report();//使能数据报告
			}
		else if(PS2_Status&0x40)
			{
			errcnt++;
			PS2_Status=MOUSE;
			LCD_ShowNum(86+30,234,errcnt,3,16);//填充模式
			}
		t++;
		delay_ms(1);
		if(t==200)
			{
			t=0;
			STM_EVAL_LEDToggle(LED1);
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





