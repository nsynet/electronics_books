/**
  ******************************************************************************
  * @file    stm32_eval.c
  * @author  MCD Application Team
  * @version V3.1.0
  * @date    06/19/2009
  * @brief   This file provides firmware functions to manage Leds, push-buttons 
  *          and COM ports available on STM32 Evaluation Boards from STMicroelectronics.
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
#include "EVAL.h"







GPIO_TypeDef* GPIO_PORT[LEDn] = {LED1_GPIO_PORT, LED2_GPIO_PORT};
const uint16_t GPIO_PIN[LEDn] = {LED1_GPIO_PIN, LED2_GPIO_PIN};
const uint32_t GPIO_CLK[LEDn] = {LED1_GPIO_CLK, LED2_GPIO_CLK};
                                 





GPIO_TypeDef* BUTTON_PORT[BUTTONn] = {BUTTON0_PORT, BUTTON1_PORT, WAKEUP_BUTTON_PORT}; 

const uint16_t BUTTON_PIN[BUTTONn] = {BUTTON0_PIN, BUTTON1_PIN ,WAKEUP_BUTTON_PIN}; 

const uint32_t BUTTON_CLK[BUTTONn] = {BUTTON0_CLK, BUTTON1_CLK, WAKEUP_BUTTON_CLK}; 

const uint16_t BUTTON_EXTI_LINE[BUTTONn] = {BUTTON0_EXTI_LINE, BUTTON1_EXTI_LINE, WAKEUP_BUTTON_EXTI_LINE}; 

const uint16_t BUTTON_PORT_SOURCE[BUTTONn] = {BUTTON0_PORT_SOURCE, BUTTON1_PORT_SOURCE, WAKEUP_BUTTON_PORT_SOURCE}; 
							 
const uint16_t BUTTON_PIN_SOURCE[BUTTONn] = {BUTTON0_PIN_SOURCE, BUTTON1_PIN_SOURCE ,WAKEUP_BUTTON_PIN_SOURCE}; 
const uint16_t BUTTON_IRQn[BUTTONn] =	{BUTTON0_IRQn, BUTTON1_IRQn ,WAKEUP_BUTTON_IRQn};                                 






USART_TypeDef* COM_USART[COMn] = {EVAL_COM1,EVAL_COM2}; 

GPIO_TypeDef* COM_PORT[COMn] = {EVAL_COM1_GPIO,EVAL_COM2_GPIO};

const uint32_t COM_USART_CLK[COMn] = {EVAL_COM1_CLK,EVAL_COM2_CLK};

const uint32_t COM_POR_CLK[COMn] = {EVAL_COM1_GPIO_CLK,EVAL_COM2_GPIO_CLK};

const uint16_t COM_TX_PIN[COMn] = {EVAL_COM1_TxPin,EVAL_COM2_TxPin};

const uint16_t COM_RX_PIN[COMn] = {EVAL_COM1_RxPin,EVAL_COM2_RxPin};

/**
  * @brief  Configures COM port.
  * @param  COM: Specifies the COM port to be configured.
  *   This parameter can be one of following parameters:    
  *     @arg COM1
  *     @arg COM2  
  * @param  USART_InitStruct: pointer to a USART_InitTypeDef structure that
  *   contains the configuration information for the specified USART peripheral.
  * @retval None
  */
void STM_EVAL_COMInit(COM_TypeDef COM, USART_InitTypeDef* USART_InitStruct)
	{
	GPIO_InitTypeDef GPIO_InitStructure;
	
	/* Enable GPIO clock */
	RCC_APB2PeriphClockCmd(COM_POR_CLK[COM] | RCC_APB2Periph_AFIO, ENABLE);		//使能串口所有GPIO模块时钟,并使能AFIO模块时钟
	
	/* Enable UART clock */
	if (COM == COM1)
		{
		RCC_APB2PeriphClockCmd(COM_USART_CLK[COM], ENABLE); 	//使能串口模块时钟
		}
	else
		{
		RCC_APB1PeriphClockCmd(COM_USART_CLK[COM], ENABLE);		//使能串口模块时钟
		}	
	
	/* Configure USART Tx as alternate function push-pull */
	GPIO_InitStructure.GPIO_Pin = COM_TX_PIN[COM];		//设置TX引脚
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;		//复用推挽输出
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(COM_PORT[COM], &GPIO_InitStructure);
	
	/* Configure USART Rx as input floating */
	GPIO_InitStructure.GPIO_Pin = COM_RX_PIN[COM];		//设置RX引脚
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;		//浮空输入
	GPIO_Init(COM_PORT[COM], &GPIO_InitStructure);
	
	/* USART configuration */
	USART_Init(COM_USART[COM], USART_InitStruct);		//初始化USART
	
	/* Enable USART */
	USART_Cmd(COM_USART[COM], ENABLE);		//使能串口模块
	}


void STM_EVAL_SendChar(COM_TypeDef COM,uint16_t ch)
	{
	/* e.g. write a character to the USART */
	USART_SendData(COM_USART[COM], (uint8_t) ch);
	
	/* Loop until the end of transmission */
	while (USART_GetFlagStatus(COM_USART[COM], USART_FLAG_TC) == RESET) {}	
		
	}

void USART_RX_IntteruptEnable(COM_TypeDef COM)		//接收中断使能
	{
	USART_ITConfig(COM_USART[COM], USART_IT_RXNE, ENABLE);	 //中断使能
	}

/**
  * @brief  Configures LED GPIO.
  * @param  Led: Specifies the Led to be configured. 
  *   This parameter can be one of following parameters:
  *     @arg LED1
  *     @arg LED2
  *     @arg LED3
  *     @arg LED4
  * @retval None
  */
void STM_EVAL_LEDInit(Led_TypeDef Led)
	{
	GPIO_InitTypeDef  GPIO_InitStructure;
	
	/* Enable the GPIO_LED Clock */
	RCC_APB2PeriphClockCmd(GPIO_CLK[Led], ENABLE);
	
	/* Configure the GPIO_LED pin */
	GPIO_InitStructure.GPIO_Pin = GPIO_PIN[Led];
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP; 		 //推挽输出
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	
	GPIO_Init(GPIO_PORT[Led], &GPIO_InitStructure);
	}

/**
  * @brief  Turns selected LED On.
  * @param  Led: Specifies the Led to be set on. 
  *   This parameter can be one of following parameters:
  *     @arg LED1
  *     @arg LED2
  *     @arg LED3
  *     @arg LED4  
  * @retval None
  */
void STM_EVAL_LEDOn(Led_TypeDef Led)
	{
	GPIO_PORT[Led]->BRR = GPIO_PIN[Led];		//清除
	}

/**
  * @brief  Turns selected LED Off.
  * @param  Led: Specifies the Led to be set off. 
  *   This parameter can be one of following parameters:
  *     @arg LED1
  *     @arg LED2
  *     @arg LED3
  *     @arg LED4 
  * @retval None
  */
void STM_EVAL_LEDOff(Led_TypeDef Led)
	{
	GPIO_PORT[Led]->BSRR = GPIO_PIN[Led]; 		//置位
	}

/**
  * @brief  Toggles the selected LED.
  * @param  Led: Specifies the Led to be toggled. 
  *   This parameter can be one of following parameters:
  *     @arg LED1
  *     @arg LED2
  *     @arg LED3
  *     @arg LED4  
  * @retval None
  */
void STM_EVAL_LEDToggle(Led_TypeDef Led)
	{
	GPIO_PORT[Led]->ODR ^= GPIO_PIN[Led];		//取反输出寄存器数据
	}          


/**
  * @brief  Configures Button GPIO and EXTI Line.
  * @param  Button: Specifies the Button to be configured.
  *   This parameter can be one of following parameters:   
  *     @arg Button_WAKEUP: Wakeup Push Button
  *     @arg Button_TAMPER: Tamper Push Button  
  *     @arg Button_KEY: Key Push Button 
  *     @arg Button_RIGHT: Joystick Right Push Button 
  *     @arg Button_LEFT: Joystick Left Push Button 
  *     @arg Button_UP: Joystick Up Push Button 
  *     @arg Button_DOWN: Joystick Down Push Button
  *     @arg Button_SEL: Joystick Sel Push Button
  * @param  Button_Mode: Specifies Button mode.
  *   This parameter can be one of following parameters:   
  *     @arg Mode_GPIO: Button will be used as simple IO 
  *     @arg Mode_EXTI: Button will be connected to EXTI line with interrupt
  *                     generation capability  
  * @retval None
  */
void STM_EVAL_PBInit(Button_TypeDef Button, Button_Mode_TypeDef Button_Mode)  //设置按键功能
	{
	GPIO_InitTypeDef GPIO_InitStructure;
	EXTI_InitTypeDef EXTI_InitStructure;
	NVIC_InitTypeDef NVIC_InitStructure;
	
	/* Enable Button GPIO clock */
	RCC_APB2PeriphClockCmd(BUTTON_CLK[Button] | RCC_APB2Periph_AFIO, ENABLE);			//使能按键所在GPIO时钟,同时使能AFIO时钟(需要设置外部中断寄存器)
	
	/* Configure Button pin as input floating */
	GPIO_InitStructure.GPIO_Pin = BUTTON_PIN[Button];			//设置按键盘所在引脚
	if(Button==Button_WAKEUP)	 //WAKE_UP按键,PA0,高电平有效,输入引脚需下拉设置
		{
	    GPIO_InitStructure.GPIO_Mode =GPIO_Mode_IPD;//上拉输入
		}
	else if(Button==Button_KEY0)  //KEY0按键,PA13 JTMS,高电平有效,输入引脚需下拉设置
		{
		//使用前请选禁止JTAG使用此引脚
	  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;//上拉输入 
		}
	else if(Button==Button_KEY1)  //WAKE_UP按键PA15 JTDI,高电平有效,输入引脚需下拉设置
		{
		//使用前请选禁止JTAG使用此引脚
		GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;//上拉输入 
		}
	
	GPIO_Init(BUTTON_PORT[Button], &GPIO_InitStructure);	//初始化按键所在GPIO寄存器状态
	
	if (Button_Mode == Mode_EXTI)			//使用外部中断方式
		{
		/* Connect Button EXTI Line to Button GPIO Pin */
		GPIO_EXTILineConfig(BUTTON_PORT_SOURCE[Button], BUTTON_PIN_SOURCE[Button]);  	//选择按键所在的GPIO管脚用作外部中断线路
		
		/* Configure Button EXTI line */
		EXTI_InitStructure.EXTI_Line = BUTTON_EXTI_LINE[Button];	//设置按键所有的外部线路
		EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;			//设外外部中断模式:EXTI线路为中断请求
		
		if(Button != Button_WAKEUP)		//判断是什么按键
			{
			EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Falling;  //外部中断触发沿选择:设置输入线路下降沿为中断请求
			}
		else
			{
			EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Rising;  //外部中断触发沿选择:设置输入线路上升降沿为中断请求
			}
		EXTI_InitStructure.EXTI_LineCmd = ENABLE;		//使能外部中断新状态
		EXTI_Init(&EXTI_InitStructure);		//根据EXTI_InitStruct中指定的参数初始化外设EXTI寄存器
		
		/* Enable and set Button EXTI Interrupt to the lowest priority */
		NVIC_InitStructure.NVIC_IRQChannel = BUTTON_IRQn[Button];			//使能按键所在的外部中断通道
		NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0x0F;	//先占优先级4位,共16级
		NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0x0F;					//先占优先级0位,从优先级4位
		NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;								//使能外部中断通道
		
		NVIC_Init(&NVIC_InitStructure); 	//根据NVIC_InitStruct中指定的参数初始化外设NVIC寄存器
		}
	}

/**
  * @brief  Returns the selected Button state.
  * @param  Button: Specifies the Button to be checked.
  *   This parameter can be one of following parameters:    
  *     @arg Button_WAKEUP: Wakeup Push Button
  *     @arg Button_TAMPER: Tamper Push Button  
  *     @arg Button_KEY: Key Push Button 
  *     @arg Button_RIGHT: Joystick Right Push Button 
  *     @arg Button_LEFT: Joystick Left Push Button 
  *     @arg Button_UP: Joystick Up Push Button 
  *     @arg Button_DOWN: Joystick Down Push Button
  *     @arg Button_SEL: Joystick Sel Push Button    
  * @retval The Button GPIO pin value.
  */
uint32_t STM_EVAL_PBGetState(Button_TypeDef Button)
	{
	return GPIO_ReadInputDataBit(BUTTON_PORT[Button], BUTTON_PIN[Button]);		//返回按键所端口电平状态
	}



	
/**
  * @}
  */ 


/**
  * @}
  */ 

/**
  * @}
  */ 
/******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/
