/**
  ******************************************************************************
  * @file    Project/Template/stm32f10x_it.c 
  * @author  MCD Application Team
  * @version V3.1.0
  * @date    06/19/2009
  * @brief   Main Interrupt Service Routines.
  *          This file provides template for all exceptions handler and 
  *          peripherals interrupt service routine.
  ******************************************************************************
  * @copy
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2009 STMicroelectronics</center></h2>
  */ 

/* Includes ------------------------------------------------------------------*/
#include "stm32f10x_it.h"
#include "eval.h"
#include "SysTickDelay.h" 
//#include "GLCD.h"
//#include <stdio.h>
#include "UART_INTERFACE.h"



/** @addtogroup Template_Project
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/******************************************************************************/
/*            Cortex-M3 Processor Exceptions Handlers                         */
/******************************************************************************/

/**
  * @brief   This function handles NMI exception.
  * @param  None
  * @retval None
  */
void NMI_Handler(void)
	{
	}

/**
  * @brief  This function handles Hard Fault exception.
  * @param  None
  * @retval None
  */
void HardFault_Handler(void)
{
  /* Go to infinite loop when Hard Fault exception occurs */
  while (1)
  {
  }
}

/**
  * @brief  This function handles Memory Manage exception.
  * @param  None
  * @retval None
  */
void MemManage_Handler(void)
{
  /* Go to infinite loop when Memory Manage exception occurs */
  while (1)
  {
  }
}

/**
  * @brief  This function handles Bus Fault exception.
  * @param  None
  * @retval None
  */
void BusFault_Handler(void)
{
  /* Go to infinite loop when Bus Fault exception occurs */
  while (1)
  {
  }
}

/**
  * @brief  This function handles Usage Fault exception.
  * @param  None
  * @retval None
  */
void UsageFault_Handler(void)
{
  /* Go to infinite loop when Usage Fault exception occurs */
  while (1)
  {
  }
}

/**
  * @brief  This function handles SVCall exception.
  * @param  None
  * @retval None
  */
void SVC_Handler(void)
{
}

/**
  * @brief  This function handles Debug Monitor exception.
  * @param  None
  * @retval None
  */
void DebugMon_Handler(void)
{
}

/**
  * @brief  This function handles PendSVC exception.
  * @param  None
  * @retval None
  */
void PendSV_Handler(void)
{
}

/**
  * @brief  This function handles SysTick Handler.
  * @param  None
  * @retval None
  */
void SysTick_Handler(void)
	{
	}

/******************************************************************************/
/*                 STM32F10x Peripherals Interrupt Handlers                   */
/*  Add here the Interrupt Handler for the used peripheral(s) (PPP), for the  */
/*  available peripheral interrupt handler's name please refer to the startup */
/*  file (startup_stm32f10x_xx.s).                                            */
/******************************************************************************/


//外部中断0服务程序
void EXTI0_IRQHandler(void)
	{
//方法一:
//	delay_ms(10);//消抖
//	if (STM_EVAL_PBGetState(Button_WAKEUP) == 0x01)		//按键按下:高电平有效
//		{
//		STM_EVAL_LEDToggle(LED1);
//		STM_EVAL_LEDToggle(LED2);
//		}		 
//	//EXTI->PR=1<<0;  //清除LINE0上的中断标志位  
//	/* Clear the Key Button EXTI line pending bit */  
//	EXTI_ClearITPendingBit(WAKEUP_BUTTON_EXTI_LINE);  //清除EXTI0线路挂起位

//方法二:
	if(EXTI_GetITStatus(WAKEUP_BUTTON_EXTI_LINE) != RESET)	  //检查指定的EXTI0线路触发请求发生与否
		{
		/* Clear the Key Button EXTI line pending bit */  
		EXTI_ClearITPendingBit(WAKEUP_BUTTON_EXTI_LINE);  //清除EXTI0线路挂起位
		/* Toggle LED1/2 */
		STM_EVAL_LEDToggle(LED1);
		STM_EVAL_LEDToggle(LED2);
		}
	}

//外部中断15~10服务程序
void EXTI15_10_IRQHandler(void)
	{			
	delay_ms(10);    //消抖			 
	if (STM_EVAL_PBGetState(Button_KEY0) == 0x00)		//按键按下:低电平有效
		{
		STM_EVAL_LEDToggle(LED1);
		}
	else if (STM_EVAL_PBGetState(Button_KEY1) == 0x00)		//按键按下:低电平有效
		{
		STM_EVAL_LEDToggle(LED2);
		}
	//EXTI->PR=1<<13;     //清除LINE13上的中断标志位  
	//EXTI->PR=1<<15;     //清除LINE15上的中断标志位  
	/* Clear the Key Button EXTI line pending bit */  
	EXTI_ClearITPendingBit(BUTTON0_EXTI_LINE);  //清除EXTI13线路挂起位
	EXTI_ClearITPendingBit(BUTTON1_EXTI_LINE);  //清除EXTI15线路挂起位
	}

/**
  * @brief  This function handles PPP interrupt request.
  * @param  None
  * @retval None
  */
/*void PPP_IRQHandler(void)
{
}*/

/**
  * @}
  */ 


/******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/
