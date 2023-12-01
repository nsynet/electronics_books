//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//           (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                     ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//=======================================================

//============================================================
//  工程名称： led1_asm.scs
//  功能描述:  用汇编实现发光二极管单向循环点亮
//  文件来源：《61板实验教程》"实验一 发光二极管单向循环点亮“
//  硬件连接： IOA低8位接至SEG接口控制LED的导通
//             IOB6连至DIG7通过ULN2003A控制8个LED的共阴极电平状态。
//  IDE环境：   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  涉及的库：
//  组成文件:
//    	main.asm
//
//  日期:  2004/8/16
//===============================================

//*****************************************************************************/
// 文件名称： main_asm
// 实现功能： 用汇编实现发光二极管单向循环点亮
// 日期： 2004/8/16
//*****************************************************************************/
		.include  hardware.inc						//包含 hardware.inc
		
		.ram
		.var R_LedControl			    			//定义变量
		.var R_DelayCounter		

		.code
		.public _main
//============================================================= 
// 函数名称:   _main
// 功能描述:   发光二极管单向循环点亮
// 语法格式:    void main(void);
// 入口参数:    无
// 出口参数:    无
// 注意事项:    仅为用户模型
//=============================================================
//============================================================================
_main:
		r1 = 0x00FF						//设置A0~A7口为同相低电平输出
		[P_IOA_Dir] = r1						  
		[P_IOA_Attrib] = r1
		r1 = 0x0000						
		[P_IOA_Data] = r1	
		r1=0x0040
		[P_IOB_Dir]=r1
		[P_IOB_Attrib]=r1
		[P_IOB_Data]=r1					//B6输出高电平，保证LED阴极接地
		r1=0x0001		
		[R_LedControl] = r1				//LED点亮控制初值
L_MainLoop:
		r1 = [R_LedControl]	  
		[P_IOA_Data] = r1				//送数据到A口
		r1=r1 LSL 1						//修改LED点亮控制参数
		cmp r1,0x0100					//只有8个LED，保证输出数据在8位以内
		jne NoOver
		r1 = 0x0001
NoOver:
		[R_LedControl] = r1	  
		r1 = 0x0000 					//延时计数器清零
		[R_DelayCounter] = r1
		call F_Delay 					//延时	
		jmp	L_MainLoop					//跳转到L_MainLoop循环，点亮LED


//============================================================= 
// 函数名称:   F_Delay
// 功能描述:   实现延时	
//=============================================================
F_Delay:
L_DelayLoop:	
		r1=0x0001                    	//清看门狗
		[P_Watchdog_Clear] = r1
		r1 = [R_DelayCounter]	  
		r1 += 1		 					//延时计数加1
		[R_DelayCounter] = r1
		jnz  L_DelayLoop 				//加到65536吗？
		retf			

//*****************************************************************************/
//  main.asm 结束
//*****************************************************************************/