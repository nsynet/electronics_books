;˵��ʹ�õ����ⲿ�������ⲿ����
EXTRN	CODE(CWE1, DWE1, CWE2, DWE2)
EXTRN	DATA(COM, DAT)

;����ȫ�ֺ���INITIAL(), CLEAR()
PUBLIC	INITIAL, CLEAR
INITP	SEGMENT	CODE
INIROM	SEGMENT CODE
RSEG	INIROM

;�����ڲ���������ʼ����������TABLE
TABLE:	DB	0E2H, 0A4H, 0A9H, 0A0H, 0C0H, 0AFH
RSEG	INITP

;INITIAL()��ʼ��������E1, E2
INITIAL:	PUSH	DPH
		PUSH	DPL
		MOV 	R4, 		#0
INIT01:		MOV	DPTR, 		#TABLE
		MOV	A, 		R4
		MOVC	A, 		@A+DPTR
		MOV	COM, 		A
		LCALL	CWE1
		LCALL	CWE2
		INC	R4
		CJNE	R4, 		#6H, INIT01
		POP	DPL
		POP	DPH
		RET

;���������������ݵ�Ԫ��0������ͼ�μ�ͼ2-25��
CLEAR:		MOV	R4,		#00H
CLEAR1:		MOV	A,		R4
		ORL	A,		#0B8H
		MOV	COM,		A
        	LCALL   CWE1
       		LCALL   CWE2
		MOV	COM,		#00H
        	LCALL   CWE1
        	LCALL   CWE2
		MOV	R3,		#3CH
CLEAR2:		MOV	DAT,		#00H
        	LCALL   DWE1
        	LCALL   DWE2
		DJNZ	R3,		CLEAR2
		INC	R4
		CJNE	R4,		#04H,	CLEAR1
		RET
		END
