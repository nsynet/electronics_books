.include 	hardware.inc
.external 	_g_uisum;
.external 	_g_ucIntFlag;
.TEXT
.PUBLIC _IRQ5
_IRQ5:                        //��ʱ3����жϳ���
	push r1,r4 to [sp];
	r1 =0x0008;						 
	test r1,[P_INT_Ctrl];				
	jnz	L_4Hz;				    	
	
	r1 = 0x0004;
    [P_INT_Clear] = r1;        //���ж�
    
    r1 = [_g_uisum]            //ȡʱ���ź���     
    r1 += 1;
    cmp r1,4;
    jnb loop0;
    
    [_g_uisum]=r1              //����ʱ���ź���
    pop r1,r4 from [sp];
    reti; 

loop0: 
    r1 = 0x0001;
    [_g_ucIntFlag] = r1;       //�����жϱ�ʶ
    r1 = 0
    [_g_uisum] = r1

	pop r1,r4 from [sp];
    reti;
L_4Hz:  
 	r1 = 0x0008;
    [P_INT_Clear] = r1;  		//���ж�
    pop r1,r4 from [sp];
    reti;