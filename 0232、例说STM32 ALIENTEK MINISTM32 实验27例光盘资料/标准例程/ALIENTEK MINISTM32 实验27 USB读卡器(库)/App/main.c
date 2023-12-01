/**********************************************
File Name: ALIENTEK MINISTM32 实验27 USB读卡器(库)
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

//注意:在禁用JTAG接后后可这样恢复:
//1.设置KEIL为JTAG或SW下载模式
//2.给板上电,按下板上的复位按键不放,点击KEIL下的FLASH下载按钮,使JTAG或SW下载工具检测完成接口后立刻放开,
//此目白在于争取IC在上电的时候有控制权,使在未进入禁用JTAG或SW生效的时候取可控制IC进行烧录
//3.此项目的启动文件不要使用Satrtup_stm32f10x_ld.s的,否则USB没有反应,应使用STM32F10X.s

//使用JLINK  JTAG方式下载程序后请把JLINK拔走

#include "stm32f10x.h"
#include "LCD.h"
//#include "USART.h"
#include "eval.h"
#include "SysTickDelay.h"
#include "UART_INTERFACE.h"
#include "mmc_sd.h"
#include "mass_mal.h"
#include "usb_lib.h"
#include "hw_config.h"
#include "usb_pwr.h"
#include "usb_istr.h"
#include <stdio.h>


////#ifdef LCD_Debug
//#ifdef __GNUC__
//  /* With GCC/RAISONANCE, small printf (option LD Linker->Libraries->Small printf
//     set to 'Yes') calls __io_putchar() */
//  #define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
//#else
//  #define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
//#endif /* __GNUC__ */
//
////#endif




//extern unsigned int Ypos;
//extern unsigned int Xpos;
////extern const unsigned short ASCII_Table[];
//extern unsigned short ASCII_Table[];

/* Private typedef -----------------------------------------------------------*/
//typedef enum { FAILED = 0, PASSED = !FAILED} TestStatus;

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

//ErrorStatus HSEStartUpStatus;
///*******************************************************************************
//* Function Name  : RCC_Config
//* Description    : Configures Main system clocks & power
//* Input          : None.
//* Return         : None.
//*******************************************************************************/
//static void RCC_Config(void)
//{ 
//  /* SYSCLK, HCLK, PCLK2 and PCLK1 configuration -----------------------------*/   
//  /* RCC system reset(for debug purpose) */
//  RCC_DeInit();
//
//  /* Enable HSE */
//  RCC_HSEConfig(RCC_HSE_ON);
//
//  /* Wait till HSE is ready */
//  HSEStartUpStatus = RCC_WaitForHSEStartUp();
//
//  if (HSEStartUpStatus == SUCCESS)
//  {
//    /* Enable Prefetch Buffer */
//    FLASH_PrefetchBufferCmd(FLASH_PrefetchBuffer_Enable);
//
//    /* Flash 2 wait state */
//    FLASH_SetLatency(FLASH_Latency_2);
// 
//    /* HCLK = SYSCLK */
//    RCC_HCLKConfig(RCC_SYSCLK_Div1); 
//  
//    /* PCLK2 = HCLK */
//    RCC_PCLK2Config(RCC_HCLK_Div1); 
//
//    /* PCLK1 = HCLK/2 */
//    RCC_PCLK1Config(RCC_HCLK_Div2);
//
//#ifdef STM32F10X_CL
//    /* Configure PLLs *********************************************************/
//    /* PLL2 configuration: PLL2CLK = (HSE / 5) * 8 = 40 MHz */
//    RCC_PREDIV2Config(RCC_PREDIV2_Div5);
//    RCC_PLL2Config(RCC_PLL2Mul_8);
//
//    /* Enable PLL2 */
//    RCC_PLL2Cmd(ENABLE);
//
//    /* Wait till PLL2 is ready */
//    while (RCC_GetFlagStatus(RCC_FLAG_PLL2RDY) == RESET)
//    {}
//
//    /* PLL configuration: PLLCLK = (PLL2 / 5) * 9 = 72 MHz */ 
//    RCC_PREDIV1Config(RCC_PREDIV1_Source_PLL2, RCC_PREDIV1_Div5);
//    RCC_PLLConfig(RCC_PLLSource_PREDIV1, RCC_PLLMul_9);
//#else
//    /* PLLCLK = 8MHz * 9 = 72 MHz */
//    RCC_PLLConfig(RCC_PLLSource_HSE_Div1, RCC_PLLMul_9);
//#endif
//
//    /* Enable PLL */ 
//    RCC_PLLCmd(ENABLE);
//
//    /* Wait till PLL is ready */
//    while (RCC_GetFlagStatus(RCC_FLAG_PLLRDY) == RESET)
//    {
//    }
//
//    /* Select PLL as system clock source */
//    RCC_SYSCLKConfig(RCC_SYSCLKSource_PLLCLK);
//
//    /* Wait till PLL is used as system clock source */
//    while(RCC_GetSYSCLKSource() != 0x08)
//    {
//    }
//  }
//  else
//  { /* If HSE fails to start-up, the application will have wrong clock configuration.
//       User can add here some code to deal with this error */    
//
//    /* Go to infinite loop */
//    while (1)
//    {
//    }
//  }
//}

//配置系统时钟,使能各外设时钟
void RCC_Configuration(void)
	{
	SystemInit();
	//RCC_Config();	
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
//	printf("123456789ABCDEFGHIJK\n");  //显示的数不能超过一行最大值
//	GLCD_SetTextColor(Red);
//	//GLCD_Clear(White);
//	GLCD_WindowModeDisable();
//	GLCD_DrawLine(0,0,200,0);	 //画线,从左上角起始画长度为200像数点的水平线
//	GLCD_DrawLine(0,0,200,1);	 //画线,从左上角起始画长度为200像数点的垂直线
//	GLCD_SetTextColor(Green);
//	GLCD_DrawLine(160,60,20,1);   //画线
//	GLCD_SetTextColor(Black);
//	GLCD_DrawRect(150,150,50,50);    //画矩形
//	GLCD_SetTextColor(Blue);
//	GLCD_DrawCircle(200,150,40);   //画圆
//	GLCD_SetTextColor(Blue);
//	}



//配置所有外设
void Init_All_Periph(void)
	{
	
	RCC_Configuration();	
	
	NVIC_Configuration();

	SysTick_Initaize();

	
	
	//USART1_Configuration();
	USART_Configuration(9600);
	//USART_RX_IntteruptEnable(USED_COM_NUMBER);		//接收中断使能
	//uart_init(72,9600); //串口1初始化 
    LCD_Init();			//初始化液晶

	GPIO_Configuration();
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

//bit0:表示电脑正在向SD卡写入数据
//bit1:表示电脑正从SD卡读出数据
//bit2:SD卡写数据错误标志位
//bit3:SD卡读数据错误标志位
//bit4:1,表示电脑有轮询操作(表明连接还保持着)
u8 Usb_Status_Reg=0;



int main(void)
	{
	u8 offline_cnt=0;
	u8 tct=0;
	u8 USB_STA;
	u8 Divece_STA;
	
	Init_All_Periph();
	
	STM_EVAL_LEDOff(LED1);
	STM_EVAL_LEDOff(LED2);
	POINT_COLOR=RED;//设置字体为蓝色	   
	LCD_ShowString(60,50,"Mini STM32");	
	LCD_ShowString(60,70,"USB TEST");	
	LCD_ShowString(60,90,"ATOM@ALIENTEK");
	LCD_ShowString(60,110,"2010/6/19");	
	
	while(SD_Init())
		{
		LCD_ShowString(60,130,"SD Init ERR!");	
		delay_ms(500);
		LCD_ShowString(60,130,"Please Check");	
		delay_ms(500);
		}					  													 
	LCD_ShowString(60,130,"SD Card Ready");//提示SD卡已经准备了	 
	Mass_Memory_Size[0]=SD_GetCapacity();//得到SD卡容量
	Mass_Block_Size[0] =512;//因为我们在Init里面设置了SD卡的操作字节为512个,所以这里一定是512个字节.
	Mass_Block_Count[0]=Mass_Memory_Size[0]/Mass_Block_Size[0];
	LCD_ShowString(60,150,"USB Connecting...");//提示SD卡已经准备了	 
	//USB配置
	USB_Interrupts_Config();    
	Set_USBClock();   
	USB_Init();		
	STM_EVAL_LEDToggle(LED2);  								   	 
	while(1)
		{	
		delay_ms(1);
		if(USB_STA!=Usb_Status_Reg)//状态改变了 
			{	 						   
			LCD_ShowString(60,170,"              ");//清除  
			if(Usb_Status_Reg&0x01)//正在写		  
				{
				LCD_ShowString(60,170,"USB Writing...");//提示USB正在写入数据	 
				}
			if(Usb_Status_Reg&0x02)//正在读
				{
				LCD_ShowString(60,170,"USB Reading...");//提示USB正在读出数据  		 
				}	 										  
			if(Usb_Status_Reg&0x04)LCD_ShowString(60,190,"USB Write Err ");//提示写入错误
			else LCD_ShowString(60,190,"              ");//清除错误    
			if(Usb_Status_Reg&0x08)LCD_ShowString(60,210,"USB Read  Err ");//提示读出错误
			else LCD_ShowString(60,210,"              ");//清除错误    
			USB_STA=Usb_Status_Reg;//记录最后的状态
			}
		if(Divece_STA!=bDeviceState) 
			{
			if(bDeviceState==CONFIGURED)LCD_ShowString(60,150,"USB Connected    ");//提示USB连接已经建立
			else LCD_ShowString(60,150,"USB DisConnected ");//提示USB被拔出了
			Divece_STA=bDeviceState;
			}
		tct++;
		if(tct==200)
			{
			tct=0;
			STM_EVAL_LEDToggle(LED1);//提示系统在运行
			if(Usb_Status_Reg&0x10)
				{
				offline_cnt=0;//USB连接了,则清除offline计数器
				bDeviceState=CONFIGURED;
				}
			else//没有得到轮询 
				{
				offline_cnt++;  
				if(offline_cnt>10)bDeviceState=UNCONNECTED;//2s内没收到在线标记,代表USB被拔出了
				}
			Usb_Status_Reg=0;
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





