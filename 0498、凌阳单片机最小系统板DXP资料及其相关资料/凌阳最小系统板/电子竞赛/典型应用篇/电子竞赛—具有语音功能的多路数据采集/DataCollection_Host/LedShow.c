//========================================================================================================
// 文件名称：LedShow.c
// 实现功能：LED显示操作
// 日    期：2003/7/7
//========================================================================================================

#include "main.h"
extern F_Led_Show(unsigned int ,unsigned int);
extern SYSFLAGS sSysFlags;

//========================================================================================================
//函数: F_Led_Show_Handle
//语法：void F_Led_Show_Handle()
//描述：显示通道数和电压值
//参数：无
//返回：无
//========================================================================================================
void F_Led_Show_Handle(void)
{
	unsigned int i=0;
	//float fDisplayVoltageValue=0.0;
	unsigned int uiShowVoltageValue=0;
	F_Led_Show(0,sSysFlags.uiChannelNumber);//显示通道号
	uiShowVoltageValue=sSysFlags.uiChannelVoltageValue;
	uiShowVoltageValue=(unsigned int)((uiShowVoltageValue*50)/0x03FF);
	sSysFlags.uiDisplayVoltageValue=uiShowVoltageValue;
	//for(i=0;i<0x500;i++);
	F_Led_Show(1,uiShowVoltageValue/10);//显示通道号
	//for(i=0;i<0x550;i++);
	F_Led_Show(2,uiShowVoltageValue%10);//显示通道号

}
//========================================================================================================
//函数: F_Led_Show_Handle
//语法：void F_Led_Show_Handle()
//描述：显示通道号
//参数：无
//返回：无
//========================================================================================================
void F_Led_Show_NotReady(void)
{
	F_Led_Show(0,sSysFlags.uiChannelNumber);//显示通道号
}