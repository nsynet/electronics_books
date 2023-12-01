//==========================================================
//�ļ�����:TNRFDriver.asm
//��������:��������
//ά����¼ 2005.12.2 v1.0
//==========================================================
.define	P_IOA_Data 				0x7000   
.define P_IOA_Buffer 			0x7001
.define P_IOA_Dir 				0x7002
.define P_IOA_Attrib 			0x7003
.define P_IOA_Latch 			0x7004
//............................................
.define P_IOB_Data				0x7005  
.define P_IOB_Buffer			0x7006   
.define P_IOB_Dir				0x7007   
.define P_IOB_Attrib			0x7008   
//............................................
.define P_Watchdog_Clear		0x7012   

//=====================�������ģ��Ŀ��ƿ�======================
.define TN_ACK		0x2000             
.define TN_Data		0x8000
.define TN_Clk		0x4000
.define TN_ACK_N	0xdfff
.define TN_Data_N	0x7fff
.define TN_Clk_N	0xbfff

//=====================//define the port========================
//���ʹ��IOA�ڣ����������-------------------------------------
.define IO_Port			P_IOA_Data				
.define IO_Port_Dir		P_IOA_Dir
.define IO_Port_Attrib	P_IOA_Attrib
.define IO_Port_Buffer	P_IOA_Buffer
//���ʹ��IOB�ڣ����������-------------------------------------
//.define IO_Port			P_IOB_Data				
//.define IO_Port_Dir		P_IOB_Dir
//.define IO_Port_Attrib	P_IOB_Attrib
//.define IO_Port_Buffer	P_IOB_Buffer

.public _TN_Data_Buff
.ram
_TN_Data_Buff:.dw 3 dup(?)
.var Data_Counter

.code
//==========================================================================
//	����ʽ��	_TN_InitalIO
//	C��ʽ��		void TN_InitalIO(void);
//	ʵ�ֹ��ܣ�	����ģ���ʼ��
//	��ڲ�����	��
//	���ڲ�����	��
//	�ƻ��Ĵ�����r1
//==========================================================================
.public _TN_InitalIO
_TN_InitalIO:
	push bp to [sp]
	r1 = [IO_Port_Dir]
	r1 &= TN_ACK_N
	r1 &= TN_Data_N
	r1 &= TN_Clk_N
	[IO_Port_Dir] = r1            
	r1 = [IO_Port_Attrib]
	r1 |= TN_ACK
	r1 &= TN_Data_N
	r1 &= TN_Clk_N
	[IO_Port_Attrib] = r1
	r1 = [IO_Port_Buffer]
	r1 &= TN_ACK_N
	r1 &= TN_Data_N
	r1 &= TN_Clk_N
	[IO_Port] = r1
	pop bp from [sp]
	retf
//==========================================================================
//	����ʽ��	_TN_IRACK_EN
//	C��ʽ��		void TN_IRACK_EN(void);
//	ʵ�ֹ��ܣ�	����ģ����������
//	��ڲ�����	��
//	���ڲ�����	��
//	�ƻ��Ĵ�����r1
//==========================================================================
.public _TN_IRACK_EN
_TN_IRACK_EN:
	push bp to [sp]
	r1 = [IO_Port_Dir]		        //����TN
	r1 |= TN_ACK
	[IO_Port_Dir] = r1				//...end
	pop bp from [sp]
	retf
//==========================================================================
//	����ʽ��	_TN_IRACK_UN
//	C��ʽ��		void TN_IRACK_UN(void);
//	ʵ�ֹ��ܣ�	����ģ����������
//	��ڲ�����	��
//	���ڲ�����	��
//	�ƻ��Ĵ�����r1
//==========================================================================	
.public _TN_IRACK_UN
_TN_IRACK_UN:
	push bp to [sp]
	r1 = [IO_Port_Dir]		        //����TN
	r1 &= TN_ACK_N
	[IO_Port_Dir] = r1				//...end
	pop bp from [sp]
	retf
//==========================================================================
//	����ʽ��	_TN_ReadData
//	C��ʽ��		int TN_ReadData(void);
//	ʵ�ֹ��ܣ�	���������
//	��ڲ�����	��
//	���ڲ�����	����������������
//	�ƻ��Ĵ�����r1
//==========================================================================	
.public _TN_ReadData
_TN_ReadData:
	push bp to [sp]
	r2 = 40                  //��5���ֽڵ�����
	r5 = _TN_Data_Buff       //ȡ����������
TN_Read_loop:
	r1 = 0x0001
	[P_Watchdog_Clear] = r1
	r1 = [IO_Port]            
	r1 &= TN_Clk             //���ʱ������ 
	jnz TN_Read_loop         //��Ϊ��ʱ������� 
	r1 = [IO_Port]           //Ϊ0ʱ��һ��bit���ݣ�����⵽������
	r1 &= TN_Data            
	jnz TN_Read_Data_H       //��Ϊ0ʱת��TN_Read_Data_H
	r1 = 0                   //��������0
	jmp TN_Read_Data_NN
TN_Read_Data_H:
	r1 = 1                    //��������1
TN_Read_Data_NN:
//	[r5++] = r1
	r3 = [r5+2]               //��һ�������ݴ���
	r3 = r3 lsl 1             //   
	r3 = r3|r1                //
	[r5+2] = r3    
	r4 = r4 lsl 3
	r3 = [r5+1]              //�ڶ��������ݴ���
	r3 = r3 rol 1
	r4 = r4 lsl 3
	[r5+1] = r3
	r3 = [r5]               //�����������ݴ���
	r3 = r3 rol 1
	r4 = r4 lsl 3
	[r5] = r3
	r2-=1
	jnz TN_Read_Wait       //40��bit����û�ж���ת��TN_Read_Wait
	jmp TN_Read_Exit       //����ת��TN_Read_Exit
TN_Read_Wait:
	r1 = 0x0001
	[P_Watchdog_Clear] = r1
	r1 = [IO_Port]        //���ʱ�� 
	r1 &= TN_Clk      
	jnz TN_Read_loop       //ʱ�Ӳ�Ϊ0ʱת��TN_Read_loop
	jmp TN_Read_Wait
TN_Read_Exit:
	nop
	nop
	pop bp from [sp]
	retf