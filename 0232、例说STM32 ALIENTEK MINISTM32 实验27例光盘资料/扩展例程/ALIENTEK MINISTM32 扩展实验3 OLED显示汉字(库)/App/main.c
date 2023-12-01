/**********************************************
File Name:ALIENTEK MINISTM32 ��չʵ��3 OLED��ʾ����(��)
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

//ʹ��JLINK  JTAG��ʽ���س�������JLINK����

#include "stm32f10x.h"
//#include "LCD.h"    //LCD.c�ļ���Ҫ�������˹�����Ŀ�б���,���򱨴�
//#include "USART.h"
#include "eval.h"
#include "SysTickDelay.h"
#include "UART_INTERFACE.h"
#include "oledhz.h"	
#include "oled.h" 
#include <stdio.h>


//#ifdef LCD_Debug
#ifdef __GNUC__
  /* With GCC/RAISONANCE, small printf (option LD Linker->Libraries->Small printf
     set to 'Yes') calls __io_putchar() */
  #define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
#else
  #define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
#endif /* __GNUC__ */

//#endif




//extern unsigned int Ypos;
//extern unsigned int Xpos;
////extern const unsigned short ASCII_Table[];
//extern unsigned short ASCII_Table[];

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




//#define SCREEN_WIDTH       320                 /* Screen Width (in pixels)           */
//#define SCREEN_HEIGHT      240                 /* Screen Hight (in pixels)           */
//#define SCREEN_BPP         16                  /* Bits per pixel                     */
//#define SCREEN_BYPP        ((SCREEN_BPP+7)/8)         /* Bytes per pixel                    */
///**
//  * @brief  Retargets the C library printf function to the USART.
//  * @param  None
//  * @retval None
//  */
//PUTCHAR_PROTOTYPE
//	{
//	uint8_t Ascii;
//	/* Place your implementation of fputc here */
//	/* e.g. write a character to the USART */
//	//USART_SendData(EVAL_COM1, (uint8_t) ch);
//	//STM_EVAL_SendChar(USED_COM_NUMBER,(uint8_t) ch);
//
//	/* Loop until the end of transmission */
//	//while (USART_GetFlagStatus(EVAL_COM1, USART_FLAG_TC) == RESET) {}
//	
//	Ascii = ch-32;
//	switch(ch)
//		{
//		case('\n'):
//			Xpos=319;
//			//Xpos=SCREEN_WIDTH-SCREEN_BPP;
//			Ypos+=24;
//			if(Ypos>Line9)  //Line9
//				{
//				Ypos=Line0;
//				GLCD_Clear(White);
//				}
//			break;
//		case('\r'):
//			Xpos=319;
//			//Xpos=SCREEN_WIDTH-SCREEN_BPP;
//			break;
//		case('\b'):
//			Xpos+=16;
//			if(Xpos>319)
//			//if(Xpos>SCREEN_WIDTH-SCREEN_BPP)
//				{
//				Xpos=15;
//				if(Ypos>0)
//					Ypos-=24;		   
//				}
//			break;
//		default:
//			if(Xpos==0xffff)
//				{
//				Xpos=319;
//				//Xpos=SCREEN_WIDTH-SCREEN_BPP;
//				Ypos+=24;
//				}
//			if(Ypos>Line9) //Line9
//				{
//				Ypos=Line0;
//				GLCD_Clear(White);
//				}
//			GLCD_DrawChar(Ypos, Xpos, &ASCII_Table[Ascii * 24]);
//			Xpos-=16;
//			break;
//		}
//	GLCD_SetCursor(Xpos,Ypos);
//	return ch;
//	}


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
	}
	


//void InitDis(void) 
//	{
//	/* LCD Module init */
//	GLCD_Init();
//	GLCD_Clear(White);
//	GLCD_SetTextColor(Blue);
//	//GLCD_DisplayStringLine(Line1, "     FireBull-EVAL");
//	printf("FireBull-EVAL  \n");
//	printf("FireBoardKitTemplate\n");
//	printf("123456789ABCDEFGHIJK\n");  //��ʾ�������ܳ���һ�����ֵ
//	GLCD_SetTextColor(Red);
//	//GLCD_Clear(White);
//	GLCD_WindowModeDisable();
//	GLCD_DrawLine(0,0,200,0);	 //����,�����Ͻ���ʼ������Ϊ200�������ˮƽ��
//	GLCD_DrawLine(0,0,200,1);	 //����,�����Ͻ���ʼ������Ϊ200������Ĵ�ֱ��
//	GLCD_SetTextColor(Green);
//	GLCD_DrawLine(160,60,20,1);   //����
//	GLCD_SetTextColor(Black);
//	GLCD_DrawRect(150,150,50,50);    //������
//	GLCD_SetTextColor(Blue);
//	GLCD_DrawCircle(200,150,40);   //��Բ
//	GLCD_SetTextColor(Blue);
//	}





//������������
void Init_All_Periph(void)
	{
	
	RCC_Configuration();	
	
	NVIC_Configuration();

	GPIO_Configuration();
	
	//USART1_Configuration();
	USART_Configuration(9600);
	

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
	SysTick_Initaize();
	
	OLED_Init();			//��ʼ��Һ��     
	OLED_Refresh_Gram();	 				    		  
	OLED_ShowString22(20,10,"ALIENTEK");
	OLED_ShowString22(4,32,"STM32"); 
	OLED_ShowFont22(59,32,0,1);
	OLED_ShowFont22(81,32,1,1);
	OLED_ShowFont22(103,32,2,1);
	OLED_Refresh_Gram();	 
	
	while(1) 
		{	
		delay_ms(300);
		STM_EVAL_LEDToggle(LED1);
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





