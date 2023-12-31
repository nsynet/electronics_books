//========================================================================================================
// 文件名称：system.asm
// 实现功能：实现与硬件相关的底层操作
// 日    期：2003/7/7
//========================================================================================================

.INCLUDE hardware.inc

.CODE
//========================================================================================================
//函数: F_System_Initial
//语法：void F_System_Initial()
//描述：初始化
//参数：无
//返回：无
//========================================================================================================
.PUBLIC _F_System_Initial
_F_System_Initial:
		PUSH r1,r5 TO [sp];
		r1 = 0xff00;	        //设置IOA8-IOA15口为同向高电平输出
		[P_IOA_Attrib] = r1;    //设置IOA0-IOA7口为带下拉电阻输入
		[P_IOA_Dir] = r1;
		r1 = 0xff00;	
		[P_IOA_Data] = r1;
		POP	r1,r5 FROM [sp];
		RETF

//========================================================================================================
//函数: F_Display_Command
//语法：void F_Display_Command()
//描述：将接收到的命令用发光二极管显示
//参数：无
//返回：无
//========================================================================================================
.PUBLIC _F_Display_Command
_F_Display_Command:
		PUSH r1,r5 TO [sp];
	    bp=sp+1;
		r1=[bp+7]
		r1=r1 lsl 4;
		r1=r1 lsl 4;
		[P_IOA_Data]=r1;
		POP	r1,r5 FROM [sp];
		RETF
		
		
//========================================================================================================
//函数: F_GetKeyValue
//语法：void F_GetKeyValue()
//描述：初始化
//参数：无
//返回：无
//========================================================================================================

.PUBLIC _F_GetKeyValue
_F_GetKeyValue:
	   	PUSH r2,r5 TO [sp];
		r1=[P_IOA_Data]
		r1&=0x00ff; 
		JZ L_ExitGetKeyValue;
		r2=0x00ff;
		call F_Delay;
		r1=[P_IOA_Data]
		r1&=0x00ff;
L_ExitGetKeyValue:
		POP	r2,r5 FROM [sp];
		RETF
F_Delay:
		r2-=1
		jnz	F_Delay
		retf


//========================================================================================================
//函数: F_LED_On
//语法：void F_LED_On(unsigned int)
//描述：点亮LED灯（IOA8-IOA15接LED）
//参数：无
//返回：无
//========================================================================================================
	
.PUBLIC _F_LED_On
_F_LED_On:
		PUSH r1,r5 to [sp];
		bp=sp+1;
		r1=[bp+7];
		r1=r1 lsl 4;
		r1=r1 lsl 4;
		[P_IOA_Data]=r1;
		POP r1,r5 from [sp];
		retf;