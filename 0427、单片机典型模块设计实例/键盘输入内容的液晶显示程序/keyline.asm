;说明使用到的外部变量
EXTRN		DATA(KEYSTATE)
;定义全局函数KEY()，按键识别函数
PUBLIC		KEY
KEYRAM	SEGMENT DATA
KEYP		SEGMENT	CODE
RSEG		KEYRAM
LAST:		DS	1

RSEG	KEYP
KEY:		MOV 	P1,			#0FH			; 输出0000列和1111行
		MOV 	A, 			P1			; 读P1的状态
		ANL 	A, 			#0FH			; 从P1口读取行状态
		MOV 	LAST, 			A				; 保存原始行状态
		CJNE 	A, 			#0FH, PRESS		; 没有键按下
		SJMP	NOKEY		
PRESS:		MOV 	R7,			#100			; 有键按下，延时10毫秒
DELAY:		MOV 	R6, 			#31
		DJNZ 	R6, 			$
		DJNZ 	R7, 			DELAY
		MOV	A, 			P1			; 重新读取P1状态
		ANL 	A,			#0FH			; 从P1口读取行状态l
		CJNE 	A, 			LAST, NOKEY		;I判断那个键按下
		ORL	A,			#0F0H			; 输出行状态，并检查列状态
		MOV	P1, 			A		
		MOV 	A, 			P1
		ANL 	A,			#0F0H
		ORL 	A, 			LAST			; 合并行、列状态
		MOV 	KEYSTATE, 	A				; 读取行列状态，并保存到20H地址
		ACALL 	RELEASE						; 等待键松开
		SJMP	KEYQUIT
NOKEY:		MOV 	KEYSTATE, 	#00H				; 没有键按下d
KEYQUIT:	RET
RELEASE:	MOV 	P1,			#0FH			; 等待键松开
		MOV 	A, 			P1
		ANL	A,			#0FH
		CJNE 	A, 			#0FH, RELEASE	
		RET
		END
