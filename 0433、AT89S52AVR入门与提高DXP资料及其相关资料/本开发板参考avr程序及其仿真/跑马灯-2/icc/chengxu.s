	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\已完成good\跑马灯-2\icc\chengxu.c
	.dbfunc e delayms _delayms fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_delayms::
	xcall push_gset1
	.dbline -1
	.dbline 7
; #include <iom16v.h>
; #define uchar unsigned char 
; #define uint unsigned int
; ////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////
; void delayms(uint i)//延时
; {
	.dbline 9
; uint j;
; for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 10
; {
	.dbline 11
	ldi R20,8000
	ldi R21,31
	xjmp L9
L6:
	.dbline 11
L7:
	.dbline 11
	subi R20,1
	sbci R21,0
L9:
	.dbline 11
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 12
L3:
	.dbline 9
	subi R16,1
	sbci R17,0
L5:
	.dbline 9
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
	.dbfunc e delayus _delayus fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_delayus::
	xcall push_gset1
	.dbline -1
	.dbline 16
; for(j=8000;j!=0;j--);
; }
; }
; ////////////////////////////////////////////////////////////////////
; void delayus(uint i)//延时
; {
	.dbline 18
; uint j;
; for(;i!=0;i--)
	xjmp L14
L11:
	.dbline 19
; {
	.dbline 20
	ldi R20,100
	ldi R21,0
	xjmp L18
L15:
	.dbline 20
L16:
	.dbline 20
	subi R20,1
	sbci R21,0
L18:
	.dbline 20
	cpi R20,0
	cpc R20,R21
	brne L15
X2:
	.dbline 21
L12:
	.dbline 18
	subi R16,1
	sbci R17,0
L14:
	.dbline 18
	cpi R16,0
	cpc R16,R17
	brne L11
X3:
	.dbline -2
L10:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r j 20 i
	.dbsym r i 16 i
	.dbend
	.dbfunc e main _main fV
;              j -> R20,R21
;              i -> R22,R23
	.even
_main::
	.dbline -1
	.dbline 25
; for(j=100;j!=0;j--);
; }
; }
; ////////////////////////////////////////////////////////////////////
; void main(void)
; {
	.dbline 26
;  DDRA=0XFF; 
	ldi R24,255
	out 0x1a,R24
	xjmp L21
L20:
	.dbline 29
; 
;  while(1)
;  {
	.dbline 31
; uint i,j;
;   for(i=0;i<4;i++)
	clr R22
	clr R23
	xjmp L26
L23:
	.dbline 32
	.dbline 33
	ldi R24,255
	out 0x1b,R24
	.dbline 34
	ldi R16,10
	ldi R17,0
	xcall _delayms
	.dbline 35
L24:
	.dbline 31
	subi R22,255  ; offset = 1
	sbci R23,255
L26:
	.dbline 31
	cpi R22,4
	ldi R30,0
	cpc R23,R30
	brlo L23
	.dbline 36
;   {
;   PORTA=0xFF;  //我闪！拚命闪！
;    delayms(10);
;   }
;   j=0x01;
	ldi R20,1
	ldi R21,0
	.dbline 37
;   for(i=0;i<8;i++)
	clr R22
	clr R23
	xjmp L30
L27:
	.dbline 38
	.dbline 39
	lsl R20
	rol R21
	.dbline 40
	out 0x1b,R20
	.dbline 41
	ldi R16,10
	ldi R17,0
	xcall _delayms
	.dbline 42
L28:
	.dbline 37
	subi R22,255  ; offset = 1
	sbci R23,255
L30:
	.dbline 37
	cpi R22,8
	ldi R30,0
	cpc R23,R30
	brlo L27
	.dbline 43
;   {
;    j<<=1;   
;   PORTA=j;  //我左闪！
;    delayms(10);
;   }
;   j=0x80;
	ldi R20,128
	ldi R21,0
	.dbline 44
;   for(i=0;i<8;i++)
	clr R22
	clr R23
	xjmp L34
L31:
	.dbline 45
	.dbline 46
	lsr R21
	ror R20
	.dbline 47
	out 0x1b,R20
	.dbline 48
	ldi R16,10
	ldi R17,0
	xcall _delayms
	.dbline 49
L32:
	.dbline 44
	subi R22,255  ; offset = 1
	sbci R23,255
L34:
	.dbline 44
	cpi R22,8
	ldi R30,0
	cpc R23,R30
	brlo L31
	.dbline 50
L21:
	.dbline 28
	xjmp L20
X4:
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbsym r j 20 i
	.dbsym r i 22 i
	.dbend
