//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//           (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                     ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//=======================================================

//============================================================
//  工程名称： led10_asm.scs
//  功能描述:  用汇编实现A/D采样数据在发光二极管上点亮
//  文件来源：《61板实验教程》"实验十 A/D采样数据在发光二极管上点亮“
//  硬件连接： 61板SPY0029接口选择3.3V，IOB高8位接至SEG接口控制LED的导通
//             IOB6连至DIG7通过ULN2003A控制8个LED的共阴极电平状态
//  IDE环境：  SUNPLUS u'nSPTM  IDE 1.8.0
//
//  涉及的库：
//  组成文件:
//  main.asm
//
//  日期:  2004/8/17
//===============================================

//*****************************************************************************/
// 文件名称： main.asm
// 实现功能： 用汇编实现A/D采样数据在发光二极管上点亮
//            通过改变LINE_IN端口的模拟电压来改变IOB口输出的数据，
//            采用自动方式执行ADC转换，可以通过发光
//            二极管的点亮了解转换的数据值。
// 日期： 2004/8/17
//*****************************************************************************/

		.define		P_IOB_DATA  	   	0x7005 
		.define		P_IOB_DIR   	    0x7007 
		.define		P_IOB_ATTRI			0x7008 
		.define		P_INT_Ctrl			0x7010 
		.define		P_INT_CLEAR			0x7011 
		.define		P_ADC_Ctrl		    0x7015 
		.define		P_ADC_MUX_Ctrl		0x702b 
		.define		P_ADC_MUX_DATA		0x702C
		.define		P_DAC_Ctrl		    0x702A 
        .define		P_Watchdog_Clear    0x7012
        
        .ram 
        .var   R_DelayCounter = 0
            
		.code
		.public _main
//============================================================= 
// 函数名称:  _main
// 功能描述: 通过改变LINE_IN端口的模拟电压来改变IOB口输出的数据，
//           采用自动方式即定时器A溢出执行ADC转换，可以通过IOB高8位控制发光
//           二极管的点亮了解转换的数据值。
// 语法格式:  _main
//入口参数:     无
// 出口参数:    无
// 注意事项:    仅为用户模型
//=================================================================
_main:         
		r1 = 0xff40 
		[P_IOB_ATTRI] = r1             //IOB8-IOB15,IOB6口设置为同向输出口
		[P_IOB_DIR] = r1 
		r1 = 0x0040
		[P_IOB_DATA] = r1
		r1 = 0x0001                   //选择通道LINE_IN为IOA0
		[P_ADC_MUX_Ctrl] = r1		 	
		r1 = 0x0001	                  //允许A/D转换
		[P_ADC_Ctrl] = r1 		 
 Loop_AD:    
		r1 = [P_ADC_MUX_Ctrl]         //读寄存器[P_ADC_MUX_Ctrl]的B15  
		test r1,0x8000				  //判断是否转换完毕
		jz Loop_AD                 	  //否，继续转换
		r1 = [P_ADC_MUX_DATA]    	  //是，则读出[P_ADC_MUX_DATA]转换结果
                                      //同时触发A/D重新转换
		r1 = r1 lsl 2				  //保留A/D值的最低8位
		r1 |= 0x0040				  //保证IOB6为高,LED阴极共地
		[P_IOB_DATA] = r1
		r1 = 0x0000                   //延时初值设定
        [R_DelayCounter] = r1
L_DelayLoop:	                      //延时并清看门狗
		r1 = 0x0001                   //清看门狗
		[P_Watchdog_Clear] = r1
		r1 = [R_DelayCounter]	  
		r1 += 1		 				  //延时计数加1
		[R_DelayCounter] = r1
		cmp r1,0x100                  //延时时间到了吗？
		jne  L_DelayLoop 				
		jmp Loop_AD;
		
//============================================================= 
//main.asm 结束
//=============================================================