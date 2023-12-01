.include   hardware.inc
.define		C_data
.include		splc501c_io.inc
.code
//////////////////////////////////////////////////////////////////////////////
//Filename : F_Init_LCD_501
//Function : Intialize  SPLC501c
//Input    : None
//Output   : None
//Destory  : R1,R2,r3
//////////////////////////////////////////////////////////////////////////////
.public		_Init_LCD_501
_Init_LCD_501:		.proc
		R1 = 0x0001;
        [P_Watchdog_Clear] = R1;   // reset watchdog
        CALL    F_LCD_Reset_Command;//Destory  : r3
        CALL    F_LCD_Command_Nop;	//Destory  : r3
        CALL    F_LCD_Solomon_Freq;	//Destory  : r3
        CALL    F_LCD_Power_Set;	//Destory  : r3
        CALL    F_LCD_Display_On;	//Destory  : r3
        R1 = 0x0000;                //Page No. = 0
        CALL    F_Set_LCD_Page_No;	//Destory  : r3,r1
        R1 = 0x0000;                //Start line = 0
        CALL    F_Set_LCD_Start_Line;//Destory  : r3,r1
        R2 = 0x0000;                //Column address = 0
        CALL    F_Set_LCD_Column_Addr;//Destory  : r3,r2,r1
        CALL    F_LCD_ALL_On;		//Destory  : r3
        CALL    F_LCD_Normal_Display;//Destory  : r3
        R3 = 0x0000;                //Fill "00"
        CALL  F_Fill_All_LCD_Value;	
        RETF;
		.endp
	
	
//////////////////////////////////////////////////////////////////////////////
//Subroutine
//////////////////////////////////////////////////////////////////////////////
F_LCD_Reset_Command:
		r3=[P_IO_Data_Data]
		r2=C_DataBus
		r2^=0xffff
		r3&=r2
		r3|=0xe200
	.if	C_BusHighLow
	.else
		R3	=	R3	lsr	4;
		R3	=	R3	lsr	4;		
	.endif
		[P_IO_Data_Data]=r3
		CALL F_Send_data			   
//        R1=0x0AE2;                //Reset
//        [P_Lcd501Ctrl]=R1;
//        CALL    F_Delay_Bus_Time;

        RETF;

//////////////////////////////////////////////////////////////////////////////
F_LCD_Command_Nop:
		r3=[P_IO_Data_Data]
		
		r2=C_DataBus
		r2^=0xffff
		r3&=r2
	
		r3|=0xe300
	.if	C_BusHighLow
	.else
		R3	=	R3	lsr	4;
		R3	=	R3	lsr	4;		
	.endif
		[P_IO_Data_Data]=r3
		CALL F_Send_data			   
//        R1=0x0AE3;                //Nop
//        [P_Lcd501Ctrl]=R1;
//        CALL F_Delay_Bus_Time;

        RETF;

//////////////////////////////////////////////////////////////////////////////
F_LCD_Solomon_Freq:
		r3=[P_IO_Data_Data]
				r2=C_DataBus
		r2^=0xffff
		r3&=r2
	
		r3|=0xC800					//C8
	.if	C_BusHighLow
	.else
		R3	=	R3	lsr	4;
		R3	=	R3	lsr	4;		
	.endif
		[P_IO_Data_Data]=r3
		CALL F_Send_data			  
//        R1=0x0AA9;                //
//        [P_Lcd501Ctrl]=R1;
//        CALL F_Delay_Bus_Time;
		r3=[P_IO_Data_Data]
				r2=C_DataBus
		r2^=0xffff
		r3&=r2
	
		r3|=0xa000					//A0
	.if	C_BusHighLow
	.else
		R3	=	R3	lsr	4;
		R3	=	R3	lsr	4;		
	.endif
		[P_IO_Data_Data]=r3
		CALL F_Send_data			  
//        R1=0x0AA1;                //ADC : Normal
//        [P_Lcd501Ctrl]=R1;
//        CALL F_Delay_Bus_Time;

        RETF;

//////////////////////////////////////////////////////////////////////////////
F_LCD_Power_Set:
		r3=[P_IO_Data_Data]
				r2=C_DataBus
		r2^=0xffff
		r3&=r2
	
		r3|=0xa200
	.if	C_BusHighLow
	.else
		R3	=	R3	lsr	4;
		R3	=	R3	lsr	4;		
	.endif
		[P_IO_Data_Data]=r3
		CALL F_Send_data			   
//        R1=0x0AA2;
//        [P_Lcd501Ctrl]=R1;        // 1/9 bias
//        CALL F_Delay_Bus_Time;
		r3=[P_IO_Data_Data]
				r2=C_DataBus
		r2^=0xffff
		r3&=r2
	
		r3|=0x2400
		.if	C_BusHighLow
	.else
		R3	=	R3	lsr	4;
		R3	=	R3	lsr	4;		
	.endif
		[P_IO_Data_Data]=r3
		CALL F_Send_data			   
//        R1=0x0A24;
//        [P_Lcd501Ctrl]=R1;        // V5 RATIO 5 FOR 1/9 BIAS
//        CALL F_Delay_Bus_Time;
		r3=[P_IO_Data_Data]
				r2=C_DataBus
		r2^=0xffff
		r3&=r2
	
		r3|=0x8100
	.if	C_BusHighLow
	.else
		R3	=	R3	lsr	4;
		R3	=	R3	lsr	4;		
	.endif
		[P_IO_Data_Data]=r3
		CALL F_Send_data			  
//        R1=0x0A81;
//        [P_Lcd501Ctrl]=R1;        // ELECTRONIC VOLUME MODE
//        CALL F_Delay_Bus_Time;
		r3=[P_IO_Data_Data]
				r2=C_DataBus
		r2^=0xffff
		r3&=r2
	
		r3|=0x1a00
	.if	C_BusHighLow
	.else
		R3	=	R3	lsr	4;
		R3	=	R3	lsr	4;		
	.endif
		[P_IO_Data_Data]=r3
		CALL F_Send_data			   
//        R1=0x0A1A;
//        [P_Lcd501Ctrl]=R1;        // MS Column : A
//        CALL F_Delay_Bus_Time;
		r3=[P_IO_Data_Data]
				r2=C_DataBus
		r2^=0xffff
		r3&=r2
	
		r3|=0xd200
	.if	C_BusHighLow
	.else
		R3	=	R3	lsr	4;
		R3	=	R3	lsr	4;		
	.endif
		[P_IO_Data_Data]=r3
		CALL F_Send_data			  
//        R1=0x0AD2;
//        [P_Lcd501Ctrl]=R1;        // Set driving mode register
//        CALL F_Delay_Bus_Time;
		r3=[P_IO_Data_Data]
				r2=C_DataBus
		r2^=0xffff
		r3&=r2
	
		r3|=0x0000
		.if	C_BusHighLow
	.else
		R3	=	R3	lsr	4;
		R3	=	R3	lsr	4;		
	.endif
		[P_IO_Data_Data]=r3
		CALL F_Send_data			  
//        R1=0x0A00;
//        [P_Lcd501Ctrl]=R1;        // LS Column : 0
//        CALL F_Delay_Bus_Time;
		r3=[P_IO_Data_Data]
				r2=C_DataBus
		r2^=0xffff
		r3&=r2
	
		r3|=0x2c00
	.if	C_BusHighLow
	.else
		R3	=	R3	lsr	4;
		R3	=	R3	lsr	4;		
	.endif
		[P_IO_Data_Data]=r3
		CALL F_Send_data			  
//        R1=0x0A2C;
//        [P_Lcd501Ctrl]=R1;        // REGULATOR on
//        CALL F_Delay_Bus_Time;
		r3=[P_IO_Data_Data]
				r2=C_DataBus
		r2^=0xffff
		r3&=r2
	
		r3|=0x2e00
	.if	C_BusHighLow
	.else
		R3	=	R3	lsr	4;
		R3	=	R3	lsr	4;		
	.endif
		[P_IO_Data_Data]=r3
		CALL F_Send_data			 
//        R1=0x0A2E;
//        [P_Lcd501Ctrl]=R1;        // +FOLLOWER oFF
//        CALL F_Delay_Bus_Time;
		r3=[P_IO_Data_Data]
				r2=C_DataBus
		r2^=0xffff
		r3&=r2
	
		r3|=0x2f00
	.if	C_BusHighLow
	.else
		R3	=	R3	lsr	4;
		R3	=	R3	lsr	4;		
	.endif
		[P_IO_Data_Data]=r3
		CALL F_Send_data			
//        R1=0x0A2F;
//        [P_Lcd501Ctrl]=R1;        // +FOLLOWER oFF
//        CALL F_Delay_Bus_Time;

        RETF;

//////////////////////////////////////////////////////////////////////////////
F_LCD_Display_On:
		r3=[P_IO_Data_Data]
				r2=C_DataBus
		r2^=0xffff
		r3&=r2
	
		r3|=0xaf00
	.if	C_BusHighLow
	.else
		R3	=	R3	lsr	4;
		R3	=	R3	lsr	4;		
	.endif
		[P_IO_Data_Data]=r3
		CALL F_Send_data			  
//        R1=0x0AAF;
//        [P_Lcd501Ctrl]=R1;
//        CALL F_Delay_Bus_Time;

        RETF;

//////////////////////////////////////////////////////////////////////////////
F_LCD_ALL_On:
		r3=[P_IO_Data_Data]
				r2=C_DataBus
		r2^=0xffff
		r3&=r2
	
		r3|=0xa500
		.if	C_BusHighLow
	.else
		R3	=	R3	lsr	4;
		R3	=	R3	lsr	4;		
	.endif
		[P_IO_Data_Data]=r3
		CALL F_Send_data			  
//        R1=0x0AA5;              	//All points on
//        [P_Lcd501Ctrl]=R1;
//        CALL F_Delay_Bus_Time;

        RETF;

//////////////////////////////////////////////////////////////////////////////
F_LCD_Normal_Display:
		r3=[P_IO_Data_Data]
				r2=C_DataBus
		r2^=0xffff
		r3&=r2
	
		r3|=0xa400
		.if	C_BusHighLow
	.else
		R3	=	R3	lsr	4;
		R3	=	R3	lsr	4;		
	.endif
		[P_IO_Data_Data]=r3
		CALL F_Send_data			 
//        R1=0x0AA4;              	//Normal display
//        [P_Lcd501Ctrl]=R1;
//        CALL F_Delay_Bus_Time;

        RETF;
//////////////////////////////////////////////////////////////////////////////
//Filename : F_Set_LCD_Page_No
//Function : Set the LCD page No.
//Input    : Page No. (R1:0x0000~0x0007)
//Output   : None
//Destroy  : R1
//////////////////////////////////////////////////////////////////////////////

.public	_Set_LCD_Page_No
.public	F_Set_LCD_Page_No
F_Set_LCD_Page_No:
_Set_LCD_Page_No:
		r1=r1 lsl 0x04
		r1=r1 lsl 0x04
		r1|=0xb000
		PUSH R1,R1 TO [SP]
		r1=[P_IO_Data_Data]
		push r2 to [sp]
		r2=C_DataBus
		r2^=0xffff
		r1&=r2
		pop r2 from [sp]
		[P_IO_Data_Data]=r1
		POP R1,R1 FROM [SP]
		r1|=[P_IO_Data_Data]
		.if	C_BusHighLow
	.else
		R1	=	R1	lsr	4;
		R1	=	R1	lsr	4;		
	.endif
		[P_IO_Data_Data]=r1
		CALL F_Send_data
//        R1 |= 0x0AB0;         	//Set Page No. (0~7)
//        [P_Lcd501Ctrl]=R1;
//        CALL F_Delay_Bus_Time;

        RETF;

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//Filename : F_Set_LCD_Start_Line
//Function : Set the LCD start line
//Input    : Page No. (R1:0x0000~0x003F)
//Output   : None
//Destroy  : R1
//////////////////////////////////////////////////////////////////////////////
F_Set_LCD_Start_Line:
		r3=[P_IO_Data_Data]
				r2=C_DataBus
		r2^=0xffff
		r3&=r2
	
		r1=r1 lsl 0x04
		r1=r1 lsl 0x04
		r3|=0x4000
		r3|=r1
	.if	C_BusHighLow
	.else
		R3	=	R3	lsr	4;
		R3	=	R3	lsr	4;		
	.endif
		[P_IO_Data_Data]=r3
		CALL F_Send_data			  
//        R1 |= 0x0A40;           	//Set start line (00D ~ 63D)
//        [P_Lcd501Ctrl]=R1;
//        CALL F_Delay_Bus_Time;

        RETF;
//////////////////////////////////////////////////////////////////////////////
//Filename : F_Set_LCD_Column_Addr
//Function : Set the LCD column address
//Input    : Page No. (R2:0x0000~0x0083)
//Output   : None
//Destroy  : R1,R2
//////////////////////////////////////////////////////////////////////////////
.public		_Set_LCD_Column_Addr
.public		F_Set_LCD_Column_Addr
F_Set_LCD_Column_Addr:
_Set_LCD_Column_Addr:
        push	r1 to [sp]
        push	r3 to [sp]
        R1 = R2                 
        R1 = R1 LSl 4;
        R1 &= 0x0F00;           	      
        R1 |= 0x1000;
        push r1,r1 to [sp]
        r1=[P_IO_Data_Data]
 //      r1&=0x00ff
 		push r2 to [sp]
		r2=C_DataBus
		r2^=0xffff
		r1&=r2
		pop r2 from [sp]
        [P_IO_Data_Data]=r1
        pop r1,r1 from [sp] 
        r1|=[P_IO_Data_Data]      
        .if	C_BusHighLow
	.else
		R1	=	R1	lsr	4;
		R1	=	R1	lsr	4;		
	.endif   	
		[P_IO_Data_Data]=r1
		CALL F_Send_data
		R1 = R2
		R1 = R1 LSl 4;
		R1 = R1 LSl 4;
        R1 &= 0x0F00;   
        push r1,r1 to [sp]
        r1=[P_IO_Data_Data]
   //     r1&=0x00ff
  		push r2 to [sp]
		r2=C_DataBus
		r2^=0xffff
		r1&=r2
		pop r2 from [sp]
        [P_IO_Data_Data]=r1
        pop r1,r1 from [sp] 
        r1|=[P_IO_Data_Data]    
        .if	C_BusHighLow
	.else
		R1	=	R1	lsr	4;
		R1	=	R1	lsr	4;		
	.endif    	         	 	
        [P_IO_Data_Data]=r1
		CALL F_Send_data
		pop	r3 from [sp]
		pop	r1 from [sp]
        
        RETF;
//////////////////////////////////////////////////////////////////////////////
//Filename : F_Fill_All_LCD_Value
//Function : Clear all LCD dots
//Input    : Value (R3 : b0~7)
//Output   : None
//Destroy  : R1,R2
//////////////////////////////////////////////////////////////////////////////
.public _Fill_All_LCD_Value
.public F_Fill_All_LCD_Value
_Fill_All_LCD_Value:
F_Fill_All_LCD_Value:
        R3 &= 0xFF00;           	//Filling value
        R1 = 0x0000;            	//Page No. = 0
		.if	C_BusHighLow
	.else
		R3	=	R3	lsr	4;
		R3	=	R3	lsr	4;		
	.endif
L_Fill_Page_Loop:
        PUSH R1,R3 TO [SP];     	//Store R1 temporarily
        CALL F_Set_LCD_Page_No; 	//Page No. = 0
        R2 = 0x0000;            	//Column address (00H ~ 63H)
        CALL F_Set_LCD_Column_Addr; //Column Addr. = 0
        POP R1,R3 FROM [SP];    	//Restore R1
        R2 = 0x0084;            	//Max. column address +1
L_Fill_Column_Loop:
        push r3,r3 to[sp]
		r3=[P_IO_Data_Data]
		push r2 to [sp]
		r2=C_DataBus
		r2^=0xffff
		r3&=r2
		pop r2 from [sp]
		[P_IO_Data_Data]=r3
		pop r3,r3 from [sp]
		r3|=[P_IO_Data_Data]

        [P_IO_Data_Data]=r3
        PUSH R3,R3 TO [SP];
        r3=C_AOP_Pin				//0x2000
        r3|=[P_IO_Control_Data]
        [P_IO_Control_Data]=r3
		CALL F_Send_data					////xxxxxxxx	  
        POP R3,R3 FROM [SP]
        R2 -= 0x0001;           	//Next column address
        JNZ L_Fill_Column_Loop; 	//End Page ?
        R1 += 0x0001;
        CMP R1,0x0008;          	//Next page address
        JNE L_Fill_Page_Loop;
        R1 = 0x0001;
        [P_Watchdog_Clear] = R1;  	// reset watchdog

        RETF;

//////////////////////////////////////////////////////////////////////////////
//destory: r3
//////////////////////////////////////////////////////////////////////
.public	 _Send_data
.public	 F_Send_data
F_Send_data:
_Send_data:			.proc
		r3=[P_IO_Control_Data]
		r3|=C_EP_Pin				//0x4000
		[P_IO_Control_Data]=r3
		push  r1 to [sp]
		r1=C_EP_Pin
		r1^=0xffff
		r3&=r1						//0xbfff
		pop r1 from [sp]
		[P_IO_Control_Data]=r3
        push r1 to [sp]
        r1=C_AOP_Pin
		r1^=0xffff
		r3&=r1
		r1=C_RWP_Pin
		r1^=0xffff
		r3&=r1
		pop r1 from [sp]
//        r3&=0x1fff
        [P_IO_Control_Data]=r3
        retf
        .endp
////////////////////////////////////////////////////////////////////////////// 
F_Delay_Bus_Time:

        RETF;
//////////////////////////////////////////////////////////////////////////////    
//Filename : F_Read_Lcd_data
//Function : frist read appoint  data on lcd
//Input    : 
//Output   : r3
//Destroy  : R1,r3
////////////////////////////////////////////////////////////////////////////// 
.public	_Read_Lcd_data
.public	F_Read_Lcd_data
_Read_Lcd_data:	.proc
F_Read_Lcd_data:
		r1=[P_IO_Data_Dir]
		push r2 to [sp]
		r2=C_DataBus
		r2^=0xffff
		r1&=r2
		pop r2 from [sp]
	//	r1&=0x00ff
		[P_IO_Data_Dir]=r1					
//		r1=[P_IOA_Attrib]
//		r1|=0xff00
//		[P_IOA_Attrib]=r1				

//		r3=0x00fd
        r3=[P_IO_Control_Data]
//       r3|=0xb000
		r3|=C_AOP_Pin
		r3|=C_RWP_Pin
		r1=C_EP_Pin
		r1^=0xffff
        r3&=r1
        [P_IO_Control_Data]=r3
        CALL F_Send_data				//Dummy read after setting column address immediately
 //       r3=0x00fd
        r3=[P_IO_Control_Data]
        r3|=C_AOP_Pin
		r3|=C_RWP_Pin
		r1=C_EP_Pin
		r1^=0xffff
        r3&=r1
        [P_IO_Control_Data]=r3
        CALL F_Send_data                //Read Data
        R3 = [P_IO_Data_Data]               //Get it
    .if	C_BusHighLow
	.else
		R3	=	R3	lsl	4;
		R3	=	R3	lsl	4;		
	.endif 
        r1=[P_IO_Data_Dir]
   	 	r1|=C_DataBus
		[P_IO_Data_Dir]=r1
		retf
        .endp    
//////////////////////////////////////////////////////////////////////
//input: r3
//destory: r3
//////////////////////////////////////////////////////////////////////
.PUBLIC  		F_Display_point
//_Display_point:		.proc
F_Display_point:
		nop
		nop 
		push r3,r3 to[sp]
		r3=[P_IO_Data_Data]
		r2=C_DataBus
		r2^=0xffff
		r3&=r2
	
		[P_IO_Data_Data]=r3
		pop r3,r3 from [sp]
		r3=r3 lsl	0x04
		r3=r3 lsl	0x04 
//        R3 |= 0x00f4;           	//Write data
	.if	C_BusHighLow
	.else
		R3	=	R3	lsr	4;
		R3	=	R3	lsr	4;		
	.endif
		r3|=[P_IO_Data_Data]
        [P_IO_Data_Data]=r3
        r3=[P_IO_Control_Data]
        r3|=C_AOP_Pin			//0x2000
        [P_IO_Control_Data]=r3
        CALL F_Send_data
        retf    
//////////////////////////////////////////////////////////////////////////////
//Filename : F_Init_IO
//Function : Intialize I/O 
//Input    : None
//Output   : None
//Destory  : R1
//////////////////////////////////////////////////////////////////////////////
.public		F_Init_IO
.public		_Init_IO
_Init_IO:
F_Init_IO:		.proc
	
    r1=[P_IO_Data_Dir]
    r1|=C_DataBus
	[P_IO_Data_Dir]=r1
	r1=[P_IO_Data_Attrib]					
	r1|=C_DataBus
	[P_IO_Data_Attrib]=r1				
	r1=[P_IO_Data_Data]
	r2=C_DataBus
	r2^=0xffff
	r1&=r2
	[P_IO_Data_Data]=r1					//Initial porta
	
	r1=[P_IO_Control_Dir]
	r1|=C_AOP_Pin
	r1|=C_EP_Pin
	r1|=C_RWP_Pin
	[P_IO_Control_Dir]=r1					
	r2=[P_IO_Control_Attrib]
	r2|=r1
	[P_IO_Control_Attrib]=r2				
	r2=[P_IO_Control_Data]
	r1^=0xffff
	r2&=r1
	[P_IO_Control_Data]=r1	
    RETF
	.endp