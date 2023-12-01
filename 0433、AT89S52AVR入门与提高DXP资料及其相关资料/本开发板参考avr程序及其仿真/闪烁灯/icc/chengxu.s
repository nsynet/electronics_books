	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\闪烁灯\chengxu.c
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
; DDRB=0xFF; /* all outputs */
	ldi R24,255
	out 0x17,R24
	xjmp L3
L2:
	.dbline 7
; while (1)
; {
	.dbline 8
; if(led)
	tst R18
	breq L5
	.dbline 9
; PORTB|=0X01; /* |使最后一位为1 */
	sbi 0x18,0
	xjmp L6
L5:
	.dbline 11
; else
; PORTB&=0XFE; /*&最后一位为0 */
	in R24,0x18
	andi R24,254
	out 0x18,R24
L6:
	.dbline 12
; led=!led;
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
	.dbline 14
; //延时
; for (i=0; i<255; i++)
	clr R20
	xjmp L12
L9:
	.dbline 15
; for(j=0; j<255;j++)
	clr R22
	xjmp L16
L13:
	.dbline 16
	inc R16
L14:
	.dbline 15
	inc R22
L16:
	.dbline 15
	cpi R22,255
	brlo L13
L10:
	.dbline 14
	inc R20
L12:
	.dbline 14
	cpi R20,255
	brlo L9
	.dbline 17
L3:
	.dbline 6
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
