	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile F:\NEW光~1\MEGA12~1\AVR单片机配套程序\002、位定义闪烁灯设计\实例一\icc\chengxu.c
	.dbfunc e DelayMS _DelayMS fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMS::
	xcall push_gset1
	.dbline -1
	.dbline 43
; #include <iom128.h>
; /**********************************************************************
; 				  函数数据类型说明							   	
; **********************************************************************/
; #define uchar unsigned char 
; #define uint unsigned int
; 
; //定义BIT 0-7 置1 
; #define BIT0_POS (1<<0)   
; #define BIT1_POS (1<<1) 
; #define BIT2_POS (1<<2) 
; #define BIT3_POS (1<<3) 
; #define BIT4_POS (1<<4) 
; #define BIT5_POS (1<<5) 
; #define BIT6_POS (1<<6) 
; #define BIT7_POS (1<<7) 
; 
; //定义BIT 0-7 清零 
; #define BIT0_NEG ((unsigned char)(~(1<<0))) 
; #define BIT1_NEG ((unsigned char)(~(1<<1))) 
; #define BIT2_NEG ((unsigned char)(~(1<<2))) 
; #define BIT3_NEG ((unsigned char)(~(1<<3))) 
; #define BIT4_NEG ((unsigned char)(~(1<<4))) 
; #define BIT5_NEG ((unsigned char)(~(1<<5))) 
; #define BIT6_NEG ((unsigned char)(~(1<<6))) 
; #define BIT7_NEG ((unsigned char)(~(1<<7))) 
; 
; //定义红色LED熄灭、亮、翻转 
; #define LED_red_OFF PORTD&=BIT0_NEG 
; #define LED_red_ON   PORTD|=BIT0_POS   
; #define LED_red_OTN PORTD^=BIT0_POS 
; 
; //定义绿色LED熄灭、亮、翻转 
; #define LED_green_OFF PORTD&=BIT1_NEG 
; #define LED_green_ON PORTD|=BIT1_POS 
; #define LED_green_OTN PORTD^=BIT1_POS 
; 
; 
; /**********************************************************************
; 				  MS级延时函数程序，参数i 延时时间								   	
; **********************************************************************/
; void DelayMS(uint i)
; {
	.dbline 45
; uint j;
; for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 46
; {
	.dbline 47
	ldi R20,8000
	ldi R21,31
	xjmp L9
L6:
	.dbline 47
L7:
	.dbline 47
	subi R20,1
	sbci R21,0
L9:
	.dbline 47
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 48
L3:
	.dbline 45
	subi R16,1
	sbci R17,0
L5:
	.dbline 45
	cpi R16,0
	cpc R16,R17
	brne L2
X1:
	.dbline -2
L1:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r j 20 i
	.dbsym r i 16 i
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 54
; for(j=8000;j!=0;j--);
; }
; }
; /**********************************************************************
; 				   主函数						   	
; **********************************************************************/
; void main(void)
; {
	.dbline 55
;  DDRD=0XFF;//端口设置，PA口设置为推挽1输出
	ldi R24,255
	out 0x11,R24
	.dbline 56
;  PORTD=0XFF;
	out 0x12,R24
	xjmp L12
L11:
	.dbline 58
	.dbline 59
	sbi 0x12,0
	.dbline 60
	sbi 0x12,1
	.dbline 61
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 62
	ldi R24,-2
	ldi R25,-1
	in R2,0x12
	and R2,R24
	out 0x12,R2
	.dbline 63
	ldi R24,253
	in R2,0x12
	and R2,R24
	out 0x12,R2
	.dbline 64
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 65
L12:
	.dbline 57
	xjmp L11
X2:
	.dbline -2
L10:
	.dbline 0 ; func end
	ret
	.dbend
