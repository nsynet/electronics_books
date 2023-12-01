.INCLUDE hardware.inc
.IRAM
.VAR     I_KeyBuf = 0                 //保存键值
.VAR	I_Key_Delay = 0               //扫描有键按下的次数
.EXTERNAL _KeyFlag                    //有键按下标识符
.CODE
.PUBLIC _SP_Init_IOA;              
_SP_Init_IOA: .PROC
   	R1 = 0x00f0;      
    [P_IOA_Attrib] = R1;    
    [P_IOA_Dir] = R1;
    [P_IOA_Data] = R1;
    RETF
.ENDP;

//============================================================================================
//函数: F_Key_Scan（）
//语法：void F_Key_Scan（）
//描述：键盘扫描函数
//参数：无
//返回：无
//=============================================================================================
.PUBLIC _F_Key_Scan;
_F_Key_Scan: .PROC      
    R1 = 0x00F0		                  //扫描键盘
	[P_IOA_Data] = R1
    R1 = 0x000f           
    R1 &= [P_IOA_Data]
    JNZ L_Have_Key_Pressed
L_NoKey_Press:                        //无键按下
    R1 = 0 
    [I_KeyBuf] = R1                   //清键盘缓冲区
    [_KeyFlag] = R1
    [I_Key_Delay]=R1;
    RETF
L_Have_Key_Pressed:                  //有键按下处理         
    CALL   F_Key_Scaning             //行扫描确定键
    CALL   Enter_Key;                //确认有键按下
    RETF       
    .ENDP
//============================================================================================
//函数: unsigned F_Key_Scaning()
//语法：void unsigned F_Key_Scaning()
//描述：行扫描函数
//参数：无
//返回：扫描键值
//=============================================================================================
.PUBLIC	 F_Key_Scaning;	   
F_Key_Scaning:
F_Key_Scan_B7:   	    
    R2=0x0080                        //扫描第一行//changed by abin 扫描第四列
	[P_IOA_Data] = R2  
	R1 = 0x000f	    	   
    R1& =[P_IOA_Data]
	CMP R1,0x0000                    //是否该行有键按下
    JNZ  F_Key_Pressed   	        
F_Key_Scan_B6:
    R2=0x0040                        //扫描第二行
	[P_IOA_Data] = R2
	R1 = 0x000f	    	   
    R1& =[P_IOA_Data]
	CMP R1,0x0000                   //是否该行有键按下
    JNZ  F_Key_Pressed   
F_Key_Scan_B5:           
    R2=0x0020                       //扫描第三行
	[P_IOA_Data] = R2
	R1 = 0x000f	    	   
    R1& =[P_IOA_Data] 
	CMP R1,0x0000                   //是否该行有键按下
    JNZ  F_Key_Pressed   
F_Key_Scan_B4:
	R2=0x0010                       //扫描第四行
	[P_IOA_Data] = R2
	R1 = 0x000f	    	   
    R1& =[P_IOA_Data]
	CMP R1,0x0000                  //是否该行有键按下
    JNZ  F_Key_Pressed   
	RETF		
F_Key_Pressed:	
    R2|=R1                         //R2--B11~B8:输出   R1--B0~B7,输入
    RETF

//============================================================================================
//函数: Enter_Key（）
//语法：Enter_Key（）
//描述：确定有键按下函数
//参数：无
//返回：无
//============================================================================================
Enter_Key:
Scan_first:
    R3 = [I_Key_Delay]
    CMP R3,0x0000
    JNZ L_Scan_many;
    [I_KeyBuf] = R2;
    R3 += 1;
    [I_Key_Delay] = R3;
    RETF;
L_Scan_many:                         //去抖
    R1 = [I_KeyBuf]        
    CMP R1,R2
    JNE L_Error_Key_pro;
    R3 = [I_Key_Delay]
    R3 += 1;
    [I_Key_Delay] = R3;		
	CMP		R3, 0x0010;         
	JE		L_Enter_Have_KeyDown;
	RETF;
L_Enter_Have_KeyDown:
	R1 = 1;
    [_KeyFlag] = R1	
    R3 = 0;
    [I_Key_Delay]=R3	
    RETF
L_Error_Key_pro:
    R3 = 0;
    [I_Key_Delay]=R3
	[I_KeyBuf] = R3
	RETF;
	    
//============================================================================================
//函数: unsigned F_Get_Key()
//语法：unsigned F_Get_Key()
//描述：取键值函数
//参数：无
//返回：键值
//============================================================================================
.PUBLIC		_F_Get_Key;       
_F_Get_Key:    .PROC
    R3 = 1
    R2 = [I_KeyBuf]
L_Key_value_Loop:
    BP = R3 + Key_Table
    R1 = [bp]
    CMP R1,R2
    JE L_KeyCode_Return
    R3 += 1
   CMP R3,18
   // CMP R3,11
    JBE L_Key_value_Loop
    R3=0
L_KeyCode_Return:
    R1 = 0;
    [I_KeyBuf] = R1; 
    R1=R3     
    RETF                             //清键盘缓冲区
    .endp    
 
            
 Key_Table:
 .DW  0x0088,0x0084,0x0082,0x0081
 .DW  0x0048,0x0044,0x0042,0x0041
 .DW  0x0028,0x0024,0x0022,0x0021
 .DW  0x0018,0x0014,0x0012,0x0011
 
 //.DW  0x0011,0x0021,0x0041,0x0081
 //.DW  0x0012,0x0022,0x0042,0x0082
 //.DW  0x0014,0x0024,0x0044,0x0084
 //.DW  0x0018,0x0028,0x0048,0x0088
 
  //  .DW 0x0000,0x0014,0x0024,0x0044
  //  .DW 0x0012,0x0022,0x0042,0x0011
  //  .DW 0x0021,0x0041,0x0028,0x0018
  //  .DW 0x0081,0x0082,0x0084,0x0048      

  
  