//========================================================
//	文件名称：	MS01.h
//	功能描述：	MS01的库函数声明（C语言）
//	维护记录：	2006-10-16	v1.0, by Qwerty
//========================================================
#ifndef	__MS01_h__
#define	__MS01_h__

//========================================================================
//	语法格式：	void SACM_MS01_Initial(void);
//	实现功能：	MS01初始化
//	参数：		无
//	返回值：	无
//========================================================================
extern void SACM_MS01_Initial(void);

//========================================================================
//	语法格式：	void SACM_MS01_Play(unsigned int SoundIndex, unsigned int DAC_Channel, unsigned int RampUpDn);
//	实现功能：	开始MS01语音播放
//	参数：		SoundIndex:		待播放的语音资源序号
//				DAC_Channel:	语音输出的DAC通道。
//								1 - DAC1
//								2 - DAC2
//								3 - DAC1+DAC2
//				RampUpDn:		是否在播放起始和结束时采取渐入渐出方式
//								0 - 不采取渐入渐出方式
//								1 - 播放起始时采取渐入方式
//								2 - 播放结束时采取渐出方式
//								3 - 播放起始时采取渐入方式，播放结束时采取渐出方式
//	返回值：	无
//========================================================================
extern void SACM_MS01_Play(unsigned int SoundIndex, unsigned int DAC_Channel, unsigned int RampUpDn);

//========================================================================
//	语法格式：	void SACM_MS01_Stop(void);
//	实现功能：	停止MS01放音
//	参数：		无
//	返回值：	无
//========================================================================
extern void SACM_MS01_Stop(void);

//========================================================================
//	语法格式：	void SACM_MS01_Pause(void);
//	实现功能：	暂停播放，可以通过SACM_MS01_Resume()函数恢复
//	参数：		无
//	返回值：	无
//========================================================================
extern void SACM_MS01_Pause(void);

//========================================================================
//	语法格式：	void SACM_MS01_Resume(void);
//	实现功能：	恢复被暂停的播放操作
//	参数：		无
//	返回值：	无
//========================================================================
extern void SACM_MS01_Resume(void);

//========================================================================
//	语法格式：	void SACM_MS01_Volume(unsigned int Volume);
//	实现功能：	设定MS01的播放音量
//	参数：		Volume:			音量等级，范围0~15，默认为8。
//								该参数为0则无声音输出，为15则以最大音量输出
//	返回值：	无
//========================================================================
extern void SACM_MS01_Volume(unsigned int Volume);

//========================================================================
//	语法格式：	void SACM_MS01_DAC_FIRType(unsigned int FIRType);
//	实现功能：	设定DAC输出的滤波方式
//	参数：		FIRType:		输出滤波方式代码，范围0~3。
//								0 - 不进行滤波，解码后以16KHz采样率直接输出
//								1 - 不进行滤波，以二倍采样率(32KHz)插值输出
//								2 - 以二倍采样率(32KHz)进行简易滤波输出
//								3 - 以二倍采样率(32KHz)进行复杂滤波输出
//	返回值：	无
//========================================================================
extern void SACM_MS01_DAC_FIRType(unsigned int FIRType);

//========================================================================
//	语法格式：	void SACM_MS01_ServiceLoop(void);
//	实现功能：	执行MS01解码操作
//	参数：		无
//	返回值：	无
//========================================================================
extern void SACM_MS01_ServiceLoop(void);

//========================================================================
//	语法格式：	void SACM_MS01_ISR(void);
//	实现功能：	MS01中断服务，应在Timer中断服务程序中执行该函数
//	参数：		无
//	返回值：	无
//========================================================================
extern void SACM_MS01_ISR(void);

//========================================================================
//	语法格式：	unsigned int SACM_MS01_Status(void);
//	实现功能：	获取当前MS01的播放状态
//	参数：		无
//	返回值：	MS01播放状态编码
//				bit0 - 1:当前处于放音状态；0:当前不处于放音状态
//				bit1 - 保留
//				bit2 - 1:暂停状态；0:正常状态
//				bit3 - 1:播放时可通过DAC1输出；0:播放时不通过DAC1输出
//				bit4 - 1:播放时可通过DAC2输出；0:播放时不通过DAC2输出
//				bit5 - 1:播放起始时采取渐入方式；0:播放起始时不采取渐入方式
//				bit6 - 1:播放结束时采取渐出方式；0:播放结束时不采取渐出方式
//				bit7~bit14 - 保留
//				bit15 - 放音时，如果当前处于输出缓冲区欠载状态（不能及时进行解码）则该位为1
//========================================================================
extern unsigned int SACM_MS01_Status(void);


//=========================================================================
//	助记符定义
//=========================================================================
#ifndef _SACM_API_CONSTANTS_
#define _SACM_API_CONSTANTS_

#define DAC_1			1
#define DAC_2			2

#define RAMP_NONE		0
#define RAMP_UP			1
#define RAMP_DN			2
#define RAMP_UP_DN		3

#define BITRATE_10K		0				// DVR1600 Only
#define BITRATE_12K		1				// DVR1600 Only
#define BITRATE_14K		2				// DVR1600 Only
#define BITRATE_16K		3				// DVR1600 Only
#define BITRATE_20K		4				// DVR1600 Only
#define BITRATE_24K		5				// DVR1600 Only

#define DAC_FIRTYPE_0	0
#define DAC_FIRTYPE_1	1
#define DAC_FIRTYPE_2	2
#define DAC_FIRTYPE_3	3

#define ADC_FIRTYPE_0	0				// DVR1600 Only
#define ADC_FIRTYPE_1	1				// DVR1600 Only
#define ADC_FIRTYPE_2	2				// DVR1600 Only

#define STATUS_PLAY		0x0001
#define STATUS_RECORD	0x0002			// DVR1600 Only
#define STATUS_PAUSE	0x0004
#define STATUS_DAC1		0x0008
#define STATUS_DAC2		0x0010
#define STATUS_RAMPUP	0x0020
#define STATUS_RAMPDN	0x0040
#define STATUS_OVERFLOW	0x8000

#endif
#endif