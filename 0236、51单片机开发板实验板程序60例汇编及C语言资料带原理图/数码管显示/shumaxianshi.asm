
LED1	EQU	08H
LED2	EQU	09H
LED3	EQU	0AH
LED4	EQU	0BH


ORG 0000H 
LJMP START;ת��������
ORG 0010H 
START:
	MOV	SP,#60H
	MOV	DPTR,#TABLE
	MOV	R0,#00H
	MOV	R1,#00H

MAIN:

	MOV	LED1,#1
	MOV	LED2,#2
	MOV	LED3,#3
	MOV	LED4,#4


SCAN:

	INC	R0
	CJNE	R0,#100,SCAN_1

	MOV	R0,#00H
	
	MOV	A,LED1
	MOV	B,A
	MOV	A,LED2
	MOV	LED1,A
	MOV	A,LED3
	MOV	LED2,A
	MOV	A,LED4
	MOV	LED3,A
	MOV	A,B
	MOV	LED4,A

SCAN_1:


	MOV	A,LED1
	MOVC	A,@A+DPTR
	MOV	P0,A
	CLR	P3.7
	LCALL	DELAY1MS
	SETB	P3.7

	MOV	A,LED2
	MOVC	A,@A+DPTR
	MOV	P0,A
	CLR	P3.6
	LCALL	DELAY1MS
	SETB	P3.6

	MOV	A,LED3
	MOVC	A,@A+DPTR
	MOV	P0,A
	CLR	P3.5
	LCALL	DELAY1MS
	SETB	P3.5

	MOV	A,LED4
	MOVC	A,@A+DPTR
	MOV	P0,A
	CLR	P3.4
	LCALL	DELAY1MS
	SETB	P3.4

LJMP	SCAN


DELAY1MS: 
	MOV	R4,#2
DELAY10MSA:
	MOV	R5,#247
	DJNZ	R5,$
	DJNZ	R4,DELAY10MSA
RET

TABLE:
	DB	11000000B	;0
	DB	11111001B	;1
	DB	10100100B	;2
	DB	10110000B	;3
	DB	10011001B	;4
	DB	10010010B	;5
	DB	10000010B	;6
	DB	11111000B	;7
	DB	10000000B	;8
	DB	10010000B	;9
	DB	10001000B	;A
	DB	10000011B	;b
	DB	11000110B	;C
	DB	10100001B	;d
	DB	10000110B	;E
	DB	10001110B	;F
	DB	11110111B	;-
	DB	11111111B	;
end