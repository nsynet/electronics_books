.INCLUDE hardware.inc
.IRAM
.VAR     I_KeyBuf = 0                 //�����ֵ
.VAR	I_Key_Delay = 0               //ɨ���м����µĴ���
.EXTERNAL _KeyFlag                    //�м����±�ʶ��
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
//����: F_Key_Scan����
//�﷨��void F_Key_Scan����
//����������ɨ�躯��
//��������
//���أ���
//=============================================================================================
.PUBLIC _F_Key_Scan;
_F_Key_Scan: .PROC      
    R1 = 0x00F0		                  //ɨ�����
	[P_IOA_Data] = R1
    R1 = 0x000f           
    R1 &= [P_IOA_Data]
    JNZ L_Have_Key_Pressed
L_NoKey_Press:                        //�޼�����
    R1 = 0 
    [I_KeyBuf] = R1                   //����̻�����
    [_KeyFlag] = R1
    [I_Key_Delay]=R1;
    RETF
L_Have_Key_Pressed:                  //�м����´���         
    CALL   F_Key_Scaning             //��ɨ��ȷ����
    CALL   Enter_Key;                //ȷ���м�����
    RETF       
    .ENDP
//============================================================================================
//����: unsigned F_Key_Scaning()
//�﷨��void unsigned F_Key_Scaning()
//��������ɨ�躯��
//��������
//���أ�ɨ���ֵ
//=============================================================================================
.PUBLIC	 F_Key_Scaning;	   
F_Key_Scaning:
F_Key_Scan_B7:   	    
    R2=0x0080                        //ɨ���һ��//changed by abin ɨ�������
	[P_IOA_Data] = R2  
	R1 = 0x000f	    	   
    R1& =[P_IOA_Data]
	CMP R1,0x0000                    //�Ƿ�����м�����
    JNZ  F_Key_Pressed   	        
F_Key_Scan_B6:
    R2=0x0040                        //ɨ��ڶ���
	[P_IOA_Data] = R2
	R1 = 0x000f	    	   
    R1& =[P_IOA_Data]
	CMP R1,0x0000                   //�Ƿ�����м�����
    JNZ  F_Key_Pressed   
F_Key_Scan_B5:           
    R2=0x0020                       //ɨ�������
	[P_IOA_Data] = R2
	R1 = 0x000f	    	   
    R1& =[P_IOA_Data] 
	CMP R1,0x0000                   //�Ƿ�����м�����
    JNZ  F_Key_Pressed   
F_Key_Scan_B4:
	R2=0x0010                       //ɨ�������
	[P_IOA_Data] = R2
	R1 = 0x000f	    	   
    R1& =[P_IOA_Data]
	CMP R1,0x0000                  //�Ƿ�����м�����
    JNZ  F_Key_Pressed   
	RETF		
F_Key_Pressed:	
    R2|=R1                         //R2--B11~B8:���   R1--B0~B7,����
    RETF

//============================================================================================
//����: Enter_Key����
//�﷨��Enter_Key����
//������ȷ���м����º���
//��������
//���أ���
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
L_Scan_many:                         //ȥ��
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
//����: unsigned F_Get_Key()
//�﷨��unsigned F_Get_Key()
//������ȡ��ֵ����
//��������
//���أ���ֵ
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
    RETF                             //����̻�����
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

  
  