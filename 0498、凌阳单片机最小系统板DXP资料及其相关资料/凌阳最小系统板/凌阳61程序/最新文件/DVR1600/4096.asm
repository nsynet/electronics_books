//======================================================
// �ļ�����:	4096.asm
// ����������   SPR4096�Ķ�д������ 
// ������ڣ�   2005-10-25
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
// ��������:	_SP_SIOInitial
// ʵ�ֹ���:    SIO��ʼ��
// ��ڲ�����   ��
// ���ڲ�����   ��
// �ƻ��Ĵ���:  r1
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
// ��������:	_SP_SIOSendAByte
// ʵ�ֹ���:    ��SPR4096д��һ��Byte������
// ��ڲ�����   ulAddrΪд��ĵ�ַ��uiDataΪд�������
// ���ڲ�����   ��
// �ƻ��Ĵ���:  r1
//======================================================
.PUBLIC _SP_SIOSendAByte;
_SP_SIOSendAByte: .PROC
F_SIOSendAByte:
		    push bp,bp to [SP];
		    bp  =  SP + 1;
			r1  =  [bp+3];
		    [P_SIO_Addr_Low] = r1;        		// FLASH�͵�ַ
		    r1 = r1 lsr 4;         		
		    r1 = r1 lsr 4;
		    [P_SIO_Addr_Mid] = r1; 				// FLASH�е�ַ
		    r1  =  [bp+4];                
		    r1 = r1&0x0007;  					// FLASH�ߵ�ַ
		    [P_SIO_Addr_High] = r1;
	        r1 = 0x00C3+C_SIOCLOCK;
	        [P_SIO_Ctrl] = r1;        			// clk = CPUclk/8, 24λ��ַ 
	        [P_SIO_Start] = r1;       			// дģʽʹ��
	        r1  =  [bp+5];
	        [P_SIO_Data] = r1;        			// ��������
L_WaitSIOSendReady:
	        r1 = [P_SIO_Start];
	        test    r1,B_Busy
	        jnz     L_WaitSIOSendReady
	        [P_SIO_Stop] = r1;            		// ��ֹдģʽ
	        call  F_Delay_Program_Time
	        pop bp,bp from [SP];
	        retf;
.ENDP;


//======================================================
// ��������:	_SP_SIOReadAByte
// ʵ�ֹ���:    ��SPR4096����һ��Byte������
// ��ڲ�����   ulAddrΪ�����ĵ�ַ
// ���ڲ�����   ����������
// �ƻ��Ĵ���:  r1��r2��r3
//======================================================
.PUBLIC _SP_SIOReadAByte;
_SP_SIOReadAByte: .PROC
F_SIOReadAByte:
	        push bp,bp to [SP];
	        bp  =  SP + 1;
	        r1  =  [bp+3];
	        [P_SIO_Addr_Low] = r1; 				// FLASH�͵�ַ
	        r1 = r1 lsr 4;
	        r1 = r1 lsr 4;
	        [P_SIO_Addr_Mid] = r1; 				// FLASH�е�ַ
	        r1  =  [bp+4];                
	        r1 = r1&0x0007;  					// FLASH�ߵ�ַ
	        [P_SIO_Addr_High] = r1;
	        r1 = 0x0083;
	        [P_SIO_Ctrl] = r1;            		// clk = CPUclk/16, 24λ��ַ
	        [P_SIO_Start] = r1;           		// ��ģʽʹ��
	        r2 = [P_SIO_Data];            		// ��buffer
L_WaitSIOReadReady1:
	        r1 = [P_SIO_Start];
	        test    r1,B_Busy
	        jnz     L_WaitSIOReadReady1
	        r1 = [P_SIO_Data];          		// ������
L_WaitSIOReadReady2:               
	        r2 = [P_SIO_Start];
	        test    r2,B_Busy
	        jnz     L_WaitSIOReadReady2
	        [P_SIO_Stop] = r2;            		// ��ֹ��ģʽ
	        pop bp,bp from [SP];
	        retf;
.ENDP;

//======================================================
// ��������:	_SP_SIOSendAWord
// ʵ�ֹ���:    ��SPR4096д��һ��Word������
// ��ڲ�����   ulAddrΪд��ĵ�ַ��uiDataΪд�������
// ���ڲ�����   ��
// �ƻ��Ĵ���:  r1��r2��r3
//======================================================
.PUBLIC _SP_SIOSendAWord;
_SP_SIOSendAWord: .PROC
F_SIOSendAWord:
	        push bp,bp to [SP];
	        bp  =  SP + 1;
	        r1 = 0x00C3+C_SIOCLOCK;
	        [P_SIO_Ctrl] = r1;            		// clk = CPUclk/8, 24λ��ַ
	        r1  =  [bp+3];
	        [P_SIO_Addr_Low] = r1; 				// FLASH�͵�ַ
	        r1 = r1 lsr 4;
	        r1 = r1 lsr 4;
	        [P_SIO_Addr_Mid] = r1; 				// FLASH�е�ַ
	        r1  =  [bp+4];                
	        r1 = r1&0x0007;  					// FLASH�ߵ�ַ
	        [P_SIO_Addr_High] = r1;
        
	        [P_SIO_Start] = r1;           		// дģʽʹ��
	        r1  =  [bp+5];
	        [P_SIO_Data] = r1;            		// �������ݣ����ֽ�
L_WaitSIOSendReadyLB:
	        r1 = [P_SIO_Start];
	        test    r1,B_Busy
	        jnz     L_WaitSIOSendReadyLB
	      
	        [P_SIO_Stop] = r1;            		// ��ֹдģʽ
	        call  F_Delay_Program_Time 
	
	         r1  =  [bp+3];
	         r1+ = 1;
	        [P_SIO_Addr_Low] = r1; 				// FLASH�͵�ַ
	             
	        [P_SIO_Start] = r1;          	 	// дģʽʹ��
	        r1 = [bp+5]; 
	        r1 = r1 lsr 4;         		
	        r1 = r1 lsr 4;
	        [P_SIO_Data] = r1;            		// �������ݣ����ֽ�
L_WaitSIOSendReadyHB:
        r1 = [P_SIO_Start];
        test    r1,B_Busy
        jnz     L_WaitSIOSendReadyHB
        [P_SIO_Stop] = r1;            			// ��ֹдģʽ
		call  F_Delay_Program_Time 
		pop bp,bp from [SP];
        retf;
.ENDP;


//======================================================
// ��������:	_SP_SIOReadAWord
// ʵ�ֹ���:    ��SPR4096����һ��Word������
// ��ڲ�����   ulAddrΪ�����ĵ�ַ
// ���ڲ�����   ����������
// �ƻ��Ĵ���:  r1��r2��r3��r4
//======================================================
.PUBLIC _SP_SIOReadAWord;
_SP_SIOReadAWord: .PROC
F_SIOReadAWord:
	        push bp,bp to [SP];
	        bp  =  SP + 1;
	        r4 = 0x00FF;
	        r1  =  [bp+3];
	        [P_SIO_Addr_Low] = r1; 				// FLASH�͵�ַ
	        r1 = r1 lsr 4;
	        r1 = r1 lsr 4;
	        [P_SIO_Addr_Mid] = r1; 				// FLASH�е�ַ
	        r1  =  [bp+4];                
	        r1 = r1&0x0007;  					// FLASH�ߵ�ַ
	        [P_SIO_Addr_High] = r1;

	        r1 = 0x0083;  							
	        [P_SIO_Ctrl] = r1;           		// clk = CPUclk/16, 24 λ��ַ
	        [P_SIO_Start] = r1;       			// ��ģʽʹ��
	        r2 = [P_SIO_Data];          		// ��buffer
L_WaitSIOReadReady1LB:
	        r1 = [P_SIO_Start];
	        test    r1,B_Busy
	        jnz     L_WaitSIOReadReady1LB
	        
	        r2 = r4&[P_SIO_Data];          		// �����ݣ����ֽ�
L_WaitSIOReadReady2LB:               
	        r1 = [P_SIO_Start];
	        test    r1,0x0080
	        jnz     L_WaitSIOReadReady2LB
	        
	        r3 = r4&[P_SIO_Data];          		// �����ݣ����ֽ�

L_WaitSIOReadReady2HB:               
	        r1 = [P_SIO_Start];
	        test    r1,B_Busy
	        jnz     L_WaitSIOReadReady2HB
	       
	        [P_SIO_Stop] = r1;             		// ��ֹ��ģʽ
	 
	        r3 = r3 lsl 4;     			 
	        r1 = r3 lsl 4;
	        r1| = r2;         			 		// r1 ��ŵ��Ƕ���������
	        pop bp,bp from [SP];
	        retf;
.ENDP;


//======================================================
// ��������:	_SP_SIOMassErase
// ʵ�ֹ���:    ����SPR4096����������
// ��ڲ�����   ��
// ���ڲ�����   ��
// �ƻ��Ĵ���:  r1
//======================================================
.PUBLIC _SP_SIOMassErase;
_SP_SIOMassErase: .PROC
F_SIOMassErase:
	        push r1,r2 to [sp];
	        r1 = 0x00C0+C_SIOCLOCK;
	        [P_SIO_Ctrl] = r1;            	// clk = CPUclk/8, 16λ��ַ
	        r2 = 0x0000;
	        [P_SIO_Addr_Low] = r2; 			// FLASH�͵�ַ
	        r2 = 0x00C0;
	        [P_SIO_Addr_Mid] = r2; 			// FLASH�е�ַ
	        r2 = 0x00C0;
	       	[P_SIO_Addr_High] = r2; 
	        [P_SIO_Start] = r1;           	// дģʽʹ��
	        r1 = 0;                       	// A7~A0  =  0
	        [P_SIO_Data] = r1;            	// ��������

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
// ��������:	_SP_SIOSectorErase
// ʵ�ֹ���:    ����SPR4096��һ������
// ��ڲ�����   uiSector��Ϊ�����ı�ţ�0��255��ѡ
// ���ڲ�����   ��
// �ƻ��Ĵ���:  r1��r2
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
	        [P_SIO_Addr_Low] = r1; 			// FLASH�͵�ַ ;�� A15 and A10
	        r1 = r1 lsr 4;
	        r1 = r1 lsr 4;
	        [P_SIO_Addr_Mid] = r1; 			// FLASH�е�ַ ;�� A16
	        r1 = 0x00C0+C_SIOCLOCK;
	        [P_SIO_Ctrl] = r1;        		// clk = CPUclk/8, 16λ��ַ
	        [P_SIO_Start] = r1;       		// дģʽʹ��
	        r1 = 0;                   		// A7~A0  =  0
	        [P_SIO_Data] = r1;        		// ��������

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
// ��������:	F_Delay_MassErase_Time
// ʵ�ֹ���:    ����ȫ����������ʱ
// ��ڲ�����   ��
// ���ڲ�����   ��
// �ƻ��Ĵ���:  r2
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
// ��������:	F_Delay_SectorErase_Time
// ʵ�ֹ���:    ����һ����������ʱ
// ��ڲ�����   ��
// ���ڲ�����   ��
// �ƻ��Ĵ���:  r2
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
// ��������:	F_Delay_Program_Time
// ʵ�ֹ���:    д��һ��Byte����ʱ
// ��ڲ�����   ��
// ���ڲ�����   ��
// �ƻ��Ĵ���:  r1
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