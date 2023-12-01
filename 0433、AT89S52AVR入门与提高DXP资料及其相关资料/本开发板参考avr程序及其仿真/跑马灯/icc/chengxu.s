	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\跑马灯\icc\chengxu.c
	.dbfunc e delayms _delayms fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_delayms::
	xcall push_gset1
	.dbline -1
	.dbline 6
; #include <iom16v.h>
; #define uchar unsigned char 
; #define uint unsigned int
; 
; void delayms(uint i)
; {
	.dbline 8
; uint j;
; for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 9
; {
	.dbline 10
	ldi R20,8000
	ldi R21,31
	xjmp L9
L6:
	.dbline 10
L7:
	.dbline 10
	subi R20,1
	sbci R21,0
L9:
	.dbline 10
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 11
L3:
	.dbline 8
	subi R16,1
	sbci R17,0
L5:
	.dbline 8
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
	.dbfunc e horse _horse fV
;              i -> R16
	.even
_horse::
	xcall push_gset1
	.dbline -1
	.dbline 15
; for(j=8000;j!=0;j--);
; }
; }
; 
; void horse(uchar i)
; {switch (i)
	.dbline 15
	mov R20,R16
	clr R21
	cpi R20,0
	cpc R20,R21
	breq L14
X2:
	cpi R20,1
	ldi R30,0
	cpc R21,R30
	breq L15
	cpi R20,2
	ldi R30,0
	cpc R21,R30
	breq L16
	cpi R20,3
	ldi R30,0
	cpc R21,R30
	breq L17
	cpi R20,4
	ldi R30,0
	cpc R21,R30
	breq L18
	cpi R20,5
	ldi R30,0
	cpc R21,R30
	breq L19
	cpi R20,6
	ldi R30,0
	cpc R21,R30
	breq L20
	cpi R20,7
	ldi R30,0
	cpc R21,R30
	breq L21
	cpi R20,8
	ldi R30,0
	cpc R21,R30
	breq L22
	xjmp L12
X3:
	.dbline 16
; {
L14:
	.dbline 17
; case 0:PORTA=0X00;break;
	clr R2
	out 0x1b,R2
	.dbline 17
	xjmp L12
L15:
	.dbline 18
; case 1:PORTA=0X01;break;
	ldi R24,1
	out 0x1b,R24
	.dbline 18
	xjmp L12
L16:
	.dbline 19
; case 2:PORTA=0X03;break;
	ldi R24,3
	out 0x1b,R24
	.dbline 19
	xjmp L12
L17:
	.dbline 20
; case 3:PORTA=0X07;break;
	ldi R24,7
	out 0x1b,R24
	.dbline 20
	xjmp L12
L18:
	.dbline 21
; case 4:PORTA=0X0f;break;
	ldi R24,15
	out 0x1b,R24
	.dbline 21
	xjmp L12
L19:
	.dbline 22
; case 5:PORTA=0X1f;break;
	ldi R24,31
	out 0x1b,R24
	.dbline 22
	xjmp L12
L20:
	.dbline 23
; case 6:PORTA=0X3f;break;
	ldi R24,63
	out 0x1b,R24
	.dbline 23
	xjmp L12
L21:
	.dbline 24
; case 7:PORTA=0X7f;break;
	ldi R24,127
	out 0x1b,R24
	.dbline 24
	xjmp L12
L22:
	.dbline 25
	ldi R24,255
	out 0x1b,R24
	.dbline 25
	.dbline 26
L12:
	.dbline -2
L10:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r i 16 c
	.dbend
	.dbfunc e main _main fV
;              i -> R20
	.even
_main::
	.dbline -1
	.dbline 30
; case 8:PORTA=0Xff;break;
; default:break;
; }
; }
; void main(void)
; {
	.dbline 32
; uchar i;
; DDRA=0XFF;
	ldi R24,255
	out 0x1a,R24
	.dbline 33
; PORTA=0XFF;
	out 0x1b,R24
	.dbline 34
; PORTA=0X00;
	clr R2
	out 0x1b,R2
	.dbline 35
; delayms(10);
	ldi R16,10
	ldi R17,0
	xcall _delayms
	xjmp L25
L24:
	.dbline 37
; while(1)
; {
	.dbline 38
; for(i=0;i<9;i++)
	clr R20
	xjmp L30
L27:
	.dbline 39
	.dbline 40
	mov R16,R20
	xcall _horse
	.dbline 41
	ldi R16,10
	ldi R17,0
	xcall _delayms
	.dbline 42
L28:
	.dbline 38
	inc R20
L30:
	.dbline 38
	cpi R20,9
	brlo L27
	.dbline 43
; {
; horse(i);
; delayms(10);
; }
; for(i=7;i!=0;i--)
	ldi R20,7
	xjmp L34
L31:
	.dbline 44
	.dbline 45
	mov R16,R20
	xcall _horse
	.dbline 46
	ldi R16,10
	ldi R17,0
	xcall _delayms
	.dbline 47
L32:
	.dbline 43
	dec R20
L34:
	.dbline 43
	tst R20
	brne L31
	.dbline 48
L25:
	.dbline 36
	xjmp L24
X4:
	.dbline -2
L23:
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbend
