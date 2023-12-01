	.module chengxu.c
	.area data(ram, con, rel)
_led::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\闪烁灯-2\icc\chengxu.c
	.dbsym e led _led c
	.area text(rom, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\闪烁灯-2\icc\chengxu.c
	.dbfunc e del _del fI
	.even
_del::
	.dbline -1
	.dbline 4
; #include <iom16v.h>
; unsigned char i, j, k,led=0;
; del()  /*延时0.2秒*/
; {
	.dbline 6
; 
; for(i=100;i>0;i--)
	ldi R24,100
	sts _i,R24
	xjmp L5
L2:
	.dbline 7
; for(j=20;j>0;j--)
	ldi R24,20
	sts _j,R24
	xjmp L9
L6:
	.dbline 8
	ldi R24,248
	sts _k,R24
	xjmp L13
L10:
	.dbline 8
L11:
	.dbline 8
	lds R24,_k
	subi R24,1
	sts _k,R24
L13:
	.dbline 8
	clr R2
	lds R3,_k
	cp R2,R3
	brlo L10
L7:
	.dbline 7
	lds R24,_j
	subi R24,1
	sts _j,R24
L9:
	.dbline 7
	clr R2
	lds R3,_j
	cp R2,R3
	brlo L6
L3:
	.dbline 6
	lds R24,_i
	subi R24,1
	sts _i,R24
L5:
	.dbline 6
	clr R2
	lds R3,_i
	cp R2,R3
	brlo L2
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fI
	.even
_main::
	.dbline -1
	.dbline 11
; for(k=248;k>0;k--);
; }
; int main( void )
; {
	.dbline 12
; DDRB=0xFF; /* all outputs */
	ldi R24,255
	out 0x17,R24
	xjmp L16
L15:
	.dbline 15
; 
; while (1)
; {
	.dbline 16
; if(led)
	lds R2,_led
	tst R2
	breq L18
	.dbline 17
; PORTB=0Xfe; 
	ldi R24,254
	out 0x18,R24
	xjmp L19
L18:
	.dbline 19
; else
; PORTB=0Xff; 
	ldi R24,255
	out 0x18,R24
L19:
	.dbline 20
; led=!led;
	lds R2,_led
	tst R2
	brne L20
	ldi R20,1
	ldi R21,0
	xjmp L21
L20:
	clr R20
	clr R21
L21:
	sts _led,R20
	.dbline 21
	xcall _del
	.dbline 22
L16:
	.dbline 14
	xjmp L15
X0:
	.dbline -2
L14:
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\闪烁灯-2\icc\chengxu.c
_k::
	.blkb 1
	.dbsym e k _k c
_j::
	.blkb 1
	.dbsym e j _j c
_i::
	.blkb 1
	.dbsym e i _i c
