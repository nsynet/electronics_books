//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//             (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                          ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  工程名称： LED8_c
//  功能描述:  
//			在数码管上显示按键的值，
//			按第一个键则显示"1"，按第二个键显示"2"，...，按第8个键显示"8"
//  硬件连接：
//			将LED键盘模组的"KEYTYPE"跳线跳到"1*8KEY"状态
//			将61板的IOA8~IOA15用排线连接到LED键盘模组的1*8KEY排针上；
//			IOB0－7连接到LED键盘模组的SEG排针上；
//			IOB8~IOB15连接到LED键盘模组的DIG排针上。
//  文件来源：《61板实验教程》,"实验八	按键显示数字"
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
//			在数码管上显示按键的值，
//			按第一个键则显示"1"，按第二个键显示"2"，...，按第8个键显示"8"
// 日期： 2004/8/19
//============================================================

#define P_IOA_Data			(volatile unsigned int *)0x7000
#define P_IOA_Buffer		(volatile unsigned int *)0x7001
#define P_IOA_Dir			(volatile unsigned int *)0x7002
#define P_IOA_Attrib		(volatile unsigned int *)0x7003
#define P_IOB_Data			(volatile unsigned int *)0x7005
#define P_IOB_Buffer		(volatile unsigned int *)0x7006
#define P_IOB_Dir			(volatile unsigned int *)0x7007
#define P_IOB_Attrib		(volatile unsigned int *)0x7008
#define P_Watchdog_Clear 	(volatile unsigned int *)0x7012

#define LED_SEG 0x00ff		//IOB0~IOB7控制数码管或灯的状态
#define LED_DIG 0x3f00		//IOB8~IOB13分别控制6个数码管
#define LED_LIGHTS 0x4000	//IOB14控制LED灯
#define KEY_ALL 0xff00		//使用IOA8~IOA15作为键盘输入口


const unsigned char DigCode[10]={0x3F,0x06,0x5B,
	0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};			//0~9十个数字的LED编码

//============================================================= 
//	函数名称:   GetKey
//	功能描述:	等待直到有键按下并抬起，返回键值，没有去抖处理
//	语法：		unsigned GetKey(void)
//	输入：		无
//	输出：		16位键值
//=============================================================
unsigned GetKey(void)
{
	unsigned KeyValue;

	//初始化IOA的相应端口为上拉输入
	*P_IOA_Dir&=~KEY_ALL;
	*P_IOA_Attrib&=~KEY_ALL;
	*P_IOA_Buffer|=KEY_ALL;
	
	//等待有键按下，即有端口变为0
	while(!((*P_IOA_Data&KEY_ALL)^KEY_ALL))
	{	
		*P_Watchdog_Clear=1;		
	}
	KeyValue=(*P_IOA_Data&KEY_ALL)^KEY_ALL;
	//等待按键抬起
	while((*P_IOA_Data&KEY_ALL)^KEY_ALL)
	{
		*P_Watchdog_Clear=1;
	}
	return KeyValue;
}

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
	unsigned KeyValue,KeyNum,KeyMask;
	while(1)		
	{
		KeyValue=GetKey();			//得到16位键值

		//将16位键值转换为1~8数值
		KeyNum=1;
		KeyMask=0x0100;
		while (KeyMask)
		{
			//从低到高依次检查IOB8~IOB15的每一位
			if(KeyValue==KeyMask)
			{
				break;
			}
			else
			{
				KeyMask<<=1;		
				KeyNum++;
			}
		}
		if(!KeyMask)KeyNum=0;	//如果没得到正确的键值则显示"0"
		LedDispDig(6,KeyNum);	//在第六个数码管上显示按键键代表的数值（1~8）
	}
}