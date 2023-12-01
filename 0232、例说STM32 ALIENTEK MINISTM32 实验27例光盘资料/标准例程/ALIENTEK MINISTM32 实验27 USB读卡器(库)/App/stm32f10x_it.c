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
#include "usb_istr.h"
#include "usb_lib.h"
//#include "usb_pwr.h"
//#include "platform_config.h"
#include "eval.h"  
//#include "GLCD.h"
//#include <stdio.h>



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


//#ifndef STM32F10X_CL
/*******************************************************************************
* Function Name  : USB_HP_CAN_TX_IRQHandler
* Description    : This function handles USB High Priority or CAN TX interrupts
*                  requests.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void USB_HP_CAN_TX_IRQHandler(void)
	{
	CTR_HP();
	}

/*******************************************************************************
* Function Name  : USB_LP_CAN_RX0_IRQHandler
* Description    : This function handles USB Low Priority or CAN RX0 interrupts
*                  requests.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void USB_LP_CAN_RX0_IRQHandler(void)
	{
	//STM_EVAL_LEDToggle(LED2);
	//USB检测时进入的初始化
	USB_Istr();
	}


/*******************************************************************************
* Function Name  : SDIO_IRQHandler
* Description    : This function handles SDIO global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void SDIO_IRQHandler(void)
{ 
  /* Process All SDIO Interrupt Sources */
 // SD_ProcessIRQSrc();
  
}

/*******************************************************************************
* Function Name  : USBWakeUp_IRQHandler
* Description    : This function handles USB WakeUp interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void USBWakeUp_IRQHandler(void)
{
// //EXTI_ClearITPendingBit(EXTI_Line18);
}

//#endif /* STM32F10X_CL */

///*******************************************************************************
//* Function Name  : EXTI9_5_IRQHandler
//* Description    : This function handles External lines 9 to 5 interrupt request.
//* Input          : None
//* Output         : None
//* Return         : None
//*******************************************************************************/
//void EXTI9_5_IRQHandler(void)
//{
//  if (EXTI_GetITStatus(KEY_BUTTON_EXTI_LINE) != RESET)
//  {
//    /* Check if the remote wakeup feature is enabled (it could be disabled 
//        by the host through ClearFeature request) */
//    if (pInformation->Current_Feature & 0x20) 
//    {      
//      /* Exit low power mode and re-configure clocks */
//      Resume(RESUME_INTERNAL);
//      
//  #ifdef STM32F10X_CL
//      /* Send resume signaling to the host */    
//      Resume(RESUME_ESOF);
//      
//      mDELAY(3);
//      /* Stop resume signaling to the host */
//      Resume(RESUME_ESOF);
//  #endif /* STM32F10X_CL */
//    }
//  
//    /* Clear the EXTI line pending bit */
//    EXTI_ClearITPendingBit(KEY_BUTTON_EXTI_LINE);
//  }
//}

//#ifdef STM32F10X_CL
///*******************************************************************************
//* Function Name  : OTG_FS_WKUP_IRQHandler
//* Description    : This function handles OTG WakeUp interrupt request.
//* Input          : None
//* Output         : None
//* Return         : None
//*******************************************************************************/
//void OTG_FS_WKUP_IRQHandler(void)
//{
//  /* Initiate external resume sequence (1 step) */
//  Resume(RESUME_EXTERNAL);  
//
//  EXTI_ClearITPendingBit(EXTI_Line18);
//}
//#else 
///*******************************************************************************
//* Function Name  : USBWakeUp_IRQHandler
//* Description    : This function handles USB WakeUp interrupt request.
//* Input          : None
//* Output         : None
//* Return         : None
//*******************************************************************************/
//void USBWakeUp_IRQHandler(void)
//{
// //EXTI_ClearITPendingBit(EXTI_Line18);
//}
//#endif /* STM32F10X_CL */


//#ifdef STM32F10X_CL
///*******************************************************************************
//* Function Name  : OTG_FS_IRQHandler
//* Description    : This function handles USB-On-The-Go FS global interrupt request.
//* Input          : None
//* Output         : None
//* Return         : None
//*******************************************************************************/
//void OTG_FS_IRQHandler(void)
//{
//  STM32_PCD_OTG_ISR_Handler(); 
//}
//#endif /* STM32F10X_CL */

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
