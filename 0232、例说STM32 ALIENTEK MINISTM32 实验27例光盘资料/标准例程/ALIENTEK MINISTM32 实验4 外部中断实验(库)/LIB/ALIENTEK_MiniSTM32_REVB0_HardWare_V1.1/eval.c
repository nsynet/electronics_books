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
	RCC_APB2PeriphClockCmd(COM_POR_CLK[COM] | RCC_APB2Periph_AFIO, ENABLE);		//ʹ�ܴ�������GPIOģ��ʱ��,��ʹ��AFIOģ��ʱ��
	
	/* Enable UART clock */
	if (COM == COM1)
		{
		RCC_APB2PeriphClockCmd(COM_USART_CLK[COM], ENABLE); 	//ʹ�ܴ���ģ��ʱ��
		}
	else
		{
		RCC_APB1PeriphClockCmd(COM_USART_CLK[COM], ENABLE);		//ʹ�ܴ���ģ��ʱ��
		}	
	
	/* Configure USART Tx as alternate function push-pull */
	GPIO_InitStructure.GPIO_Pin = COM_TX_PIN[COM];		//����TX����
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;		//�����������
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(COM_PORT[COM], &GPIO_InitStructure);
	
	/* Configure USART Rx as input floating */
	GPIO_InitStructure.GPIO_Pin = COM_RX_PIN[COM];		//����RX����
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;		//��������
	GPIO_Init(COM_PORT[COM], &GPIO_InitStructure);
	
	/* USART configuration */
	USART_Init(COM_USART[COM], USART_InitStruct);		//��ʼ��USART
	
	/* Enable USART */
	USART_Cmd(COM_USART[COM], ENABLE);		//ʹ�ܴ���ģ��
	}


void STM_EVAL_SendChar(COM_TypeDef COM,uint16_t ch)
	{
	/* e.g. write a character to the USART */
	USART_SendData(COM_USART[COM], (uint8_t) ch);
	
	/* Loop until the end of transmission */
	while (USART_GetFlagStatus(COM_USART[COM], USART_FLAG_TC) == RESET) {}	
		
	}

void USART_RX_IntteruptEnable(COM_TypeDef COM)		//�����ж�ʹ��
	{
	USART_ITConfig(COM_USART[COM], USART_IT_RXNE, ENABLE);	 //�ж�ʹ��
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
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP; 		 //�������
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
	GPIO_PORT[Led]->BRR = GPIO_PIN[Led];		//���
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
	GPIO_PORT[Led]->BSRR = GPIO_PIN[Led]; 		//��λ
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
	GPIO_PORT[Led]->ODR ^= GPIO_PIN[Led];		//ȡ������Ĵ�������
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
void STM_EVAL_PBInit(Button_TypeDef Button, Button_Mode_TypeDef Button_Mode)  //���ð�������
	{
	GPIO_InitTypeDef GPIO_InitStructure;
	EXTI_InitTypeDef EXTI_InitStructure;
	NVIC_InitTypeDef NVIC_InitStructure;
	
	/* Enable Button GPIO clock */
	RCC_APB2PeriphClockCmd(BUTTON_CLK[Button] | RCC_APB2Periph_AFIO, ENABLE);			//ʹ�ܰ�������GPIOʱ��,ͬʱʹ��AFIOʱ��(��Ҫ�����ⲿ�жϼĴ���)
	
	/* Configure Button pin as input floating */
	GPIO_InitStructure.GPIO_Pin = BUTTON_PIN[Button];			//���ð�������������
	if(Button==Button_WAKEUP)	 //WAKE_UP����,PA0,�ߵ�ƽ��Ч,������������������
		{
	    GPIO_InitStructure.GPIO_Mode =GPIO_Mode_IPD;//��������
		}
	else if(Button==Button_KEY0)  //KEY0����,PA13 JTMS,�ߵ�ƽ��Ч,������������������
		{
		//ʹ��ǰ��ѡ��ֹJTAGʹ�ô�����
	  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;//�������� 
		}
	else if(Button==Button_KEY1)  //WAKE_UP����PA15 JTDI,�ߵ�ƽ��Ч,������������������
		{
		//ʹ��ǰ��ѡ��ֹJTAGʹ�ô�����
		GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;//�������� 
		}
	
	GPIO_Init(BUTTON_PORT[Button], &GPIO_InitStructure);	//��ʼ����������GPIO�Ĵ���״̬
	
	if (Button_Mode == Mode_EXTI)			//ʹ���ⲿ�жϷ�ʽ
		{
		/* Connect Button EXTI Line to Button GPIO Pin */
		GPIO_EXTILineConfig(BUTTON_PORT_SOURCE[Button], BUTTON_PIN_SOURCE[Button]);  	//ѡ�񰴼����ڵ�GPIO�ܽ������ⲿ�ж���·
		
		/* Configure Button EXTI line */
		EXTI_InitStructure.EXTI_Line = BUTTON_EXTI_LINE[Button];	//���ð������е��ⲿ��·
		EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;			//�����ⲿ�ж�ģʽ:EXTI��·Ϊ�ж�����
		
		if(Button != Button_WAKEUP)		//�ж���ʲô����
			{
			EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Falling;  //�ⲿ�жϴ�����ѡ��:����������·�½���Ϊ�ж�����
			}
		else
			{
			EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Rising;  //�ⲿ�жϴ�����ѡ��:����������·��������Ϊ�ж�����
			}
		EXTI_InitStructure.EXTI_LineCmd = ENABLE;		//ʹ���ⲿ�ж���״̬
		EXTI_Init(&EXTI_InitStructure);		//����EXTI_InitStruct��ָ���Ĳ�����ʼ������EXTI�Ĵ���
		
		/* Enable and set Button EXTI Interrupt to the lowest priority */
		NVIC_InitStructure.NVIC_IRQChannel = BUTTON_IRQn[Button];			//ʹ�ܰ������ڵ��ⲿ�ж�ͨ��
		NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0x0F;	//��ռ���ȼ�4λ,��16��
		NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0x0F;					//��ռ���ȼ�0λ,�����ȼ�4λ
		NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;								//ʹ���ⲿ�ж�ͨ��
		
		NVIC_Init(&NVIC_InitStructure); 	//����NVIC_InitStruct��ָ���Ĳ�����ʼ������NVIC�Ĵ���
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
	return GPIO_ReadInputDataBit(BUTTON_PORT[Button], BUTTON_PIN[Button]);		//���ذ������˿ڵ�ƽ״̬
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
