//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//           (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                     ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//=======================================================

//============================================================
//  工程名称： led9_asm.scs
//  功能描述:  用汇编实现发光二极管循回点亮并数码管计数
//  文件来源：《61板实验教程》"实验九 发光二极管循回点亮并数码管计数“
//  硬件连接： IOA低8位接至SEG接口控制LED的导通
//             IOB低8位连至DIG通过ULN2003A控制8个LED的共阴极电平状态和数码管驱动
//  IDE环境：   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  涉及的库：
//  组成文件:
//    	main.asm
//
//  日期:  2004/8/19
//===============================================

//*****************************************************************************/
// 文件名称： main.asm
// 实现功能： 用汇编实现发光二极管循回点亮并数码管计数
//            LED巡回闪烁，同时数码管从左至右显示0~8，全部显示完成后，LED停止闪烁，数码管全亮
// 日期： 2004/8/19
//*****************************************************************************/
        .define P_IOA_Data			0x7000
		.define P_IOA_Dir			0x7002
		.define P_IOA_Attrib		0x7003
		.define P_IOB_Data			0x7005
		.define P_IOB_Dir			0x7007
		.define P_IOB_Attrib		0x7008
        .define P_Watchdog_Clear 	0x7012
		.data
//显示段码存放区
DispTbl:.DW 0x003F,0x0006,0x005B,0x004F,0x0066				//0，1，2，3，4
		.DW 0x006D,0x007D,0x0007,0x007F,0x00FF				//5，6，7，8，全亮								       
        .ram 
        .var R_Led = 0x0000
		.code
		.public _main
//============================================================= 
// 函数名称:    _main  
// 日期：		20040819	
// 功能描述:    发光二极管循回点亮并数码管计数
//              LED巡回闪烁，同时数码管从左至右显示0~8，全部显示完成后，LED停止闪烁，数码管全亮
// 语法格式:    _main 
// 入口参数:    无
// 出口参数:    无
// 注意事项:    仅为用户模型
//=============================================================
_main:
		r1 = 0x00FF						//设置A0~A7口为同相低电平输出
		[P_IOA_Dir] = r1						  
		[P_IOA_Attrib] = r1	
		[P_IOB_Dir]=r1	                //设置B0~B7口为同相低电平输出
		[P_IOB_Attrib] = r1
		r1 = 0x0000						
		[P_IOA_Data] = r1	
		[P_IOB_Data] = r1				
		r3 = 1                          //从第一个数码管开始
L_Loop:		
        r2 = 0x0000                     //防止误显示
        [P_IOA_Data] = r2;      
        r2 = 0x0001                     //对应位数码管显示0
        r1 = r3                       
        r1 -= 0x0001
        jz L_ShiftStop
L_Shift:                                //相应数码管位驱动                                      
        r2 = r2 LSL 1
        r1 -= 0x0001
        jnz	L_Shift
L_ShiftStop:
        [R_Led] = r2
        [P_IOB_Data] = r2;             
        BP = DispTbl
        r2 = [BP]
	    [P_IOA_Data] = r2; 
	    call F_LedDisp                  //发光二极管循回点亮并数码管计数
	    r3 += 0x0001   
        cmp r3,0x0007
		jne	L_Loop					    //数码管未全部显示完成，跳转到L_Loop循环
		r2 = 0x0000                     //防止误显示
        [P_IOA_Data] = r2; 
        r2 = 0x003f;                    //数码管全亮
        [P_IOB_Data] = r2;       
        BP = DispTbl                    
	    BP += 9 
        r2 = [BP]
	    [P_IOA_Data] = r2;   
L_MainLoop:
        call  F_Delay
        jmp   L_MainLoop

//============================================================= 
.public F_Delay;
.code
//============================================================= 
// 函数名称:    void F_Delay()  
// 日期：		20040819		
// 功能描述:    延时并清看门狗
//=============================================================
F_Delay:
          push r2,r3 to [SP]
          r3 = 0x5000
L_Delay:  
          r2 = 0x0001
          [P_Watchdog_Clear] = r2
          r3 -= 0x0001
          jnz L_Delay
          pop r2,r3 from [SP]
          retf
//============================================================= 

.public F_LedDisp;
.code
//============================================================= 
// 函数名称:    void F_LedDisp()  
// 日期：		20040819		
// 功能描述:    发光二极管点亮并数码管计数
// 入口参数:    r3 显示对应数字的数码管号码
//=============================================================
F_LedDisp:
          push r3,r3 to [sp]   
//          r2 = r3                   
//          r2 -= 0x0001
//          jz L_Stop
//L_LedShift1:                                                              
//          r3 = r3 LSL 1
//          r2 -= 0x0001
//          jnz L_LedShift1
//L_Stop:
//          [R_Led] = r3              //得到相应数码管位驱动
          r1 = 0x0001               //点亮的发光二极管号码         
L_Led:                              //发光二极管循环点亮一次                
	      r3 = 0x0001
	      r2 = 0x0000               //防止显示错误
	      [P_IOA_Data] = r2
	      r2 = 0x0040               //LED点亮位驱动
	      [P_IOB_Data] = r2  
          r2 = r1
          r2 -= 0x0001
          jz L_LedShiftStop2
L_LedShift2:                         //相应数码管位驱动                                      
          r3 = r3 LSL 1
          r2 -= 0x0001
          jnz L_LedShift2
L_LedShiftStop2:
          [P_IOA_Data] = r3         //LED新状态
          call F_Delay
          r3 = 0x0000               //防止显示错误
	      [P_IOA_Data] = r3     
          r2 = [R_Led]              //LED点亮位驱动
          [P_IOB_Data] = r2 
	      BP = DispTbl              //对应数字显示在数码管上
	      BP += r1
          r3 = [BP]
	      [P_IOA_Data] = r3;  
          call F_Delay
	      r1 += 0x0001
	      cmp r1,0x0009
		  jne L_Led					     //LED未全部显示完成，跳转到L_Led循环  
		  pop r3, r3 from [sp]  
          retf
//============================================================= 
//main.asm 结束
//=============================================================