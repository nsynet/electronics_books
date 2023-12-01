//program:
////
.include spce.inc;
.include sp_lib.inc;
.define P_INT_Ctrl_New    0x702d


.code

 ////////////////////////////
.public _LCD_INIT
_LCD_INIT:   .proc
        INT off;        
        call Init_IOA_high8bit_output;          
        r1 = 0x00e2;        //turn off waiting
       // [LCDcommand] = r1;
        call Write_command_E1;
        call Write_command_E2;
        r1 = 0x00a4;
       // [LCDcommand] = r1;  //set 1/32 pwm
        call Write_command_E1;
        call Write_command_E2;
        r1 = 0x00a9;          //正向排序
       // [LCDcommand] = r1;
        call Write_command_E1;
        call Write_command_E2;
        r1 = 0x00c0;          //正向排序
       // [LCDcommand] = r1;
        call Write_command_E1;
        call Write_command_E2;
        r1 = 0x00af;          //display
       // [LCDcommand] = r1;
        call Write_command_E1;        
        call Write_command_E2;
        //call Clear_screen;           
    retf;
                   
   .endp                                                            
	   
        
        
////////////////////////////////////////
    
.public  Init_IOA_high8bit_output
Init_IOA_high8bit_output: .PROC
//Init_IOA_output:
	r1 = [P_IOA_Dir]
    r1 |= 0xffff
    [P_IOA_Dir] = r1;
    r1 =  [P_IOA_Attrib]
    r1 |= 0xffff
    [P_IOA_Attrib] = r1;
    r1 = [P_IOA_Data]
    r1 |= 0xfbff                    //LCD is writing
    [P_IOA_Data] = r1;				//
		retf
	.endp

//////////////////////////////////////
//Init_IOA_high8bit_output
.public Init_IOA_low8bit_output
Init_IOA_low8bit_output:  .proc
//Init_IOA_low8bit_output:  
	r1 = [P_IOA_Dir]
    r1 |= 0x00ff
    [P_IOA_Dir] = r1;
    r1 =  [P_IOA_Attrib]
    r1 |= 0x00ff
    [P_IOA_Attrib] = r1;
    r1 = [P_IOA_Data]
    r1 |= 0x00ff
    [P_IOA_Data] = r1;
    retf
 .endp;
///////////////////////////////////////
//Init_IOA_low8bit_Input 
.public Init_IOA_low8bit_Input
Init_IOA_low8bit_Input: .proc
		 r1 = [P_IOA_Data]
        r1 &= 0xff00
        [P_IOA_Data] = r1;   
        r1 = [P_IOA_Dir]
        r1 &= 0xff00
        [P_IOA_Dir] = r1;
        r1 = [P_IOA_Attrib]
        r1 &= 0xff00
        [P_IOA_Attrib] = r1;          
        retf
.endp

////////////////////////////////////
//Read_status_command
.public Read_status_command
Read_status_command: .proc
//Read_status_command:
      call Init_IOA_low8bit_Input;
      
       R1 = [P_IOA_Data]   //R/W = 1    A0 = 0  
       R1 |= 0x0400  
       R1 &= 0x07ff
       [P_IOA_Data] = R1;
       retf
 .endp;
 
 ////////////////////////////////
 //Write_status_command
 .public Write_status_command
Write_status_command: .proc
//Write_status_command:
       R1 = [P_IOA_Data]    //R/W = 0    A0 = 0  
       R1 &= 0x03ff   
       [P_IOA_Data] = R1;
	   call  Init_IOA_low8bit_output;      
       retf
.endp   

/////////////////////////////////
.public Write_data_status
Write_data_status:   .proc    
    r1 = [P_IOA_Data]
    R1 |= 0x0800
    r1 &= 0x0bff
    [P_IOA_Data] = R1;
    call  Init_IOA_low8bit_output;
    retf
.endp 

/////////////////////////////////
.public E1_status_high
E1_status_high:
    R1 = [P_IOA_Data]              //E1 = 1;
    r1 |= 0x0100
    [P_IOA_Data] = R1;
    retf
    
/////////////////////////////////
.public E1_status_low
E1_status_low:
    R1 = [P_IOA_Data]              //E1 = 0;
    r1 &= 0xfeff
    [P_IOA_Data] = R1;
    retf
/////////////////////////////////
.public E2_status_high
E2_status_high:
	R1 = [P_IOA_Data]            //E2 = 1;
    r1 |= 0x0200
    [P_IOA_Data] = R1;
    retf
/////////////////////////////////
.public E2_status_low
E2_status_low:
	R1 = [P_IOA_Data]             //E2 = 0;
    r1 &= 0xfdff
    [P_IOA_Data] = R1;
    retf  
//////////////////////////////////// 
//Write_command_E1:
.public Write_command_E1
.public _Write_command_E1
Write_command_E1:
_Write_command_E1:  .proc
     push r1 to [sp]
     call Write_status_command	
Pr01:	
    R1 = [P_IOA_Data]             //DB0-7 = high
	R1 |= 0x00FF   
	[P_IOA_Data] = R1;

    call E1_status_high;
    call E1_status_low;   
    
    call Read_status_command;       
	call E1_status_high;    
     R2 = [P_IOA_Data] 
     r2 &= 0x0080;
     jnz Pr01;   
    

    call Write_status_command
    
  
    pop r1 from [sp]
            
    R2 = [P_IOA_Data]
    r2 &= 0xff00
    r1 |= r2;
    [P_IOA_Data] = R1; //write command
     
    call E1_status_high;    
    call E1_status_low;  
   
    retf
   .endp
   
 //////////////////////////////////////////// 
//Write_command_E2:
.public Write_command_E2
.public _Write_command_E2
_Write_command_E2: 
Write_command_E2: .proc 
    push r1 to [sp]
	call Write_status_command	
Pr02:	
    R1 = [P_IOA_Data]             //DB0-7 = high
	R1 |= 0x00FF	 
	[P_IOA_Data] = R1;
	
	call E2_status_high 
    call E2_status_low
   
    
    call Read_status_command;
    
   	call E2_status_high 
    
    r2 = [P_IOA_Data]            //read DB0-7
    
    r2 &= 0x0080;
    jnz Pr02;
    
    call Write_status_command    
    call E2_status_high 
    
   pop r1 from [sp]          //write command    
    
    R2 = [P_IOA_Data]
    r2 &= 0xff00
    r1 |= r2;
    [P_IOA_Data] = R1;
     
    call E2_status_high 
    call E2_status_low
   
    retf
   .endp
   
 /////////////////////////////////////////
  .public  Write_display_data_function_E1; 
  .public  _Write_display_data_function_E1
  _Write_display_data_function_E1:
  Write_display_data_function_E1: .proc   
    push r1 to [sp]
    call Write_status_command
Pr11:	
    R1 = [P_IOA_Data]             //DB0-7 = high
	R1 |= 0x00FF  
	[P_IOA_Data] = R1;
	
	call E1_status_high;    
    call E1_status_low;  
    
    call  Read_status_command;
    
   	call E1_status_high;    
    
    
    r2 = [P_IOA_Data]              //read DB0-7
    r2 &= 0x0080;
    jnz Pr11;
    
    call Write_data_status
    
    pop r1 from [sp]
    //r1 = [r1]
   // r1 = [LCDdisplay_data]           //write command
    R2 = [P_IOA_Data]
    r2 &= 0xff00
    r1 |= r2;
    [P_IOA_Data] = R1;
    
     
    call E1_status_high;    
    call E1_status_low;  
    //pop bp from [sp]
    retf
   .endp
   
   
     
  /////////////////////////
.public  Write_display_data_function_E2;
.public  _Write_display_data_function_E2
 _Write_display_data_function_E2:
Write_display_data_function_E2: .proc
    push r1 to [sp]
	call Write_status_command
Pr12:		
	R1 = [P_IOA_Data]             //DB0-7 = high
	R1 |= 0x00FF
	[P_IOA_Data] = R1;

	call E2_status_high 
    call E2_status_low	
    
     call  Read_status_command;
     
    call E2_status_high 
   
    
     R2 = [P_IOA_Data]
     r2 &= 0x0080;
     jnz Pr12;
    
    call Write_data_status
    
    call E2_status_high  
    pop r1 from [sp]    //write command
    //r1 = [r1]
    R2 = [P_IOA_Data]
    r2 &= 0xff00
    r1 |= r2;
    [P_IOA_Data] = R1;
    
     
   call E2_status_high 
    call E2_status_low
   //  pop bp from [sp]
    retf
   .endp
 
//////////////////////////
.public _SP_INT
_SP_INT:    .proc
push r1,r2 to [sp]
   
   R1 = 0x0001
   [P_Watchdog_Clear] = R1
  // R1 = 0x0015;
  // [P_TimerA_Ctrl] = R1;
   //r1 = 0xffff-370; 
   //[P_TimerA_Data] = r1   
   R1 = 0x0000
   [P_TimeBase_Setup] = R1
   R1 = 0x0002
   R2 = [P_INT_Ctrl_New]    //irq6 tmb1
   R1 |= R2
   [P_INT_Ctrl_New] = R1;
    r1 = 0x0080
    [P_SystemClock] = r1;
   irq on
   pop r1,r2 from [sp]
   retf
.endp
///////////////////////
.public _SP_INT_ON
_SP_INT_ON:    .proc
   R1 = 0x1000
   R2 = [P_INT_Ctrl_New]    //irq6 tmb1
   R1 |= R2
   [P_INT_Ctrl_New] = R1;
   retf
   .endp