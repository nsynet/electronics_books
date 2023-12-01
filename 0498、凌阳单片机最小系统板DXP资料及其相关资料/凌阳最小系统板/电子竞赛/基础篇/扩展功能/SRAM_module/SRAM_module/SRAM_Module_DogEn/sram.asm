//==============================================================================================================
// �ļ�����:   sram.asm
// ��    �ܣ�  ��ɶ�HM628128A�Ķ�д��ʼ�����Լ���д���ݲ�����
// �� �� ����  NONE
// ��    ��:   2003-07-07
//==============================================================================================================
.INCLUDE hardware.inc
.RAM 
.PUBLIC  HighAddr      
.VAR  HighAddr

.CODE
//**************************************************************************************************************
// ����: SP_InitWriteSRAM
// �﷨��void SP_InitWriteSRAM(void) (for c language)
// ���ܣ�дSRAM��ʼ��,���ı�IOA0~IOA3�Ķ˿�����
// ��ڣ���
// ���ڣ���
//**************************************************************************************************************
.PUBLIC _SP_InitWriteSRAM
.PUBLIC F_SP_InitWriteSRAM 
_SP_InitWriteSRAM:         .PROC
F_SP_InitWriteSRAM:
		PUSH r1 TO [sp]
		
		r1=[P_IOA_Dir]		// IOA8---IOA15 �������ߣ�д��ʱ����Ϊͬ��ߵ�ƽ���
		r1|=0xFFF0;			// IOA4--IOA6 ��SRAM������(IOA4��WE_N,IOA5=OE_N,IOA6=CS_N)����Ϊͬ��ߵ�ƽ���.
		r1&=0xFFFF;			// IOB15--IOB0 ��SRAM��ַ��(A0-A15)������Ϊͬ��ߵ�ƽ���
		[P_IOA_Dir]=r1 		
		
   		r1=[P_IOA_Attrib];
		r1|=0xFFF0;
		r1&=0xFFFF;
        [P_IOA_Attrib]=r1  	
       
        r1=[P_IOA_Buffer] 
        r1|=0xFFF0;
		r1&=0xFFFF;
		[P_IOA_Buffer]=r1;
		
        r1 = 0xFFFF 		 //IOB15--IOB0 ��SRAM��ַ�ߣ�����Ϊͬ��ߵ�ƽ���
        [P_IOB_Dir] = r1     	
        [P_IOB_Attrib] = r1  
        [P_IOB_Data] = r1     
         
        POP r1 FROM [sp]
        RETF 
        .ENDP

//**************************************************************************************************************
// ����: SP_InitReadSRAM
// �﷨��void SP_InitReadSRAM(void) (for c language)
// ���ܣ���SRAM��ʼ��,���ı�IOA0~IOA3�Ķ˿�����
// ��ڣ���
// ���ڣ���
//**************************************************************************************************************

.PUBLIC F_SP_InitReadSRAM 
.PUBLIC _SP_InitReadSRAM 
_SP_InitReadSRAM:          .PROC
F_SP_InitReadSRAM:
		PUSH r1 TO [sp]
	
		r1=[P_IOA_Dir]		// IIOA8---IOA15 �������ߣ�����ʱ����Ϊ���������������
		r1|=0x00F0;			// IOA4--IOA6 ��SRAM������(IOA4��WE_N,IOA5=OE_N,IOA6=CS_N)����Ϊͬ��ߵ�ƽ���.
		r1&=0x00FF;			// IOB15--IOB0 ��SRAM��ַ��(A0-A15)������Ϊͬ��ߵ�ƽ���
		[P_IOA_Dir]=r1 		
		
   		r1=[P_IOA_Attrib];
		r1|=0x00F0;
		r1&=0x00FF;
        [P_IOA_Attrib]=r1  	
       
        r1=[P_IOA_Buffer]   
        r1|=0x00F0;
		r1&=0x00FF;
		[P_IOA_Buffer]=r1;
		
        r1 = 0xFFFF 		//IOB15--IOB0 ��SRAM��ַ�ߣ�����Ϊͬ��ߵ�ƽ���
        [P_IOB_Dir] = r1     	
        [P_IOB_Attrib] = r1  
        [P_IOB_Data] = r1     
        
        POP r1 FROM [sp]
        RETF 
        .ENDP
//**************************************************************************************************************
// �� ��: SP_ReadSRAM
// �� ����unsigned int SP_ReadSRAM(unsigned long Addr) (for c language)
// �� �ܣ���SRAM,���ı�IOA0~IOA3�Ķ˿�����
// �� ����Addr:SRAM��17λ��ַ,����ͨ����ջ����
// �� �أ�r1��16λ���ݣ���8bitsΪ�͵�ַ�Ĵ洢��Ԫ����,��8bitsΪ�ߵ�ַ�Ĵ洢��Ԫ����
//**************************************************************************************************************
.PUBLIC _SP_ReadSRAM 
_SP_ReadSRAM:     .PROC
        PUSH r2,r5 TO [sp]
        bp = sp + 1 
        r1 = [bp+6]         	// SRAM ��ַ��λ A15---A0
        r2 = [bp+7]         	// SRAM ��ַ��λ A16
        JZ   L_Read_Low_Addr
        r2 = 0x0080         	// IOA7��A16
 L_Read_Low_Addr:
        [HighAddr]=r2
        call	F_SP_ReadSRAM	//���ӳ���  r1: ��������ֵ
        POP r2,r5 FROM [sp] 
        RETF 
        .ENDP

//**************************************************************************************************************
// �� ��: F_SP_ReadSRAM
// �� ����call SP_ReadSRAM (for Assembly language)
// �� �ܣ���SRAM�ж�ȡһ��WORD���ݣ����ı�IOA0~IOA3�Ķ˿�����
// �� ����r1:��16λ��ַ,[HighAddr]����1λ��ַ
// �� �أ�r1��16λ���ݣ�˵��������HM628128A�����ݿ��Ϊ8λ��һ��WORD���ݷ����ζ������ȶ���8λ���ٶ���8λ
//**************************************************************************************************************              
.PUBLIC F_SP_ReadSRAM
F_SP_ReadSRAM:
        PUSH r2,r4 TO [sp]
        
        r3=[P_IOA_Buffer]
        r3|=[HighAddr]          //IOA7�ӵ�ַ A16
        r3|=0x0070              //IOA4��we,IOA5��oe,IOA6��cs�����ǵ͵�ƽ��Ч
        [P_IOA_Buffer] = r3 
        
        [P_IOB_Buffer] = r1     //��ַA15---A0
        r4 = r1                 
        
        r3=[P_IOA_Buffer]
        r3|=[HighAddr]          //A16
        r3|=0x0010              //����������
        r3&=0xFF9F
        [P_IOA_Buffer] = r3     //CE_N=IOB6=0, OE_N=IOB5=0, WE_N=IOB4=1
 
        r1 = [P_IOA_Data]       //������
        r1 = [P_IOA_Data]        
        r1 = r1 lsr 4           //�����������8λ
        r2 = r1 lsr 4            
        
        r3=[P_IOA_Buffer]
        r3 |= 0x0030            //CE_N=IOB6=0, OE_N=IOB5=1, WE_N=IOB4=1
        r3&=0xFFBF;
        [P_IOA_Buffer] = r3     
       
        r4 += 1         
        [P_IOB_Buffer] = r4     //��һ�ֽ�
        
        r3=[P_IOA_Buffer]
        r3|=[HighAddr]          //A16
        r3|=0x0010 
        r3&=0xFF9F;
        [P_IOA_Buffer] = r3     //CS_N=IOB6=0, OE_N=IOB5=0, WE_N=IOB4=1 

        r1 = [P_IOA_Data]       //������/////////////////////////////////
        r1 = [P_IOA_Data]        
        r1 = r1 & 0xFF00        //��8λ����
        r1 |= r2                //����һ��������
        r3 |= 0x0070 
        [P_IOA_Buffer]=r3       //CS_N=IOB6=1, OE_N=IOB5=1, WE_N=IOB4=1 
		POP r2,r4 FROM [sp]      
        RETF 

//**************************************************************************************************************
// �� ��: SP_WriteSRAM
// �� ����void SP_WriteSRAM(unsigned long Addr,unsigned int uiWriteRamData) (for c language)
// �� �ܣ�����SRAM��д��һ��WORD����,���ı�IOA0~IOA3�Ķ˿�����
// �� ����Addr:SRAM��17λ��ַ,����ͨ����ջ����; uiWriteRamData:ΪҪд��SRAM�����ݣ�һ���ֳ��ȣ�
// �� �أ���
//**************************************************************************************************************
.PUBLIC _SP_WriteSRAM 
_SP_WriteSRAM: .PROC
        PUSH r1,r5 TO [sp] 
        
        bp = sp + 1 
        r1 = [bp+7]                // SRAM ��ַ��8λ
        r2 = [bp+8]                // SRAM ��ַ��1λ
        JZ    Write_Low_Addr
        r2 = 0x0080        
 Write_Low_Addr:
        [HighAddr]=r2
        r2 = [bp+9]                //��д���һ��WORD����
        call	F_SP_WriteSRAM    //����д���ӳ���
        POP r1,r5 FROM [sp] 
        RETF 
        .ENDP

//**************************************************************************************************************
// �� ��: F_SP_WriteSRAM
// �� ����call F_SP_WriteSRAM (for Assembly language)
// �� �ܣ�дһ��WORD���ݵ�SRAM�����ı�IOA0~IOA3�Ķ˿�����
// �� ����r1:��16λ��ַ;[HighAddr]����1λ��ַ;r2:��д���һ��WORD����
// �� �أ�r1��16λ���ݣ�˵��������HM628128A�����ݿ��Ϊ8λ��һ��WORD���ݷ�����д�룬��д��8λ����д��8λ)
//************************************************************************************************************** 
.PUBLIC F_SP_WriteSRAM
F_SP_WriteSRAM:
        PUSH r1,r5 TO [sp]
        
        r3=[P_IOA_Buffer];
        r3&=0x000F;
        r3|=[HighAddr]         //��ַ A16
        r3|=0x0070
        [P_IOA_Buffer] = r3 
        
        [P_IOB_Data] = r1       //��λ��ַ A15---A0
        r3 = r2                 //���д������
        r2 = r2 lsl 4           //���ֽڣ�����8λ�Ƶ���8λ����������IOA15---IOA8��
        r2 = r2 lsl 4           

        r4=[P_IOA_Buffer]
        r4&=0x00FF;
        r2|=r4;
        r2|=0x0020              //CS_N=IOB6=0, OE_N=IOB5=1, WE_N=IOB4=0 ,д����
        r2&=0xFFAF;
        r2|=[HighAddr] 
        [P_IOA_Buffer] = r2     //д����
        
        r2 |=0x0010             //CE_N=IOB6=0,OE_N=IOB5=1, WE_N=IOB4=1,
        [P_IOA_Buffer] = r2     

        r1 += 1; 
        [P_IOB_Data] = r1;      //���ֽ�
		
		r2=[P_IOA_Buffer];
        r2&=0x00FF;
        r3&=0xFF00;
        r3|=r2; 
        r3|=0x0020;            //CE_N=IOB6=0,OE_N=IOB5=1 ,WE_N=IOB4=0
        r3&=0xFFAF;
        r3|=[HighAddr] 
        [P_IOA_Buffer] = r3     //д���� 
       
        r3 |= 0x0070 
        [P_IOA_Buffer] = r3     //CE_N=1, OE_N=1, WE_N=1
        POP r1,r5 FROM [sp]
        RETF 
//========================================================================================        
// End of sram.asm
//========================================================================================
     