/**********************************************
File Name:ALIENTEK MINISTM32 实验25 图片显示实验(库)
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
//此目的在于争取IC在上电的时候有控制权,使在未进入禁用JTAG或SW生效的时候取可控制IC进行烧录

//使用JLINK  JTAG方式下载程序后请把JLINK拔走

#include "stm32f10x.h"
#include "LCD.h"
//#include "USART.h"
#include "eval.h"
#include "SysTickDelay.h"
#include "UART_INTERFACE.h"
#include "sysfile.h"
#include "spi.h"
#include "jpegbmp.h"
#include "flash.h"
#include "text.h"
#include "fontupd.h"
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
	
	LCD_Init();			//初始化液晶
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
	u8 i;	 
	u8 key;	  
	FileInfoStruct *FileInfo;	   		 
	u16 pic_cnt=0;//当前目录下图片文件的个数
	u16 index=0;  //当前选择的文件编号	   
	u16 time=0;    
	
	Init_All_Periph();
	SysTick_Initaize();
	STM_EVAL_PBInit(Button_KEY0, Mode_GPIO);			//设置按键GPIO属性
	STM_EVAL_PBInit(Button_KEY1, Mode_GPIO);			//设置按键GPIO属性
	STM_EVAL_PBInit(Button_WAKEUP, Mode_GPIO);			//设置按键GPIO属性
	STM_EVAL_LEDOff(LED1);
	STM_EVAL_LEDOff(LED2);
	
	SPI_Flash_Init();   //SPI FLASH使能
	
	
	if(Font_Init())//字库不存在,则更新字库
		{	 
		POINT_COLOR=RED;      
		LCD_ShowString(60,50,"Mini STM32");	
		LCD_ShowString(60,70,"Font ERROR"); 
		while(1);  	 	  
		}  
			  
	POINT_COLOR=RED;      
	Show_Str(60,50,"Mini STM32开发板",16,0);				    	 
	Show_Str(60,70,"图片显示 程序",16,0);				    	 
	Show_Str(60,90,"正点原子@ALIENTEK",16,0);				    	 
	Show_Str(60,110,"2010年6月18日",16,0);  
	SD_Init();
	while(FAT_Init())//FAT 错误
		{
		Show_Str(60,130,"文件系统错误!",16,0);  
		i= SD_Init();
		if(i)Show_Str(60,150,"SD卡错误!",16,0);//SD卡初始化失败 	  
		delay_ms(500);
		LCD_Fill(60,130,240,170,WHITE);//清除显示			  
		delay_ms(500);
		STM_EVAL_LEDToggle(LED1);   
		}	   				 
	while(SysInfoGet(1))//得到图片文件夹  
		{
		Show_Str(60,130,"图片文件夹未找到!",16,0);  
		delay_ms(500);  
		FAT_Init();
		SD_Init();
		STM_EVAL_LEDToggle(LED1);
		LCD_Fill(60,130,240,170,WHITE);//清除显示			  
		delay_ms(500); 
		}
	LCD_Fill(60,130,240,170,WHITE);//清除显示	
	Show_Str(60,130,"开始显示...",16,0); 
	delay_ms(1000);
	Cur_Dir_Cluster=PICCLUSTER;
	while(1)
		{	    			 
		pic_cnt=0;	 
		Get_File_Info(Cur_Dir_Cluster,FileInfo,T_JPEG|T_JPG|T_BMP,&pic_cnt);//获取当前文件夹下面的目标文件个数 		    
		if(pic_cnt==0)//没有图片文件
			{
			LCD_Clear(WHITE);//清屏	   
			while(1)
				{	  
				if(time%2==0)Show_Str(32,150,"没有图片,请先COPY图片到SD卡的PICTURE文件夹,然后后重启!",16,0);		 
				else LCD_Clear(WHITE);
				time++;
				delay_ms(300);
				}
			}								   
		FileInfo=&F_Info[0];//开辟暂存空间.
		index=1;
		while(1)
			{
			Get_File_Info(Cur_Dir_Cluster,FileInfo,T_JPEG|T_JPG|T_BMP,&index);//得到这张图片的信息	 
			LCD_Clear(WHITE);//清屏,加载下一幅图片的时候,一定清屏	
			AI_LoadPicFile(FileInfo,0,0,240,320);//显示图片	       	 
			POINT_COLOR=RED;      
			Show_Str(0,0,FileInfo->F_Name,16,1);//显示图片名字
			while(1)//延时3s
				{
				key=KEY_Scan();
				if(key==1)break;//下一张
				else if(key==2)//上一张
					{
					if(index>1)index-=2;
					else index=pic_cnt-1;
					break;
					}
				delay_ms(1);
				time++;
				if(time%100==0)STM_EVAL_LEDToggle(LED1);
				if(time>3000)
					{
					time=0;
					break;
					}
				}
			index++;
			if(index>pic_cnt)index=1;//显示第一副,循环	  	 		 
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





