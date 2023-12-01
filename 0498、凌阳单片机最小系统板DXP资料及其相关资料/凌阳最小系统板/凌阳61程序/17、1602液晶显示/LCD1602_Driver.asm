//============================================================
//	�ļ����ƣ�	LCD1602_Driver.asm
//	����������	LCD1602�ײ���������
//	ά����¼��	2005-11-2	v1.0		Edit by С�� 
//	Mz��Ʒ  ʱ�򾭵�
//============================================================
	.DEFINE		P_IOA_Data				0x7000
	.DEFINE		P_IOA_Buffer			0x7001
	.DEFINE		P_IOA_Dir				0x7002
	.DEFINE		P_IOA_Attrib			0x7003
	.DEFINE		P_IOA_Latch				0x7004

	.DEFINE		P_IOB_Data				0x7005
	.DEFINE		P_IOB_Buffer			0x7006
	.DEFINE		P_IOB_Dir				0x7007
	.DEFINE		P_IOB_Attrib			0x7008
	
	.DEFINE		P_Watchdog_Clear		0x7012
//**********************************************************************************//
//========================�û���Ҫ�޸Ķ˿�ʱ�������ж�������޸ļ���==============//
//�������ݶ˿�
.DEFINE Port_Data_D		P_IOA_Data
.DEFINE Port_Buffer_D	P_IOA_Buffer
.DEFINE Port_Dir_D		P_IOA_Dir
.DEFINE Port_Attrib_D	P_IOA_Attrib
//������ƶ˿�
.DEFINE Port_Data_C		P_IOB_Data
.DEFINE Port_Buffer_C	P_IOB_Buffer
.DEFINE	Port_Dir_C		P_IOB_Dir
.DEFINE	Port_Attrib_C	P_IOB_Attrib
//������ƶ˿ڵ��У�ÿ������������Ӧ�Ķ˿ں�
.DEFINE	M_1602_EP	0x1000
.DEFINE M_1602_RW	0x4000
.DEFINE M_1602_RS	0x2000
//���ݶ˿ڸߵ�λ���壬��ʹ�õͰ�λ����Ϊ0x00ff���߰�λ��Ϊ0xff00
.DEFINE M_Mask			0xff00
//�����ݶ˿ڲ��õͰ�λʱ�����������M_HIGHT���壬��ʹ�ø߰�λ�˿���Ϊ���ݿڣ�������
.DEFINE M_HIGHT			1
//**********************************************************************************//
.DEFINE M_Delay_Timers		0x00ff			//��ʱʱ�̶��壬��Ĭ��ʱΪ0x00ff����Ż���ʱ6ms����
											//�û��ɸ����Լ��ĳ����ʵ��޸�

.RAM
.VAR R_Port_Dir,R_Port_Data,R_Port_Attrib

.CODE
//========================================================
//	����ʽ��	InitIO_LCD1602
//	C��ʽ��		��
//	ʵ�ֹ��ܣ�	��ʼ���˿�
//	��ڲ�����	��
//	���ڲ�����	��
//	�ƻ��Ĵ�������
//========================================================
.PUBLIC F_InitIO_LCD1602
F_InitIO_LCD1602:
	push r1 to [sp]
	r1 = [Port_Dir_D]
	r1 = r1&(~M_Mask)
	[Port_Dir_D] = r1
	r1 = [Port_Attrib_D]
	r1 = r1&(~M_Mask)
	[Port_Attrib_D] = r1
	r1 = [Port_Buffer_D]
	r1 = r1&(~M_Mask)
	[Port_Data_D] = r1
	
	r1 = [Port_Dir_C]
	r1 = r1|(M_1602_EP+M_1602_RS+M_1602_RW)
	[Port_Dir_C] = r1
	r1 = [Port_Attrib_C]
	r1 = r1|(M_1602_EP+M_1602_RS+M_1602_RW)
	[Port_Attrib_C] = r1
	r1 = [Port_Buffer_C]
	r1 = r1|(M_1602_EP+M_1602_RS+M_1602_RW)
	[Port_Data_C] = r1
	pop r1 from [sp]
	retf
//========================================================
//	����ʽ��	F_DataPort_Input
//	C��ʽ��		NULL
//	ʵ�ֹ��ܣ�	�����ݶ˿�����Ϊ�����
//	��ڲ�����	��
//	���ڲ�����	��
//	�ƻ��Ĵ�������
//========================================================
F_DataPort_Input:
	r4 = [Port_Dir_D]
	[R_Port_Dir] = r4
	r4 = r4&(~M_Mask)
	[Port_Dir_D] = r4
	r4 = [Port_Attrib_D]
	[R_Port_Attrib] = r4
	r4 = r4&(~M_Mask)
	[Port_Attrib_D] = r4
	r4 = [Port_Buffer_D]
	[R_Port_Data] = r4
	r4 = r4&(~M_Mask)
	[Port_Data_D] = r4
	retf
//========================================================
//	����ʽ��	F_DataPort_Output
//	C��ʽ��		NULL
//	ʵ�ֹ��ܣ�	�����ݶ˿�����Ϊ�����
//	��ڲ�����	��
//	���ڲ�����	��
//	�ƻ��Ĵ�������
//========================================================
F_DataPort_Output:
	r3 = [Port_Dir_D]
	r3 = r3|M_Mask
	[Port_Dir_D] = r3
	r3 = [Port_Attrib_D]
	r3 = r3|M_Mask
	[Port_Attrib_D] = r3
	r3 = [Port_Buffer_D]
	r3 = r3|M_Mask
	[Port_Data_D] = r3
	retf
//========================================================
//	����ʽ��	F_DataPort_Resum
//	C��ʽ��		NULL
//	ʵ�ֹ��ܣ�	�ָ��˿�����
//	��ڲ�����	��
//	���ڲ�����	��
//	�ƻ��Ĵ�������
//========================================================
F_DataPort_Resum:
	r2 = [R_Port_Dir]
	[Port_Dir_D] = r2
	r2 = [R_Port_Attrib]
	[Port_Attrib_D] = r2
	r2 = [R_Port_Data]
	[Port_Data_D] = r2
	retf
	
//========================================================
//	����ʽ��	_LCD1602_Initial
//	C��ʽ��		void LCD1602_Initial(void)
//	ʵ�ֹ��ܣ�	LCD1602��ʼ������
//	��ڲ�����	��
//	���ڲ�����	��
//	�ƻ��Ĵ�������
//========================================================
.PUBLIC _LCD1602_Initial
_LCD1602_Initial:
	push r1,r2 to [sp]
	call F_InitIO_LCD1602
	call F_DataPort_Output
	r2 = [Port_Buffer_D]				//��ȡ��ǰ�˿����ֵ
	r2 = r2&(~M_Mask)
.IFDEF M_HIGHT
	r2 = r2|0x3000
.ELSE
	r2 = r2|0x0030
.ENDIF
	[Port_Data_D] = r2
	r2 = [Port_Buffer_C]				//��ȡ��ǰ�˿����ֵ
	r2 = r2&(~(M_1602_RW+M_1602_RS))
	[Port_Data_C] = r2
	r1 = 3
?LCD1602_Initial_1:
	r2 = r2|M_1602_EP
	[Port_Data_C] = r2					//ep hight
	nop
	r2 = r2&(~M_1602_EP)				
	[Port_Data_C] = r2					//EP to low
	call F_Delay
	r1 = r1-1
	jnz ?LCD1602_Initial_1
	r2 = [Port_Buffer_D]
	r2 = r2&(~M_Mask)
.IFDEF M_HIGHT
	r2 = r2|0x3800
.ELSE
	r2 = r2|0x0038
.ENDIF
	[Port_Data_D] = r2
	r2 = [Port_Buffer_C]
	r2 = r2|M_1602_EP
	[Port_Buffer_C] = r2
	nop
	r2 = r2&(~M_1602_EP)
	[Port_Buffer_C] = r2				//EP to low
	call F_Delay
	r1 = 0x0001
	call F_Write_Command
	r1 = 0x0006
	call F_Write_Command
	r1 = 0x000c
	call F_Write_Command
	pop r1,r2 from [sp]
	retf
//========================================================
//	����ʽ��	F_Write_Command
//	C��ʽ��		void Write_Command(unsigned int Com)
//	ʵ�ֹ��ܣ�	дָ���Ӻ���
//	��ڲ�����	Com������R1���ݣ�  Ҫд��LCD��ָ��
//	���ڲ�����	��
//	�ƻ��Ĵ�������
//========================================================
.PUBLIC _Write_Command,F_Write_Command
_Write_Command:
F_Write_Command:
	push r1,r4 to [sp]
	call F_DataPort_Input
	r2 = [Port_Buffer_C]				//��ȡ��ǰ�˿����ֵ
	r2 = r2|M_1602_RW
	r2 = r2&(~(M_1602_EP+M_1602_RS))	//RW=1  RS=0  EP=0
	[Port_Data_C] = r2
	nop
?Write_Command_BZ:
	r2 = r2|M_1602_EP
	[Port_Data_C] = r2					//EP hight!
	r3 = [Port_Data_D]
	r2 = r2&(~M_1602_EP)
	[Port_Data_C] = r2					//EP low!
.IFDEF M_HIGHT
	test r3,0x8000
.ELSE
	test r3,0x0080
.ENDIF
	jnz ?Write_Command_BZ				//Busy? yes---Loop
	call F_DataPort_Output
	r2 = r2&(~M_1602_RW)
	[Port_Data_C] = r2					//RW low
	r2 = [Port_Buffer_D]
	r2 = r2&(~M_Mask)
.IFDEF M_HIGHT
	r1 = r1 lsl 4
	r1 = r1 lsl 4
.ENDIF
	r2 = r2|r1							//or the command
	[Port_Data_D] = r2
	r2 = [Port_Buffer_C]
	r2 = r2|M_1602_EP					//EP hight
	[Port_Data_C] = r2
	nop
	nop
	r2 = r2&(~M_1602_EP)
	[Port_Data_C] = r2					//EP low
	call F_DataPort_Resum				//resum the IO Port
	pop r1,r4 from [sp]
	retf
//========================================================
//	����ʽ��	F_Write_Data
//	C��ʽ��		void Write_Data(unsigned int Data)
//	ʵ�ֹ��ܣ�	д��ʾ���ݺ���
//	��ڲ�����	Data������R1���ݣ�  Ҫд��LCD������
//	���ڲ�����	��
//	�ƻ��Ĵ�������
//========================================================
.PUBLIC _Write_Data,F_Write_Data
_Write_Data:
F_Write_Data:
//	push r1,r4 to [sp]
	push bp to [sp]
	bp = sp + 1
	r1 = [bp + 3]
	call F_DataPort_Input
	r2 = [Port_Buffer_C]				//��ȡ��ǰ�˿����ֵ
	r2 = r2|M_1602_RW
	r2 = r2&(~(M_1602_EP+M_1602_RS))	//RW=1  RS=0  EP=0
	[Port_Data_C] = r2
	nop
?Write_Data_BZ:
	r2 = r2|M_1602_EP
	[Port_Data_C] = r2					//EP hight!
	r3 = [Port_Data_D]
	r2 = r2&(~M_1602_EP)
	[Port_Data_C] = r2					//EP low!
.IFDEF M_HIGHT
	test r3,0x8000
.ELSE
	test r3,0x0080
.ENDIF
	jnz ?Write_Data_BZ					//Busy? yes---Loop
	call F_DataPort_Output
	r2 = r2&(~M_1602_RW)
	r2 = r2|M_1602_RS					//RS hight
	[Port_Data_C] = r2					//RW low
	r2 = [Port_Buffer_D]
	r2 = r2&(~M_Mask)
.IFDEF M_HIGHT
	r1 = r1 lsl 4
	r1 = r1 lsl 4
.ENDIF
	r2 = r2|r1							//or the command
	[Port_Data_D] = r2
	r2 = [Port_Buffer_C]
	r2 = r2|M_1602_EP					//EP hight
	[Port_Data_C] = r2
	nop
	nop
	r2 = r2&(~M_1602_EP)
	[Port_Data_C] = r2					//EP low
	call F_DataPort_Resum				//resum the IO Port
	pop bp from [sp]
//	pop r1,r4 from [sp]
	retf
//========================================================
//	����ʽ��	F_Read_Data
//	C��ʽ��		unsigned int Read_Data(void)
//	ʵ�ֹ��ܣ�	����ʾ���ݺ���
//	��ڲ�����	��
//	���ڲ�����	���ص����� r1����
//	�ƻ��Ĵ�������
//========================================================
.PUBLIC _Read_Data,F_Read_Data
_Read_Data:
F_Read_Data:
	push r2,r4 to [sp]
	call F_DataPort_Input
	r2 = [Port_Buffer_C]				//��ȡ��ǰ�˿����ֵ
	r2 = r2|M_1602_RW
	r2 = r2&(~(M_1602_EP+M_1602_RS))	//RW=1  RS=0  EP=0
	[Port_Data_C] = r2
?Read_Data_BZ:
	r2 = r2|M_1602_EP
	[Port_Data_C] = r2					//EP hight!
	r3 = [Port_Data_D]
	r2 = r2&(~M_1602_EP)
	[Port_Data_C] = r2					//EP low!
.IFDEF M_HIGHT
	test r3,0x8000
.ELSE
	test r3,0x0080
.ENDIF
	jnz ?Read_Data_BZ					//Busy? yes---Loop
	r2 = r2|M_1602_RS					//RS hight
	[Port_Data_C] = r2					//
	nop
	r2 = r2|M_1602_EP					//EP hight
	[Port_Data_C] = r2
	nop
	nop
	r1 = [Port_Data_D]
	r1 = r1&M_Mask
.IFDEF M_HIGHT
	r1 = r1 lsr 4
	r1 = r1 lsr 4
.ENDIF
	r2 = r2&(~M_1602_EP)
	[Port_Data_C] = r2					//EP low
	call F_DataPort_Resum				//resum the IO Port
	pop r2,r4 from [sp]
	retf
//========================================================
//	����ʽ��	F_Read_BZAC
//	C��ʽ��		unsigned int Read_BZAC(void)
//	ʵ�ֹ��ܣ�	����ʾ���ݺ���
//	��ڲ�����	��
//	���ڲ�����	���ص�����  r1����
//	�ƻ��Ĵ�������
//========================================================
.PUBLIC _Read_BZAC,F_Read_BZAC
_Read_BZAC:
F_Read_BZAC:
	push r2,r4 to [sp]
	call F_DataPort_Input
	r2 = [Port_Buffer_C]				//��ȡ��ǰ�˿����ֵ
	r2 = r2|M_1602_RW
	r2 = r2&(~(M_1602_EP+M_1602_RS))	//RW=1  RS=0  EP=0
	[Port_Data_C] = r2
?Read_BZAC_BZ:
	r2 = r2|M_1602_EP
	[Port_Data_C] = r2					//EP hight!
	r3 = [Port_Data_D]
	r2 = r2&(~M_1602_EP)
	[Port_Data_C] = r2					//EP low!
.IFDEF M_HIGHT
	test r3,0x8000
.ELSE
	test r3,0x0080
.ENDIF
	jnz ?Read_BZAC_BZ					//Busy? yes---Loop
	r2 = r2|M_1602_EP					//EP hight
	[Port_Data_C] = r2
	nop
	r1 = [Port_Data_D]
	r1 = r1&M_Mask
.IFDEF M_HIGHT
	r1 = r1 lsr 4
	r1 = r1 lsr 4
.ENDIF
	r2 = r2&(~M_1602_EP)
	[Port_Data_C] = r2					//EP low
	call F_DataPort_Resum				//resum the IO Port
	pop r2,r4 from [sp]
	retf
//========================================================
//	����ʽ��	F_Delay
//	C��ʽ��		��
//	ʵ�ֹ��ܣ�	��ʱ����
//	��ڲ�����	��
//	���ڲ�����	��
//	�ƻ��Ĵ�������
//========================================================
F_Delay:
	push r1,r3 to [sp]
	r1 = 5
F_Delay_1:
	r2 = M_Delay_Timers
F_Delay_2:
	r3 = 0x0001
	[P_Watchdog_Clear] = r3
	r2 = r2-1
	jnz F_Delay_2
	r1 = r1-1
	jnz F_Delay_1
	pop r1,r3 from [sp]
	retf