//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//             (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                          ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  工程名称： LED5_c
//  功能描述:  
//			控制所有数码管循环显示0－9十个数字
//  硬件连接：
//			将61板的IOB0－7用排线连接到LED键盘模组的SEG排针上；
//			IOB8~IOB15连接到LED键盘模组的DIG排针上。
//  文件来源：《61板实验教程》,"实验五	数码管显示0－9"
//  IDE环境：   SUNPLUS u'nSPTM  IDE 1.8.4
//
//  涉及的库：
//  组成文件:
//    	main.c
//  日期:          2004-8-19
//===============================================

//============================================================
// 文件名称：main.c
// 实现功能: 
//			控制所有数码管循环显示0－9十个数字
// 日期： 2004/8/19
//============================================================

#define P_IOB_Data			(volatile unsigned int *)0x7005
#define P_IOB_Buffer		(volatile unsigned int *)0x7006
#define P_IOB_Dir			(volatile unsigned int *)0x7007
#define P_IOB_Attrib		(volatile unsigned int *)0x7008
#define P_Watchdog_Clear 	(volatile unsigned int *)0x7012

#define LED_SEG 0x00ff		//IOB0~IOB7
#define LED_DIG 0x3f00		//IOB8~IOB13


const unsigned char DigCode[10]={0x3F,0x06,0x5B,
	0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};			//0~9十个数字的LED编码

//============================================================= 
//	函数名称:   LedDispDig
//	功能描述:	在指定的数码管上显示数字
//	语法：		void LedDispDig(int Pos,int Dig)
//	输入：		Pos:	要显示数字的数码管位置，取值范围1~6
//				Dig:	要显示的数字，取值范围0~9
//	输出：		无
//=============================================================
void LedDispDig(int Pos,int Dig)
{
	*P_Watchdog_Clear=1;				
	//初始化IOB为同相输出
	*P_IOB_Dir|=LED_SEG+LED_DIG;
	*P_IOB_Attrib|=LED_SEG+LED_DIG;

	*P_IOB_Data=(unsigned)0x0100<<(Pos-1);		//将数字的位置转换为IOB高8位值，选中相应的数码管
	*P_IOB_Data|=DigCode[Dig];					//将数字转换为编码，作为IOB低8位输出
}

//============================================================= 
//	主函数
//=============================================================
int main()
{
	int Pos,Dig,TimerCnt;
	while(1)
	{
		for(Dig=0;Dig<=9;Dig++)		//循环显示0~9十个数字
		{
			for(TimerCnt=0;TimerCnt<1000;TimerCnt++)	//每组数字保持一段时间
			{
				for(Pos=1;Pos<=6;Pos++)		//让6个数码管显示相同的数字（即Dig的值）
				{
					LedDispDig(Pos,Dig);
				}
			}
		}
	}
}