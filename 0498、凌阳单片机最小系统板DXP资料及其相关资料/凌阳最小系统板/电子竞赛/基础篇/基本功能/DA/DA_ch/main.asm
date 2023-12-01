//*****************************************************************************/
// ������ ʵ�����Ҳ������ǲ�����ݲ����ֲ��������
//		  ��3������ʵ�ֲ�ͬ���ε������
//����: 2003/07/08
//�汾��1.8.0
//*****************************************************************************/
.INCLUDE hardware.inc;
.INCLUDE key.inc;					    //�������̵�API
.DEFINE		P_WatchDog_Clear	0x7012; 
.RAM
.VAR I_Key;						        //��ֵ�洢��Ԫ
.iram
.var R_SUM,T_PinLv=1;
//=========================================================================/
//�������ݱ�
//=========================================================================/
.data 
TBsin: 
.dw 0x8000,0x8202,0x8403,0x8604,0x8803,0x8a00,0x8bfb,0x8df2,0x8fe6,0x91d7; 
.dw 0x93c1,0x95b8,0x9789,0x9964,0x9b39,0x9d06,0x9ecd,0xa08b,0xa242,0xa3f0;
.dw 0xab94,0xa730,0xa8c1,0xaa48,0xabc4,0xad35,0xae9b,0xaff5,0xb143,0xb285;
.dw 0xb3b9,0xb4e1,0xb5fb,0xb708,0xb807,0xb8f7,0xb9da,0xbaad,0xbb72,0xbc28;
.dw 0xbcce,0xbd6b,0xbded,0xbe65,0xbece,0xbf26,0xbf6e,0xbfa7,0xbfcf,0xbfe7;
.dw 0xbff0,0xbfe7,0xbfcf,0xbfa7,0xbf6e,0xbf26,0xbece,0xbe65,0xbded,0xbd66;
.dw 0xbcce,0xbc28,0xbb72,0xbaad,0xb9da,0xb8f8,0xb807,0xb708,0xb5fb,0xb4ee;
.dw 0xb3ba,0xb285,0xb143,0xaff5,0xae96,0xad35,0xabc4,0xaa48,0xa8c1,0xa730;
.dw 0xa594,0xa3f0,0xa242,0xa08c,0x9ecd,0x9d06,0x9b39,0x9964,0x9789,0x95a8;
.dw 0x93c2,0x91d6,0x8fe6,0x8df2,0x8bfb,0x8a00,0x8803,0x8604,0x8403,0x8000;
.dw 0x8000,0x7dfe,0x7bfd,0x79fc,0x77fd,0x7600,0x7405,0x720e,0x701a,0x6e2a;
.dw 0x6c3f,0x6a58,0x6877,0x669c,0x64c7,0x62fa,0x6133,0x5f75,0x5dbe,0x5c10;
.dw 0x5abc,0x58d0,0x573f,0x55b8,0x543c,0x52cb,0x5165,0x500b,0x4ebd,0x4d7b;
.dw 0x4c47,0x4b1f,0x4a05,0x48f8,0x47f9,0x4709,0x4626,0x4553,0x448e,0x43d8;
.dw 0x4332,0x429a,0x4213,0x419b,0x4132,0x40da,0x4092,0x4059,0x4031,0x4019;
.dw 0x4010,0x4019,0x4031,0x4059,0x4092,0x40da,0x4132,0x419b,0x4213,0x429a;
.dw 0x4332,0x43d8,0x448e,0x4553,0x4626,0x4708,0x47f9,0x48f8,0x4a05,0x4b1f;
.dw 0x4c46,0x4d7b,0x4ebd,0x500b,0x5165,0x52cb,0x543c,0x55b8,0x5738,0x58d0;
.dw 0x5abc,0x5c10,0x5dbe,0x5f74,0x6133,0x62fa,0x64c7,0x669c,0x6877,0x6a58;
.dw 0x6c3f,0x6e2a,0x701a,0x720e,0x7405,0x7600,0x77fd,0x79fc,0x7bfd,0x7dfe;
.CODE
//============================================================================= 
// ������ main()
// ������������
//=============================================================================
.PUBLIC _main;						
_main: 	
		R2=0x0000;
    	[P_DAC_Ctrl]=R2; 
		CALL L_User_Init_IO;		    //��ʼ��IO��
		CALL F_Key_Scan_Initial;	    //���̳�ʼ��
L_MainLoop:
		CALL F_Key_Scan_ServiceLoop;    //ɨ�����
        CALL F_Key_DebounceCnt_Down;    //����ȥ��
        R4=0x0001;                      //�忴�Ź�
	   	[P_Watchdog_Clear]=R4;	
   		CALL F_SP_GetCh;			    //ȡ��ֵ
	    CMP R1, 0x0000;					
	    JE 	L_MainLoop;	
	    R2=0x0000				
	 	[I_Key] = R1;			        //�����ֵ
		cmp R1, 0x0001;	                
		je L_Wave1;                     //��1���£������ݲ�
		R1=[I_Key]; 
		cmp R1, 0x0002;
		je L_Wave2;                    //��2���£�������ǲ�
		R1=[I_Key];
		cmp R1, 0x0004;
		je L_sina;                     //��3���£�������Ҳ�
		R4=0x0001;                      //�忴�Ź�
	   	[P_Watchdog_Clear]=R4;	
	   	JMP	L_MainLoop;
L_User_Init_IO:
		R1 = 0x0000;			        //��A��Ϊ���������������
        [P_IOA_Dir] = R1;			
        [P_IOA_Attrib] = R1;
        [P_IOA_Data] = R1;
		RETF;
//==========================================================================
//��ݲ�
//==========================================================================		
L_Wave1:   
	R3=0x0040		      //D/Aת��Ϊ10λ����B15~B6 
    [P_DAC1]=R2;  
    [P_DAC2]=R2;
    CALL L_Delay		  //������ʱ
    R2+=R3
    R1 = [P_IOA_Data]
    cmp R1, 0x0001       
    jbe L_Wave1        
    jmp L_MainLoop;       //�����������£��򷵻ؼ���ɨ���ӳ���
L_Delay:				  //��ʱ
    R1=0  
L_DelayLoop:
 	R4 = 0x0001;                      
	[P_WatchDog_Clear] = R4;	   		
    R1+=2048
    JNZ L_DelayLoop    
    RETF
//==========================================================================  
//���ǲ�
//==========================================================================  
L_Wave2:
	 R3=0x0040		      //D/Aת��Ϊ10λ����B15~B6 
    [P_DAC1]=R2;  
    [P_DAC2]=R2;
    CALL L_Delay		  //������ʱ
    R2+=R3;
    cmp R2, 0xffc0;       //�ж��Ƿ�ﵽ��ֵ
    je L_Sub;
     R1 = [P_IOA_Data]
    R1|= 0x0002
    cmp R1, 0x0002
    je L_Wave2        
    GOTO L_MainLoop       //�����������£��򷵻ؼ���ɨ���ӳ���
L_Sub:
    [P_DAC1]=R2;  
    [P_DAC2]=R2;
    CALL L_Delay
    R2-=R3;
    cmp R2, 0x0000;		  //�ж��Ƿ�Ϊ��
    jne  L_Sub;
    jmp L_Wave2;
//==========================================================================  
//���Ҳ�
//==========================================================================     
L_sina:  
 	r2=0x8000
    [P_DAC1]=r2  
    [P_DAC2]=r2 
     bp=TBsin;
     [P_DAC1]=r2 
     [P_DAC2]=r2 
     r3=0
     [R_SUM]=r3
     r2=0x8000
    [P_DAC1]=r2 
    [P_DAC2]=r2   
 L_wait: 
 r2=0x8000
    [P_DAC1]=r2
    [P_DAC2]=r2     
     r3=bp+[R_SUM]            //ȡ��Ӧ��ַ
     r2=[r3];                 //��ַ��������r2
     r3=[R_SUM]
     r3=r3+[T_PinLv]
     r3=r3+1                  //��ַָ���1
    [R_SUM]=r3
     [P_DAC1]=r2
     [P_DAC2]=r2
     R4 = 0x0001;                      
	[P_WatchDog_Clear] = R4;  //�忴�Ź�
     sr&=0xffdf
     r4=200
     cmp r4,r3
     jnb L_wait              
     R1 = [P_IOA_Data]
    R1|= 0x0004
    cmp R1, 0x0004
    je L_next
    goto L_MainLoop         //�����������£��򷵻ؼ���ɨ���ӳ���
L_next:
    r2=0x8000
    [P_DAC1]=r2
    [P_DAC2]=r2   
    goto L_sina
 
//*****************************************************************************/
//  main.asm ����
//*****************************************************************************/