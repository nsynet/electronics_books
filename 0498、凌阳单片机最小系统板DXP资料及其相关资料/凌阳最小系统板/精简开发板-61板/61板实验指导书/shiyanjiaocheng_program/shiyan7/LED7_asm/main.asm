//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//             (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                          ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  工程名称： LED7_asm
//  功能描述:  
//			发光二极管全部点亮；
//			发光二极管全部熄灭，数码管全部显示数字8；
//			数码管全部熄灭，发光二极管全部点亮，如此反复。
//  硬件连接：
//			将61板的IOB0－7用排线连接到LED键盘模组的SEG排针上；
//			IOB8~IOB15连接到LED键盘模组的DIG排针上。
//  文件来源：《61板实验教程》,"实验七	发光二极管和数码管交替显示"
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
//			控制所有数码管循环显示0－9十个数字
// 日期： 2004/8/19
//============================================================

.include hardware.inc

.define LED_SEG 0x00ff		//IOB0~IOB7控制数码管或灯的状态
.define LED_DIG 0x3f00		//IOB8~IOB13分别控制6个数码管
.define LED_LIGHTS 0x4000	//IOB14控制LED灯

.ram
	.var Pos,Dig,BitValue,TimerCnt

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
//	函数名称:   LedLights
//	语法：		void LedLights(int BitValue)
//	功能描述:	控制LED灯
//	输入：		BitValue:	8个LED灯的亮灭状态
//	输出：		无
//=============================================================
.public LedLights
LedLights:
	push r1 to [sp]
	r1=1
	[P_Watchdog_Clear]=r1
	
	//初始化IOB为同相输出
	r1=[P_IOB_Dir]
	r1|=LED_LIGHTS+LED_SEG
	[P_IOB_Dir]=r1
	r1=[P_IOB_Attrib]
	r1|=LED_LIGHTS+LED_SEG
	[P_IOB_Attrib]=r1
	
	r1=[BitValue]		//显示BitValue指定的值
	r1|=LED_LIGHTS		//选中LED灯
	[P_IOB_Data]=r1	
	
	pop r1 from [sp]
	retf

//============================================================= 
//	主函数
//=============================================================
.public _main
_main:
		
L_MainLoop:			//循环1：主循环
	//点亮全部LED灯
	r1=0xff;
	[BitValue]=r1
	call LedLights

	r1=60000		//循环2：保持LED灯点亮一段时间
	[TimerCnt]=r1
L_LightsLoop:
	r1=1
	[P_Watchdog_Clear]=r1
	r1=[TimerCnt]		//判断循环2是否结束
	r1-=1
	[TimerCnt]=r1
	jnz L_LightsLoop
		
	r1=1000			//循环3：在一段时间中使所有数码管显示数字“8”
	[TimerCnt]=r1
L_DigTimerLoop:		
	r1=1				
	[Pos]=r1
L_DigLoop:				//循环4：使六个数码管依次显示数字“8”
	r1=8
	[Dig]=r1
	call LedDispDig
	
	r1=[Pos]		//判断循环4是否结束
	r1+=1
	[Pos]=r1
	cmp r1,6
	jna L_DigLoop
	
	r1=[TimerCnt]
	r1-=1
	[TimerCnt]=r1
	jnz L_DigTimerLoop	//判断循环3是否结束
	
	jmp L_MainLoop		//返回主循环

	retf