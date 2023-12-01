	.module chengxu.c
	.area data(ram, con, rel)
_x::
	.blkb 2
	.area idata
	.word 200
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA8\个人总结的M8程序\仿PLC控制输入输出\icc\chengxu.c
	.dbsym e x _x i
	.area text(rom, con, rel)
	.dbfile E:\Proteus\ATMEGA8\个人总结的M8程序\仿PLC控制输入输出\icc\chengxu.c
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 7
; #include <iom8v.h>
; #define uchar unsigned char 
; #define uint unsigned int
; uint x=200;
; //////////////////////////////初始化////////////////////////////////////
; void Init_IO(void)//初始化I/O
; {
	.dbline 9
; //设置B口为输出
; DDRB=0xff;
	ldi R24,255
	out 0x17,R24
	.dbline 10
; PORTB=0xff;
	out 0x18,R24
	.dbline 12
; //设置C口为输出
; DDRC=0xff;
	out 0x14,R24
	.dbline 13
; PORTC=0xff;
	out 0x15,R24
	.dbline 15
; //设置D口为输入
; DDRD=0X00;
	clr R2
	out 0x11,R2
	.dbline 16
; PORTD=0x00;
	out 0x12,R2
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e delay _delay fV
;              i -> R20,R21
;              j -> R22,R23
;              t -> R16,R17
	.even
_delay::
	rcall push_gset2
	.dbline -1
	.dbline 24
; }
; /******************************************************************
; 
; 延时函数
; 
; ******************************************************************/
; void delay(uint t)
; {
	.dbline 26
;   uint i,j;
;    for(i=0;i<t;i++)
	clr R20
	clr R21
	rjmp L6
L3:
	.dbline 27
;    {
	.dbline 28
	ldi R22,1000
	ldi R23,3
	rjmp L10
L7:
	.dbline 28
L8:
	.dbline 28
	subi R22,1
	sbci R23,0
L10:
	.dbline 28
	cpi R22,0
	cpc R22,R23
	brne L7
X0:
	.dbline 29
	.dbline 29
	.dbline 30
	.dbline 31
L4:
	.dbline 26
	subi R20,255  ; offset = 1
	sbci R21,255
L6:
	.dbline 26
	cp R20,R16
	cpc R21,R17
	brlo L3
	.dbline -2
L2:
	rcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r i 20 i
	.dbsym r j 22 i
	.dbsym r t 16 i
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 35
;    	 for(j=1000;j>0;j--);
; 	 { ;
; 	 }
;    }
; }
; /////////////////////////////主函数/////////////////////////////////////
; void main(void)
; {
	.dbline 36
; Init_IO();  //初始化I/O
	rcall _Init_IO
	rjmp L13
L12:
	.dbline 39
	.dbline 40
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 41
	ldi R24,15
	out 0x15,R24
	.dbline 42
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 43
	ldi R24,7
	out 0x18,R24
	.dbline 44
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 45
	ldi R24,11
	out 0x18,R24
	.dbline 46
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 47
	ldi R24,13
	out 0x18,R24
	.dbline 48
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 49
	ldi R24,14
	out 0x18,R24
	.dbline 50
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 51
	ldi R24,15
	out 0x18,R24
	.dbline 52
	ldi R24,7
	out 0x15,R24
	.dbline 53
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 54
	ldi R24,11
	out 0x15,R24
	.dbline 55
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 56
	ldi R24,13
	out 0x15,R24
	.dbline 57
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 58
	ldi R24,14
	out 0x15,R24
	.dbline 59
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 60
	ldi R24,10
	out 0x15,R24
	.dbline 61
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 62
	ldi R24,5
	out 0x15,R24
	.dbline 63
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 64
	ldi R24,15
	out 0x15,R24
	.dbline 65
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 66
	clr R2
	out 0x15,R2
	.dbline 67
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 68
	ldi R24,15
	out 0x15,R24
	.dbline 69
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 70
	ldi R24,10
	out 0x18,R24
	.dbline 71
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 72
	ldi R24,5
	out 0x18,R24
	.dbline 73
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 74
	ldi R24,15
	out 0x18,R24
	.dbline 75
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 76
	clr R2
	out 0x18,R2
	.dbline 77
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 78
	ldi R24,15
	out 0x18,R24
	.dbline 79
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 80
	clr R2
	out 0x18,R2
	.dbline 81
	out 0x15,R2
	.dbline 82
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 83
	ldi R24,15
	out 0x18,R24
	.dbline 84
	out 0x15,R24
	.dbline 85
L13:
	.dbline 38
	rjmp L12
X1:
	.dbline -2
L11:
	.dbline 0 ; func end
	ret
	.dbend
