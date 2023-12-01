//========================================================
//	文件名称：	SACM_DVR1600_User_C.c
//	功能描述：	DVR1600用户函数（C语言版），用于保存或获取语音资源数据
//				包括：
//					void USER_DVR1600_GetResource_Init(unsigned int SoundIndex);
//					void USER_DVR1600_GetResource(unsigned int *p_Buf, unsigned int Words);
//					void USER_DVR1600_SaveResource_Init(unsigned int UserParam);
//					void USER_DVR1600_SaveResource(unsigned int *p_Buf, unsigned int Words);
//					void USER_DVR1600_SaveResource_End(void);
//				这些函数被语音库自动调用，可根据需要自行修改这些函数的内容
//	维护记录：	2006-10-16	v1.0, by Qwerty
//========================================================
#include "SPCE061A.h"
#include "Flash.h"
//======================================================
//	常量和助记符定义
//======================================================
#define	RECORD_SA	0xC000					// 录音资源起始地址
#define	RECORD_EA	0xEFFF					// 录音资源结束地址

//======================================================
//	外部函数和变量声明
//======================================================
extern void SACM_DVR1600_Stop(void);

//========================================================================
//	全局变量定义
//========================================================================
unsigned int ResAddr;

//========================================================================
//	语法格式：	void USER_DVR1600_GetResource_Init(unsigned int SoundIndex);
//	实现功能：	(被DVR1600函数库自动调用)获取语音资源数据，初始化操作
//	参数：		SoundIndex:		语音资源序号
//	返回值：		无
//========================================================================
void USER_DVR1600_GetResource_Init(unsigned int SoundIndex)
{
	ResAddr = RECORD_SA;					// 初始化语音资源的起始地址
}

//========================================================================
//	语法格式：	void USER_DVR1600_GetResource(unsigned int *p_Buf, unsigned int Words);
//	实现功能：	(被DVR1600函数库自动调用)获取语音资源数据，并填充到解码队列中
//	参数：		p_Buf:		待填充解码队列的起始地址(该参数由函数库自动产生)
//				Words:		待填充数据的数量，单位为Word(该参数由函数库自动产生)
//	返回值：		无
//========================================================================
void USER_DVR1600_GetResource(unsigned int *p_Buf, unsigned int Words)
{
	while(Words>0)
	{
		*p_Buf = *(unsigned int*)ResAddr;
		p_Buf++;
		ResAddr++;
		Words--;
	}
}

//========================================================================
//	语法格式：	void USER_DVR1600_SaveResource_Init(unsigned int UserParam);
//	实现功能：	(被DVR1600函数库自动调用)保存录制的语音资源编码，初始化操作
//	参数：		UserParam:	由SACM_DVR1600_Play函数传递的用户自定义参数
//	返回值：		无
//========================================================================
void USER_DVR1600_SaveResource_Init(unsigned int UserParam)
{
	unsigned int Addr;
	for(Addr=RECORD_SA; Addr<=RECORD_EA; Addr+=0x0100)
	{
		Flash_Erase(Addr);					// 擦除录音所需的Flash
		*P_Watchdog_Clear = 0x01;
	}
	ResAddr = RECORD_SA + 2;				// 跳过前两个Word（用于录音结束时保存资源长度）
}

//========================================================================
//	语法格式：	void USER_DVR1600_SaveResource(unsigned int *p_Buf, unsigned int Words)
//	实现功能：	(被DVR1600函数库自动调用)获取已编码数据，并保存
//	参数：		p_Buf:		待获取的已编码数据的起始地址(该参数由函数库自动产生)
//				Words:		已编码数据的数量，单位为Word(该参数由函数库自动产生)
//	返回值：		无
//========================================================================
void USER_DVR1600_SaveResource(unsigned int *p_Buf, unsigned int Words)
{
	while(Words--)
	{
		Flash_WriteWord(ResAddr++, *p_Buf++);
		if(ResAddr>RECORD_EA)				// 达到结束地址则停止录音
		{
			SACM_DVR1600_Stop();
			break;
		}
	}
}

//========================================================================
//	语法格式：	void USER_DVR1600_SaveResource_End(void)
//	实现功能：	(被DVR1600函数库自动调用)录音结束后，将录制资源的长度(单位为Byte)保存到该资源的前两个word
//	参数：		无
//	返回值：		无
//========================================================================
void USER_DVR1600_SaveResource_End(void)
{
	unsigned int ResSize;
	ResSize = (ResAddr - RECORD_SA)<<1;		// 计算录音资源的长度，转换为Byte单位
	Flash_WriteWord(RECORD_SA, ResSize);	// 资源长度的低16位写入RECORD_SA中
	Flash_WriteWord(RECORD_SA+1, 0x0000);	// 资源长度的高16位填充0
}
