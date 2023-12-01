#define P_IOA_Data			(volatile unsigned int *)0x7000
#define P_IOA_Buffer		(volatile unsigned int *)0x7001
#define P_IOA_Dir			(volatile unsigned int *)0x7002
#define P_IOA_Attrib		(volatile unsigned int *)0x7003

#define P_Watchdog_Clear 	(volatile unsigned int *)0x7012

#define KEY_ALL 0xff00		//使用IOA8~IOA15作为键盘输入口
//============================================================= 
//	函数名称:   GetKey()
//	日期：		20040816
//	功能描述:	等待直到有键按下并抬起，返回键值，没有去抖处理
//	输入：		无
//	输出：		返回16位键值
//=============================================================
unsigned GetKey(void)
{
	
	unsigned KeyValue;

	//初始化IOA的相应端口为上拉输入
	*P_IOA_Dir&=~KEY_ALL;
	*P_IOA_Attrib&=~KEY_ALL;
	*P_IOA_Buffer|=KEY_ALL;
	
	//等待有键按下，即有端口变为0
	while(KeyValue==0)
	{
		KeyValue=(*P_IOA_Data & KEY_ALL)^KEY_ALL;
		*P_Watchdog_Clear=1;         //清看门狗
	}
	KeyValue=(*P_IOA_Data&KEY_ALL)^KEY_ALL;
	//等待按键抬起
	while((*P_IOA_Data&KEY_ALL)^KEY_ALL)
	{
		*P_Watchdog_Clear=1;
	}
	return KeyValue;
}