//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//           (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                     ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//=======================================================

//============================================================
//  �������ƣ� led9_asm.scs
//  ��������:  �û��ʵ�ַ��������ѭ�ص���������ܼ���
//  �ļ���Դ����61��ʵ��̡̳�"ʵ��� ���������ѭ�ص���������ܼ�����
//  Ӳ�����ӣ� IOA��8λ����SEG�ӿڿ���LED�ĵ�ͨ
//             IOB��8λ����DIGͨ��ULN2003A����8��LED�Ĺ�������ƽ״̬�����������
//  IDE������   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  �漰�Ŀ⣺
//  ����ļ�:
//    	main.asm
//
//  ����:  2004/8/19
//===============================================

//*****************************************************************************/
// �ļ����ƣ� main.asm
// ʵ�ֹ��ܣ� �û��ʵ�ַ��������ѭ�ص���������ܼ���
//            LEDѲ����˸��ͬʱ����ܴ���������ʾ0~8��ȫ����ʾ��ɺ�LEDֹͣ��˸�������ȫ��
// ���ڣ� 2004/8/19
//*****************************************************************************/
        .define P_IOA_Data			0x7000
		.define P_IOA_Dir			0x7002
		.define P_IOA_Attrib		0x7003
		.define P_IOB_Data			0x7005
		.define P_IOB_Dir			0x7007
		.define P_IOB_Attrib		0x7008
        .define P_Watchdog_Clear 	0x7012
		.data
//��ʾ��������
DispTbl:.DW 0x003F,0x0006,0x005B,0x004F,0x0066				//0��1��2��3��4
		.DW 0x006D,0x007D,0x0007,0x007F,0x00FF				//5��6��7��8��ȫ��								       
        .ram 
        .var R_Led = 0x0000
		.code
		.public _main
//============================================================= 
// ��������:    _main  
// ���ڣ�		20040819	
// ��������:    ���������ѭ�ص���������ܼ���
//              LEDѲ����˸��ͬʱ����ܴ���������ʾ0~8��ȫ����ʾ��ɺ�LEDֹͣ��˸�������ȫ��
// �﷨��ʽ:    _main 
// ��ڲ���:    ��
// ���ڲ���:    ��
// ע������:    ��Ϊ�û�ģ��
//=============================================================
_main:
		r1 = 0x00FF						//����A0~A7��Ϊͬ��͵�ƽ���
		[P_IOA_Dir] = r1						  
		[P_IOA_Attrib] = r1	
		[P_IOB_Dir]=r1	                //����B0~B7��Ϊͬ��͵�ƽ���
		[P_IOB_Attrib] = r1
		r1 = 0x0000						
		[P_IOA_Data] = r1	
		[P_IOB_Data] = r1				
		r3 = 1                          //�ӵ�һ������ܿ�ʼ
L_Loop:		
        r2 = 0x0000                     //��ֹ����ʾ
        [P_IOA_Data] = r2;      
        r2 = 0x0001                     //��Ӧλ�������ʾ0
        r1 = r3                       
        r1 -= 0x0001
        jz L_ShiftStop
L_Shift:                                //��Ӧ�����λ����                                      
        r2 = r2 LSL 1
        r1 -= 0x0001
        jnz	L_Shift
L_ShiftStop:
        [R_Led] = r2
        [P_IOB_Data] = r2;             
        BP = DispTbl
        r2 = [BP]
	    [P_IOA_Data] = r2; 
	    call F_LedDisp                  //���������ѭ�ص���������ܼ���
	    r3 += 0x0001   
        cmp r3,0x0007
		jne	L_Loop					    //�����δȫ����ʾ��ɣ���ת��L_Loopѭ��
		r2 = 0x0000                     //��ֹ����ʾ
        [P_IOA_Data] = r2; 
        r2 = 0x003f;                    //�����ȫ��
        [P_IOB_Data] = r2;       
        BP = DispTbl                    
	    BP += 9 
        r2 = [BP]
	    [P_IOA_Data] = r2;   
L_MainLoop:
        call  F_Delay
        jmp   L_MainLoop

//============================================================= 
.public F_Delay;
.code
//============================================================= 
// ��������:    void F_Delay()  
// ���ڣ�		20040819		
// ��������:    ��ʱ���忴�Ź�
//=============================================================
F_Delay:
          push r2,r3 to [SP]
          r3 = 0x5000
L_Delay:  
          r2 = 0x0001
          [P_Watchdog_Clear] = r2
          r3 -= 0x0001
          jnz L_Delay
          pop r2,r3 from [SP]
          retf
//============================================================= 

.public F_LedDisp;
.code
//============================================================= 
// ��������:    void F_LedDisp()  
// ���ڣ�		20040819		
// ��������:    ��������ܵ���������ܼ���
// ��ڲ���:    r3 ��ʾ��Ӧ���ֵ�����ܺ���
//=============================================================
F_LedDisp:
          push r3,r3 to [sp]   
//          r2 = r3                   
//          r2 -= 0x0001
//          jz L_Stop
//L_LedShift1:                                                              
//          r3 = r3 LSL 1
//          r2 -= 0x0001
//          jnz L_LedShift1
//L_Stop:
//          [R_Led] = r3              //�õ���Ӧ�����λ����
          r1 = 0x0001               //�����ķ�������ܺ���         
L_Led:                              //���������ѭ������һ��                
	      r3 = 0x0001
	      r2 = 0x0000               //��ֹ��ʾ����
	      [P_IOA_Data] = r2
	      r2 = 0x0040               //LED����λ����
	      [P_IOB_Data] = r2  
          r2 = r1
          r2 -= 0x0001
          jz L_LedShiftStop2
L_LedShift2:                         //��Ӧ�����λ����                                      
          r3 = r3 LSL 1
          r2 -= 0x0001
          jnz L_LedShift2
L_LedShiftStop2:
          [P_IOA_Data] = r3         //LED��״̬
          call F_Delay
          r3 = 0x0000               //��ֹ��ʾ����
	      [P_IOA_Data] = r3     
          r2 = [R_Led]              //LED����λ����
          [P_IOB_Data] = r2 
	      BP = DispTbl              //��Ӧ������ʾ���������
	      BP += r1
          r3 = [BP]
	      [P_IOA_Data] = r3;  
          call F_Delay
	      r1 += 0x0001
	      cmp r1,0x0009
		  jne L_Led					     //LEDδȫ����ʾ��ɣ���ת��L_Ledѭ��  
		  pop r3, r3 from [sp]  
          retf
//============================================================= 
//main.asm ����
//=============================================================