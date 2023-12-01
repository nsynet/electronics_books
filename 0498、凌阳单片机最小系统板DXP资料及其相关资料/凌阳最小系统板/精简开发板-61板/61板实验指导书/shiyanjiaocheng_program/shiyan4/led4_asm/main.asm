//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//           (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                     ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//=======================================================

//============================================================
//  工程名称： led4_asm.scs
//  功能描述:  用汇编实现键控发光二极管循环点亮
//  文件来源：《61板实验教程》"实验四 键控发光二极管循环点亮“
//  硬件连接： IOA低8位接至SEG接口控制LED的导通
//             IOA高8位连接到LED键盘模组的1*8KEY接口管脚上，读取相应按键值
//             1*8key中ROW1与DGND相连，IOB6连至DIG7通过ULN2003A控制8个LED的共阴极电平状态
//  IDE环境：   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  涉及的库：
//  组成文件:
//    	main.asm
//
//  日期:  2004/8/16
//===============================================

//*****************************************************************************/
// 文件名称： main.asm
// 实现功能： 用汇编实现键控发光二极管循环点亮
// 日期： 2004/8/16
//*****************************************************************************/
		.include  hardware.inc				//包含 hardware.inc
		.external  F_GetKey	
		.ram
		.var R_key			    			//定义变量	
		.var R_LedControl
		.code
		.public _main
//============================================================= 
// 函数名称:    _main  
// 日期：		20040816 	
// 功能描述:    键控发光二极管循环点亮
// 语法格式:    _main 
// 入口参数:    无
// 出口参数:    无
// 注意事项:    仅为用户模型
//=============================================================
_main:
		r1 = 0x00FF						//设置A0~A7口为同相低电平输出
		[P_IOA_Dir] = r1						  
		[P_IOA_Attrib] = r1
		r1 = 0xff00						
		[P_IOA_Data] = r1	
		r1=0x0040
		[P_IOB_Dir]=r1
		[P_IOB_Attrib]=r1
		[P_IOB_Data]=r1					//B6输出高电平，保证LED阴极接地
		r1 = 0
		[R_LedControl]	= r1
L_MainLoop:		
        call F_GetKey                   //取键值
        [R_key] = r1
        cmp r1, 0x0000
        je L_LedLoop
        r1 = r1 lsr 4                   //取新的显示数据
        r1 = r1 lsr 4                 
        [R_LedControl]	= r1
L_LedLoop: 
        r1 = [R_LedControl]
        [P_IOA_Data] = r1				//送数据到A口
		r1 = r1 LSL 1					//修改LED点亮控制参数
		cmp r1,0x0100					//只有8个LED，保证输出数据在8位以内
		jne L_LedValue                 
		r1 = 0x0001                     //Led显示初始值
L_LedValue:                             //Led下一次显示值
		[R_LedControl] = r1
		jmp	L_MainLoop					//跳转到L_MainLoop循环
   
//============================================================= 
//main.asm 结束
//=============================================================












