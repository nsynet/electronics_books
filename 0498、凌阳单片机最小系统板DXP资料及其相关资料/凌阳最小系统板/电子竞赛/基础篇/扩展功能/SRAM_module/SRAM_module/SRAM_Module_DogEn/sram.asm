//==============================================================================================================
// 文件名称:   sram.asm
// 功    能：  完成对HM628128A的读写初始化、以及读写数据操作。
// 库 函 数：  NONE
// 日    期:   2003-07-07
//==============================================================================================================
.INCLUDE hardware.inc
.RAM 
.PUBLIC  HighAddr      
.VAR  HighAddr

.CODE
//**************************************************************************************************************
// 函数: SP_InitWriteSRAM
// 语法：void SP_InitWriteSRAM(void) (for c language)
// 功能：写SRAM初始化,不改变IOA0~IOA3的端口属性
// 入口：无
// 出口：无
//**************************************************************************************************************
.PUBLIC _SP_InitWriteSRAM
.PUBLIC F_SP_InitWriteSRAM 
_SP_InitWriteSRAM:         .PROC
F_SP_InitWriteSRAM:
		PUSH r1 TO [sp]
		
		r1=[P_IOA_Dir]		// IOA8---IOA15 接数据线，写入时设置为同相高电平输出
		r1|=0xFFF0;			// IOA4--IOA6 接SRAM控制线(IOA4＝WE_N,IOA5=OE_N,IOA6=CS_N)，设为同相高电平输出.
		r1&=0xFFFF;			// IOB15--IOB0 接SRAM地址线(A0-A15)，设置为同相高电平输出
		[P_IOA_Dir]=r1 		
		
   		r1=[P_IOA_Attrib];
		r1|=0xFFF0;
		r1&=0xFFFF;
        [P_IOA_Attrib]=r1  	
       
        r1=[P_IOA_Buffer] 
        r1|=0xFFF0;
		r1&=0xFFFF;
		[P_IOA_Buffer]=r1;
		
        r1 = 0xFFFF 		 //IOB15--IOB0 接SRAM地址线，设置为同相高电平输出
        [P_IOB_Dir] = r1     	
        [P_IOB_Attrib] = r1  
        [P_IOB_Data] = r1     
         
        POP r1 FROM [sp]
        RETF 
        .ENDP

//**************************************************************************************************************
// 函数: SP_InitReadSRAM
// 语法：void SP_InitReadSRAM(void) (for c language)
// 功能：读SRAM初始化,不改变IOA0~IOA3的端口属性
// 入口：无
// 出口：无
//**************************************************************************************************************

.PUBLIC F_SP_InitReadSRAM 
.PUBLIC _SP_InitReadSRAM 
_SP_InitReadSRAM:          .PROC
F_SP_InitReadSRAM:
		PUSH r1 TO [sp]
	
		r1=[P_IOA_Dir]		// IIOA8---IOA15 接数据线，读出时设置为带下拉电阻的输入
		r1|=0x00F0;			// IOA4--IOA6 接SRAM控制线(IOA4＝WE_N,IOA5=OE_N,IOA6=CS_N)，设为同相高电平输出.
		r1&=0x00FF;			// IOB15--IOB0 接SRAM地址线(A0-A15)，设置为同相高电平输出
		[P_IOA_Dir]=r1 		
		
   		r1=[P_IOA_Attrib];
		r1|=0x00F0;
		r1&=0x00FF;
        [P_IOA_Attrib]=r1  	
       
        r1=[P_IOA_Buffer]   
        r1|=0x00F0;
		r1&=0x00FF;
		[P_IOA_Buffer]=r1;
		
        r1 = 0xFFFF 		//IOB15--IOB0 接SRAM地址线，设置为同相高电平输出
        [P_IOB_Dir] = r1     	
        [P_IOB_Attrib] = r1  
        [P_IOB_Data] = r1     
        
        POP r1 FROM [sp]
        RETF 
        .ENDP
//**************************************************************************************************************
// 函 数: SP_ReadSRAM
// 语 法：unsigned int SP_ReadSRAM(unsigned long Addr) (for c language)
// 功 能：读SRAM,不改变IOA0~IOA3的端口属性
// 参 数：Addr:SRAM的17位地址,参数通过堆栈传递
// 返 回：r1：16位数据，低8bits为低地址的存储单元内容,高8bits为高地址的存储单元内容
//**************************************************************************************************************
.PUBLIC _SP_ReadSRAM 
_SP_ReadSRAM:     .PROC
        PUSH r2,r5 TO [sp]
        bp = sp + 1 
        r1 = [bp+6]         	// SRAM 地址低位 A15---A0
        r2 = [bp+7]         	// SRAM 地址高位 A16
        JZ   L_Read_Low_Addr
        r2 = 0x0080         	// IOA7接A16
 L_Read_Low_Addr:
        [HighAddr]=r2
        call	F_SP_ReadSRAM	//读子程序  r1: 返回数据值
        POP r2,r5 FROM [sp] 
        RETF 
        .ENDP

//**************************************************************************************************************
// 函 数: F_SP_ReadSRAM
// 语 法：call SP_ReadSRAM (for Assembly language)
// 功 能：从SRAM中读取一个WORD数据，不改变IOA0~IOA3的端口属性
// 参 数：r1:低16位地址,[HighAddr]：高1位地址
// 返 回：r1：16位数据（说明：由于HM628128A的数据宽度为8位，一个WORD数据分两次读出，先读低8位，再读高8位
//**************************************************************************************************************              
.PUBLIC F_SP_ReadSRAM
F_SP_ReadSRAM:
        PUSH r2,r4 TO [sp]
        
        r3=[P_IOA_Buffer]
        r3|=[HighAddr]          //IOA7接地址 A16
        r3|=0x0070              //IOA4接we,IOA5接oe,IOA6接cs，它们低电平有效
        [P_IOA_Buffer] = r3 
        
        [P_IOB_Buffer] = r1     //地址A15---A0
        r4 = r1                 
        
        r3=[P_IOA_Buffer]
        r3|=[HighAddr]          //A16
        r3|=0x0010              //读允许设置
        r3&=0xFF9F
        [P_IOA_Buffer] = r3     //CE_N=IOB6=0, OE_N=IOB5=0, WE_N=IOB4=1
 
        r1 = [P_IOA_Data]       //读数据
        r1 = [P_IOA_Data]        
        r1 = r1 lsr 4           //将数据移入低8位
        r2 = r1 lsr 4            
        
        r3=[P_IOA_Buffer]
        r3 |= 0x0030            //CE_N=IOB6=0, OE_N=IOB5=1, WE_N=IOB4=1
        r3&=0xFFBF;
        [P_IOA_Buffer] = r3     
       
        r4 += 1         
        [P_IOB_Buffer] = r4     //下一字节
        
        r3=[P_IOA_Buffer]
        r3|=[HighAddr]          //A16
        r3|=0x0010 
        r3&=0xFF9F;
        [P_IOA_Buffer] = r3     //CS_N=IOB6=0, OE_N=IOB5=0, WE_N=IOB4=1 

        r1 = [P_IOA_Data]       //读数据/////////////////////////////////
        r1 = [P_IOA_Data]        
        r1 = r1 & 0xFF00        //高8位数据
        r1 |= r2                //返回一个字数据
        r3 |= 0x0070 
        [P_IOA_Buffer]=r3       //CS_N=IOB6=1, OE_N=IOB5=1, WE_N=IOB4=1 
		POP r2,r4 FROM [sp]      
        RETF 

//**************************************************************************************************************
// 函 数: SP_WriteSRAM
// 语 法：void SP_WriteSRAM(unsigned long Addr,unsigned int uiWriteRamData) (for c language)
// 功 能：读向SRAM中写入一个WORD数据,不改变IOA0~IOA3的端口属性
// 参 数：Addr:SRAM的17位地址,参数通过堆栈传递; uiWriteRamData:为要写入SRAM的数据（一个字长度）
// 返 回：无
//**************************************************************************************************************
.PUBLIC _SP_WriteSRAM 
_SP_WriteSRAM: .PROC
        PUSH r1,r5 TO [sp] 
        
        bp = sp + 1 
        r1 = [bp+7]                // SRAM 地址低8位
        r2 = [bp+8]                // SRAM 地址高1位
        JZ    Write_Low_Addr
        r2 = 0x0080        
 Write_Low_Addr:
        [HighAddr]=r2
        r2 = [bp+9]                //待写入的一个WORD数据
        call	F_SP_WriteSRAM    //调用写入子程序
        POP r1,r5 FROM [sp] 
        RETF 
        .ENDP

//**************************************************************************************************************
// 函 数: F_SP_WriteSRAM
// 语 法：call F_SP_WriteSRAM (for Assembly language)
// 功 能：写一个WORD数据到SRAM，不改变IOA0~IOA3的端口属性
// 参 数：r1:低16位地址;[HighAddr]：高1位地址;r2:待写入的一个WORD数据
// 返 回：r1：16位数据（说明：由于HM628128A的数据宽度为8位，一个WORD数据分两次写入，先写低8位，再写高8位)
//************************************************************************************************************** 
.PUBLIC F_SP_WriteSRAM
F_SP_WriteSRAM:
        PUSH r1,r5 TO [sp]
        
        r3=[P_IOA_Buffer];
        r3&=0x000F;
        r3|=[HighAddr]         //地址 A16
        r3|=0x0070
        [P_IOA_Buffer] = r3 
        
        [P_IOB_Data] = r1       //低位地址 A15---A0
        r3 = r2                 //存待写入数据
        r2 = r2 lsl 4           //低字节，将低8位移到高8位（数据线是IOA15---IOA8）
        r2 = r2 lsl 4           

        r4=[P_IOA_Buffer]
        r4&=0x00FF;
        r2|=r4;
        r2|=0x0020              //CS_N=IOB6=0, OE_N=IOB5=1, WE_N=IOB4=0 ,写允许
        r2&=0xFFAF;
        r2|=[HighAddr] 
        [P_IOA_Buffer] = r2     //写数据
        
        r2 |=0x0010             //CE_N=IOB6=0,OE_N=IOB5=1, WE_N=IOB4=1,
        [P_IOA_Buffer] = r2     

        r1 += 1; 
        [P_IOB_Data] = r1;      //高字节
		
		r2=[P_IOA_Buffer];
        r2&=0x00FF;
        r3&=0xFF00;
        r3|=r2; 
        r3|=0x0020;            //CE_N=IOB6=0,OE_N=IOB5=1 ,WE_N=IOB4=0
        r3&=0xFFAF;
        r3|=[HighAddr] 
        [P_IOA_Buffer] = r3     //写数据 
       
        r3 |= 0x0070 
        [P_IOA_Buffer] = r3     //CE_N=1, OE_N=1, WE_N=1
        POP r1,r5 FROM [sp]
        RETF 
//========================================================================================        
// End of sram.asm
//========================================================================================
     