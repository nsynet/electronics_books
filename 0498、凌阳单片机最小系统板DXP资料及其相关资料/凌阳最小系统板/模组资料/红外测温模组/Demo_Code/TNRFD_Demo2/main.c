//======================================================================
//	The information contained herein is the exclusive property of
//	Sunnnorth Technology Co. And shall not be distributed, reproduced,
//	or disclosed in whole in part without prior written permission.
//	(C) COPYRIGHT 2003 SUNNORTH TECHNOLOGY CO.
//	ALL RIGHTS RESERVED
//	The entire notice above must be reproduced on all authorized copies.
//======================================================================

//======================================================================
//	工程名称：	TNRFDriver.spj
//	功能描述：	测量环境温度和目标温度,并用键盘控制播放温度值，利用61板上自带三个按键控制测温
//              按K1,连续播放目标温度和环境温度
//              按K2,仅播放目标温度
//              按K3,仅播放环境温度
//  IDE环境：   SUNPLUS u'nSPTM  IDE 2.0.0（or later）
//	涉及的库：	CMacro1016.lib
//              sacmv26e.lib
//	组成文件：	main.c/PlayData.c/Key.c/TNDriverUser.c
//              hardware.asm/isr.asm/TNRFDriver.asm
//              s480.h/hardware.h/
//              SPCE061A.inc/s480.inc
//	硬件连接：	
//              IOA13接红外测温模块A
//              IOA14接红外测温模块CLK
//              IOA15接红外测温模块D(Data)
//              V接VCC,G接GND
//	维护记录：	2006-4-20	v1.0    by hongyan.Feng
//======================================================================

//======================================================================
//	文件名称：	main.c
//	功能描述：	取测量数据,并根据键值进行播报
//              按K1,连续播放目标温度和环境温度
//              按K2,仅播放目标温度
//              按K3,仅播放环境温度
//	维护记录：	2006-4-20	v1.0
//======================================================================
#define P_Watchdog_Clear		(volatile unsigned int *)0x7012  

extern unsigned int TN_Data_Buff[5];		      //保存测量结果的数组
extern void TN_InitalIO(void);
extern void Key_Init(void);
extern unsigned int TN_IR_GetData(unsigned int Item);
extern unsigned int KeyScan(void);
extern void PlaySnd_Auto(unsigned int uiSndIndex);
extern void F_TempplayAndShow(float temp);
float iTemp;                                       //保存温度值
//========================================================
//	语法格式：	int main(void)
//	实现功能：	键盘控制测量环境温度和目标温度
//	参数：		无
//	返回值：	无
//========================================================
int main(void)
{
	unsigned int Key,iFlag = 1;	
	Key_Init();                                     //初始化键盘
	TN_InitalIO();                                  //初始化红外测温模块
	while(1)
	{
		Key = KeyScan();                             //扫描键盘

		switch(Key)
		{
			case 0:                                  //没有键按下				       
				break;
			case 0x0001:                             //第一个键K1按下
				while(iFlag)                         //判断是否测量出正确数据
				{
					iFlag = TN_IR_GetData(0x004c);   //测量目标温度，取温度值和iFlag
					*P_Watchdog_Clear = 0x0001; 
				}
				PlaySnd_Auto(16);                    //播放"OK"
				PlaySnd_Auto(15);                    //播放"目标温度"
				F_TempplayAndShow(iTemp);            //播放"测得目标温度值"
				iFlag = 1;                           //iFlag置1
				while(iFlag)                         //判断是否测量出正确数据
				{
					iFlag = TN_IR_GetData(0x0066);   //测量环境温度，取温度值和iFlag
					*P_Watchdog_Clear = 0x0001; 
				}
				PlaySnd_Auto(14);                    //播放"环境温度" 
				F_TempplayAndShow(iTemp);            //播放"测得环境温度值"
				iFlag = 1;                           //iFlag置1 
				break;
			case 0x0002:                             //第二个键按下
				while(iFlag)                         //判断是否测量出正确数据
				{
					iFlag = TN_IR_GetData(0x004c);   //测量目标温度，取温度值和iFlag
					*P_Watchdog_Clear = 0x0001; 
				}
				PlaySnd_Auto(16);                    //播放"OK"
				PlaySnd_Auto(15);                    //播放"目标温度"
				F_TempplayAndShow(iTemp);            //播放"测得目标温度值"
				iFlag = 1;
				break;
			case 0x0004:                             //第三个键盘按下
				while(iFlag)                         //判断是否测量出正确数据
				{
					iFlag = TN_IR_GetData(0x0066);   //测量环境温度，取温度值和iFlag
					*P_Watchdog_Clear = 0x0001; 
				}
				PlaySnd_Auto(16);                    //播放"OK"
				PlaySnd_Auto(14);                    //播放"环境温度"
				F_TempplayAndShow(iTemp);            //播放"测得环境温度值"
				break;
			default:
				break;
		}
	}	
}
//====================================================================================
//main.c end
//====================================================================================