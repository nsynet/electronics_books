.EXTERNAL	G_Flag_Status;

.DEFINE		P_WatchDog_Clear	0x7012
.DEFINE 	P_ADC_MUX_Ctrl 		0x702b
.DEFINE 	P_ADC_MUX_Data		0x702c


.define 	FOR_PLAY_xKHZ		(0xffff - 49152000/2/4000)	 
.define 	FOR_RECORD_8KHZ 	(0xffff - 49152000/2/8000)

.PUBLIC		_System_Initial;
.PUBLIC		_Fir;

.INCLUDE	hardware.inc
	
.CODE
_System_Initial:	.PROC

	 	//系统时钟设定
	 	r1 = 0x0098;    		 	
	 	[P_SystemClock] = r1;
	 	
	 	//IO设定
	 	//IOA0~IOA2为带下拉电阻输入，IOA6为悬浮输入
	 	r1=0x0;
	 	[P_IOA_Dir]=r1;
	 	r1=0xfff0;
	 	[P_IOA_Attrib]=r1;
	 	[P_IOA_Data]=r1;

		r1=0xffff;
		[P_IOB_Dir] = r1;
		[P_IOB_Attrib] = r1;
		r1=0x3;
	    [P_IOB_Data] = r1;  
	 
	    r1 = 0x00C3;				//采用24位地址
	    [P_SIO_Ctrl] = r1;
	
		
	 	//TimerA设定
	 	r1 = 0x0030;    		 	//clckA选择Fosc/2;屏蔽ClockB
	 	[P_TimerA_Ctrl] = r1;
	 	r1 = FOR_RECORD_8KHZ;		
	 	[P_TimerA_Data] = r1;   	//8kHz中断频率
	 	
	 	//DA设定
		 r1 = 0;    
	 	[P_DAC_Ctrl] = r1;      	//直接将DAR锁存到DAC,通过读P_ADC触发ADC转换
	 	
	 	//AD设定
	 	r1 = 0x1;
	 	[P_ADC_Ctrl] = r1;        	//允许数模转换
	 	r1 = 0x7;
	 	[P_ADC_MUX_Ctrl] = r1;    	//选择Line_IN7(IOA6)输入
	 	
	 	//中断设置
	 	r1 = 0x2000;
	 	[P_INT_Ctrl] = r1;    		//允许timeA的FIQ中断
	 	retf
.ENDP


////////////////////////////////////////////
_Fir:	.PROC
	 	r1 = x0; 					//数据指针复位
	 	r2 = h0; 					//系数指针复位	
	
		r3 = [P_ADC_MUX_Data];     	//取AD采样数据
		[P_DAC1]=r3;
		r3 = r3 & 0xffc0
		r3 = r3 lsr 1;
	 	[r1] = r3; 					//更新
	
	 	mr = [r1]*[r2],ss,16       	//FIR滤波运算
		r4 += 0x7fff;				//电压偏移	
		r1=r4;
		retf
.ENDP




.DATA
		h0:    .dw 48;
		h1:    .dw -724;
		h2:    .dw -119;
		h3:    .dw -2779;
		h4:    .dw -2841;
		h5:    .dw -2080;
		h6:    .dw -15369;
		h7:    .dw 32768;
		h8:    .dw 32768;
		h9:    .dw -15369;
		h10:   .dw -2080;
		h11:   .dw -2841;
		h12:   .dw -2779;
		h13:   .dw -119;
		h14:   .dw -724;
		h15:   .dw 48;
.ISRAM
		x0:    .dw 1;
		x1:    .dw 1;
		x2:    .dw 1;
		x3:    .dw 1;
		x4:    .dw 1;
		x5:    .dw 1;
		x6:    .dw 1;
		x7:    .dw 1;
		x8:    .dw 1;
		x9:    .dw 1;
		x10:   .dw 1;
		x11:   .dw 1;
		x12:   .dw 1;
		x13:   .dw 1;
		x14:   .dw 1;
		x15:   .dw 1;

.PUBLIC _Timer_for_Record  
_Timer_for_Record:
		int off;	
		r1 = FOR_RECORD_8KHZ 		// 采样率为 8kHz
		[P_TimerA_Data] = r1;		//
		int irq;
		retf;
		
.PUBLIC _Timer_for_Play  
_Timer_for_Play:
		int off;	
		r1 = FOR_PLAY_xKHZ; 	
		[P_TimerA_Data] = r1;		//
		int irq;
		retf;     