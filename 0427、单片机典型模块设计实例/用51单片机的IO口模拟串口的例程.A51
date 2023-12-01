TXD 	EQU 	P1.0
RXD 	EQU 	P1.1 			;定义89C51 P1.0 为发送端，P1.1 为接收端
ORG 	0000H
AJMP 	MAIN
ORG 	0100H
MAIN: 	MOV 	A, 		#30H
MOV 	R5,		#5
SETB 	RXD 				;P1.0 置高

TX: 	LCALL 	OUTPUT 				;调用发送子程序，将寄存器A 中内容发给PC 机
SETB 	TXD 				;P1.1 置高
MOV 	R0,		#40H

RX: 		LCALL 	OUTPUT 				;调用接收子程序 
MOV 	@R0,	A
INC 		R0
DJNZ 	R5, 		RX 			;N 个数据接收结束，则等待，否则转RX 继续接收
AJMP $

;**************延时833μs 子程序*****
DELAY: 	MOV 	R7 ,		#205
MS: 		DJNZ 	R7,		MS
RET

;******** 89C51发送数据给PC 机子程序****
OUTPUT: CLR 		C
MOV 	TXD,		C 			;发送起始位
LCALL 	DELAY 				;延时
MOV 	R3,		#8
OUT: 	RRC 	A
MOV	TXD ,	C
LCALL 	DELAY
DJNZ 	R3,		OUT 		;发送8 位数据
SETB 	C 					;发送停止位
MOV 	TXD,		C
LCALL 	DELAY
RET



