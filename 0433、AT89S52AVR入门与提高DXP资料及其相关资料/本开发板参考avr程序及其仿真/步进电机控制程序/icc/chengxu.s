	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\流水灯-1\icc\chengxu.c
	.dbfunc e delay_us _delay_us fV
;              t -> R16,R17
	.even
_delay_us::
	.dbline -1
	.dbline 4
; #include <iom16v.h>
; ///////////////////延时 us//////////////////
; void delay_us(int t)
; {
L2:
	.dbline 6
; do
;    t--;
	subi R16,1
	sbci R17,0
L3:
	.dbline 7
; while(t>1);
	ldi R24,1
	ldi R25,0
	cp R24,R16
	cpc R25,R17
	brlt L2
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbsym r t 16 I
	.dbend
	.dbfunc e delay_ms _delay_ms fV
;              t -> R20,R21
	.even
_delay_ms::
	xcall push_gset1
	movw R20,R16
	.dbline -1
	.dbline 12
; }
; 
; ///////////////////延时  ms/////////////////
; void delay_ms(unsigned int t)
; {
	xjmp L7
L6:
	.dbline 14
	.dbline 15
	ldi R16,1142
	ldi R17,4
	xcall _delay_us
	.dbline 16
	subi R20,1
	sbci R21,0
	.dbline 17
L7:
	.dbline 13
; while(t!=0)
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline -2
L5:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r t 20 i
	.dbend
	.dbfunc e main _main fI
	.even
_main::
	.dbline -1
	.dbline 21
; {
; delay_us(1142);
; t--;
; }
; }
; ///////////////////主程序/////////////////////
; int main(void)
; {
	.dbline 22
;   DDRA=0xFF;  /* all outputs */
	ldi R24,255
	out 0x1a,R24
	.dbline 23
;   PORTA=0XFF;
	out 0x1b,R24
	xjmp L11
L10:
	.dbline 25
	.dbline 27
	ldi R24,254
	out 0x1b,R24
	.dbline 28
	ldi R16,100
	ldi R17,0
	xcall _delay_ms
	.dbline 29
	ldi R24,253
	out 0x1b,R24
	.dbline 30
	ldi R16,100
	ldi R17,0
	xcall _delay_ms
	.dbline 31
	ldi R24,251
	out 0x1b,R24
	.dbline 32
	ldi R16,100
	ldi R17,0
	xcall _delay_ms
	.dbline 33
	ldi R24,247
	out 0x1b,R24
	.dbline 34
	ldi R16,100
	ldi R17,0
	xcall _delay_ms
	.dbline 35
	ldi R24,239
	out 0x1b,R24
	.dbline 36
	ldi R16,100
	ldi R17,0
	xcall _delay_ms
	.dbline 37
	ldi R24,223
	out 0x1b,R24
	.dbline 38
	ldi R16,100
	ldi R17,0
	xcall _delay_ms
	.dbline 39
	ldi R24,191
	out 0x1b,R24
	.dbline 40
	ldi R16,100
	ldi R17,0
	xcall _delay_ms
	.dbline 41
	ldi R24,-129
	ldi R25,-1
	out 0x1b,R24
	.dbline 42
	ldi R16,100
	ldi R17,0
	xcall _delay_ms
	.dbline 44
	clr R2
	out 0x1b,R2
	.dbline 47
L11:
	.dbline 24
	xjmp L10
X1:
	.dbline -2
L9:
	.dbline 0 ; func end
	ret
	.dbend
