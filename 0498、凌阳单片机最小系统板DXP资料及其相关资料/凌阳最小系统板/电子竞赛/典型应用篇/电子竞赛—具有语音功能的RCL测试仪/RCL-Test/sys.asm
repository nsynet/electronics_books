.include Hardware.inc;
.include key.inc;
.include resource.inc;
.external _g_uisum;
                     
.DATA
    C_Address: .DW 0x3f00,0x8600,0xdb00,0xcf00, 0xe600,0xed00,0xfd00,0x8700,0xff00,0xef00;//'0''1''2''3''4''5''6''7''8''9'�Ĵ���
    C_Dig:     .DW 0x0008,0x0020,0x0040,0x0080;//ѡ��LED��
.CODE

//*********************************************************//
//����:System_Initial()
//����:����ɨ���ʼ��
//����:��
//����:��
//*********************************************************//
.CODE
.public _System_Initial;
.public	F_System_Initial;
_System_Initial: .PROC
F_System_Initial:
  		
		call	F_User_Init;				// ���ü���ɨ��
		call	F_Key_Scan_Initial;				
		retf;
	   .ENDP;
//*********I/O��ʼ��*****************************//
//*********************************************************//
F_User_Init: 
		R1 = 0xFFF8;
        [P_IOA_Dir] = R1;                    //A��Ϊ�����
        [P_IOA_Attrib] = R1;
        R1 = 0xF338			 
        [P_IOA_Data] = R1;                   //��������                     
        
        R1 = 0xFFEF;
        [P_IOB_Dir] = R1;                    //A��Ϊ�����
        R1=0xFFFB
        [P_IOB_Attrib] = R1;        			 
        [P_IOB_Data] = R1;                   //�������� 
	      
		R1=0x0004 
		[P_FeedBack]=r1	       
        retf; 
    	 

//*********************************************************//
//����:System_ServiceLoop()
//����:����ȥ���ͼ���ɨ��
//����:��
//����:��
//*********************************************************//
.public _System_ServiceLoop;
_System_ServiceLoop: .PROC                  

		call	F_Key_DebounceCnt_Down;		//����ȥ��
		call    F_Key_Scan_ServiceLoop;		//����ɨ��		
		R1=0x0001;                      	// 
		[P_Watchdog_Clear]=R1;       		//
        retf;
        .ENDP;
//*********************************************************//
//����:Clear_WatchDog()
//����:���Ź���0
//����:��
//����:��
//*********************************************************//
.public _Clear_WatchDog;
_Clear_WatchDog: 	.PROC
		R1=0x0001;                      	
		[P_Watchdog_Clear]=R1;       		
		retf;
		.ENDP
        
    


//=========================================//
//�������ƣ��ж�����
//========================================//

.public _RunTime2Hz; 
_RunTime2Hz:   .proc
	irq off
	r1 = 0x0004;
    [P_INT_Ctrl] = r1; 
    INT IRQ;           //���ж�
    retf
.endp;


.public _SP_INT_32Hz
_SP_INT_32Hz:	.proc

     irq off
     R1 = 0x0002;
     [P_TimeBase_Setup]=r1
    //r1 = [P_INT_Ctrl]
     r1 = 0x0002 						//���ж�IRQ6_TMB1��IRQ6_TMB2
	 [P_INT_Ctrl]= r1 
	 irq on
     retf;
     .endp;
      
.public _Turnoff_INT_32Hz
 _Turnoff_INT_32Hz: .proc
    irq off
    r1 = [P_INT_Ctrl]
	r1 &= 0xfffd;
	[P_INT_Ctrl] = r1;
    irq on
    retf;  
    .endp;  
     
.public _OffTime2Hz
_OffTime2Hz: .proc
   r1 = [P_INT_Ctrl]
   r1 &= 0xfffb;
   [P_INT_Ctrl] = r1;
   r1 = 0x0000
   [_g_uisum] = r1;
   retf;
 .endp;
 
//***************R/C/Lͨ��ѡ�񼰶����ܵ���******************// 
 .PUBLIC _Rline_on
_Rline_on: .PROC
	 R1=[P_IOA_Data]
	//ѡ��ͨ��y0�������
	 R1&=0xFFE7
	 R1|=0x4000
	 [P_IOA_Data]=r1	 
	 retf;
	 .ENDP
	 
.PUBLIC _Cline_on
_Cline_on: .PROC
	  R1=[P_IOA_Data]
	//ѡ��ͨ��y1�����̻Ƶ�
	 R1&=0xFFEF
	 R1|=0x2000
	 [P_IOA_Data]=r1	 
	 retf;
	 .ENDP
	 
	 
.PUBLIC _Lline_on
_Lline_on: .PROC
	 R1=[P_IOA_Data]
	//ѡ��ͨ��y2�����̵�
	 R1&=0xFFF7
	 R1|=0x1000
	 [P_IOA_Data]=r1
 	 retf;
	 .ENDP
//************************************************//
	 
//***************R/C����***************************//
	 
.PUBLIC _R_Above1K
_R_Above1K:	.PROC
	 R1=[P_IOA_Data]
	//IOA5=0,IOA8=0,IOA6=1,IOA7=1
	 R1&=0xFEDF
	 R1|=0x40C0
	 [P_IOA_Data]=r1	 
	 retf;
	 .ENDP	 
	 
	 
.PUBLIC _C_Below1K
_C_Below1K:	.PROC
	  R1=[P_IOA_Data]
	//IOA9=0,IOA10=1
	 R1&=0xFDFF
	 R1|=0x0400
	 [P_IOA_Data]=r1
	 retf;
	 .ENDP
//***********************************************//	


.PUBLIC _TmbCount
_TmbCount:	.PROC
	 R1=0x0000
	 [P_TimerB_Data]=R1;//��ʼ����	
	 r1 =0x0007   //�����ⲿʱ��Դ
	 [P_TimerB_Ctrl]=r1
	 retf;   
	 .ENDP
	 
.PUBLIC _F_Show;
_F_Show: .PROC
	
    PUSH BP TO  [SP];  		      //������ڲ�����������ڲ���
    BP = SP + 1     
    R1 = [BP+3]                   //ȡ����һ����ڲ���
    R3 = [BP+4]                   //ȡ���ڶ�����ڲ���
    R2 =  R1 + C_Dig;             //ȡLED�ܵ�Ƭѡ��ַ    
    R2  = [R2]   
    R4 =  R3 + C_Address          //ȡ��ʾ���ݵĵ�ַ 
    R4 = [R4] 
    R2 |= R4 
    r1=[P_IOB_Buffer]
    r1 &= 0x0017;
    r2 |= r1;    
    [P_IOB_Data] = R2;            //     
    POP BP FROM [SP]
    RETF;
.ENDP