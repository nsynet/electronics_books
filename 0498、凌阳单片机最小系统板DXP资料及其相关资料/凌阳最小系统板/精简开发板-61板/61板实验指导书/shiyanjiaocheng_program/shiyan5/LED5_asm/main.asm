//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//             (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                          ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  工程名称： LED5_asm
//  功能描述:  
//			控制所有数码管循环显示0－9十个数字
//  硬件连接：
//			将61板的IOB0－7用排线连接到LED键盘模组的SEG排针上；
//			IOB8~IOB15连接到LED键盘模组的DIG排针上。
//  文件来源：《61板实验教程》,"实验五	数码管显示0－9"
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

.define LED_SEG 0x00ff	//IOB0~IOB7
.define LED_DIG 0x3f00	//IOB8~IOB13

.ram
	.var Pos,Dig,TimerCnt

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
//	主函数
//=============================================================
.public _main
_main:

L_MainLoop:				//循环1：主循环
	r1=0
	[Dig]=r1
L_DigLoop:				//循环2：循环显示0~9十个数字
	r1=0
	[TimerCnt]=r1
L_TimerLoop:			//循环3：每组数字保持一段时间
 	r1=1
	[Pos]=r1
L_DispLoop:				//循环4：让6个数码管显示相同的数字（即Dig的值）
	call LedDispDig

	r1=[Pos]			//判断循环4是否结束
	r1+=1
	[Pos]=r1
	cmp r1,6
	jna L_DispLoop

	r1=[TimerCnt]		//判断循环3是否结束
	r1+=1
	[TimerCnt]=r1
	cmp r1,1000
	jb L_TimerLoop
	
	r1=[Dig]			//判断循环2是否结束
	r1+=1
	[Dig]=r1
	cmp r1,9
	jna L_DigLoop

	jmp L_MainLoop		//返回主循环
	
	retf