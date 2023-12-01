/**********************************************
File Name: ALIENTEK MINISTM32 实验26 触控USB鼠标(库)
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


//模拟时USB必须接在USB的接口
//USB文件夹下的文件使用正点原子自带的例程

//注意:在禁用JTAG接后后可这样恢复:
//1.设置KEIL为JTAG或SW下载模式
//2.给板上电,按下板上的复位按键不放,点击KEIL下的FLASH下载按钮,使JTAG或SW下载工具检测完成接口后立刻放开,
//此目的在于争取IC在上电的时候有控制权,使在未进入禁用JTAG或SW生效的时候取可控制IC进行烧录

//使用JLINK  JTAG方式下载程序后请把JLINK拔走



#include "stm32f10x.h"
#include "LCD.h"
//#include "USART.h"
#include "eval.h"
#include "SysTickDelay.h"
#include "UART_INTERFACE.h"
#include "touch.h"  	    
#include "usb_lib.h"
#include "hw_config.h"
#include "usb_pwr.h"
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
	/* 2 bit for pre-emption priority, 2 bits for subpriority */
	//NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
	
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


//装载画图的界面						
void Load_Drow_Dialog(void)
	{
	LCD_Clear(WHITE);//清屏   
	POINT_COLOR=BLUE;//设置字体为蓝色 
	LCD_ShowString(216,0,"RST");//显示清屏区域
	POINT_COLOR=RED;//设置画笔蓝色 
	}


//返回按键值
//0，没有任何按键按下
//1，KEY0按下
//2，KEY1按下
//3，KEY2按下 WK_UP
//注意此函数有响应优先级,KEY0>KEY1>KEY2!!
u8 KEY_Scan(void)
	{	 
	static u8 key_up=1;//按键按松开标志	
	/* Disable the Serial Wire Jtag Debug Port SWJ-DP */
	//GPIO_PinRemapConfig(GPIO_Remap_SWJ_Disable, ENABLE);	//SWJ完全失能(JTAG+SW-DP)
	/* Disable the Serial Wire Jtag Debug Port SWJ-DP */
	//GPIO_PinRemapConfig(GPIO_Remap_SWJ_JTAGDisable , ENABLE);	//JTAG-DP 失能 + SW-DP使能 
	//STM_EVAL_PBInit(Button_KEY0, Mode_GPIO);			//设置按键GPIO属性
	//STM_EVAL_PBInit(Button_KEY1, Mode_GPIO);			//设置按键GPIO属性
	//STM_EVAL_PBInit(Button_WAKEUP, Mode_GPIO);			//设置按键GPIO属性
	if(key_up&&((STM_EVAL_PBGetState(Button_KEY0) == 0x00)||(STM_EVAL_PBGetState(Button_KEY1) == 0x00)||(STM_EVAL_PBGetState(Button_WAKEUP) == 0x01)))
		{
		delay_ms(10);//去抖动 
		key_up=0;
		if (STM_EVAL_PBGetState(Button_KEY0) == 0x00)		//按键按下:低电平有效
			{
			//GPIO_PinRemapConfig(GPIO_Remap_SWJ_NoJTRST, ENABLE);	//除 JTRST 外SWJ 完全使能（JTAG+SW-DP）
			return 1;
			}
		if (STM_EVAL_PBGetState(Button_KEY1) == 0x00)		//按键按下:低电平有效
			{
			//GPIO_PinRemapConfig(GPIO_Remap_SWJ_NoJTRST, ENABLE);	//除 JTRST 外SWJ 完全使能（JTAG+SW-DP）
			return 2;
			}
		if (STM_EVAL_PBGetState(Button_WAKEUP) == 0x01)		//按键按下:高电平有效
			{
			//GPIO_PinRemapConfig(GPIO_Remap_SWJ_NoJTRST, ENABLE);	//除 JTRST 外SWJ 完全使能（JTAG+SW-DP）
			return 3;
			}
		}
	else if((STM_EVAL_PBGetState(Button_KEY0) == 0x01)&&(STM_EVAL_PBGetState(Button_KEY1) == 0x01)&&(STM_EVAL_PBGetState(Button_WAKEUP) == 0x00)) key_up=1; 	    
	//GPIO_PinRemapConfig(GPIO_Remap_SWJ_NoJTRST, ENABLE);	//除 JTRST 外SWJ 完全使能（JTAG+SW-DP）
	return 0;// 无按键按下
	}

int main(void)
	{  
	u8 key;
	u8 i=0;
	u8 tpx=0;	
	
	s8 x0;		 //发送到电脑端的坐标值
	s8 y0;
	short xlast; //最后一次按下的坐标值
	short ylast;
	
	//Set_System();
	
	Init_All_Periph();
	SysTick_Initaize();
	 
	
	STM_EVAL_PBInit(Button_KEY0, Mode_GPIO);			//设置按键GPIO属性
	STM_EVAL_PBInit(Button_KEY1, Mode_GPIO);			//设置按键GPIO属性
	STM_EVAL_PBInit(Button_WAKEUP, Mode_GPIO);			//设置按键GPIO属性
	STM_EVAL_LEDOff(LED1);
	STM_EVAL_LEDOff(LED2);
	
	//USB配置
	USB_Interrupts_Config();    
	Set_USBClock();   
	USB_Init();	  
	
	POINT_COLOR=RED;//设置字体为蓝色	   
	LCD_ShowString(60,50,"Mini STM32");	
	LCD_ShowString(60,70,"USB TEST");	
	LCD_ShowString(60,90,"ATOM@ALIENTEK");
	LCD_ShowString(60,110,"2010/6/19");	
	LCD_ShowString(60,130,"Press KEY0 to Adjust");	   
	Touch_Init();
	delay_ms(1500);
	Load_Drow_Dialog();	     
	while(1)
		{	
		key=KEY_Scan();
		//LCD_ShowNum(60,0,key,4,16);//显示ADC的值
		tpx=AI_Read_TP();//得到触点的状态
		if(tpx)//触摸屏被按下						  
			{											   
			xlast=Pen_Point.X0;
			ylast=Pen_Point.Y0;
			while(1)
				{
				tpx=AI_Read_TP();
				if(tpx==0)break;//触点松开了							 
				if(Pen_Point.X0>216&&Pen_Point.Y0<16)Load_Drow_Dialog();//清除
				else Draw_Big_Point(Pen_Point.X0,Pen_Point.Y0);//画图  
				if((Pen_Point.X0!=xlast||Pen_Point.Y0!=ylast)&&(bDeviceState==CONFIGURED)&&tpx==1)
					{
					x0=(xlast-Pen_Point.X0)*3;//上次坐标值与得到的坐标值之差,扩大3倍
					y0=(ylast-Pen_Point.Y0)*3;
					xlast=Pen_Point.X0;		  //记录本次的坐标值
					ylast=Pen_Point.Y0;
					Joystick_Send(0,-x0,-y0,0); //发送数据到电脑  
					delay_ms(10);	   
					}
				else if((bDeviceState==CONFIGURED)&&tpx==2)//单击
					{
					tpx=0X01;
					Joystick_Send(tpx,0,0,0);//模拟左键按下	
					} 
				delay_us(50); 
				} 
			Joystick_Send(0,0,0,0);//发送左键松开
			}
		else delay_ms(1);	 
		if(bDeviceState==CONFIGURED)STM_EVAL_LEDOn(LED2);//当USB配置成功了，LED1亮，否则，灭
		else STM_EVAL_LEDOff(LED2);
		if(key==1)//KEY0按下,则执行校准程序
			{
			//STM_EVAL_LEDToggle(LED2);
			LCD_Clear(WHITE);//清屏
			Touch_Adjust();  //屏幕校准 
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





