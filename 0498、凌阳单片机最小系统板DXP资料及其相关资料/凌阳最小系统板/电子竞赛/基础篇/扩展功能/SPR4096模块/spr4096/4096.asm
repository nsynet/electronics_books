

.DEFINE C_SIOCLOCK           	0x0010;     // CPUCLOCK/8
.define	B_Busy					0x80

.const C_Program_Time			=60			//60us
.const C_SectorErase_Time		=400		//60us*400=24ms
.const C_MassErase_Time			=1166		//60us*1166=70ms

.include SPCE061.INC	
.CODE
.PUBLIC		_SP_SIOInitial;
_SP_SIOInitial:	.PROC

		 	//系统时钟设定
		 	r1 = 0x0098;    		 		//Fosc=49mHz 
		 	[P_SystemClock] = r1;
	 	
			r1 = [P_IOB_Dir];
			r1 |= 1;						//set bit0 output for sck
			[P_IOB_Dir] = r1;
			
			r1 = [P_IOB_Attrib];
			r1 |= 1;						//buffer output
			[P_IOB_Attrib] = r1;
			
			r1 = [P_IOB_Buffer];
			r1 |= 1;						//output high
			[P_IOB_Data] = r1;
		 	retf
.ENDP
//////////////////////////////////////////////////////////////////
// Function: Send A Byte to Serial Flash
// Syntax: SP_SIOSendAByte(AddressLow,AddressHigh,  data)
// c level public
// Used register: r1,r2,r3
//////////////////////////////////////////////////////////////////
.public _SP_SIOSendAByte;
_SP_SIOSendAByte: .PROC
F_SIOSendAByte:
	    PUSH BP,BP TO [SP];
	    BP = SP + 1;
		R1 = [BP+3];
	    [P_SIO_Addr_Low]=r1;        // input SFLASH low address
	    r1=r1 lsr 4;         		// right shift 8
	    r1=r1 lsr 4;
	    [P_SIO_Addr_Mid]=r1; 		// input SFLASH mid address
	    R1 = [BP+4];                // Port direction
	    r1=r1&0x0007;  				// input SFLASH hi address
	    [P_SIO_Addr_High]=r1;
        r1=0x00C3+C_SIOCLOCK;
        [P_SIO_Ctrl]=r1;        	// clk=CPUclk/8, 24 bit address  ;write
        [P_SIO_Start]=r1;       	// enable write mode
        R1 = [BP+5];
        [P_SIO_Data]=r1;        	// state to transmit data
L_WaitSIOSendReady:
        r1=[P_SIO_Start];
        test    r1,0x0080
        jnz     L_WaitSIOSendReady
        [P_SIO_Stop]=r1;            //disable write mode
        call  F_Delay_Program_Time
        POP BP,BP FROM [SP];
        retf;
        .ENDP;


//////////////////////////////////////////////////////////////////
// Function: Read A Byte to Serial Flash
// Syntax: SP_SIOReadAByte(AddressLow, AddressHigh)
// c level public
// Used register: r1,r2,r3
// Return register: r1
//////////////////////////////////////////////////////////////////         

.public _SP_SIOReadAByte;
_SP_SIOReadAByte: .PROC
F_SIOReadAByte:
                PUSH BP,BP TO [SP];
        BP = SP + 1;
        R1 = [BP+3];
        [P_SIO_Addr_Low]=r1; 		// input SFLASH low address
        r1=r1 lsr 4;
        r1=r1 lsr 4;
        [P_SIO_Addr_Mid]=r1; 		// input SFLASH mid address
        R1 = [BP+4];                // Port direction
        r1=r1&0x0007;  				// input SFLASH hi address
        [P_SIO_Addr_High]=r1;
        r1=0x0083+C_SIOCLOCK;
        [P_SIO_Ctrl]=r1;            // clk=CPUclk/16, 24 bit address  ;read
        [P_SIO_Start]=r1;           // enable read mode
        r2=[P_SIO_Data];            // Clear SFLASH buffer
L_WaitSIOReadReady1:
        r1=[P_SIO_Start];
        test    r1,0x0080
        jnz     L_WaitSIOReadReady1
        r1=[P_SIO_Data];          	// Read exact Data
L_WaitSIOReadReady2:                // Wait read stop
        r2=[P_SIO_Start];
        test    r2,0x0080
        jnz     L_WaitSIOReadReady2
        [P_SIO_Stop]=r2;            // disable read mode
        POP BP,BP FROM [SP];
        retf;
        .ENDP;
//////////////////////////////////////////////////////////////////
// Function: Send A Word to Serial Flash
// Syntax: SP_SIOSendAData(AddressLow,AddressHigh,  data) Address must be even
// c level public
// Used register: r1,r2,r3
//////////////////////////////////////////////////////////////////
.public _SP_SIOSendAWord;
_SP_SIOSendAWord: .PROC
F_SIOSendAWord:
        PUSH BP,BP TO [SP];
        BP = SP + 1;
        r1=0x00C3+C_SIOCLOCK;
        [P_SIO_Ctrl]=r1;            // clk=CPUclk/8, 24 bit address  ;write
        R1 = [BP+3];
        [P_SIO_Addr_Low]=r1;  		// input Sflash low address
        r1=r1 lsr 4;          		// right shift 8
        r1=r1 lsr 4;
        [P_SIO_Addr_Mid]=r1;  		// input SFLASH mid address
        R1 = [BP+4];                // Port direction
        r1=r1&0x0007;  				// input SFLASH hi address
        [P_SIO_Addr_High]=r1;
        
        [P_SIO_Start]=r1;           // enable write mode
        R1 = [BP+5];
        [P_SIO_Data]=r1;            //start to transmit low byte
L_WaitSIOSendReadyLB:
        r1=[P_SIO_Start];
        test    r1,0x0080
        jnz     L_WaitSIOSendReadyLB
      
        [P_SIO_Stop]=r1;            // disable write mode
        call  F_Delay_Program_Time 

         R1 = [BP+3];
         r1+=1;
        [P_SIO_Addr_Low]=r1; 		// input SFLASH low address
             
        [P_SIO_Start]=r1;           //enable write mode
        r1=[BP+5]; 
        r1=r1 lsr 4;         		// right shift 8
        r1=r1 lsr 4;
        [P_SIO_Data]=r1;            //start to transmit high byte
L_WaitSIOSendReadyHB:
        r1=[P_SIO_Start];
        test    r1,0x0080
        jnz     L_WaitSIOSendReadyHB
        [P_SIO_Stop]=r1;            //disable write mode
		call  F_Delay_Program_Time 
		POP BP,BP FROM [SP];
        retf;
        .ENDP;


//////////////////////////////////////////////////////////////////
// Function: Read A Word from Serial Flash
// Syntax: SP_SIOReadAWord(AddressLow, AddressHigh)
// c level public
// Used register: r1,r2,r3,r4
// Return register: r1
//////////////////////////////////////////////////////////////////         

.public _SP_SIOReadAWord;
_SP_SIOReadAWord: .PROC
F_SIOReadAWord:
        PUSH BP,BP TO [SP];
        BP = SP + 1;
        r4=0x00FF;
        R1 = [BP+3];
        [P_SIO_Addr_Low]=r1; 		// input SFLASH low address
        r1=r1 lsr 4;
        r1=r1 lsr 4;
        [P_SIO_Addr_Mid]=r1; 		// input SFLASH mid address
        R1 = [BP+4];                // Port direction
        r1=r1&0x0007;  				// input SFLASH hi address
        [P_SIO_Addr_High]=r1;
        r1=0x0083;  				// C_SIOCLOCK 0x0010
        [P_SIO_Ctrl]=r1;           	// clk=CPUclk/16, 24 bit address  ;read
        [P_SIO_Start]=r1;       	// enable read mode
        r2=[P_SIO_Data];          	// Clear SFLASH buffer
L_WaitSIOReadReady1LB:
        r1=[P_SIO_Start];
        test    r1,0x0080
        jnz     L_WaitSIOReadReady1LB
        
        r2=r4&[P_SIO_Data];          // Read exact Low Byte
L_WaitSIOReadReady2LB:               // Wait read stop
        r1=[P_SIO_Start];
        test    r1,0x0080
        jnz     L_WaitSIOReadReady2LB
        
        r3=r4&[P_SIO_Data];          // Read exact High Byte

L_WaitSIOReadReady2HB:               // Wait read stop
        r1=[P_SIO_Start];
        test    r1,0x0080
        jnz     L_WaitSIOReadReady2HB
       
        [P_SIO_Stop]=r1;             // disable read mode
 
        r3=r3 lsl 4;     			 //shift left 8
        r1=r3 lsl 4;
        r1|=r2;         			 //return data
        POP BP,BP FROM [SP];
        retf;
        .ENDP;




///////////////////////////////////////////////////////////////
//Function : Mass Erase for S_Flash
// Syntax: SIOMassErase()
// Used register: r1,r2
///////////////////////////////////////////////////////////////

.public _SP_SIOMassErase;
_SP_SIOMassErase: .PROC
F_SIOMassErase:
        push r1,r2 to [sp];
        r1=0x00C0+C_SIOCLOCK;
        [P_SIO_Ctrl]=r1;            // clk=CPUclk/8, 16 bit address  ;write
        r2=0x0000;
        [P_SIO_Addr_Low]=r2; 		// input SFLASH low address
        r2=0x00C0;
        [P_SIO_Addr_Mid]=r2; 		// input SFLASH mid address
        r2=0x00C0;
       [P_SIO_Addr_High]=r2; 
        [P_SIO_Start]=r1;           // enable write mode
        r1=0;                       // A7~A0 = 0
        [P_SIO_Data]=r1;            // state to transmit data

L_WaitSIOSendReadyMass:
        r1=[P_SIO_Start];
        test    r1,0x0080
        jnz     L_WaitSIOSendReadyMass
		[P_SIO_Stop]=r1;
        call    F_Delay_MassErase_Time
        pop r1,r2 from [sp];
        retf;
        .ENDP;

///////////////////////////////////////////////////////////////
//Function : Sector Erase for S_Flash (Page Size 1K)
// Syntax: SP_SIOSectorErase(Sector)
// Used register: r1,r2
///////////////////////////////////////////////////////////////
.public _SP_SIOSectorErase;
_SP_SIOSectorErase: .PROC
SP_SIOSectorErase:
        PUSH BP,BP TO [SP];
        BP = SP + 1;
 
        R1 = [BP+3];
        r1=r1&0x00ff;
        r1=r1 lsl 3;
        r1=r1|0x8000;
        [P_SIO_Addr_Low]=r1; 	// input SFLASH low address ;for A15 and A10
        r1=r1 lsr 4;
        r1=r1 lsr 4;
        [P_SIO_Addr_Mid]=r1; 	// input SFLASH mid address ;for A16
        r1=0x00C0+C_SIOCLOCK;
        [P_SIO_Ctrl]=r1;        // clk=CPUclk/8, 16 bit address  ;write
        [P_SIO_Start]=r1;       // enable write mode
        r1=0;                   // A7~A0 = 0
        [P_SIO_Data]=r1;        // state to transmit data

L_WaitSIOSendReadyPage1:
        r1=[P_SIO_Start];
        test    r1,0x0080
        jnz     L_WaitSIOSendReadyPage1
        [P_SIO_Stop]=r1;        
        call    F_Delay_SectorErase_Time
        POP BP,BP FROM [SP];
        retf;
        .ENDP;



//=======================================================================================
//FunctionName:F_Delay_MassErase_Time
//Description:
//Author:
//Date:
//Destroy:
//Input:
//Return:
//========================================================================================
.public F_Delay_MassErase_Time;
F_Delay_MassErase_Time:
		r2=C_MassErase_Time;		
?L_Wait_MassErase_Time_Over:							       
		call	F_Delay_Program_Time;
		r2-=1;						
		jnz ?L_Wait_MassErase_Time_Over;		
		retf;						
//=======================================================================================
//FunctionName:F_Delay_SectorErase_Time
//Description:
//Author:
//Date:
//Destroy:
//Input:
//Return:
//========================================================================================
.public F_Delay_SectorErase_Time;
F_Delay_SectorErase_Time:
		r2=C_SectorErase_Time;				//6	
?L_Wait_SectorErase_Time_Over:							       
		call	F_Delay_Program_Time;
		r2-=1;								//3					
		jnz ?L_Wait_SectorErase_Time_Over;	//5	
		retf;						
//=======================================================================================
//FunctionName:F_Delay_Program_Time
//Description:
//Author:
//Date:
//Destroy:
//Input:
//Return:
//========================================================================================
.public F_Delay_Program_Time;
F_Delay_Program_Time:
		r1=C_Program_Time;			//6
?L_Wait_Program_Time_Over:							//52cycle,1us @ 49Mhz       
		nop;						//4
		nop;						//4
		nop;						//4
		nop;						//4
		nop;						//4
		nop;						//4
		nop;						//4
		nop;						//4
		nop;						//4
		nop;						//4
		nop;						//4
		nop;						//4
		nop;						//4
		r1-=1;						//3
		jnz ?L_Wait_Program_Time_Over;		//5
		retf;						//12
