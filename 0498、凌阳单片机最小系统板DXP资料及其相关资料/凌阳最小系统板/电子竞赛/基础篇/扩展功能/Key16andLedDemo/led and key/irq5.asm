.define     P_System_Clock  0x7013
.define		P_INT_CTRL		0x7010;
.define 	P_INT_CTRL_NEW	0x702D;
.define		P_INT_CLEAR		0x7011;
.external _KeyFind;
.RAM

.code
.public _Initirq5
_Initirq5:
	int off 
	call ClearWatchDog;
	//r1=0x0098
    //[P_System_Clock]=r1
	r1=0x0008			    //���ж�IRQ5_4Hz��IRQ5_2Hz
	[P_INT_CTRL]=r1 
	[P_INT_CTRL_NEW]=r1 
	R1=0 
	int	irq 
    retf;
    
.public _ClearWatchDog
.public ClearWatchDog
_ClearWatchDog: 
ClearWatchDog: .proc
 push R1 to [SP]
 R1 = 0x0001
 [0x7012] = R1
 pop R1 from [SP]
 retf
.endp
	
.text	
.public _IRQ5
_IRQ5:	
	push r1,r5 to [sp]		//ѹջ����  
    r1=0x0008 	    
	test r1,[P_INT_CTRL] 	//�Ƚ��Ƿ�Ϊ4Hz���ж�Դ
    jnz l_irq5_4 			//�ǣ���ת����Ӧ�����
   	
l_irq5_2:					//�������2Hz�����
	r1=0x0004      
	[P_INT_CLEAR]=r1 
    pop r1,r5 from [sp]
    RETI    
l_irq5_4:
    
	r1=0x0008     
   	[P_INT_CLEAR]=r1
	 call  _KeyFind; 
    pop r1,r5 from [sp]
    RETI
