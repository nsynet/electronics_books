	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile C:\DOCUME~1\Administrator\桌面\001、闪烁灯设计\icc\chengxu.c
	.dbfunc e int_io _int_io fV
	.even
_int_io::
	.dbline -1
	.dbline 13
; #include<iom128v.h>
; #include <macros.h>
; /**********************************************************************
; 				  函数数据类型说明							   	
; **********************************************************************/
; #define uint unsigned int
; #define uchar unsigned char
; 
; /**********************************************************************
; 				初始化I/0口							   	
; **********************************************************************/
; void int_io()
; {
	.dbline 14
;    DDRD  =0xff;  
	ldi R24,255
	out 0x11,R24
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Delay_us _Delay_us fV
;              i -> R20,R21
;              j -> R22,R23
;          Timer -> R16,R17
	.even
_Delay_us::
	xcall push_gset2
	.dbline -1
	.dbline 21
; }
; 
; /**********************************************************************
; 				  MS级延时函数程序，参数Timer 延时时间								   	
; **********************************************************************/
; void Delay_us(int Timer)
; {
	.dbline 23
;    int i,j;
;    for( i = Timer; i > 0; i--)
	movw R20,R16
	xjmp L6
L3:
	.dbline 24
;    for( j = 11   ; j > 0; j--)
	ldi R22,11
	ldi R23,0
L7:
	.dbline 25
	nop
L8:
	.dbline 24
	subi R22,1
	sbci R23,0
	.dbline 24
	clr R2
	clr R3
	cp R2,R22
	cpc R3,R23
	brlt L7
L4:
	.dbline 23
	subi R20,1
	sbci R21,0
L6:
	.dbline 23
	clr R2
	clr R3
	cp R2,R20
	cpc R3,R21
	brlt L3
	.dbline -2
L2:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r i 20 I
	.dbsym r j 22 I
	.dbsym r Timer 16 I
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 32
;    NOP();
; }
; 
; /**********************************************************************
; 				   主函数						   	
; **********************************************************************/
; void main()
; {
	.dbline 33
;     int_io();
	xcall _int_io
	.dbline 34
;    PORTD|=(1<<4);
	sbi 0x12,4
	.dbline 35
;    PORTD|=(1<<5);
	sbi 0x12,5
	.dbline 36
;    PORTD&=~(1<<6);
	cbi 0x12,6
	xjmp L13
L12:
	.dbline 38
	.dbline 39
	ldi R16,10000
	ldi R17,39
	xcall _Delay_us
	.dbline 40
	cbi 0x12,7
	.dbline 41
	ldi R16,10000
	ldi R17,39
	xcall _Delay_us
	.dbline 42
	sbi 0x12,7
	.dbline 44
L13:
	.dbline 37
	xjmp L12
X0:
	.dbline -2
L11:
	.dbline 0 ; func end
	ret
	.dbend
