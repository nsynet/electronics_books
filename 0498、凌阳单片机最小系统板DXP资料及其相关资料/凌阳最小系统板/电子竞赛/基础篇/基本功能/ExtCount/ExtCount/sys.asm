.include    hardware.inc
.define		TIMERA_CLKA_EXT		 0x0007;  
.define     TIMERA_CLKB_1        0x0030
.define     P_INT_Ctrl_New       0x702d
 

.code
.public _Init_IOB
_Init_IOB: .PROC	
	
    //����IOB2IOB3�ֱ�ΪEXT1��EXT2�ⲿ�жϣ���д��P_FeedBack�ڣ�
    //IOB2��IOB3�ֱ�����δ���������IOB4��IOB5�ֱ�����Ϊ��������           
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
    INT IRQ;           //���ж�
    retf
.endp;                       

//****************************************//
 .public _TmbCount 
 _TmbCount:	.PROC
 	r1 =0
    [P_TimerA_Data]=r1
    r1 = TIMERA_CLKA_EXT +TIMERA_CLKB_1  //���ö�ʱ����ʱ��ԴΪclkA���ⲿʱ��Դ
    [P_TimerA_Ctrl]=r1 					 //��ʼ����
    RETF
    .ENDP
                   
        
  