/**********************************************
File Name: ALIENTEK MINISTM32 实验19 无线通信实验(库)
Revision:
Corporation:
Microcontroller Corporation:ST
Microcontroller name:STM32F103RBT6 ARM
Compiler: Keil MDK_ARM 4.11
Author: moweidong
E-mail: moweidongsabbit@21cn.com
Date : 2010.12.09
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

//PA4:NRF_CE
//PC4:NRF_CS
//PC5:NRF_IRQ

//注意:在禁用JTAG接后后可这样恢复:
//1.设置KEIL为JTAG或SW下载模式
//2.给板上电,按下板上的复位按键不放,点击KEIL下的FLASH下载按钮,使JTAG或SW下载工具检测完成接口后立刻放开,
//此目的在于争取IC在上电的时候有控制权,使在未进入禁用JTAG或SW生效的时候取可控制IC进行烧录

//使用JLINK JTAG下载的请在下载完成后拔走JLINK

#include "stm32f10x.h"
#include "LCD.h"
//#include "USART.h"
#include "eval.h"
#include "SysTickDelay.h"
#include "UART_INTERFACE.h"
#include "24l01.h"
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

//返回按键值
//0，没有任何按键按下
//1，KEY0按下
//2，KEY1按下
//3，KEY2按下 WK_UP
//注意此函数有响应优先级,KEY0>KEY1>KEY2!!
u8 KEY_Scan(void)
	{	 
	static u8 key_up=1;//按键按松开标志	
	//JTAG_Set(JTAG_SWD_DISABLE);
	if(key_up&&((STM_EVAL_PBGetState(Button_KEY0) == 0x00)||(STM_EVAL_PBGetState(Button_KEY1) == 0x00)||(STM_EVAL_PBGetState(Button_WAKEUP) == 0x01)))
		{
		delay_ms(10);//去抖动 
		key_up=0;
		if (STM_EVAL_PBGetState(Button_KEY0) == 0x00)		//按键按下:低电平有效
			{
			//JTAG_Set(SWD_ENABLE);
			return 1;
			}
		if (STM_EVAL_PBGetState(Button_KEY1) == 0x00)		//按键按下:低电平有效
			{
			//JTAG_Set(SWD_ENABLE);
			return 2;
			}
		if (STM_EVAL_PBGetState(Button_WAKEUP) == 0x01)		//按键按下:高电平有效
			{
			//JTAG_Set(SWD_ENABLE);
			return 3;
			}
		}
		else if((STM_EVAL_PBGetState(Button_KEY0) == 0x01)&&(STM_EVAL_PBGetState(Button_KEY1) == 0x01)&&(STM_EVAL_PBGetState(Button_WAKEUP) == 0x00)) key_up=1; 	    
	//JTAG_Set(SWD_ENABLE);
	return 0;// 无按键按下
	}

int main(void)
	{ 
	u8 key,mode;
	u16 t=0;			 
	u8 tmp_buf[33]; 
	Init_All_Periph();
	SysTick_Initaize();
	LCD_Init();			//初始化液晶
	STM_EVAL_PBInit(Button_KEY0, Mode_GPIO);			//设置按键GPIO属性
	STM_EVAL_PBInit(Button_KEY1, Mode_GPIO);			//设置按键GPIO属性
	STM_EVAL_PBInit(Button_WAKEUP, Mode_GPIO);			//设置按键GPIO属性
	STM_EVAL_LEDOff(LED1);
	STM_EVAL_LEDOff(LED2);
	NRF24L01_Init();    //初始化NRF24L01 
	POINT_COLOR=RED;//设置字体为红色	   
	LCD_ShowString(60,50,"Mini STM32");	
	LCD_ShowString(60,70,"NRF24L01 TEST");	
	LCD_ShowString(60,90,"ATOM@ALIENTEK");
	LCD_ShowString(60,110,"2010/6/16");				 
	while(NRF24L01_Check())//检测不到24L01
		{
		LCD_ShowString(60,130,"24L01 Check Failed!");
		delay_ms(500);
		LCD_ShowString(60,130,"Please Check!      ");
		delay_ms(500);
		STM_EVAL_LEDToggle(LED1);//DS0闪烁
		}
	LCD_ShowString(60,130,"24L01 Ready!");
	LCD_ShowString(10,150,"KEY0:RX_Mode  KEY1:TX_Mode");
	while(1)//在该部分确定进入哪个模式!
		{
		key=KEY_Scan();
		if(key==1)
			{
			mode=0;   
			break;
			}
		else if(key==2)
			{
			mode=1;
			break;
			}
		t++;
		if(t==100) //闪烁显示提示信息
			{
			LCD_ShowString(10,150,"                          ");//清空显示  
			}	
		if(t==200)
			{
			t=0;
			LCD_ShowString(10,150,"KEY0:RX_Mode  KEY1:TX_Mode");
			}
		delay_ms(5);
		
		}
	LCD_Fill(10,150,240,166,WHITE);//清空上面的显示		  
	POINT_COLOR=BLUE;//设置字体为蓝色	   
	if(mode==0)//RX模式
		{
		LCD_ShowString(60,150,"NRF24L01 RX_Mode");	
		LCD_ShowString(60,170,"Received DATA:");	
		RX_Mode();		  
		while(1)
			{	  		    		    				 
			if(NRF24L01_RxPacket(tmp_buf)==0)//一旦接收到信息,则显示出来.
				{
				tmp_buf[32]=0;//加入字符串结束符
				LCD_ShowString(0,190,tmp_buf); 
				}else delay_us(100);	   
			t++;
			if(t==10000)//大约1s钟改变一次状态
				{
				t=0;
				STM_EVAL_LEDToggle(LED1);
				} 				    
			};	
		}
	else//TX模式
		{							    
		LCD_ShowString(60,150,"NRF24L01 TX_Mode");	
		TX_Mode();
		mode=' ';//从空格键开始  
		while(1)
			{	  		   				 
			if(NRF24L01_TxPacket(tmp_buf)==TX_OK)
				{
				LCD_ShowString(60,170,"Sended DATA:");	
				LCD_ShowString(0,190,tmp_buf); 
				key=mode;
				for(t=0;t<32;t++)
					{
					key++;
					if(key>('~'))key=' ';
					tmp_buf[t]=key;	
					}
				mode++; 
				if(mode>'~')mode=' ';  	  
				tmp_buf[32]=0;//加入结束符		   
				}
			else
				{										   	
				LCD_ShowString(60,170,"Send Failed "); 
				LCD_Fill(0,188,240,218,WHITE);//清空上面的显示			   
				};
			STM_EVAL_LEDToggle(LED1);
			delay_ms(1500);				    
			};
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





