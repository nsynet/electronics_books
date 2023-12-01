//////////////////////////////////////////////////////////////////
// File: sflash.asm    
// Function: SERIAL Flash Interface with Serial Flash V1.1
// Writen by: Honda
// Modified by: Arthur Shieh
// Modify list:
//              2001/08/23 : first version
//              2002/05/26 : Modified to use with DVR by Arthur Shieh
//              2002/06/06 : API wrapping 
// Note:
//      1. Modify the C_SIOCLOCK to speed up the serial IO bus
//      2. Modified the delay to shorten the waiting time for flash writing
//
// Modified by: guangyuan wei  (email: guangyuan/sunnorth)   (Ext:2912)
// Modify list:	
//				2003/05/21 : Added SP_SIOSectorErase(Sector) 
//////////////////////////////////////////////////////////////////

.include spce.inc;

.DEFINE C_SIOCLOCK           0x0010;        // CPUCLOCK/8

.CODE


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
        call    F_DelayPT           // Delay necessary for the writing   
        call    F_DelayPT 
        call    F_DelayPT 
        call    F_DelayPT 
        call    F_DelayPT 
        
        [P_SIO_Stop]=r1;            // disable write mode
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
        call    F_DelayPT 
        call    F_DelayPT 
        call    F_DelayPT 
        call    F_DelayPT
        call    F_DelayPT
        [P_SIO_Stop]=r1;            //disable write mode
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
        r1=0x0083;    //+C_SIOCLOCK;       // C_SIOCLOCK 0x0010
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
 
        r3=r3 lsl 4;     //shift left 8
        r1=r3 lsl 4;
        r1|=r2;         //return data
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
//        r1=0x00C0+C_SIOCLOCK;
  //      [P_SIO_Ctrl]=r1;            // clk=CPUclk/8, 16 bit address  ;write
        [P_SIO_Start]=r1;           // enable write mode
        r1=0;                       // A7~A0 = 0
        [P_SIO_Data]=r1;            // state to transmit data

L_WaitSIOSendReadyMass:
        r1=[P_SIO_Start];
        test    r1,0x0080
        jnz     L_WaitSIOSendReadyMass
                      //disable write mode
		[P_SIO_Stop]=r1;

        call    F_Delay11ms
        call    F_Delay11ms      //modify by abin
        call    F_Delay11ms
        call    F_Delay11ms
        pop r1,r2 from [sp];
        retf;
        .ENDP;

F_Delay11ms:
        push r1,r1 to [sp];
        //r1=17*10;
        r1=20*10;  // delay 
L_LoopDelay11:
        call    F_Delay100uS;
        r1-=1;
        jne     L_LoopDelay11
        pop r1,r1 from [sp];
        retf;


///////////////////////////////////////////////////////////////
//Function : 100us Dealy for S_Flash programming time (base on CPUCLK= 24MHz)
// Syntax: Delay100uS()
// Used register: r1,r2
///////////////////////////////////////////////////////////////

.public _Delay100uS;
_Delay100uS: .PROC
F_Delay100uS:  //13
        push r1,r1 to [sp];             //7
        r1=294;  //6
L_DelayLoop:
        r1-=1;  //3           26+19+8*294 =2400
        jne     L_DelayLoop;   //5
        pop r1,r1 from [sp];    //7
        retf;      //12
        .ENDP;

///////////////////////////////////////////////////////////////
//Function : Dealy for S_Flash programming time (base on CPUCLK= 24MHz)
// Syntax: DelayPT()
// Used register: r1
///////////////////////////////////////////////////////////////

.public _DelayPT;
_DelayPT: .PROC
F_DelayPT:  //13
        push r1,r1 to [sp];             //7
        //r1=294;  //6
        //r1=147;
        //r1=1600;
        //r1=100;
        r1=160
        //r1=200;
L_DelayLoopPT:
        r1-=1;  //3           26+19+8*160 =1325  ----> 56us
        jne     L_DelayLoopPT;   //5
        pop r1,r1 from [sp];    //7
        retf;      //12
        .ENDP;



///////////////////////////////////////////////////////////////
//Function : Page Erase for S_Flash (Page Size 1K)
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
        [P_SIO_Stop]=r1;         //disable write mode

        call    F_Delay11ms
        
        POP BP,BP FROM [SP];
        retf;
        .ENDP;


