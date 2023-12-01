/**********************************************
File Name:ALIENTEK MINISTM32 ʵ��25 ͼƬ��ʾʵ��(��)
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
	



//������������
void Init_All_Periph(void)
	{
	
	RCC_Configuration();	
	
	NVIC_Configuration();

	GPIO_Configuration();
	
	//USART1_Configuration();
	USART_Configuration(9600);
	
	LCD_Init();			//��ʼ��Һ��
	}







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
	u8 i;	 
	u8 key;	  
	FileInfoStruct *FileInfo;	   		 
	u16 pic_cnt=0;//��ǰĿ¼��ͼƬ�ļ��ĸ���
	u16 index=0;  //��ǰѡ����ļ����	   
	u16 time=0;    
	
	Init_All_Periph();
	SysTick_Initaize();
	STM_EVAL_PBInit(Button_KEY0, Mode_GPIO);			//���ð���GPIO����
	STM_EVAL_PBInit(Button_KEY1, Mode_GPIO);			//���ð���GPIO����
	STM_EVAL_PBInit(Button_WAKEUP, Mode_GPIO);			//���ð���GPIO����
	STM_EVAL_LEDOff(LED1);
	STM_EVAL_LEDOff(LED2);
	
	SPI_Flash_Init();   //SPI FLASHʹ��
	
	
	if(Font_Init())//�ֿⲻ����,������ֿ�
		{	 
		POINT_COLOR=RED;      
		LCD_ShowString(60,50,"Mini STM32");	
		LCD_ShowString(60,70,"Font ERROR"); 
		while(1);  	 	  
		}  
			  
	POINT_COLOR=RED;      
	Show_Str(60,50,"Mini STM32������",16,0);				    	 
	Show_Str(60,70,"ͼƬ��ʾ ����",16,0);				    	 
	Show_Str(60,90,"����ԭ��@ALIENTEK",16,0);				    	 
	Show_Str(60,110,"2010��6��18��",16,0);  
	SD_Init();
	while(FAT_Init())//FAT ����
		{
		Show_Str(60,130,"�ļ�ϵͳ����!",16,0);  
		i= SD_Init();
		if(i)Show_Str(60,150,"SD������!",16,0);//SD����ʼ��ʧ�� 	  
		delay_ms(500);
		LCD_Fill(60,130,240,170,WHITE);//�����ʾ			  
		delay_ms(500);
		STM_EVAL_LEDToggle(LED1);   
		}	   				 
	while(SysInfoGet(1))//�õ�ͼƬ�ļ���  
		{
		Show_Str(60,130,"ͼƬ�ļ���δ�ҵ�!",16,0);  
		delay_ms(500);  
		FAT_Init();
		SD_Init();
		STM_EVAL_LEDToggle(LED1);
		LCD_Fill(60,130,240,170,WHITE);//�����ʾ			  
		delay_ms(500); 
		}
	LCD_Fill(60,130,240,170,WHITE);//�����ʾ	
	Show_Str(60,130,"��ʼ��ʾ...",16,0); 
	delay_ms(1000);
	Cur_Dir_Cluster=PICCLUSTER;
	while(1)
		{	    			 
		pic_cnt=0;	 
		Get_File_Info(Cur_Dir_Cluster,FileInfo,T_JPEG|T_JPG|T_BMP,&pic_cnt);//��ȡ��ǰ�ļ��������Ŀ���ļ����� 		    
		if(pic_cnt==0)//û��ͼƬ�ļ�
			{
			LCD_Clear(WHITE);//����	   
			while(1)
				{	  
				if(time%2==0)Show_Str(32,150,"û��ͼƬ,����COPYͼƬ��SD����PICTURE�ļ���,Ȼ�������!",16,0);		 
				else LCD_Clear(WHITE);
				time++;
				delay_ms(300);
				}
			}								   
		FileInfo=&F_Info[0];//�����ݴ�ռ�.
		index=1;
		while(1)
			{
			Get_File_Info(Cur_Dir_Cluster,FileInfo,T_JPEG|T_JPG|T_BMP,&index);//�õ�����ͼƬ����Ϣ	 
			LCD_Clear(WHITE);//����,������һ��ͼƬ��ʱ��,һ������	
			AI_LoadPicFile(FileInfo,0,0,240,320);//��ʾͼƬ	       	 
			POINT_COLOR=RED;      
			Show_Str(0,0,FileInfo->F_Name,16,1);//��ʾͼƬ����
			while(1)//��ʱ3s
				{
				key=KEY_Scan();
				if(key==1)break;//��һ��
				else if(key==2)//��һ��
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
			if(index>pic_cnt)index=1;//��ʾ��һ��,ѭ��	  	 		 
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





