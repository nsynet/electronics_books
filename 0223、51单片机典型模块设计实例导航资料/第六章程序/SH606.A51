PCON    EQU     87H
;定义端口
DOUT		BIT		P1.0			;数据输出
DIN			BIT		P1.1			;数据输入
SCLK		BIT		P1.2			;串行时钟
CS			BIT		P1.3			;片选信号
IRQ			BIT		P3.2			;红外模式接口
;定义RAM地址
TX1			EQU		10H			;发送寄存器 
TX2			EQU		11H
RX1			EQU		12H			;接收寄存器 
RX2			EQU		13H

ORG			00H
BEGIN:	MOV     	SP,		#70H			
  CLR     		SCLK				;清空时钟线信号
;初始化8951的串口t
MOV     	TMOD,	#20H			;T1的波特率
MOV		TH1,		#253			;重装数值
MOV		SCON,	#50H			
MOV		PCON,	#80H			;波特率加倍
MOV		TCON,	#40H			;计数器开始工作
;初始化MAX3100的串口－红外方式工作在9600下
MOV		TX1,		#0E4H		
MOV		TX2,		#0CAH		;9600波特率，两个停止位
CALL		UTLK			;串口写

LOOP:   JNB			IRQ,		URCV	;判断有数据
NRECV:  JBC			RI,		RCV51		
JMP			LOOP				
;从MAX3100接收，从8951发送
URCV:	MOV		TX1,		#0 			;读数据
MOV		TX2,		#0			
CALL		UTLK			;将数据发送到RX
MOV		A,		RX2          ;将数据送入累加器
MOV		SBUF,	A			;发送RS232信号
JMP			LOOP				
;从MAX3100发送，从8951接收
RCV51:	MOV		A,		SBUF         ;从8951获得数据
MOV		TX1,		#80H			
MOV		TX2,		A			;准备红外数据
CALL		UTLK			;从红外端口发送数据
JMP			LOOP				

;子程序，完成16位数据的收发
UTLK:	CLR			CS				;片选工作 
MOV     	A,		TX1          
CALL    		BYT8           	;发送
MOV     	RX1,		A        ;从RX1获得数据
MOV     	A,		TX2      ;获得高位字节
CALL    		BYT8           	;发送
MOV     	RX2,		A        ;从RX2获得数据
SETB    		CS             	;关闭片选
RET 

;8个字节的移位
BYT8:   	MOV     	R4,		#8       ;8位数据
SETB    		DIN            		 
B8LP:   	RLC     		A              		;载入高位字节       
MOV     	DOUT,	C         	;输出
SETB    		SCLK           		;时钟高电平
MOV     	C,		DIN          ;获得数据
CLR     		SCLK           		;时钟低电平
MOV     	ACC.0,	C        		;载入低位字节
DJNZ    		R4,		B8LP        
RET 

END 

