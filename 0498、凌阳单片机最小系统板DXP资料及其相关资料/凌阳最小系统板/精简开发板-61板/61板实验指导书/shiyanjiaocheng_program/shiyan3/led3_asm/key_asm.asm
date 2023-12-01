.include hardware.inc

.define KEY_ALL 0xff00		//使用IOA8~IOA15作为键盘输入口

//============================================================= 
//	函数名称:   F_GetKey
//	日期：		20040816
//	语法：		unsigned F_GetKey(void)
//	功能描述:	等待直到有键按下并抬起，返回键值，没有去抖处理
//	输入：		无
//	输出：		由r1返回16位键值
//=============================================================
.public F_GetKey;
.code
F_GetKey:
	push r2 to [sp]
	r1=[P_IOA_Dir]			//初始化IOA的相应端口为上拉输入
	r1&=~KEY_ALL
	[P_IOA_Dir]=r1
	r1=[P_IOA_Attrib]		
	r1&=~KEY_ALL
	[P_IOA_Attrib]=r1
	r1=[P_IOA_Buffer]
	r1|=KEY_ALL
	[P_IOA_Buffer]=r1
L_WaitKeyDown:				//等待有键按下，即有端口变为0
	r1=1
	[P_Watchdog_Clear]=r1	//清看门狗
	r1=[P_IOA_Data]
	r1&=KEY_ALL
	r1^=KEY_ALL				//取反
	jz	L_WaitKeyDown		//如果r1为0说明没有键按下，继续等待
L_WaitKeyUp:				//如果有键按下则等待该键抬起
	r2=1
	[P_Watchdog_Clear]=r2
	r2=[P_IOA_Data]
	r2&=KEY_ALL
	r2^=KEY_ALL
	jnz L_WaitKeyUp
	pop r2 from [sp]
	retf
