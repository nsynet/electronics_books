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
//	功能描述：	开机后测量环境温度和目标温度,并可以通过观察HJTemp和MBTemp来观察测量结果
//  IDE环境：   SUNPLUS u'nSPTM  IDE 2.0.0（or later）
//	涉及的库：	CMacro1016.lib
//              sacmv26e.lib
//	组成文件：	main.c/TNDriverUser.c
//              isr.asm/TNRFDriver.asm
//              SPCE061A.inc
//	硬件连接：	
//              IOA13接红外测温模块A
//              IOA14接红外测温模块CLK
//              IOA15接红外测温模块D(Data)
//              V接VCC，G接GND 
//	维护记录：	2006-5-16	v1.0    by hongyan.Feng
//======================================================================
//======================================================================
//	文件名称：	main.c
//	功能描述：	开机后测量环境温度和目标温度,并可以通过观察HJTemp和MBTemp来观察测量结果
//	维护记录：	2006-5-16	v1.0
//======================================================================
#define P_Watchdog_Clear (volatile unsigned int*)0x7012
extern	unsigned int TN_IR_GetData(unsigned int Item);
extern  void TN_InitalIO(void);
float iTemp;
//========================================================
//	语法格式：	int main(void)
//	实现功能：	测量环境温度和目标温度
//	参数：		无
//	返回值：	无
//========================================================
int main(void)
{
	float HJTemp,MBTemp;
	TN_InitalIO();
	while(TN_IR_GetData(0x66))                 //测量环境温度
	{
		*P_Watchdog_Clear = 0x0001;
	}
	HJTemp = iTemp;                            //保存环境温度值
	while(TN_IR_GetData(0x4c))                 //测量目标温度     
	{
		*P_Watchdog_Clear = 0x0001;
	}
	MBTemp = iTemp;                            //保存目标温度值
	while(1)
	{   
		
		*P_Watchdog_Clear = 0x0001;
	}
}