//***********************************************************
// Note:通过模拟量输入口LINE_IN输入电压值，以8K的采样率经A/D
//转换后送给IOB口控制LED点亮,同时可以根据LED的点亮来了解转换
//的数据
//*************************************************************									

// 时钟源为Fosc/2，采样率为8KHz
.include hardware.inc
.CODE
.public _F_AD_Initial;
_F_AD_Initial:  .PROC
		PUSH r1,r1 TO [sp];
		R1 = 0x0001	            //允许A/D
		[P_ADC_Ctrl] = R1 		 
	    
    	r1=0x0000;			//通过读P_ADC触发ADC自动转换	
	    [P_DAC_Ctrl] = r1; 
		
		r1 = 0x0001            //LINE1输入			
		[P_ADC_MUX_Ctrl] = r1;
		
		POP r1,r1 FROM [sp];
		RETF
		.ENDP
	
	
//************** A/D 转换程序 **********************//	
.public _F_ReadAD
_F_ReadAD: .PROC
		   PUSH r2,r5 TO [sp];
		   BP=SP+1;
		   r1 = [BP+6];           		
		   [P_ADC_MUX_Ctrl] = r1;//设置通道号
		   r1=0x0001;
		   [P_Watchdog_Clear]=r1;
		   r2=16      //进行4次转换
		   r3=0
L_SampleLoop:	   
		   r1=[P_ADC_MUX_Data]      //读[P_ADC_MUX_Data]，启动一次AD转换
           r1=0x8000
L_VoltageConverLoop:   
          TEST r1,[P_ADC_MUX_Ctrl]
          JZ L_VoltageConverLoop; 
          r1=[P_ADC_MUX_Data]      //AD转换值 
          r1=r1 LSR 4           //将AD值移到低10位
          r1=r1 LSR 2
          r3+=r1             //四次A/D值累加
          r2-=1
          jnz  L_SampleLoop
          r3=r3 LSR 4     //结果除以4，求4次的平均值
          r1=r3           //返回结果
          
          POP r2,r5 FROM [sp];
          RETF
          .ENDP
		   
   
 