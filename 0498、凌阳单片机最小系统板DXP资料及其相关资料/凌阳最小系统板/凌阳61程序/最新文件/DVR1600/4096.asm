//======================================================
// 文件名称:	4096.asm
// 功能描述：   SPR4096的读写、擦除 
// 完成日期：   2005-10-25
//======================================================
.DEFINE		P_IOB_Data				0x7005
.DEFINE		P_IOB_Buffer			0x7006
.DEFINE		P_IOB_Dir				0x7007
.DEFINE		P_IOB_Attrib			0x7008
.DEFINE		P_SystemClock			0x7013
//	Serial	functions control registers
.DEFINE		P_SIO_Data				0x701A
.DEFINE		P_SIO_Addr_Low			0x701B
.DEFINE		P_SIO_Addr_Mid			0x701C
.DEFINE		P_SIO_Addr_High			0x701D
.DEFINE		P_SIO_Ctrl				0x701E
.DEFINE		P_SIO_Start				0x701F
.DEFINE		P_SIO_Stop				0x7020

.DEFINE 	C_SIOCLOCK           		0x0010     	// CPUCLOCK/8
.DEFINE		B_Busy						0x80

.CONST 		C_Program_Time			 	= 60		//60us
.CONST 		C_SectorErase_Time		 	= 400		//60us*400 = 24ms
.CONST 		C_MassErase_Time			= 1166		//60us*1166 = 70ms

.CODE
//======================================================
// 函数名称:	_SP_SIOInitial
// 实现功能:    SIO初始化
// 入口参数：   无
// 出口参数：   无
// 破坏寄存器:  r1
//======================================================
.PUBLIC		_SP_SIOInitial;
_SP_SIOInitial:	.PROC
			r1 = [P_IOB_Dir]					//IOB0:SCK,IOB1:SDA
			r1 |= 0x0001
			[P_IOB_Dir] = r1
			r1 = [P_IOB_Attrib]
			r1 |= 0x0003
			[P_IOB_Attrib] = r1
			r1 = [P_IOB_Buffer]
			r1 |= 0x0001
			[P_IOB_Buffer] = r1
		 	retf
.ENDP

//======================================================
// 函数名称:	_SP_SIOSendAByte
// 实现功能:    往SPR4096写入一个Byte的数据
// 入口参数：   ulAddr为写入的地址，uiData为写入的数据
// 出口参数：   无
// 破坏寄存器:  r1
//======================================================
.PUBLIC _SP_SIOSendAByte;
_SP_SIOSendAByte: .PROC
F_SIOSendAByte:
		    push bp,bp to [SP];
		    bp  =  SP + 1;
			r1  =  [bp+3];
		    [P_SIO_Addr_Low] = r1;        		// FLASH低地址
		    r1 = r1 lsr 4;         		
		    r1 = r1 lsr 4;
		    [P_SIO_Addr_Mid] = r1; 				// FLASH中地址
		    r1  =  [bp+4];                
		    r1 = r1&0x0007;  					// FLASH高地址
		    [P_SIO_Addr_High] = r1;
	        r1 = 0x00C3+C_SIOCLOCK;
	        [P_SIO_Ctrl] = r1;        			// clk = CPUclk/8, 24位地址 
	        [P_SIO_Start] = r1;       			// 写模式使能
	        r1  =  [bp+5];
	        [P_SIO_Data] = r1;        			// 传输数据
L_WaitSIOSendReady:
	        r1 = [P_SIO_Start];
	        test    r1,B_Busy
	        jnz     L_WaitSIOSendReady
	        [P_SIO_Stop] = r1;            		// 禁止写模式
	        call  F_Delay_Program_Time
	        pop bp,bp from [SP];
	        retf;
.ENDP;


//======================================================
// 函数名称:	_SP_SIOReadAByte
// 实现功能:    从SPR4096读出一个Byte的数据
// 入口参数：   ulAddr为读出的地址
// 出口参数：   读出的数据
// 破坏寄存器:  r1，r2，r3
//======================================================
.PUBLIC _SP_SIOReadAByte;
_SP_SIOReadAByte: .PROC
F_SIOReadAByte:
	        push bp,bp to [SP];
	        bp  =  SP + 1;
	        r1  =  [bp+3];
	        [P_SIO_Addr_Low] = r1; 				// FLASH低地址
	        r1 = r1 lsr 4;
	        r1 = r1 lsr 4;
	        [P_SIO_Addr_Mid] = r1; 				// FLASH中地址
	        r1  =  [bp+4];                
	        r1 = r1&0x0007;  					// FLASH高地址
	        [P_SIO_Addr_High] = r1;
	        r1 = 0x0083;
	        [P_SIO_Ctrl] = r1;            		// clk = CPUclk/16, 24位地址
	        [P_SIO_Start] = r1;           		// 读模式使能
	        r2 = [P_SIO_Data];            		// 清buffer
L_WaitSIOReadReady1:
	        r1 = [P_SIO_Start];
	        test    r1,B_Busy
	        jnz     L_WaitSIOReadReady1
	        r1 = [P_SIO_Data];          		// 读数据
L_WaitSIOReadReady2:               
	        r2 = [P_SIO_Start];
	        test    r2,B_Busy
	        jnz     L_WaitSIOReadReady2
	        [P_SIO_Stop] = r2;            		// 禁止读模式
	        pop bp,bp from [SP];
	        retf;
.ENDP;

//======================================================
// 函数名称:	_SP_SIOSendAWord
// 实现功能:    往SPR4096写入一个Word的数据
// 入口参数：   ulAddr为写入的地址，uiData为写入的数据
// 出口参数：   无
// 破坏寄存器:  r1，r2，r3
//======================================================
.PUBLIC _SP_SIOSendAWord;
_SP_SIOSendAWord: .PROC
F_SIOSendAWord:
	        push bp,bp to [SP];
	        bp  =  SP + 1;
	        r1 = 0x00C3+C_SIOCLOCK;
	        [P_SIO_Ctrl] = r1;            		// clk = CPUclk/8, 24位地址
	        r1  =  [bp+3];
	        [P_SIO_Addr_Low] = r1; 				// FLASH低地址
	        r1 = r1 lsr 4;
	        r1 = r1 lsr 4;
	        [P_SIO_Addr_Mid] = r1; 				// FLASH中地址
	        r1  =  [bp+4];                
	        r1 = r1&0x0007;  					// FLASH高地址
	        [P_SIO_Addr_High] = r1;
        
	        [P_SIO_Start] = r1;           		// 写模式使能
	        r1  =  [bp+5];
	        [P_SIO_Data] = r1;            		// 传输数据，低字节
L_WaitSIOSendReadyLB:
	        r1 = [P_SIO_Start];
	        test    r1,B_Busy
	        jnz     L_WaitSIOSendReadyLB
	      
	        [P_SIO_Stop] = r1;            		// 禁止写模式
	        call  F_Delay_Program_Time 
	
	         r1  =  [bp+3];
	         r1+ = 1;
	        [P_SIO_Addr_Low] = r1; 				// FLASH低地址
	             
	        [P_SIO_Start] = r1;          	 	// 写模式使能
	        r1 = [bp+5]; 
	        r1 = r1 lsr 4;         		
	        r1 = r1 lsr 4;
	        [P_SIO_Data] = r1;            		// 传输数据，高字节
L_WaitSIOSendReadyHB:
        r1 = [P_SIO_Start];
        test    r1,B_Busy
        jnz     L_WaitSIOSendReadyHB
        [P_SIO_Stop] = r1;            			// 禁止写模式
		call  F_Delay_Program_Time 
		pop bp,bp from [SP];
        retf;
.ENDP;


//======================================================
// 函数名称:	_SP_SIOReadAWord
// 实现功能:    从SPR4096读出一个Word的数据
// 入口参数：   ulAddr为读出的地址
// 出口参数：   读出的数据
// 破坏寄存器:  r1，r2，r3，r4
//======================================================
.PUBLIC _SP_SIOReadAWord;
_SP_SIOReadAWord: .PROC
F_SIOReadAWord:
	        push bp,bp to [SP];
	        bp  =  SP + 1;
	        r4 = 0x00FF;
	        r1  =  [bp+3];
	        [P_SIO_Addr_Low] = r1; 				// FLASH低地址
	        r1 = r1 lsr 4;
	        r1 = r1 lsr 4;
	        [P_SIO_Addr_Mid] = r1; 				// FLASH中地址
	        r1  =  [bp+4];                
	        r1 = r1&0x0007;  					// FLASH高地址
	        [P_SIO_Addr_High] = r1;

	        r1 = 0x0083;  							
	        [P_SIO_Ctrl] = r1;           		// clk = CPUclk/16, 24 位地址
	        [P_SIO_Start] = r1;       			// 读模式使能
	        r2 = [P_SIO_Data];          		// 清buffer
L_WaitSIOReadReady1LB:
	        r1 = [P_SIO_Start];
	        test    r1,B_Busy
	        jnz     L_WaitSIOReadReady1LB
	        
	        r2 = r4&[P_SIO_Data];          		// 读数据，低字节
L_WaitSIOReadReady2LB:               
	        r1 = [P_SIO_Start];
	        test    r1,0x0080
	        jnz     L_WaitSIOReadReady2LB
	        
	        r3 = r4&[P_SIO_Data];          		// 读数据，高字节

L_WaitSIOReadReady2HB:               
	        r1 = [P_SIO_Start];
	        test    r1,B_Busy
	        jnz     L_WaitSIOReadReady2HB
	       
	        [P_SIO_Stop] = r1;             		// 禁止读模式
	 
	        r3 = r3 lsl 4;     			 
	        r1 = r3 lsl 4;
	        r1| = r2;         			 		// r1 存放的是读出的数据
	        pop bp,bp from [SP];
	        retf;
.ENDP;


//======================================================
// 函数名称:	_SP_SIOMassErase
// 实现功能:    擦除SPR4096的所有扇区
// 入口参数：   无
// 出口参数：   无
// 破坏寄存器:  r1
//======================================================
.PUBLIC _SP_SIOMassErase;
_SP_SIOMassErase: .PROC
F_SIOMassErase:
	        push r1,r2 to [sp];
	        r1 = 0x00C0+C_SIOCLOCK;
	        [P_SIO_Ctrl] = r1;            	// clk = CPUclk/8, 16位地址
	        r2 = 0x0000;
	        [P_SIO_Addr_Low] = r2; 			// FLASH低地址
	        r2 = 0x00C0;
	        [P_SIO_Addr_Mid] = r2; 			// FLASH中地址
	        r2 = 0x00C0;
	       	[P_SIO_Addr_High] = r2; 
	        [P_SIO_Start] = r1;           	// 写模式使能
	        r1 = 0;                       	// A7~A0  =  0
	        [P_SIO_Data] = r1;            	// 传输数据

L_WaitSIOSendReadyMass:
	        r1 = [P_SIO_Start];
	        test    r1,B_Busy
	        jnz     L_WaitSIOSendReadyMass
			[P_SIO_Stop] = r1;
	        call    F_Delay_MassErase_Time
	        pop r1,r2 from [sp];
	        retf;
.ENDP;

//======================================================
// 函数名称:	_SP_SIOSectorErase
// 实现功能:    擦除SPR4096的一个扇区
// 入口参数：   uiSector，为扇区的编号，0～255可选
// 出口参数：   无
// 破坏寄存器:  r1，r2
//======================================================
.PUBLIC _SP_SIOSectorErase;
_SP_SIOSectorErase: .PROC
SP_SIOSectorErase:
	        push bp,bp to [SP];
	        bp  =  SP + 1;
	 
	        r1  =  [bp+3];
	        r1 = r1&0x00ff;
	        r1 = r1 lsl 3;
	        r1 = r1|0x8000;
	        [P_SIO_Addr_Low] = r1; 			// FLASH低地址 ;给 A15 and A10
	        r1 = r1 lsr 4;
	        r1 = r1 lsr 4;
	        [P_SIO_Addr_Mid] = r1; 			// FLASH中地址 ;给 A16
	        r1 = 0x00C0+C_SIOCLOCK;
	        [P_SIO_Ctrl] = r1;        		// clk = CPUclk/8, 16位地址
	        [P_SIO_Start] = r1;       		// 写模式使能
	        r1 = 0;                   		// A7~A0  =  0
	        [P_SIO_Data] = r1;        		// 传输数据

L_WaitSIOSendReadyPage1:
	        r1 = [P_SIO_Start];
	        test    r1,B_Busy
	        jnz     L_WaitSIOSendReadyPage1
	        [P_SIO_Stop] = r1;        
	        call    F_Delay_SectorErase_Time
	        pop bp,bp from [SP];
	        retf;
.ENDP;



//======================================================
// 函数名称:	F_Delay_MassErase_Time
// 实现功能:    擦除全部扇区的延时
// 入口参数：   无
// 出口参数：   无
// 破坏寄存器:  r2
//======================================================
.PUBLIC F_Delay_MassErase_Time;
F_Delay_MassErase_Time:	.PROC
			r2 = C_MassErase_Time;		
?L_Wait_MassErase_Time_Over:							       
			call	F_Delay_Program_Time;
			r2- = 1;						
			jnz ?L_Wait_MassErase_Time_Over;		
			retf;						
.ENDP

//======================================================
// 函数名称:	F_Delay_SectorErase_Time
// 实现功能:    擦除一个扇区的延时
// 入口参数：   无
// 出口参数：   无
// 破坏寄存器:  r2
//======================================================
.PUBLIC F_Delay_SectorErase_Time;
F_Delay_SectorErase_Time: .PROC
			r2 = C_SectorErase_Time;				//6	
?L_Wait_SectorErase_Time_Over:							       
			call	F_Delay_Program_Time;
			r2- = 1;								//3					
			jnz ?L_Wait_SectorErase_Time_Over;		//5	
			retf;						
.ENDP

//======================================================
// 函数名称:	F_Delay_Program_Time
// 实现功能:    写入一个Byte的延时
// 入口参数：   无
// 出口参数：   无
// 破坏寄存器:  r1
//======================================================
.PUBLIC F_Delay_Program_Time;
F_Delay_Program_Time: .PROC
			r1 = C_Program_Time;					//6
?L_Wait_Program_Time_Over:							//52cycle,1us @ 49Mhz       
			nop;									//4
			nop;									//4
			nop;									//4
			nop;									//4
			nop;									//4
			nop;									//4
			nop;									//4
			nop;									//4
			nop;									//4
			nop;									//4
			nop;									//4
			nop;									//4
			nop;									//4
			r1- = 1;								//3
			jnz ?L_Wait_Program_Time_Over;			//5
			retf;									//12
.ENDP