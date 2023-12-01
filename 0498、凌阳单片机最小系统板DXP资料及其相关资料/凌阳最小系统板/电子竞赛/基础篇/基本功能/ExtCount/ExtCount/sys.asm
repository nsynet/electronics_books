.include    hardware.inc
.define		TIMERA_CLKA_EXT		 0x0007;  
.define     TIMERA_CLKB_1        0x0030
.define     P_INT_Ctrl_New       0x702d
 

.code
.public _Init_IOB
_Init_IOB: .PROC	
	
    //设置IOB2IOB3分别为EXT1和EXT2外部中断，并写入P_FeedBack口；
    //IOB2和IOB3分别设置未反相输出，IOB4和IOB5分别设置为悬浮输入           
    r1=0x000c  
    [P_IOB_Dir]=r1 
	r1=0x0030 
	[P_IOB_Attrib]=r1       
	R1=0x000c 
	[P_FeedBack]=r1	 
	RETF
	.ENDP   
//***************************************/ /
 .public _RunTime2Hz 
_RunTime2Hz:   .proc
	irq off
	r1 = 0x0004;
    [P_INT_Ctrl] = r1; 
    INT IRQ;           //开中断
    retf
.endp;                       

//****************************************//
 .public _TmbCount 
 _TmbCount:	.PROC
 	r1 =0
    [P_TimerA_Data]=r1
    r1 = TIMERA_CLKA_EXT +TIMERA_CLKB_1  //设置定时器的时钟源为clkA的外部时钟源
    [P_TimerA_Ctrl]=r1 					 //开始计数
    RETF
    .ENDP
                   
        
  