//***********************************************************
//描述: 1)选择不同的时钟源,同一占空比8/16，观察示波器中频率的变化
//      2)选择同一时钟源，改变占空比,观察示波器，比较脉冲宽度 
//日期: 2003/07/08
//版本：1.8.0
//*************************************************************
.define			timefosc_2		0x0230;	//clkA选择fosc/2Hz
.define			timefosc_256	0x0231;	//clkA选择fosc/256Hz
.define			timeclk_32768	0x0232;	//clkA选择32768Hz
.define			timeclk_8192	0x0233;	//clkA选择8192Hz
.define			timeclk_4096	0x0234;	//clkA选择4096Hz
.define			timeclk_2048	0x0205;	//clkB选择2048Hz
.define			timeclk_1024	0x020d;	//clkB选择1024Hz
.define			timeclk_256		0x0215; //clkB选择256Hz
.define			timeclk_4		0x0225; //clkB选择4Hz
.define			timeclk_2		0x0065;	//clkB选择2HzHz
 
//频率选择fosc/2Hz;
//使用者也可以自己设置不同频率下的占空比；
 
.define			timepwm_1		0x0070; 	//脉宽选择1/6
.define			timepwm_2		0x00b0;	    //脉宽选择2/6
.define			timepwm_3		0x00f0;		//脉宽选择3/6
.define			timepwm_4		0x0130;		//脉宽选择4/6 		
.define			timepwm_5		0x0170;		//脉宽选择5/6 		 
.define			timepwm_6		0x01b0;		//脉宽选择6/6 		
.define			timepwm_7		0x01f0;		//脉宽选择7/6 	
.define			timepwm_8		0x0230;		//脉宽选择8/6 		
.define			timepwm_9		0x0270;		//脉宽选择9/6        
.define			timepwm_10		0x02b0;		//脉宽选择10/6 		
.define			timepwm_11		0x02f0;		//脉宽选择11/6 		
.define			timepwm_12		0x0330;		//脉宽选择12/6 		
.define			timepwm_13		0x0370;		//脉宽选择13/6 		
.define			timepwm_14		0x03b0;		//脉宽选择14/6
 
.define			time_clk	timefosc_256;	//频率选择
.define			time_pwm	timepwm_4;	 	//脉宽选择
 
.define		    P_TimerA_Data	  0x700A;
.define		    P_TimerA_Ctrl	  0x700B;
.define	     	P_IOB_DATA  	  0x7005;
.define	    	P_IOB_DIR   	  0x7007;
.define		    P_IOB_ATTRI		  0x7008;
.define	    	P_Feedback		  0x7009;
.define         p_watchdog_clear  0x7012;

.code
.public _main;	
_main:
	R1=0x0100; 			    	//IOB8设置为同相输出口 
    [P_IOB_DIR] = R1; 
	[P_IOB_ATTRI] = R1; 
	R1 = 0x0000; 
	[P_IOB_DATA ] = R1;
	R1 = 0x0000;
	[P_Feedback] = R1;          //设置IOB8口为APWMO端口
	R1 = 0xff9f; 		        //设定TA_TIMEOUT/16=(time_clk/96)/16=8kHz
	[P_TimerA_Data] = R1; 
	R1 = time_clk; 
	[P_TimerA_Ctrl] = R1; 
L_loop:
    nop;
    R1 = 0x0001;
    [p_watchdog_clear] = R1;    //清看门狗
    jmp L_loop;