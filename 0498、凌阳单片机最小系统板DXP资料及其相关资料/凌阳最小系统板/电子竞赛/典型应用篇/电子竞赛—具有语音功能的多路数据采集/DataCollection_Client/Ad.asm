//***********************************************************
// Note:ͨ��ģ���������LINE_IN�����ѹֵ����8K�Ĳ����ʾ�A/D
//ת�����͸�IOB�ڿ���LED����,ͬʱ���Ը���LED�ĵ������˽�ת��
//������
//*************************************************************									

// ʱ��ԴΪFosc/2��������Ϊ8KHz
.include hardware.inc
.CODE
.public _F_AD_Initial;
_F_AD_Initial:  .PROC
		PUSH r1,r1 TO [sp];
		R1 = 0x0001	            //����A/D
		[P_ADC_Ctrl] = R1 		 
	    
    	r1=0x0000;			//ͨ����P_ADC����ADC�Զ�ת��	
	    [P_DAC_Ctrl] = r1; 
		
		r1 = 0x0001            //LINE1����			
		[P_ADC_MUX_Ctrl] = r1;
		
		POP r1,r1 FROM [sp];
		RETF
		.ENDP
	
	
//************** A/D ת������ **********************//	
.public _F_ReadAD
_F_ReadAD: .PROC
		   PUSH r2,r5 TO [sp];
		   BP=SP+1;
		   r1 = [BP+6];           		
		   [P_ADC_MUX_Ctrl] = r1;//����ͨ����
		   r1=0x0001;
		   [P_Watchdog_Clear]=r1;
		   r2=16      //����4��ת��
		   r3=0
L_SampleLoop:	   
		   r1=[P_ADC_MUX_Data]      //��[P_ADC_MUX_Data]������һ��ADת��
           r1=0x8000
L_VoltageConverLoop:   
          TEST r1,[P_ADC_MUX_Ctrl]
          JZ L_VoltageConverLoop; 
          r1=[P_ADC_MUX_Data]      //ADת��ֵ 
          r1=r1 LSR 4           //��ADֵ�Ƶ���10λ
          r1=r1 LSR 2
          r3+=r1             //�Ĵ�A/Dֵ�ۼ�
          r2-=1
          jnz  L_SampleLoop
          r3=r3 LSR 4     //�������4����4�ε�ƽ��ֵ
          r1=r3           //���ؽ��
          
          POP r2,r5 FROM [sp];
          RETF
          .ENDP
		   
   
 