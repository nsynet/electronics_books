//========================================================================================================
// 文件名称：system.asm
// 实现功能：实现与硬件相关的底层操作
// 日    期：2003/7/7
//========================================================================================================
.INCLUDE   hardware.inc
.CODE
//========================================================================================================
//函数: F_System_Initial
//语法：void F_System_Initial()
//描述：初始化
//参数：无
//返回：无
//========================================================================================================
.PUBLIC _F_System_Initial;
_F_System_Initial: .PROC
	PUSH r1,r1 TO [sp];
	r1=0xFF00;				//IOA0-IOA7设置为下拉输入，IOA8-IOB15设置为同相高电平输出。
	[P_IOA_Dir]=r1;
	[P_IOA_Attrib]=r1;
	r1=0xFF00;
	[P_IOA_Data]=r1;
	POP r1,r1 FROM [sp];
	RETF;
	.ENDP;
//========================================================================================================
//函数: F_LED_On
//语法：void F_LED_On(unsigned int uiLedStateValue)
//描述：点亮与IOA8-IOA15相连的LED灯
//参数：uiLedStateValue:低8位为LED灯状态值，高电平点亮LED,低电平熄灭LED.
//返回：无
//========================================================================================================
.PUBLIC _F_LED_On;
_F_LED_On: .PROC 
	PUSH r1,r1 TO [sp];
	bp=sp+1;
	r1=[bp+3];
	r1=r1 lsl 4;
	r1=r1 lsl 4;
	[P_IOA_Data]=r1;
	POP r1,r1 FROM [sp];
	RETF;
	.ENDP

//========================================================================================================
//函数: F_GetKeyValue
//语法：unsigned int F_GetKeyValue(void)
//描述：获取与IOA0-IOA7相连接的7个按键的键值
//参数：无
//返回：键值
//========================================================================================================
.PUBLIC _F_GetKeyValue;
_F_GetKeyValue: .PROC
	PUSH r2,r5 TO [sp];
	r1=[P_IOA_Data];
	r1&=0x00FF;
	JZ L_Exit;
	CALL F_Delay;
	r1=[P_IOA_Data];
	r1&=0x00FF;
	JZ L_Bounce;
L_Key_Query:
	r3=0x0001;
	[P_Watchdog_Clear]=r3;
	r2=[P_IOA_Data];
	r2&=0x00FF;
	JNZ L_Key_Query;
	JMP L_Exit;
L_Bounce:
	r1=0x0000;
L_Exit:	
	r3=0x0001;
	[P_Watchdog_Clear]=r3;
	POP r2,r5 FROM [sp];
	RETF;
	.ENDP
//========================================================================================================
//函数: F_Delay
//语法：call F_Delay  (for Assembly language)
//描述：用于键扫描延时去抖
//参数：无
//返回：无
//========================================================================================================
F_Delay:
	PUSH r1,r2 TO [sp];
	r2=0x0002;
L_Delay_Loop1:
	r1=0x0FFF;
L_Delay_Loop2:
	r1-=1;
	JNZ L_Delay_Loop2;
	r2-=1;
	JNZ L_Delay_Loop1;	
	POP r1,r2 FROM [sp];
	RETF;
