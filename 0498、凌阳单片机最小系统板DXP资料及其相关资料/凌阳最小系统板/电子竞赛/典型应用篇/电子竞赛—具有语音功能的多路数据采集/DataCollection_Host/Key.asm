//========================================================================================================//
// 程序名称：key.asm
// 功能描述：实现按键扫描、去抖、获取键值功能
// 日    期：2003/7/7
//========================================================================================================//
.include   hardware.inc
.DEFINE C_DebounceCnt	3;   	//去抖值

.ram
//.public  Key
.var    Key
.var    Key_Buff;           	//本次键值暂存单元
.var    Key_Debounce;       	//计数单元

.var    KeyScanLineBuff;
.code
.PUBLIC _F_Key_Scan;
_F_Key_Scan: .PROC
         r1=0x0070				//B0-B6接key0－key11       
		 r1|=[P_IOB_Buffer]     //B0-B3带下拉输入
		 [P_IOB_Data]=r1	    //B4-B6高电平输出

         r1=[P_IOB_Data]
         r1&=0x000f
         jnz F_SomeKeyIsPressed
         r1=0x0000
         [Key]=r1
         retf
         .ENDP
 F_SomeKeyIsPressed:    
         call F_Key_Scaning
         r1=[Key_Buff]    		//读上次键值� 
         [Key_Buff]=r2    		//暂存本次键值
         cmp r1,r2
         je L_KS_StableTwoSample
         r1=C_DebounceCnt    	//初始化计数单元
         [Key_Debounce]=r1  
         retf
        
   
L_KS_StableTwoSample:       
	     r1=[Key_Debounce]
         jz L_KS_StableOverDebounce
         r1-=1              	//计数减 1
         [Key_Debounce]=r1    
         retf   
         

L_KS_StableOverDebounce:   		//形成键码
		r2=[Key_Buff]     		//暂存键值
     
        r3=0         			//查表
Key_value_Loop:
        r4=r3+ Key_Table
        r1=[r4]
        cmp r1,r2
        je Key_Avail_Ret
        r3+=1
        cmp r3,13
        jb Key_value_Loop
        r3=0        

Key_Avail_Ret:
       [Key]=r3  
WaitKeyUp:                		//等待键弹起
        r2=0x0070	 	  		//A8--A11置高，A12---A15不变       
		r2|=[P_IOB_Buffer]
		[P_IOB_Data]=r2	
        r2=0x000f
        r2&=[P_IOB_Data]
        jnz WaitKeyUp 
        retf

        

//======================================================//
F_Key_Scaning:
F_Key_Scan_IOB4:   	    
	    r2=0x0010          		//IOB4=1   
	    r3=0xff80
	    r3&=[P_IOB_Buffer]  	//保护IOB口的其它IO属性
	    r3|=r2 
    	[P_IOB_Data]=r3
    	r1=0x000f
    	r1&=[P_IOB_Data]  
	    jz  F_Key_Scan_IOB5
	    r2|=r1   				//r2--IOB4~IOB6:output    r1--IOB0~IOB3,input
    	[KeyScanLineBuff]=r2
  	        
F_Key_Scan_IOB5:
	    r2=0x0020            	//IOB5=1    
	    r3=0xff80
	    r3&=[P_IOB_Buffer] 
	    r3|=r2 
    	[P_IOB_Data]=r3
    	r1=0x000f
    	r1&=[P_IOB_Data]   
    	jz  F_Key_Scan_IOB6
        r2|=r1               	//r2--IOB4~IOB6:output    r1--IOB0~IOB3,input
    	[KeyScanLineBuff]=r2
    
F_Key_Scan_IOB6:            
    	r2=0x0040           	//IOB6=1
	    r3=0xff80          
	    r3&=[P_IOB_Buffer] 
	    r3|=r2 
    	[P_IOB_Data]=r3
    	r1=0x000f
    	r1&=[P_IOB_Data]   
    	jz  F_Key_Pressed
        r2|=r1   				//r2--B11~B8:output    r1--B0~B7,input
    	[KeyScanLineBuff]=r2

F_Key_Pressed:	
		r2=[KeyScanLineBuff]    //返回值在R2中
        retf
        
.PUBLIC _F_Get_KeyValue;
_F_Get_KeyValue:
		r2=0x0001;
		[P_Watchdog_Clear]=r2;
		r1=[Key];
		RETF;
 .TEXT
//======================================================//
 Key_Table:
  .dw 0x0000;
  .dw 0x0011,0x0012,0x0014,0x0018   //S1, S2, S3, S4
  .dw 0x0021,0x0022,0x0024,0x0028   //S5, S6, S7, S8
  .dw 0x0041,0x0042,0x0044,0x0048   //S9, S10,S10,S11
  .dw 0x0000;
//=====================================================//  
       