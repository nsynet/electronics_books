//======================================================
// 文件名称:	PWM.asm
// 功能描述：   PWM设置服务 
// 完成日期：   2003-8-13
//======================================================
.DEFINE	timefosc_2		0x0230;	//clkA选择fosc/2Hz
.DEFINE		timefosc_256	0x0231;	//clkA选择fosc/256Hz
.DEFINE		timeclk_32768	0x0232;	//clkA选择32768Hz
.DEFINE		timeclk_8192	0x0233;	//clkA选择8192Hz
.DEFINE		timeclk_4096	0x0234;	//clkA选择4096Hz
.DEFINE		timeclk_2048	0x0205;	//clkB选择2048Hz
.DEFINE		timeclk_1024	0x020d;	//clkB选择1024Hz
.DEFINE		timeclk_256		0x0215; //clkB选择256Hz
.DEFINE		timeclk_4		0x0225; //clkB选择4Hz
.DEFINE		timeclk_2		0x0065;	//clkB选择2HzHz
 
//频率选择fosc/2Hz;
//使用者也可以自己设置不同频率下的占空比；
 
.DEFINE		timepwm_1		0x0070; 	//脉宽选择1/6
.DEFINE		timepwm_2		0x00b0;	    //脉宽选择2/6
.DEFINE		timepwm_3		0x00f0;		//脉宽选择3/6
.DEFINE		timepwm_4		0x0130;		//脉宽选择4/6 		
.DEFINE		timepwm_5		0x0170;		//脉宽选择5/6 		 
.DEFINE		timepwm_6		0x01b0;		//脉宽选择6/6 		
.DEFINE		timepwm_7		0x01f0;		//脉宽选择7/6 	
.DEFINE		timepwm_8		0x0230;		//脉宽选择8/6 		
.DEFINE		timepwm_9		0x0270;		//脉宽选择9/6        
.DEFINE		timepwm_10		0x02b0;		//脉宽选择10/6 		
.DEFINE		timepwm_11		0x02f0;		//脉宽选择11/6 		
.DEFINE		timepwm_12		0x0330;		//脉宽选择12/6 		
.DEFINE		timepwm_13		0x0370;		//脉宽选择13/6 		
.DEFINE		timepwm_14		0x03b0;		//脉宽选择14/6
 
.DEFINE		time_clk	timefosc_256;	//频率选择
.DEFINE		time_pwm	timepwm_4;	 	//脉宽选择
 
.DEFINE	    P_TimerB_Data	  0x700C;
.DEFINE	    P_TimerB_Ctrl	  0x700D;
.DEFINE     P_IOB_DATA  	  0x7005;
.DEFINE    	P_IOB_DIR   	  0x7007;
.DEFINE	    P_IOB_ATTRI		  0x7008;
.DEFINE    	P_Feedback		  0x7009;
.define     p_watchdog_clear  0x7012;
.DEFINE		P_INT_CTRL		  0x7010;
.DEFINE		P_INT_CLEAR		  0x7011;

.code
//======================================================
// 函数名称:	F_Pwm
// 实现功能:    PWM设置
// 入口参数：   频率设置值，占空比设置值
// 出口参数：   无
// 破坏寄存器:  r1，r2
//======================================================
.public _F_Pwm;	
_F_Pwm:
    push bp to  [sp];
   bp=sp+3  
   r1=[bp+1]; 
 //	r1=0x0200; 			    	//IOB8设置为同相低电平输出口 
 //   [P_IOB_DIR] = r1; 
//	[P_IOB_ATTRI] = r1; 
//	r1 = 0x0000; 
//	[P_IOB_DATA ] = r1;
//    r1=	0x0030	        
	[P_TimerB_Data]=r1; 
	r2=[bp+2];
//	r2=0x0100;
	[P_TimerB_Ctrl]=r2; 
	
	r1=0x0000;
	[P_Feedback]=r1;        //设置IOB8口为APWMO端口
	pop bp from  [sp];
	retf
