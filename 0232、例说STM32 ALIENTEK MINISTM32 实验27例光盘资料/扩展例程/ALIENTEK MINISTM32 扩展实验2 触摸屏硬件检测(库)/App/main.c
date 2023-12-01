/**********************************************
File Name: ALIENTEK MINISTM32 À©Õ¹ÊµÑé2 ´¥ÃşÆÁÓ²¼ş¼ì²â(¿â)
Revision:
Corporation:
Microcontroller Corporation:ST
Microcontroller name:STM32F103RBT6 ARM
Compiler: Keil MDK_ARM 4.11
Author: moweidong
E-mail: moweidongsabbit@21cn.com
Date : 2010.12.05
*********************************************/
//·ÂÕæÒÇÆ÷Éè±¸:
//ALIENTEK_MiniSTM32_REVB0¿ª·¢°å
//JLINK V7
/*********************************************
//¿â
//CMSIS:V1.20
//STM32F10x_StdPeriph_Driver:V3.1.1
*********************************************/

//±¾³ÌĞòÊ¹ÓÃÁËprintfÓÃÓÚÔÚLCDºÍ´®¿ÚÏÔÊ¾Êı¾İ,ÒòĞ©¶ÔOption for TargetÊôĞÔÓĞÈçÏÂ¸ü¸Ä
//TargetÑ¡ÏîÒ³:¹´ÖĞUse MicroLIB(Ê¹ÓÃÎ¢¿â)

//LED0:PA8
//LED1:PD2

//×¢Òâ:ÔÚ½ûÓÃJTAG½Óºóºó¿ÉÕâÑù»Ö¸´:
//1.ÉèÖÃKEILÎªJTAG»òSWÏÂÔØÄ£Ê½
//2.¸ø°åÉÏµç,°´ÏÂ°åÉÏµÄ¸´Î»°´¼ü²»·Å,µã»÷KEILÏÂµÄFLASHÏÂÔØ°´Å¥,Ê¹JTAG»òSWÏÂÔØ¹¤¾ß¼ì²âÍê³É½Ó¿ÚºóÁ¢¿Ì·Å¿ª,
//´ËÄ¿µÄÔÚÓÚÕùÈ¡ICÔÚÉÏµçµÄÊ±ºòÓĞ¿ØÖÆÈ¨,Ê¹ÔÚÎ´½øÈë½ûÓÃJTAG»òSWÉúĞ§µÄÊ±ºòÈ¡¿É¿ØÖÆIC½øĞĞÉÕÂ¼

//Ê¹ÓÃJLINK  JTAG·½Ê½ÏÂÔØ³ÌĞòºóÇë°ÑJLINK°Î×ß

#include "stm32f10x.h"
#include "LCD.h"
//#include "USART.h"
#include "eval.h"
#include "SysTickDelay.h"
#include "UART_INTERFACE.h"
#include "touch.h"

#include <stdio.h>


extern void Convert_Pos(void);           //½á¹û×ª»»º¯Êı



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
	//GPIO_Init(GPIOA, &GPIO_InitStructure);

	/* Initialize LEDs and Key Button mounted on STM3210X-EVAL board */       
	STM_EVAL_LEDInit(LED1);
	STM_EVAL_LEDInit(LED2);
	}

//ÏµÍ³ÖĞ¶Ï¹ÜÀí
void NVIC_Configuration(void)
	{ 
	//NVIC_InitTypeDef NVIC_InitStructure;

	/* Configure the NVIC Preemption Priority Bits */  
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_0);	//ÉèÖÃÓÅÏÈ¼¶·Ö×é£ºÏÈÕ¼ÓÅÏÈ¼¶0Î»,´ÓÓÅÏÈ¼¶4Î»
	
	//ÉèÖÃÏòÁ¿±íµÄÎ»ÖÃºÍÆ«ÒÆ
	#ifdef  VECT_TAB_RAM  
		/* Set the Vector Table base location at 0x20000000 */ 
		NVIC_SetVectorTable(NVIC_VectTab_RAM, 0x0); 		//ÏòÁ¿±íÎ»ÓÚRAM
	#else  /* VECT_TAB_FLASH  */
		/* Set the Vector Table base location at 0x08000000 */ 
		NVIC_SetVectorTable(NVIC_VectTab_FLASH, 0x0);   //ÏòÁ¿±íÎ»ÓÚFLASH
	#endif
	}

//ÅäÖÃÏµÍ³Ê±ÖÓ,Ê¹ÄÜ¸÷ÍâÉèÊ±ÖÓ
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
	

//ÅäÖÃËùÓĞÍâÉè
void Init_All_Periph(void)
	{
	
	RCC_Configuration();	
	
	NVIC_Configuration();

	GPIO_Configuration();
	
	//USART1_Configuration();
	USART_Configuration(9600);
	
    LCD_Init();    		//TFTLCDÒº¾§³õÊ¼»¯
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

void Load_Drow_Dialog(void)
	{
	LCD_Clear(WHITE);//ÇåÆÁ   
	POINT_COLOR=BLUE;//ÉèÖÃ×ÖÌåÎªÀ¶É« 
	LCD_ShowString(216,0,"RST");//ÏÔÊ¾ÇåÆÁÇøÓò
	POINT_COLOR=RED;//ÉèÖÃ»­±ÊÀ¶É« 
	}


//·µ»Ø°´¼üÖµ
//0£¬Ã»ÓĞÈÎºÎ°´¼ü°´ÏÂ
//1£¬KEY0°´ÏÂ
//2£¬KEY1°´ÏÂ
//3£¬KEY2°´ÏÂ WK_UP
//×¢Òâ´Ëº¯ÊıÓĞÏìÓ¦ÓÅÏÈ¼¶,KEY0>KEY1>KEY2!!
u8 KEY_Scan(void)
	{	 
	static u8 key_up=1;//°´¼ü°´ËÉ¿ª±êÖ¾	
	//JTAG_Set(JTAG_SWD_DISABLE);
	if(key_up&&((STM_EVAL_PBGetState(Button_KEY0) == 0x00)||(STM_EVAL_PBGetState(Button_KEY1) == 0x00)||(STM_EVAL_PBGetState(Button_WAKEUP) == 0x01)))
		{
		delay_ms(10);//È¥¶¶¶¯ 
		key_up=0;
		if (STM_EVAL_PBGetState(Button_KEY0) == 0x00)		//°´¼ü°´ÏÂ:µÍµçÆ½ÓĞĞ§
			{
			//JTAG_Set(SWD_ENABLE);
			return 1;
			}
		if (STM_EVAL_PBGetState(Button_KEY1) == 0x00)		//°´¼ü°´ÏÂ:µÍµçÆ½ÓĞĞ§
			{
			//JTAG_Set(SWD_ENABLE);
			return 2;
			}
		if (STM_EVAL_PBGetState(Button_WAKEUP) == 0x01)		//°´¼ü°´ÏÂ:¸ßµçÆ½ÓĞĞ§
			{
			//JTAG_Set(SWD_ENABLE);
			return 3;
			}
		}
		else if((STM_EVAL_PBGetState(Button_KEY0) == 0x01)&&(STM_EVAL_PBGetState(Button_KEY1) == 0x01)&&(STM_EVAL_PBGetState(Button_WAKEUP) == 0x00)) key_up=1; 	    
	//JTAG_Set(SWD_ENABLE);
	return 0;// ÎŞ°´¼ü°´ÏÂ
	}




int main(void)
	{ 
	GPIO_InitTypeDef GPIO_InitStructure; 
	u8 key;
	u8 i=0;	
	Init_All_Periph();
	SysTick_Initaize();
	/* Disable the Serial Wire Jtag Debug Port SWJ-DP */
	//GPIO_PinRemapConfig(GPIO_Remap_SWJ_Disable, ENABLE);	//SWJÍêÈ«Ê§ÄÜ(JTAG+SW-DP)
	/* Disable the Serial Wire Jtag Debug Port SWJ-DP */
	GPIO_PinRemapConfig(GPIO_Remap_SWJ_JTAGDisable , ENABLE);	//JTAG-DP Ê§ÄÜ + SW-DPÊ¹ÄÜ 
	STM_EVAL_PBInit(Button_KEY0, Mode_GPIO);			//ÉèÖÃ°´¼üGPIOÊôĞÔ
	STM_EVAL_PBInit(Button_KEY1, Mode_GPIO);			//ÉèÖÃ°´¼üGPIOÊôĞÔ
	STM_EVAL_PBInit(Button_WAKEUP, Mode_GPIO);			//ÉèÖÃ°´¼üGPIOÊôÔ
	//KEY_Init();
	STM_EVAL_LEDOff(LED1);
	STM_EVAL_LEDOff(LED2);
	
	POINT_COLOR=RED;//ÉèÖÃ×ÖÌåÎªÀ¶É«	   
	LCD_ShowString(60,50,"Mini STM32");	
	LCD_ShowString(60,70,"TOUCH TEST");	
	LCD_ShowString(60,90,"ATOM@ALIENTEK");
	LCD_ShowString(60,110,"2010/6/13");	
	LCD_ShowString(60,130,"Press KEY0 to Adjust");	
	Touch_Init();
	delay_ms(1500);
	Load_Drow_Dialog();
	while(1)
		{	
		key=KEY_Scan();
		if(Pen_Point.Key_Sta==Key_Down)//´¥ÃşÆÁ±»°´ÏÂ
			{
			Pen_Int_Set(0);//¹Ø±ÕÖĞ¶Ï
			do
				{
				Convert_Pos();
				LCD_ShowNum(100,100,Pen_Point.X,4,16);//ÏÔÊ¾ÊıÖµ
				LCD_ShowNum(100,120,Pen_Point.Y,4,16);//ÏÔÊ¾ÊıÖµ	   
				Pen_Point.Key_Sta=Key_Up;
				if(Pen_Point.X0>216&&Pen_Point.Y0<16)Load_Drow_Dialog();//Çå³ı
				else 
					{
					Draw_Big_Point(Pen_Point.X0,Pen_Point.Y0);//»­Í¼	    
					//GPIOC->ODR|=1<<1;    //PC1 ÉÏÀ­
					GPIO_InitStructure.GPIO_Pin = GPIO_Pin_1;
					GPIO_InitStructure.GPIO_Mode =GPIO_Mode_IPD;//ÉÏÀ­ÊäÈë
					GPIO_Init(GPIOC, &GPIO_InitStructure);
					}
				}while(TOUCH_PEN==0);//Èç¹ûPENÒ»Ö±ÓĞĞ§,ÔòÒ»Ö±Ö´ĞĞ
			
			Pen_Int_Set(1);//¿ªÆôÖĞ¶Ï
			}else delay_ms(1);
		if(key==1)//KEY0°´ÏÂ,ÔòÖ´ĞĞĞ£×¼³ÌĞò
			{
			LCD_Clear(WHITE);//ÇåÆÁ
			Touch_Adjust();  //ÆÁÄ»Ğ£×¼ 
			Save_Adjdata();	 
			Load_Drow_Dialog();
			}
		i++;
		if(i==200)
			{
			i=0;
			STM_EVAL_LEDToggle(LED1);
			}
		};	   		 
	
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





