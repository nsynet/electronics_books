/**
  ******************************************************************************
  * @file    stm3210c_eval.h
  * @author  MCD Application Team
  * @version V3.1.0
  * @date    06/19/2009
  * @brief   This file contains definitions for STM3210C_EVAL's Leds, push-buttons
  *          and COM ports hardware resources.
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
  
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __ALIENTEK_MiniSTM32_EVAL_H
#define __ALIENTEK_MiniSTM32_EVAL_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f10x.h"

/** @addtogroup Utilities
  * @{
  */
  
/** @addtogroup STM3210C_EVAL
  * @{
  */ 


/** @defgroup STM3210C_EVAL_Exported_Types
  * @{
  */
/**
  * @}
  */ 

/** @defgroup STM3210C_EVAL_Exported_Constants
  * @{
  */ 

/** @addtogroup ALIENTEK_MiniSTM32_LED
  * @{
  */
#define LEDn                        2
#define LED1_GPIO_PORT              GPIOA
#define LED1_GPIO_CLK               RCC_APB2Periph_GPIOA  
#define LED1_GPIO_PIN               GPIO_Pin_8
  
#define LED2_GPIO_PORT              GPIOD
#define LED2_GPIO_CLK               RCC_APB2Periph_GPIOD  
#define LED2_GPIO_PIN               GPIO_Pin_2
  

/**
  * @}
  */ 
  
/** @addtogroup STM3210C_EVAL_BUTTON
  * @{
  */  
#define BUTTONn                     3 /*!< Joystick pins are connected to an IO Expander (accessible through I2C1 interface) */

/**
 * @brief KEY0
 */
#define BUTTON0_PORT          GPIOA
#define BUTTON0_CLK           RCC_APB2Periph_GPIOA
#define BUTTON0_PIN           GPIO_Pin_13
#define BUTTON0_EXTI_LINE     EXTI_Line13
#define BUTTON0_PORT_SOURCE   GPIO_PortSourceGPIOA
#define BUTTON0_PIN_SOURCE    GPIO_PinSource13
#define BUTTON0_IRQn          EXTI15_10_IRQn 

/**
 * @brief KEY1
 */
#define BUTTON1_PORT          GPIOA
#define BUTTON1_CLK           RCC_APB2Periph_GPIOA
#define BUTTON1_PIN           GPIO_Pin_15
#define BUTTON1_EXTI_LINE     EXTI_Line15
#define BUTTON1_PORT_SOURCE   GPIO_PortSourceGPIOA
#define BUTTON1_PIN_SOURCE    GPIO_PinSource15
#define BUTTON1_IRQn          EXTI15_10_IRQn 

/**
 * @brief Wakeup push-button
 */
#define WAKEUP_BUTTON_PORT          GPIOA			 //所在的GPIO端口名
#define WAKEUP_BUTTON_CLK           RCC_APB2Periph_GPIOA   //端口时钟
#define WAKEUP_BUTTON_PIN           GPIO_Pin_0			 //所在的端口号
#define WAKEUP_BUTTON_EXTI_LINE     EXTI_Line0			//对应的外部中断线编号
#define WAKEUP_BUTTON_PORT_SOURCE   GPIO_PortSourceGPIOA   //中断源时钟
#define WAKEUP_BUTTON_PIN_SOURCE    GPIO_PinSource0		  //对应的中断源连接的端口号
#define WAKEUP_BUTTON_IRQn          EXTI0_IRQn 			  //相应的中断事件





/** @addtogroup STM3210C_EVAL_COM
  * @{
  */
#define COMn                        2

/**
 * @brief Definition for COM port1, connected to USART2 (USART2 pins remapped on GPIOD)
 */ 
#define EVAL_COM1                   USART1
#define EVAL_COM1_GPIO              GPIOA
#define EVAL_COM1_CLK               RCC_APB2Periph_USART1
#define EVAL_COM1_GPIO_CLK          RCC_APB2Periph_GPIOA
#define EVAL_COM1_RxPin             GPIO_Pin_10
#define EVAL_COM1_TxPin             GPIO_Pin_9


#define EVAL_COM2                   USART2
#define EVAL_COM2_GPIO              GPIOA
#define EVAL_COM2_CLK               RCC_APB1Periph_USART2
#define EVAL_COM2_GPIO_CLK          RCC_APB2Periph_GPIOA
#define EVAL_COM2_RxPin             GPIO_Pin_3
#define EVAL_COM2_TxPin             GPIO_Pin_2

/**
  * @}
  */ 

/**
  * @}
  */ 
  
/** @defgroup STM3210C_EVAL_Exported_Macros
  * @{
  */ 
/**
  * @}
  */ 


/** @defgroup STM3210C_EVAL_Exported_Functions
  * @{
  */ 
/**
  * @}
  */
  
#ifdef __cplusplus
}
#endif

#endif /* __STM3210C_EVAL_H */
/**
  * @}
  */ 


/**
  * @}
  */ 


/******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/
