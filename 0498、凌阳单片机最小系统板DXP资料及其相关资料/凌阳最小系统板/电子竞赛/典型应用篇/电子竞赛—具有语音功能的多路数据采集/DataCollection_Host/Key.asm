//========================================================================================================//
// �������ƣ�key.asm
// ����������ʵ�ְ���ɨ�衢ȥ������ȡ��ֵ����
// ��    �ڣ�2003/7/7
//========================================================================================================//
.include   hardware.inc
.DEFINE C_DebounceCnt	3;   	//ȥ��ֵ

.ram
//.public  Key
.var    Key
.var    Key_Buff;           	//���μ�ֵ�ݴ浥Ԫ
.var    Key_Debounce;       	//������Ԫ

.var    KeyScanLineBuff;
.code
.PUBLIC _F_Key_Scan;
_F_Key_Scan: .PROC
         r1=0x0070				//B0-B6��key0��key11       
		 r1|=[P_IOB_Buffer]     //B0-B3����������
		 [P_IOB_Data]=r1	    //B4-B6�ߵ�ƽ���

         r1=[P_IOB_Data]
         r1&=0x000f
         jnz F_SomeKeyIsPressed
         r1=0x0000
         [Key]=r1
         retf
         .ENDP
 F_SomeKeyIsPressed:    
         call F_Key_Scaning
         r1=[Key_Buff]    		//���ϴμ�ֵ� 
         [Key_Buff]=r2    		//�ݴ汾�μ�ֵ
         cmp r1,r2
         je L_KS_StableTwoSample
         r1=C_DebounceCnt    	//��ʼ��������Ԫ
         [Key_Debounce]=r1  
         retf
        
   
L_KS_StableTwoSample:       
	     r1=[Key_Debounce]
         jz L_KS_StableOverDebounce
         r1-=1              	//������ 1
         [Key_Debounce]=r1    
         retf   
         

L_KS_StableOverDebounce:   		//�γɼ���
		r2=[Key_Buff]     		//�ݴ��ֵ
     
        r3=0         			//���
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
WaitKeyUp:                		//�ȴ�������
        r2=0x0070	 	  		//A8--A11�øߣ�A12---A15����       
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
	    r3&=[P_IOB_Buffer]  	//����IOB�ڵ�����IO����
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
		r2=[KeyScanLineBuff]    //����ֵ��R2��
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
       