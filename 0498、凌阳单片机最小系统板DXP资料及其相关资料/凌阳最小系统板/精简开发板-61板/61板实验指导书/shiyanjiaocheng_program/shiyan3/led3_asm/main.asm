//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//           (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                     ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//=======================================================

//============================================================
//  工程名称： led3_asm.scs
//  功能描述:  用汇编实现按键点亮发光二极管
//  文件来源：《61板实验教程》"实验三 按键点亮发光二极管“
//  硬件连接：：A口低八位控制8个发光二极管的亮灭，B6控制8个发光二极管的共阴极
//              A8~A15作为键盘K1~K8输入口，1*8key中ROW1与VDD相连
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
// 实现功能： 用汇编实现按键点亮发光二极管
// 日期： 2004/8/16
//*****************************************************************************/

		.include  hardware.inc						//包含 hardware.inc
		.external  F_GetKey	
		.ram
		.var R_key			    			//定义变量	

		.code
		.public _main
//============================================================= 
// 函数名称:    _main  
// 日期：		20040816 		
// 功能描述:    按键点亮发光二极管
// 语法格式:    void main(void)
// 入口参数:    无
// 出口参数:    无
// 注意事项:    仅为用户模型
//=============================================================
_main:
		r1 = 0x00FF						//设置A0~A7口为同相低电平输出,
		[P_IOA_Dir] = r1				//A8 ~A15为高电平输入		  
		[P_IOA_Attrib] = r1
		r1 = 0xff00						
		[P_IOA_Data] = r1	
		r1=0x0040
		[P_IOB_Dir]=r1
		[P_IOB_Attrib]=r1
		[P_IOB_Data]=r1					//B6输出高电平，保证LED阴极接地		
L_MainLoop:
        call F_GetKey                   //取键值
        [R_key] = r1
        r1 = r1 lsr 4                   //取新的显示数据
        r1 = r1 lsr 4                 
        [P_IOA_Data] = r1
        jmp L_MainLoop


//*****************************************************************************/
//  main.asm 结束
//*****************************************************************************/









