;˵��ʹ�õ����ⲿ����
EXTRN		DATA(KEYSTATE)
;����ȫ�ֺ���KEY()������ʶ����
PUBLIC		KEY
KEYRAM	SEGMENT DATA
KEYP		SEGMENT	CODE
RSEG		KEYRAM
LAST:		DS	1

RSEG	KEYP
KEY:		MOV 	P1,			#0FH			; ���0000�к�1111��
		MOV 	A, 			P1			; ��P1��״̬
		ANL 	A, 			#0FH			; ��P1�ڶ�ȡ��״̬
		MOV 	LAST, 			A				; ����ԭʼ��״̬
		CJNE 	A, 			#0FH, PRESS		; û�м�����
		SJMP	NOKEY		
PRESS:		MOV 	R7,			#100			; �м����£���ʱ10����
DELAY:		MOV 	R6, 			#31
		DJNZ 	R6, 			$
		DJNZ 	R7, 			DELAY
		MOV	A, 			P1			; ���¶�ȡP1״̬
		ANL 	A,			#0FH			; ��P1�ڶ�ȡ��״̬l
		CJNE 	A, 			LAST, NOKEY		;I�ж��Ǹ�������
		ORL	A,			#0F0H			; �����״̬���������״̬
		MOV	P1, 			A		
		MOV 	A, 			P1
		ANL 	A,			#0F0H
		ORL 	A, 			LAST			; �ϲ��С���״̬
		MOV 	KEYSTATE, 	A				; ��ȡ����״̬�������浽20H��ַ
		ACALL 	RELEASE						; �ȴ����ɿ�
		SJMP	KEYQUIT
NOKEY:		MOV 	KEYSTATE, 	#00H				; û�м�����d
KEYQUIT:	RET
RELEASE:	MOV 	P1,			#0FH			; �ȴ����ɿ�
		MOV 	A, 			P1
		ANL	A,			#0FH
		CJNE 	A, 			#0FH, RELEASE	
		RET
		END
