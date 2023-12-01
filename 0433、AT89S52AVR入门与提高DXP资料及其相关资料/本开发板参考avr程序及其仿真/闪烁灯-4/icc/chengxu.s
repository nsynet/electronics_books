	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\流水灯\icc\chengxu.c
	.dbfunc e main _main fI
;            led -> R18
;              i -> R20
;              k -> R16
;              j -> R22
	.even
_main::
	.dbline -1
	.dbline 3
; #include <iom16v.h>
; int main( void )
; {
	.dbline 4
; unsigned char i, j, k,led=0;
	clr R18
	.dbline 5
; DDRA=0xFF;//为输出
	ldi R24,255
	out 0x1a,R24
	.dbline 6
; DDRB=0xFF;
	out 0x17,R24
	.dbline 7
; DDRC=0XFF;
	out 0x14,R24
	.dbline 8
; DDRD=0XFF;
	out 0x11,R24
	xjmp L3
L2:
	.dbline 10
; while (1)
; {
	.dbline 11
; if(led)
	tst R18
	breq L5
	.dbline 12
; {
	.dbline 13
; PORTA|=0XFF;
	in R24,0x1b
	ori R24,255
	out 0x1b,R24
	.dbline 14
; PORTB|=0XFF;
	in R24,0x18
	ori R24,255
	out 0x18,R24
	.dbline 15
; PORTC|=0XFF;
	in R24,0x15
	ori R24,255
	out 0x15,R24
	.dbline 16
; PORTD|=0XFF;
	in R24,0x12
	ori R24,255
	out 0x12,R24
	.dbline 17
; }
	xjmp L6
L5:
	.dbline 19
; else
; {
	.dbline 20
; PORTA&=0X00;
	clr R2
	out 0x1b,R2
	.dbline 21
; PORTB&=0X00;
	out 0x18,R2
	.dbline 22
; PORTC&=0X00;
	out 0x15,R2
	.dbline 23
; PORTD&=0X00;
	out 0x12,R2
	.dbline 24
; }
L6:
	.dbline 25
; led=!led;//取反
	tst R18
	brne L7
	ldi R20,1
	ldi R21,0
	xjmp L8
L7:
	clr R20
	clr R21
L8:
	mov R18,R20
	.dbline 28
; 
; ////////////延时////////////////
; for (i=0; i<255; i++)
	clr R20
	xjmp L12
L9:
	.dbline 29
; for(j=0; j<255;j++)
	clr R22
	xjmp L16
L13:
	.dbline 30
	inc R16
L14:
	.dbline 29
	inc R22
L16:
	.dbline 29
	cpi R22,255
	brlo L13
L10:
	.dbline 28
	inc R20
L12:
	.dbline 28
	cpi R20,255
	brlo L9
	.dbline 31
L3:
	.dbline 9
	xjmp L2
X0:
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbsym r led 18 c
	.dbsym r i 20 c
	.dbsym r k 16 c
	.dbsym r j 22 c
	.dbend
