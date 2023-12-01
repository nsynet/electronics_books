//==========================================================
//文件名称:Key.c
//功能描述:初始化键盘函数和扫描键盘函数
//维护记录 2006.4.20 by hongyan.Feng
//==========================================================
#define	P_IOA_Data 				(volatile unsigned int *)0x7000
#define P_IOA_Buffer 			(volatile unsigned int *)0x7001
#define P_IOA_Dir 				(volatile unsigned int *)0x7002
#define P_IOA_Attrib 			(volatile unsigned int *)0x7003

#define	P_IOB_Data 				(volatile unsigned int *)0x7005
#define P_IOB_Buffer 			(volatile unsigned int *)0x7006
#define P_IOB_Dir 				(volatile unsigned int *)0x7007
#define P_IOB_Attrib 			(volatile unsigned int *)0x7008
#define P_Watchdog_Clear		(volatile unsigned int *)0x7012 
//========================================================
//	语法格式：	void Key_Init(void)
//	实现功能：	键盘初始化
//	参数：		无
//	返回值：	无
//========================================================
void Key_Init(void)
{
	*P_IOA_Dir &= 0xff00;				//初始化IOA口低八位为带下拉电阻输入口
	*P_IOA_Attrib &= 0xff00;
	*P_IOA_Data &= 0xff00;	
}
//========================================================
//	语法格式：	void Delay(void)
//	实现功能：	延时
//	参数：		无
//	返回值：	无
//========================================================
void delay(void)
{
	unsigned int uiCount;
	for(uiCount = 0;uiCount <= 3000;uiCount++)
	{
		*P_Watchdog_Clear = 0x0001;    //清看门狗
	}
}
//========================================================
//	语法格式：	unsigned int KeyScan(void)
//	实现功能：	获得键盘值并返回
//	参数：		无
//	返回值：	键盘值
//========================================================

unsigned int KeyScan(void)
{
	unsigned int uiData;
	unsigned int uiTemp;
	uiData = *P_IOA_Data;				//读取IOA端口输入
	uiData = uiData&0x00ff;				//仅取低八位有效值
	if(uiData!=0)						//非零则表示有键按下
	{
		delay();						//延时消抖
		uiTemp = *P_IOA_Data;
		uiTemp = uiTemp&0x00ff;		    //仅取低八位有效值
		if(uiData != uiTemp)
			uiData = 0;					//两次读数不相等，则置返回值为0
	}
	return uiData;	                    //返回键值	
}

