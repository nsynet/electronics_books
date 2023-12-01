#ifndef __TOUCH_H__
#define __TOUCH_H__
#include "stm32f10x.h"
//Mini STM32开发板
//ADS7843/7846/UH7843/7846/XPT2046/TSC2046 驱动函数
//正点原子@ALIENTEK
//2010/6/13
//V1.3
//加入了u8 AI_Read_TP(void)函数,用于读取触点状态	 
	    
//按键状态	 
#define Key_Down 0x01
#define Key_Up   0x00 
//笔杆结构体
typedef struct 
{
	u16 X0;//原始坐标
	u16 Y0;
	u16 X; //最终/暂存坐标
	u16 Y;						   	    
	u8 Key_Sta;//笔的状态
	u8 Key_OK; //笔准备好了,调用函数自行修改			  
//触摸屏校准参数
	float xfac;
	float yfac;
	short xoff;
	short yoff;
}Pen_Holder;	   
extern Pen_Holder Pen_Point;
//与触摸屏芯片连接引脚	   
//#define PEN  PCin(1)   //PC1  INT
#define TOUCH_PEN_PORT              GPIOC
#define TOUCH_PEN_CLK               RCC_APB2Periph_GPIOC  
#define TOUCH_PEN_PIN               GPIO_Pin_1
#define Set_TOUCH_PEN  {GPIO_SetBits(TOUCH_PEN_PORT,TOUCH_PEN_PIN);}
#define Clr_TOUCH_PEN  {GPIO_ResetBits(TOUCH_PEN_PORT,TOUCH_PEN_PIN);} 
#define TOUCH_PEN    (GPIO_ReadInputDataBit(TOUCH_PEN_PORT, TOUCH_PEN_PIN))
//#define DOUT PCin(2)   //PC2  MISO
#define TOUCH_DOUT_PORT              GPIOC
#define TOUCH_DOUT_CLK               RCC_APB2Periph_GPIOC  
#define TOUCH_DOUT_PIN               GPIO_Pin_2
#define Set_TOUCH_DOUT  {GPIO_SetBits(TOUCH_DOUT_PORT,TOUCH_DOUT_PIN);}
#define Clr_TOUCH_DOUT  {GPIO_ResetBits(TOUCH_DOUT_PORT,TOUCH_DOUT_PIN);} 
#define TOUCH_DOUT    (GPIO_ReadInputDataBit(TOUCH_DOUT_PORT, TOUCH_DOUT_PIN))
//#define TDIN PCout(3)  //PC3  MOSI
#define TOUCH_TDIN_PORT              GPIOC
#define TOUCH_TDIN_CLK               RCC_APB2Periph_GPIOC  
#define TOUCH_TDIN_PIN               GPIO_Pin_3
#define Set_TOUCH_TDIN  {GPIO_SetBits(TOUCH_TDIN_PORT,TOUCH_TDIN_PIN);}
#define Clr_TOUCH_TDIN  {GPIO_ResetBits(TOUCH_TDIN_PORT,TOUCH_TDIN_PIN);} 
//#define TCLK PCout(0)  //PC0  SCLK
#define TOUCH_TCLK_PORT              GPIOC
#define TOUCH_TCLK_CLK               RCC_APB2Periph_GPIOC  
#define TOUCH_TCLK_PIN               GPIO_Pin_0
#define Set_TOUCH_TCLK  {GPIO_SetBits(TOUCH_TCLK_PORT,TOUCH_TCLK_PIN);}
#define Clr_TOUCH_TCLK  {GPIO_ResetBits(TOUCH_TCLK_PORT,TOUCH_TCLK_PIN);} 
//#define TCS  PCout(13) //PC13 CS    
#define TOUCH_TCS_PORT              GPIOC
#define TOUCH_TCS_CLK               RCC_APB2Periph_GPIOC  
#define TOUCH_TCS_PIN               GPIO_Pin_13
#define Set_TOUCH_TCS  {GPIO_SetBits(TOUCH_TCS_PORT,TOUCH_TCS_PIN);}
#define Clr_TOUCH_TCS  {GPIO_ResetBits(TOUCH_TCS_PORT,TOUCH_TCS_PIN);}   
//ADS7843/7846/UH7843/7846/XPT2046/TSC2046 指令集
#define CMD_RDY 0X90  //0B10010000即用差分方式读X坐标
#define CMD_RDX	0XD0  //0B11010000即用差分方式读Y坐标   											 
#define TEMP_RD	0XF0  //0B11110000即用差分方式读Y坐标    
//使用保存
#define ADJ_SAVE_ENABLE	    
			  
void Touch_Init(void);		 //初始化
u8 Read_ADS(u16 *x,u16 *y);	 //带舍弃的双方向读取
u8 Read_ADS2(u16 *x,u16 *y); //带加强滤波的双方向坐标读取
u16 ADS_Read_XY(u8 xy);		 //带滤波的坐标读取(单方向)
u16 ADS_Read_AD(u8 CMD);	 //读取AD转换值
void ADS_Write_Byte(u8 num); //向控制芯片写入一个数据
void Drow_Touch_Point(u8 x,u16 y);//画一个坐标叫准点
void Draw_Big_Point(u8 x,u16 y);  //画一个大点
void Touch_Adjust(void);          //触摸屏校准
void Save_Adjdata(void);		  //保存校准参数
u8 Get_Adjdata(void); 			  //读取校准参数
void Pen_Int_Set(u8 en); 		  //PEN中断使能/关闭
void Convert_Pos(void);           //结果转换函数	 
u8 AI_Read_TP(void);              //读取TP状态	 
u8 Is_In_Area(u8 x1,u16 y1,u8 x2,u16 y2);//判断按键是否在这个区域内.
#endif

















