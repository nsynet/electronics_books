/**********************************************
File Name: ALIENTEK MINISTM32 ʵ��15 DMAʵ��(��)
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

//�˳���ʹ����LCD��Ϊ��ʾ,�������JLINK JTAG���ص�,������������JLIN����

#include "stm32f10x.h"
#include "LCD.h"
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
u8 SendBuff[5200];
const u8 TEXT_TO_SEND[]={"ALIENTEK MiniSTM32 DMA ����ʵ��"};
DMA_InitTypeDef DMA_InitStructure;

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

//ϵͳ�жϹ���
void NVIC_Configuration(void)
	{ 
	//NVIC_InitTypeDef NVIC_InitStructure;

	/* Configure the NVIC Preemption Priority Bits */  
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_0);	//�������ȼ����飺��ռ���ȼ�0λ,�����ȼ�4λ
	
	//�����������λ�ú�ƫ��
	#ifdef  VECT_TAB_RAM  
		/* Set the Vector Table base location at 0x20000000 */ 
		NVIC_SetVectorTable(NVIC_VectTab_RAM, 0x0); 		//������λ��RAM
	#else  /* VECT_TAB_FLASH  */
		/* Set the Vector Table base location at 0x08000000 */ 
		NVIC_SetVectorTable(NVIC_VectTab_FLASH, 0x0);   //������λ��FLASH
	#endif
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
	/* DMA clock enable */
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_DMA1, ENABLE);	//ʹ��DMA����
	}
	





/**
  * @brief  Configures the DMA.
  * @param  None
  * @retval None
  */
void DMA_Configuration(void)
	{
	/* USART1 TX DMA4 Channel Config */
	DMA_DeInit(DMA1_Channel4);   //��DMA��ͨ��1�Ĵ�������Ϊȱʡֵ
	DMA_InitStructure.DMA_PeripheralBaseAddr = (u32)&USART1->DR;  //DMA����ADC����ַ
	DMA_InitStructure.DMA_MemoryBaseAddr = (u32)SendBuff;  //DMA�ڴ����ַ
	DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralDST;  //������Ϊ���ݴ����Ŀ�ĵ�
	DMA_InitStructure.DMA_BufferSize = sizeof(SendBuff);  //DMAͨ����DMA����Ĵ�С
	DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;  //�����ַ�Ĵ�������
	DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;  //�ڴ��ַ�Ĵ�������
	DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;  //���ݿ��Ϊ8λ
	DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte; //���ݿ��Ϊ8λ
	DMA_InitStructure.DMA_Mode = DMA_Mode_Normal;  //��������������ģʽ
	DMA_InitStructure.DMA_Priority = DMA_Priority_Medium; //DMAͨ�� xӵ�������ȼ� 
	DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;  //DMAͨ��xû������Ϊ�ڴ浽�ڴ洫��
	DMA_Init(DMA1_Channel4, &DMA_InitStructure);  //����DMA_InitStruct��ָ���Ĳ�����ʼ��DMA��ͨ��USART1_Tx_DMA_Channel����ʶ�ļĴ���
	}


//������������
void Init_All_Periph(void)
	{
	
	RCC_Configuration();	
	
	NVIC_Configuration();

	GPIO_Configuration();

	DMA_Configuration();
	
	//USART1_Configuration();
	USART_Configuration(9600);
	
	LCD_Init(); 
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

//����������
//���ذ���ֵ
//0��û���κΰ�������
//1��KEY0����
//2��KEY1����
//3��KEY2���� WK_UP
//ע��˺�������Ӧ���ȼ�,KEY0>KEY1>KEY2!!
u8 KEY_Scan(void)
	{	 
	static u8 key_up=1;//�������ɿ���־	
	//JTAG_Set(JTAG_SWD_DISABLE);
	if(key_up&&((STM_EVAL_PBGetState(Button_KEY0) == 0x00)||(STM_EVAL_PBGetState(Button_KEY1) == 0x00)||(STM_EVAL_PBGetState(Button_WAKEUP) == 0x01)))
		{
		delay_ms(10);//ȥ���� 
		key_up=0;
		if (STM_EVAL_PBGetState(Button_KEY0) == 0x00)		//��������:�͵�ƽ��Ч
			{
			//JTAG_Set(SWD_ENABLE);
			return 1;
			}
		if (STM_EVAL_PBGetState(Button_KEY1) == 0x00)		//��������:�͵�ƽ��Ч
			{
			//JTAG_Set(SWD_ENABLE);
			return 2;
			}
		if (STM_EVAL_PBGetState(Button_WAKEUP) == 0x01)		//��������:�ߵ�ƽ��Ч
			{
			//JTAG_Set(SWD_ENABLE);
			return 3;
			}
		}
		else if((STM_EVAL_PBGetState(Button_KEY0) == 0x01)&&(STM_EVAL_PBGetState(Button_KEY1) == 0x01)&&(STM_EVAL_PBGetState(Button_WAKEUP) == 0x00)) key_up=1; 	    
	//JTAG_Set(SWD_ENABLE);
	return 0;// �ް�������
	}

int main(void)
	{ 
	u16 i;
	u8 t=0;
	u8 j,mask=0;
	float pro=0;//���� 
	Init_All_Periph();
	SysTick_Initaize();
	STM_EVAL_PBInit(Button_KEY0, Mode_GPIO);			//���ð���GPIO����
	STM_EVAL_PBInit(Button_KEY1, Mode_GPIO);			//���ð���GPIO����
	STM_EVAL_PBInit(Button_WAKEUP, Mode_GPIO);			//���ð���GPIO����
	STM_EVAL_LEDOff(LED1);
	STM_EVAL_LEDOff(LED2);
	
	POINT_COLOR=RED;//��������Ϊ��ɫ	   
	LCD_ShowString(60,50,"Mini STM32");	
	LCD_ShowString(60,70,"DMA USART TEST");	
	LCD_ShowString(60,90,"ATOM@ALIENTEK");
	LCD_ShowString(60,110,"2010/6/7");
	//��ʾ��ʾ��Ϣ
	LCD_ShowString(60,130,"Press KEY0 To Start!");
	
	j=sizeof(TEXT_TO_SEND);	   
	for(i=0;i<5200;i++)//���ASCII�ַ�������
		{
		if(t>=j)//���뻻�з�
		{
		if(mask)
			{
			SendBuff[i]=0x0a;
			t=0;
			}
		else 
			{
			SendBuff[i]=0x0d;
			mask++;
			}	
		}
		else//����TEXT_TO_SEND���
			{
			mask=0;
			SendBuff[i]=TEXT_TO_SEND[t];
			t++;
			}   	   
		}		 
	POINT_COLOR=BLUE;//��������Ϊ��ɫ	  
	i=0;
	while(1)
		{
		t=KEY_Scan();
		if(t==1)//KEY0����
			{
			LCD_ShowString(60,150,"Start Transimit....");
			LCD_ShowString(60,170,"   %");//��ʾ�ٷֺ�
			printf("\n\nDMA DATA:\n"); 	    
			//USART1->CR3=1<<7;           //ʹ�ܴ���1��DMA���� 
			/* Enable USARTz DMA Rx and TX request */
			USART_DMACmd(USART1, USART_DMAReq_Tx, ENABLE);  //ʹ��UART DAM����
			/* Enable USART1 TX DMA1 Channel */
			DMA_Cmd(DMA1_Channel4, DISABLE );  //�ر�USART1 TX DMA1 ��ָʾ��ͨ��      
		    //DMA_Configuration();
			DMA_InitStructure.DMA_BufferSize = sizeof(SendBuff);  //DMAͨ����DMA����Ĵ�С
			DMA_Init(DMA1_Channel4, &DMA_InitStructure);  //����DMA_InitStruct��ָ���Ĳ�����ʼ��DMA��ͨ��USART1_Tx_DMA_Channel����ʶ�ļĴ���
			DMA_Cmd(DMA1_Channel4, ENABLE);  //ʹ��USART1 TX DMA1 ��ָʾ��ͨ��      
			//MYDMA_Enable(DMA1_Channel4);//��ʼһ��DMA���䣡	  
			//�ȴ�DMA������ɣ���ʱ������������һЩ�£����
			//ʵ��Ӧ���У����������ڼ䣬����ִ�����������
			while(1)
				{
				//if(DMA1->ISR&(1<<13))//�ȴ�ͨ��4�������
				/* Wait until USARTy TX DMA1 Channel Transfer Complete */
				if(DMA_GetFlagStatus(DMA1_FLAG_TC4) == SET)  //���ָ����DMAͨ��x��־λ�������:ͨ��X������ɱ�־
					{
					//DMA1->IFCR|=1<<13;//���ͨ��4������ɱ�־
					/* Clear the DMA Channel3 transfer error interrupt pending bit */ 
					DMA_ClearFlag(DMA1_FLAG_TC4);  //���������ɱ�־
					break; 
					}
				/* Get the number of remaining data units in the current DMA  Channel4 transfer */ 
				//pro=DMA1_Channel4->CNDTR;//�õ���ǰ��ʣ����ٸ�����
				pro = DMA_GetCurrDataCounter(DMA1_Channel4);    //�õ���ǰ��ʣ����ٸ�����
				pro=1-pro/5200;//�õ��ٷֱ�	  
				pro*=100;      //����100��
				LCD_ShowNum(60,170,pro,3,16);	  
				}			    
			LCD_ShowNum(60,170,100,3,16);//��ʾ100%	  
			LCD_ShowString(60,150,"Transimit Finished!");//��ʾ�������
			}
		i++;
		delay_ms(1);
		if(i==200)
			{
			STM_EVAL_LEDToggle(LED1);//��ʾϵͳ��������	
			i=0;
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





