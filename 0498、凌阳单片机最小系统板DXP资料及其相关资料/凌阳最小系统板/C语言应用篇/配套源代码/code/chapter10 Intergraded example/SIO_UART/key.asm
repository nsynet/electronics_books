.INCLUDE spce.inc
.DEFINE C_DebounceCnt			0x0008;		

.RAM
.PUBLIC KeyBuf      //�����ֵ
.PUBLIC keysum      //ɨ���м����µĴ���
.VAR    KeyBuf
.VAR    keysum
.VAR	R_DebounceReg;						//for keyboard scan
.VAR	R_DebounceCnt;						//for keyboard scan
.VAR	R_KeyBuf;							//for keyboard scan
.VAR	R_KeyStrobe;						//for keyboard scan
.VAR 	KeyValue

.PUBLIC F_Key_Scan_ServiceLoop;
.PUBLIC F_Key_DebounceCnt_Down;

.CODE
//*******************************************//
//����ɨ�躯��
//�������ƣ�unsigned F_Key_Scan����
//���ڲ���:����ֵ
//*******************************************//
.PUBLIC _F_Key_Scan;
_F_Key_Scan: .proc       
        r1 = 0x00F0		     //ɨ�����
		[P_IOA_Data] = r1
        r1 = 0x000f           
        r1 &= [P_IOA_Data]
        jnz Have_Key_Pressed

NoKey_Press:                //�޼�����
        r1 = 0 
        [KeyBuf] = r1        //����̻�����
		r1=0xff;			//if no key ,KeyCode=0xff
         retf

Have_Key_Pressed:            //�м����´���
        [KeyBuf]=r1       	//�Ƿ��������ΰ���ɨ��ֵ��ͬ
        
        call Delay10ms
        
        r1 = 0x000f           
        r1 &= [P_IOA_Data]
        
        cmp r1,[KeyBuf]
        jne   NoKey_Press
        call   F_Key_Scaning  //��ɨ��ȷ����
        call   Key_Order      //ȷ������
        [KeyValue]=r2
        
   WaitDebon:    
        r1 = 0x000f           
        r1 &= [P_IOA_Data]
        jnz    WaitDebon
        
        r1=[KeyValue]
        retf                 //����̻�����
 .endp
//////////////////////////////////////////
//��ɨ�躯��
//�������ƣ�unsigned F_Key_Scaning()
//���ڲ�����ɨ���ֵ
//**************************************//
      
F_Key_Scaning:
F_Key_Scan_B7:   	    
	    r2=0x0080          //ɨ���һ��
	    [P_IOA_Data] = r2  
	    r1 = 0x000f	    	   
    	r1& =[P_IOA_Data]
	    cmp r1,0x0000      //�Ƿ�����м�����
    	jnz  F_Key_Pressed   	        
F_Key_Scan_B6:
	    r2=0x0040          //ɨ��ڶ���
	    [P_IOA_Data] = r2
	    r1 = 0x000f	    	   
    	r1& =[P_IOA_Data]
	    cmp r1,0x0000      //�Ƿ�����м�����
    	jnz  F_Key_Pressed   
F_Key_Scan_B5:           
    	r2=0x0020           //ɨ�������
	    [P_IOA_Data] = r2
	    r1 = 0x000f	    	   
    	r1& =[P_IOA_Data] 
	    cmp r1,0x0000       //�Ƿ�����м�����
    	jnz  F_Key_Pressed   
F_Key_Scan_B4:
	    r2=0x0010          //ɨ�������
	    [P_IOA_Data] = r2
	    r1 = 0x000f	    	   
    	r1& =[P_IOA_Data]
	    cmp r1,0x0000      //�Ƿ�����м�����
    	jnz  F_Key_Pressed   
        r1=0
        r2=0         
        [KeyBuf] = r1  
F_Key_Pressed:	
		r2|=r1      //r2--B11~B8:output    r1--B0~B7,input
        retf
 //***********************************//
 //ȷ����ֵ����
 //�������ƣ�Key_Order����
 //***********************************//
Key_Order: 
      r3=1
Key_value_Loop:
      bp = r3 + Key_Table
      r1 = [bp]
      cmp r1,r2
      je KeyOrder_Ret
      r3 += 1
      cmp r3,15  //modified by gywei ( cmp r3,11 )
      jbe Key_value_Loop
      r3=0
 KeyOrder_Ret: 
       r2=r3     
        retf
 
 //****************************************//
 //��ʱ����
 //�������ƣ�Delay10ms����
 //****************************************//
 Delay10ms:
      r4=0x2FFF
    Delay10LOOP:
       R4-=1
       JNZ     Delay10LOOP
       RETF  
  
  .data             
 Key_Table:
//    .dw  0x0000
    .dw 0x0011,0x0012,0x0014,0x0018
    .dw 0x0021,0x0022,0x0024,0x0028
    .dw 0x0041,0x0042,0x0044,0x0048
    .dw 0x0081,0x0082,0x0084,0x0088      
//////////////////////////////////////////////////////////////////
// Function: Get Key code from key pad(8 x 1 key pad)
// Input: Port IOA b7-b0
// Output: R_KeyStrobe b7-b0
//          | 	  |     |     | 
// +Vcc --- x --- x ... x --- x ---   
//          |     |     |     |
//          IOA.7             IOA.0
// Note: 1)link F_DebounceCntDown is necessary 
// Destory register: r1, r2                                            
////////////////////////////////////////////////////////////////// 
F_Key_Scan_ServiceLoop:
		
     	r1 = [P_IOA_Data];			// get key data from IOA   
	    	
        r1 = r1 and 0xff;				//
        r2 = [R_DebounceReg];			//
        [R_DebounceReg] = r1;			//
        cmp r2,[R_DebounceReg];			//
        je	L_KS_StableTwoSample;		//
        
        r1 = C_DebounceCnt;				//debounce time setting
        [R_DebounceCnt] = r1;			//
        retf;							//
        
L_KS_StableTwoSample:
		r1 = [R_DebounceCnt];			//
		jz	L_KS_StableOverDebounce;	//
		retf;
	
L_KS_StableOverDebounce:        
		[R_DebounceCnt] = r1;			//
		r2 = [R_DebounceReg];			//
		r1 = [R_KeyBuf];				//
		[R_KeyBuf] = r2;				//
		r1 = r1 xor 0x00ff;				//
		r1 = r1 and [R_KeyBuf];			//
		r1 = r1 and 0x00ff;				//
		r1 = r1 or [R_KeyStrobe];		//
		[R_KeyStrobe] = r1;				//save stable key code to R_KeyStrobe
		retf;		
	

//////////////////////////////////////////////////////////////////
// Function: debounce counter down count
//////////////////////////////////////////////////////////////////
F_Key_DebounceCnt_Down:
		r1 = [R_DebounceCnt];			// Debounce subroutine for F_IO_Key_Scan:
		jz	L_DebounceCntZero;			// stop count if zero
		r1 -= 0x0001;					//
		[R_DebounceCnt] = r1;			//
L_DebounceCntZero:						//
		retf;  							//	