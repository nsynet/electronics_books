//=========== 按键处理=============================//
//
//=================================================//
#include "main.h"
extern void F_PlayRespond(unsigned int);
extern g_uiKeyValue;
extern SYSFLAGS sSysFlags;
void F_KeyHandle(void)
{
	unsigned int i=0;
	switch(g_uiKeyValue)
	{
		case 1:
		case 2:
		case 3:
		case 4:
		case 5:
		case 6:
		case 7://数字键
			if(sSysFlags.uiSelectSample==1)
			{			
				sSysFlags.uiChannelNumber=g_uiKeyValue;
				F_PlayRespond(4);//语音提示"通道号选择完毕"
			}
			break;
		case 8://语音播放键
			sSysFlags.uiPlaySpeechKey=1;
			break;
		case 9://选择采样键
			sSysFlags.uiSelectSample=1;
			F_PlayRespond(2);//语音提示“模式选择完毕”
			for(i=0;i<0xFFFF;i++);
			F_PlayRespond(3);//语音提示"请输入通道号"
			break;
		case 10://循环采样键
			sSysFlags.uiCircleSample=1;
			F_PlayRespond(2);//语音提示“模式选择完毕”
			break;
		case 11://确定键
			sSysFlags.uiEnterKey=1;
			break;
		case 12://取消键
			sSysFlags.uiCancelKey=1;
			break;
		default:
			break;
	}
}