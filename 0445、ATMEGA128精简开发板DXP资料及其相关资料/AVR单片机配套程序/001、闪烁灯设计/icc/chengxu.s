	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile F:\NEW光~1\MEGA12~1\AVR单片机配套程序\001、闪烁灯设计\icc\chengxu.c
	.dbfunc e DelayMS _DelayMS fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMS::
	xcall push_gset1
	.dbline -1
	.dbline 11
; #include <iom128.h>
; /**********************************************************************
; 				  函数数据类型说明							   	
; **********************************************************************/
; #define uchar unsigned char 
; #define uint unsigned int
; /**********************************************************************
; 				  MS级延时函数程序，参数i 延时时间								   	
; **********************************************************************/
; void DelayMS(uint i)
; {
	.dbline 13
; uint j;
; for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 14
; {
	.dbline 15
	ldi R20,8000
	ldi R21,31
	xjmp L9
L6:
	.dbline 15
L7:
	.dbline 15
	subi R20,1
	sbci R21,0
L9:
	.dbline 15
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 16
L3:
	.dbline 13
	subi R16,1
	sbci R17,0
L5:
	.dbline 13
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
	.dbline 22
; for(j=8000;j!=0;j--);
; }
; }
; /**********************************************************************
; 				   主函数						   	
; **********************************************************************/
; void main(void)
; {
	.dbline 25
;  //DDRD=0XFF;//端口设置，PD口设置为推挽1输出
;  //PORTD=0XFF;
;  DDRA=0XFF;//端口设置，PA口设置为推挽1输出
	ldi R24,255
	out 0x1a,R24
	.dbline 26
;  PORTA=0XFF;
	out 0x1b,R24
	.dbline 27
;  DDRB=0XFF;//端口设置，PB口设置为推挽1输出
	out 0x17,R24
	.dbline 28
;  PORTB=0XFF;
	out 0x18,R24
	.dbline 29
;  DDRC=0XFF;//端口设置，PC口设置为推挽1输出
	out 0x14,R24
	.dbline 30
;  PORTC=0XFF;
	out 0x15,R24
	.dbline 31
;  DDRD=0XFF;//端口设置，PD口设置为推挽1输出
	out 0x11,R24
	.dbline 32
;  PORTD=0XFF;
	out 0x12,R24
	.dbline 33
;  DDRE=0XFF;//端口设置，PE口设置为推挽1输出
	out 0x2,R24
	.dbline 34
;  PORTE=0XFF;
	out 0x3,R24
	.dbline 35
;  DDRF=0XFF;//端口设置，PF口设置为推挽1输出
	sts 97,R24
	.dbline 36
;  PORTF=0XFF;
	sts 98,R24
	.dbline 37
;  DDRG=0XFF;//端口设置，PG口设置为推挽1输出
	sts 100,R24
	.dbline 38
;  PORTG=0XFF;
	sts 101,R24
	xjmp L12
L11:
	.dbline 40
	.dbline 42
	clr R2
	out 0x1b,R2
	.dbline 43
	out 0x18,R2
	.dbline 44
	out 0x15,R2
	.dbline 45
	out 0x12,R2
	.dbline 46
	out 0x3,R2
	.dbline 47
	sts 98,R2
	.dbline 48
	sts 101,R2
	.dbline 49
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 51
	ldi R24,255
	out 0x1b,R24
	.dbline 52
	out 0x18,R24
	.dbline 53
	out 0x15,R24
	.dbline 54
	out 0x12,R24
	.dbline 55
	out 0x3,R24
	.dbline 56
	sts 98,R24
	.dbline 57
	sts 101,R24
	.dbline 58
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 59
L12:
	.dbline 39
	xjmp L11
X2:
	.dbline -2
L10:
	.dbline 0 ; func end
	ret
	.dbend
