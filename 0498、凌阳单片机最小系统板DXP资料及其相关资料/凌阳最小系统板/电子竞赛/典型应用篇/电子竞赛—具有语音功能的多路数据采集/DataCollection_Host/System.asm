//========================================================================================================
// �ļ����ƣ�system.asm
// ʵ�ֹ��ܣ�ʵ����Ӳ����صĵײ����
// ��    �ڣ�2003/7/7
//========================================================================================================
.INCLUDE hardware.inc
.EXTERNAL R_InterruptStatus;
.CODE
//========================================================================================================
//����: _F_SPCE061A_Initial
//�﷨��void _F_SPCE061A_Initial()
//������061ϵͳ��ʼ��
//��������
//���أ���
//========================================================================================================
.PUBLIC _F_SPCE061A_Initial
_F_SPCE061A_Initial:
	    PUSH r1,r1 TO [sp];

  	 	r1=0x0000
     	[P_SystemClock]=r1
		r1=[R_InterruptStatus]
     	r1|=0x0004;            //��2HZ�ж�
     	[P_INT_Ctrl]=r1;       //
     	[R_InterruptStatus]=r1;//
     	INT IRQ	
     	
		r1 = 0xffff;
     	[P_IOA_Attrib] = r1;    
  		[P_IOA_Dir] = r1;
    	r1 = 0xffff;    
    	[P_IOA_Data] = r1;
    
    	r1 = 0x00f0;            //IOB0-IOB3Ϊ����������������,IOB4-IOB6Ϊ�ߵ�ƽ���
    	[P_IOB_Attrib] = r1;       
    	[P_IOB_Dir] = r1;   
    	[P_IOB_Data] = r1;
    
        POP r1,r1 FROM [SP];
        RETF;

.PUBLIC _F_Display_Command
_F_Display_Command:
		PUSH r1,r5 TO [sp];
	    bp=sp+1;
		r1=[bp+7]
		r1=r1 lsl 4;
		r1=r1 lsl 4;
		[P_IOA_Data]=r1;
		POP	r1,r5 FROM [sp];
		RETF

//========================================================================================================
//����: F_Led_Show
//�﷨��void F_Led_Show(unsigned int  uiChannelNumber,unsigned int uiLedValue)
//������uiChannelNumber:ͨ���ţ�uiLedValue��ΪLED��ֵ
//��������
//���أ���
//========================================================================================================
.public _F_Led_Show;
_F_Led_Show: .PROC
	    push r1,r5 to  [sp];  //������ڲ�����������ڲ���
	    bp = sp + 1   
	    r1 = [bp+7]       	  //cs
	    r3 = [bp+8]           //data
	       
	    r2 =  r1 + T_Led_Cs;  //ȡLED�ܵ�Ƭѡ��ַ    
	    r2  = [r2]   
	    CMP r1,1
	    JE  L_DisplayDot;
	    r4 =  r3 + T_Led_Data //ȡ��ʾ���ݵĵ�ַ 
	    JMP L_Display
L_DisplayDot:
		r4 =  r3 + T_Led_Data_Dot;
L_Display:
	    r4 = [r4] 
	    r2 |= r4     
	    [P_IOA_Data] = r2;    //��ʾ����  
	    pop r1,r5 from [sp]
	    retf;
	 	.ENDP 
.data
    T_Led_Data:     .dw 0x3f00,0x0600,0x5b00,0x4f00, 0x6600,0x6d00,0x7c00,0x0700,0x7f00,0x6f00;//'0''1''2''3''4''5''6''7''8''9'�Ĵ���
    T_Led_Cs:       .dw 0x0001,0x0002,0x0008,0x0010,0x0020,0x0040;//ѡ��LED��
    T_Led_Data_Dot: .dw 0xbf00,0x8600,0xdb00,0xcf00, 0xe600,0xed00,0xfc00,0x8700,0xff00,0xef00;//'0''1''2''3''4''5''6''7''8''9'�Ĵ���
    //  T_Led_Cs:       .dw 0x0001,0x0002,0x0008,0x0010,0x0020,0x0040;//ѡ��LED��