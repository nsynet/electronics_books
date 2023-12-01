//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//             (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                          ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  工程名称： LED8_asm
//  功能描述:  
//			在数码管上显示按键的值，
//			按第一个键则显示"1"，按第二个键显示"2"，...，按第8个键显示"8"
//  硬件连接：
//			将LED键盘模组的"KEYTYPE"跳线跳到"1*8KEY"状态
//			将61板的IOA8~IOA15用排线连接到LED键盘模组的1*8KEY排针上；
//			IOB0－7连接到LED键盘模组的SEG排针上；
//			IOB8~IOB15连接到LED键盘模组的DIG排针上。
//  文件来源：《61板实验教程》,"实验八	按键显示数字"
//  IDE环境：   SUNPLUS u'nSPTM  IDE 1.8.4
//
//  涉及的库：
//  组成文件:
//    	main.asm
//  日期:          2004-8-19
//===============================================

//============================================================
// 文件名称：main.asm
// 实现功能: 
//			在数码管上显示按键的值，
//			按第一个键则显示"1"，按第二个键显示"2"，...，按第8个键显示"8"
// 日期： 2004/8/19
//============================================================
.include hardware.inc

.define LED_SEG 0x00ff		//IOB0~IOB7控制数码管或灯的状态
.define LED_DIG 0x3f00		//IOB8~IOB13分别控制6个数码管
.define LED_LIGHTS 0x4000	//IOB14控制LED灯
.define KEY_ALL 0xff00		//使用IOA8~IOA15作为键盘输入口

.ram
	.var Pos,Dig

.data
DigCode:
	.dw 0x3F,0x06,0x5B,0x4F,0x66
	.dw 0x6D,0x7D,0x07,0x7F,0x6F		//0~9十个数字的LED编码

.code
//============================================================= 
//	函数名称:   LedDispDig
//	功能描述:	在指定的数码管上显示数字
//	语法：		void LedDispDig(int Pos,int Dig)
//	输入：		Pos:	要显示数字的数码管位置，取值范围1~6
//				Dig:	要显示的数字，取值范围0~9
//	输出：		无
//=============================================================
.public LedDispDig
LedDispDig:
	push r1,r2 to [sp]

	r1=1
	[P_Watchdog_Clear]=r1
	//初始化IOB为同相输出
	r1=[P_IOB_Dir]
	r1|=LED_DIG+LED_SEG
	[P_IOB_Dir]=r1
	r1=[P_IOB_Attrib]
	r1|=LED_DIG+LED_SEG
	[P_IOB_Attrib]=r1
	
	//将数字的位置转换为IOB高8位值，选中相应数码管
	r1=0x0080
	r2=[Pos]			//将0x0080左移(Pos)位
L_SetIOBHigh:
	r1=r1 LSL 1
	r2-=1
	jnz	L_SetIOBHigh
	[P_IOB_Data]=r1
	
	//将数字转换为编码，作为IOB低8位输出
	r1=[Dig]
	r2=DigCode
	r2+=r1
	r1=[r2]
	r2=[P_IOB_Buffer]
	r2|=r1
	[P_IOB_Data]=r2
		
	pop r1,r2 from [sp]
	retf
	
//============================================================= 
//	函数名称:   GetKey
//	功能描述:	等待直到有键按下并抬起，返回键值，没有去抖处理
//	语法：		unsigned GetKey(void)
//	输入：		无
//	输出：		由r1返回16位键值
//=============================================================
.public GetKey;
.code
GetKey:
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
	[P_Watchdog_Clear]=r1	//喂狗
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

//============================================================= 
//	主函数
//=============================================================
.public _main
_main:
L_MainLoop:			//循环1：主循环
	call GetKey		//得到16位键值，保存在r1

	//将16位键值转换为1~8数值
	r2=1
	[Dig]=r2
	r3=0x0100
L_KeyLoop:			//循环2：从低到高依次检查IOB8~IOB15的每一位
	cmp r3,r1
	je L_KeyNum
	r2+=1
	[Dig]=r2
	r3=r3 lsl 1
	jz L_KeyError	//8位全部判断完，没有得到键值，则显示"0"表示出错
	jmp L_KeyLoop
L_KeyError:
	r2=0
	[Dig]=r2
L_KeyNum:
	r2=6			//在第六个数码管上显示键代表的数值（1~8）
	[Pos]=r2
	call LedDispDig	//送显示
	jmp L_MainLoop	//返回主循环
	retf

