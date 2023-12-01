
.INCLUDE hardware.inc
.INCLUDE key.inc

.DEFINE TIMER_CLKA_8K   0x0003
.DEFINE TIMER_CLKB_1    0x0030
.DEFINE RUN_TIMERA      0x1000
.DEFINE TIMER_DATA_FOR_8KHZ (0xFFFF-80)

.DEFINE  P_ADC_MUX_Ctrl 0x702b
.DEFINE P_INT_Ctrl_New  0x702d
.EXTERNAL  LED_No  
.CODE
//============================================================================================
//函数: Clear_WatchDog()
//语法：void Clear_WatchDog(void)
//描述：清看门狗
//参数：无
//返回：无
//============================================================================================
.PUBLIC _System_Initial;
_System_Initial: .PROC
     call L_User_Init_IO;		        //初始化IO口
	 call F_Key_Scan_Initial;			//键盘初始化
	 call F_ADC_Init;                   //AD初始化
	 call F_SP_INT_IRQ5;                //ADC采样
	 call F_SP_INT_IRQ6		            //LED显示
	 r1 = 0;
	 [LED_No] = r1                      //初始化LED显示位数
     retf
.ENDP
//============================================================================================
//函数: Clear_WatchDog()
//语法：void Clear_WatchDog(void)
//描述：清看门狗
//参数：无
//返回：无
//============================================================================================
.PUBLIC _Clear_WatchDog;
_Clear_WatchDog:  .PROC
	r1 = 0x01;
 	[P_Watchdog_Clear] = r1;
 	retf
.ENDP

//============================================================================= 
// 函数： System_ServiceLoop();
// 语法： System_ServiceLoop();
// 描述： 程序扫描键盘、按键去抖调度
// 参数： 无
// 返回： 无
//=============================================================================	

.PUBLIC _System_ServiceLoop;
_System_ServiceLoop:	.PROC
		call F_Key_Scan_ServiceLoop;	   //扫描键盘
        call F_Key_DebounceCnt_Down;	   //按键去抖
        RETF;
 .ENDP      


//============================================================================================
//函数: L_User_Init_IO
//语法：L_User_Init_IO()
//描述：初始化A口低八位为下拉电阻输入,高八位为同相高电平输出
//      初始化B口低四位为同相高电平输出，
//参数：无
//返回：无
//=============================================================================================
.PUBLIC L_User_Init_IO;                
L_User_Init_IO: .PROC
   	r1 = 0xff10;      
    [P_IOA_Attrib] = r1;    
    [P_IOA_Dir] = r1;
    r1 = 0xff00;
    [P_IOA_Data] = r1;
    r1 = 0x000F;      
    [P_IOB_Attrib] = r1;    
    [P_IOB_Dir] = r1;
    [P_IOB_Data] = r1;
    RETF
.ENDP;
//============================================================================================
//函数: ADC_Init()
//语法：void ADC_Init()
//描述：初始化ADC
//参数：无
//返回：无
//=============================================================================================
.PUBLIC  _ADC_Init;
.PUBLIC  F_ADC_Init;
_ADC_Init:    .PROC
F_ADC_Init:
	r1 = 0x0004                  //选择通道LINE_IN为IOA4
	[P_ADC_MUX_Ctrl] = r1
	r1 = [P_ADC_Ctrl]
    r1 |= 0x0001	                 //允许A/D转换
    [P_ADC_Ctrl] = r1 	
    r1 = [P_DAC_Ctrl]
    r1 &= 0xffe7;
    [P_DAC_Ctrl] = r1
    retf	 
.ENDP

//============================================================================================
//函数: SP_INT_IRQ5()
//语法：void SP_INT_IRQ5(void)
//描述：初始化中断为2HZ定时中断源，用来确定ADC采样时间定时.1秒钟采样一次.
//参数：无
//返回：无
//=============================================================================================
.PUBLIC _SP_INT_IRQ5;  		       //初始化中断为2HZ定时中断源
.PUBLIC F_SP_INT_IRQ5;  		   

_SP_INT_IRQ5: .PROC
F_SP_INT_IRQ5:   
    r1 =  [P_INT_Ctrl_New];     
	r1 =  r1 |0x0004;
    [P_INT_Ctrl] = r1; 
    irq on;          		       //开中断
    retf
.ENDP;

//============================================================================================
//函数: turn_off_IRQ5()
//语法：void SP_INT_IRQ5(void)
//描述：初始化中断为2HZ定时中断源
//参数：无
//返回：无
//=============================================================================================
.PUBLIC _turn_off_IRQ5;  		       //初始化中断为2HZ定时中断源
 _turn_off_IRQ5:  .PROC
     r1 =  [P_INT_Ctrl_New];
	 r1 &=  0xfffb;
     [P_INT_Ctrl_New] = r1;     
      retf;
 .ENDP    
//============================================================================================
//函数: UART_Init()
//语法：void UART_Init(void)
//描述：通过串行通讯传输采样温度值
//参数：无
//返回：无
//=============================================================================================
.PUBLIC _UART_Init;
.PUBLIC F_UART_Init
_UART_Init:  .PROC
F_UART_Init:

    r1 = [P_IOB_Attrib]              //设置IOB7为输入IOB10为输出
    r1 = r1 | 0x0480;	                
	[P_IOB_Attrib] = R1;
	r1 = [P_IOB_Dir]
	r1 = r1 | 0x0400;
	[P_IOB_Dir] = R1;
	r1 = [P_IOB_Data] 
	r1 = r1 & 0xffb7;		
	[P_IOB_Data] = R1;
	
   	R1 = 0x006b;	     	         //设置波特率为115.2Kbps
    [P_UART_BaudScalarLow] = R1;
	R1 = 0x0000;
    [P_UART_BaudScalarHigh] = R1;
	R1 = 0x0000;                     
	R4 = 0x00C0;		             //使能输入和输出
	[P_UART_Command1] = R1;
	[P_UART_Command2] = R4;	
.ENDP
//============================================================================================
//函数: SP_INT_IRQ6()
//语法：void SP_INT_IRQ6(void)
//描述：初始化中断IRQ6
//参数：无
//返回：无
//=============================================================================================
.PUBLIC _SP_INT_IRQ6;    	      //128hz
.PUBLIC F_SP_INT_IRQ6;    	      //128hz
_SP_INT_IRQ6:   .PROC
 F_SP_INT_IRQ6:
     r1 = 0x0000;
     [P_TimeBase_Setup]=r1        //128hz
     r1 =  [P_INT_Ctrl_New];
	 r1 =  r1 |0x0001;           //开中断IRQ6   			         
	 [P_INT_Ctrl_New]= r1 
	 irq on;	 
     RETF;
.ENDP
//============================================================================================
//函数: SP_INT_TIMEA()
//语法：void SP_INT_TIMEA(void)
//描述：初始化中断为1s定时中断源
//参数：无
//返回：无
//============================================================================================
.PUBLIC _SP_INT_TIMEA;
_SP_INT_TIMEA: .PROC
	//r1 = 0x0000;                    //CPU选频
    //[P_SystemClock] = r1;
    r1 = TIMER_DATA_FOR_8KHZ 
	[P_TimerA_Data] = r1;
	r1 = TIMER_CLKA_8K + TIMER_CLKB_1 
	[P_TimerA_Ctrl]=r1;                
	r1 = [P_INT_Ctrl_New];
	r1 |= 0x1000                 //IRQ1_TMA
	[P_INT_Ctrl_New] = r1;             //开TimeA 中断
	IRQ ON;
    RETF
   .ENDP
   
//============================================================================================
//函数: turn_off_timerA
//语法：turn_off_timerA
//描述：关闭定时器B
//参数：无
//返回：无
//============================================================================================
.PUBLIC _turn_off_timerB
_turn_off_timerB:  .PROC
	 r1 =  [P_INT_Ctrl_New];
	 r1 &=  0xfbff;
     [P_INT_Ctrl_New] = r1;     
      retf;
 .ENDP
//============================================================================================
//函数: turn_on_relay;
//语法：void turn_on_relay;
//描述：打开继电器
//参数：无
//返回：无
//============================================================================================
.PUBLIC _turn_on_relay;
.PUBLIC F_turn_on_relay;
_turn_on_relay: .PROC
F_turn_on_relay:
	r1 = [P_IOA_Buffer]
	r1 |= 0x0010;
	[P_IOA_Buffer] = r1;
	retf
.ENDP
//============================================================================================
//函数: turn_off_relay;
//语法：void turn_off_relay;
//描述：关闭继电器
//参数：无
//返回：无
//============================================================================================
.PUBLIC _turn_off_relay;
.PUBLIC F_turn_off_relay;
_turn_off_relay: .PROC
F_turn_off_relay:
	r1 = [P_IOA_Buffer]
	r1 &= 0xffef;
	[P_IOA_Buffer] = r1;
	retf
.ENDP
//============================================================================================
//函数: SP_INT_TIMEA()
//语法：void SP_INT_TIMEA(void)
//描述：初始化中断为1s定时中断源
//参数：无
//返回：无
//============================================================================================
.PUBLIC _SP_INT_TIMEB;
_SP_INT_TIMEB: .PROC
	//r1 = 0x0000;                    //CPU选频
    //[P_SystemClock] = r1;
    r1 = TIMER_DATA_FOR_8KHZ 
	[P_TimerB_Data] = r1;
	r1 = TIMER_CLKA_8K 
	[P_TimerB_Ctrl]=r1;                
	r1 = [P_INT_Ctrl_New];
	r1 |= 0x0400                       //IRQ1_TMA
	[P_INT_Ctrl_New] = r1;             //开TimeA 中断
	IRQ ON;
    RETF
   .ENDP