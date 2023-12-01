.INCLUDE hardware.inc				
.EXTERNAL	F_Key_Scan;
.TEXT
.PUBLIC _BREAK;
.PUBLIC _FIQ;
.PUBLIC _IRQ0;
.PUBLIC _IRQ1;
.PUBLIC _IRQ2;
.PUBLIC _IRQ3;
.PUBLIC _IRQ4;
.PUBLIC _IRQ5;
.PUBLIC _IRQ6;
.PUBLIC _IRQ7;

//============================================================================================
//函数: FIQ()，IRQ0(),IRQ1(),IRQ2(),IRQ3(),IRQ4(),IRQ5(),IRQ6(),IRQ7()
//语法：void FIQ(void ),void IRQ0(void ),void IRQ1(void ),void IRQ2(void ),void IRQ3(void ),
//      void IRQ4(void ),void IRQ5(void ),void IRQ6(void ),void IRQ7(void )
//描述：FIQ()，IRQ0(),IRQ1(),IRQ2(),IRQ3(),IRQ4(),IRQ5(),IRQ6(),IRQ7()中断服务子程序
//参数：无
//返回：无
//=============================================================================================               
_FIQ:
    PUSH R1,R5 TO [SP];
    R1 = C_FIQ_PWM;
    TEST R1,[P_INT_Ctrl];
    JNE    L_FIQ_PWM;
    R1 = C_FIQ_TMA;
    TEST R1,[P_INT_Ctrl];
    JNE L_FIQ_TimerA;
L_FIQ_TimerB:
    POP R1,R5 FROM[SP];
    RETI;
L_FIQ_PWM:                                     
   [P_INT_Clear] = R1;
   POP R1,R5 FROM[SP];
   RETI;
L_FIQ_TimerA:
   [P_INT_Clear] = R1;
   POP R1,R5 FROM[SP];
   RETI;

_BREAK:        
    PUSH R1,R4 TO [SP];
    POP R1,R4 FROM[SP];
    RETI;
_IRQ0:        
    PUSH R1,R4 TO [SP];
    POP R1,R4 FROM[SP];
    RETI;
_IRQ1:        
    PUSH R1,R4 TO [SP];
    POP R1,R4 FROM[SP];
    RETI;
_IRQ2:        
    PUSH R1,R5 TO [SP];
    
    [P_INT_Clear] = R1;
    POP R1,R5 FROM[SP];
    RETI;
_IRQ3:
    PUSH R1,R4 TO [SP];
    POP R1,R4 FROM[SP];
    RETI;
_IRQ4:        
    PUSH R1,R1 TO [SP];
    [P_INT_Clear] = R1;
    POP R1,R1 FROM[SP];
    RETI;
_IRQ5:        
    PUSH R1,R4 TO [SP];
    POP R1,R4 FROM[SP];
    RETI;
_IRQ6:        
   	PUSH R1,R4 to [SP];
	R1=0x0001;
	TEST R1,[P_INT_Ctrl];
	JNZ  _IRQ6_TMB2;
	R1=0x0002;
	[P_INT_Clear]=R1;
	POP R1,R4 FROM [SP];
    RETI;         
_IRQ6_TMB2:
	[P_INT_Clear]=r1;
	CALL	F_Key_Scan;
	POP R1,R4 FROM [SP];
    RETI;  
_IRQ7:        
    PUSH R1,R4 TO [SP];
    POP R1,R4 FROM[SP];
    RETI;
//========================================================================================        
//  isr.asm结束
//========================================================================================
        
       