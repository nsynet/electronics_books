
.INCLUDE	hardware.inc
.INCLUDE	A2000.inc
.INCLUDE	Resource.inc
.EXTERNAL	_giADC_DataSave;
.EXTERNAL   _fOut;
.EXTERNAL   F_turn_off_relay;
.EXTERNAL   F_LED_Show
.DEFINE     P_ADC_MUX_Data      0x702c
.DEFINE		P_ADC_MUX_Ctrl		0x702b  

.IRAM
.PUBLIC  G_Sum 
.VAR     G_Sum  = 10;
.PUBLIC  _G_ADC_flag        
.VAR     _G_ADC_flag = 0;  

.IRAM
.TEXT
//===================================================================================
//函数：IRQ5（）
//语法：void IRQ5(void)
//描述：利用2Hz中断定时1秒，1秒钟采样一次温度值
//参数：无
//返回：无
//===================================================================================

.PUBLIC	_FIQ;
_FIQ:
	push	r1,r4 to [sp];
	r1 = 0x2000;
	test r1,[P_INT_Ctrl];
	jnz L_FIQ_TimerA;
	r1 = 0x0800;
	test r1,[P_INT_Ctrl];
	jnz L_FIQ_TimerB;
L_FIQ_PWM:
	r1 = C_FIQ_PWM;
	[P_INT_Clear] = r1;
	pop r1,r4 from[sp];
	reti;
L_FIQ_TimerA:
	[P_INT_Clear] = r1;
	call F_FIQ_Service_SACM_A2000;
	pop r1,r4 from [sp];
	reti;
L_FIQ_TimerB:
	[P_INT_Clear] = r1;
	pop r1,r4 from [sp];
	reti;
	
//===================================================================================
//函数：IRQ5（）
//语法：void IRQ5(void)
//描述：利用2Hz中断定时1秒，1秒钟采样一次温度值
//参数：无
//返回：无
//===================================================================================
.PUBLIC  _IRQ5;
_IRQ5:	
	PUSH r1,r4 TO [sp];
	r1 = 0x0008;			 
	test r1,[P_INT_Ctrl];			
	jnz	L_4Hz;			               // 开Timer A FIQ 	
	r1 = 0x0004;
    [P_INT_Clear] = r1;                //清中断    
   // [P_UART_Data] = r1;              //通过串行通讯将采样的温度数据上传       
    r1 =  [G_Sum]   
    r1 = r1 - 1
    [G_Sum] = r1
    jz ADC_Value  
	POP r1,r4 FROM [sp]
    RETI; 
 ADC_Value:
    r1 = 0;    
    L_AD: 	 
    R2 = [P_ADC_MUX_Ctrl]        //读寄存器[P_ADC_MUX_Ctrl]的B15位
    TEST R2,0x8000               //判断是否转换完毕
    JZ L_AD                      //否，继续转换
    r3 = [P_ADC_MUX_Data]              //是，则读出[P_ADC_MUX_DATA]转换结果
    jz  L_AD 
    r3 = r3 lsr 4
    r3 = r3 lsr 2    
    r2 = r1 + _giADC_DataSave
    cmp r1,10
    jne L_AD
   //[r2] = r3
    r1 = 1;
    [_G_ADC_flag] = r1;
    r1 = 10
    [G_Sum] = r1
    jmp exit_Int;
L_4Hz:  
 	r1 = 0x0008;
    [P_INT_Clear] = r1;               //清中断
exit_Int:
    POP r1,r4 FROM [sp];
    RETI; 
    
//===================================================================================
//函数：IRQ5（）
//语法：void IRQ5(void)
//描述：利用2Hz中断定时1秒，1秒钟采样一次温度值
//参数：无
//返回：无
//===================================================================================
   
.PUBLIC  _IRQ6;
_IRQ6:
	PUSH r1,r4 to [sp];
	r1 = 0x0001;
	TEST r1,[P_INT_Ctrl];
	JNZ  _IRQ6_TMB2;
	r1=0x0002;
	[P_INT_Clear]=r1;	
	POP r1,r4 FROM [sp];
    RETI;         
_IRQ6_TMB2:   
	[P_INT_Clear]=r1;
	call F_LED_Show;	
	POP r1,r4 FROM [sp];
    RETI;     
//===================================================================================
//函数：IRQ1（）
//语法：void IRQ1(void)
//描述：利用中断定时10ms秒，确定加热时间
//参数：无
//返回：无
//===================================================================================
.PUBLIC  _IRQ2;
_IRQ2:
    PUSH r1,r4 to [sp];
    r1 = 0x0400;
    [P_INT_Clear]=r1;
    r1 = [_fOut]
    r1 = r1 -1;
    [_fOut] = r1;
    jz  l;
exit:
    POP r1,r4 FROM [sp];
    RETI;    
l:
    call F_turn_off_relay;
    jmp exit;