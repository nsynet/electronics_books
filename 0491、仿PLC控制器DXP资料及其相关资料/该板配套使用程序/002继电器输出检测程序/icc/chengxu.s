	.module chengxu.c
	.area data(ram, con, rel)
_x::
	.blkb 2
	.area idata
	.word 200
	.area data(ram, con, rel)
	.dbfile F:\NEW光~1\八路输入输出继电器控制板\002继电器输出检测程序\icc\chengxu.c
	.dbsym e x _x i
	.area text(rom, con, rel)
	.dbfile F:\NEW光~1\八路输入输出继电器控制板\002继电器输出检测程序\icc\chengxu.c
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 10
; #include <iom8v.h>
; #include <macros.h> 
; #define uchar unsigned char 
; #define uint unsigned int
; uint x=200;
; /**********************************************************************
; 				   初始化					   	
; **********************************************************************/
; void Init_IO(void)//初始化I/O
; {
	.dbline 12
; //设置B口为输出
; DDRB=0x3F;
	ldi R24,63
	out 0x17,R24
	.dbline 13
; PORTB=0x3F;
	out 0x18,R24
	.dbline 15
; //设置C口为输出
; DDRC=0xFF;
	ldi R24,255
	out 0x14,R24
	.dbline 16
; PORTC=0xFF;
	out 0x15,R24
	.dbline 18
; //设置D口为输入
; DDRD=0X00;
	clr R2
	out 0x11,R2
	.dbline 19
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
	.dbline 25
; }
; /******************************************************************
; 延时函数
; ******************************************************************/
; void delay(uint t)
; {
	.dbline 27
;   uint i,j;
;    for(i=0;i<t;i++)
	clr R20
	clr R21
	rjmp L6
L3:
	.dbline 28
;    {
	.dbline 29
	ldi R22,1000
	ldi R23,3
	rjmp L10
L7:
	.dbline 29
L8:
	.dbline 29
	subi R22,1
	sbci R23,0
L10:
	.dbline 29
	cpi R22,0
	cpc R22,R23
	brne L7
X0:
	.dbline 30
	wdr
	.dbline 31
	.dbline 31
	.dbline 32
	.dbline 33
L4:
	.dbline 27
	subi R20,255  ; offset = 1
	sbci R21,255
L6:
	.dbline 27
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
	.dbline 39
;    	 for(j=1000;j>0;j--);
; 	 WDR();//WDT 复位 
; 	 { ;
; 	 }
;    }
; }
; /**********************************************************************
; 				  主函数				   	
; **********************************************************************/
; void main(void)
; {
	.dbline 40
; Init_IO();  //初始化I/O
	rcall _Init_IO
	rjmp L13
L12:
	.dbline 43
	.dbline 44
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 45
	ldi R24,15
	out 0x15,R24
	.dbline 46
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 47
	ldi R24,7
	out 0x18,R24
	.dbline 48
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 49
	ldi R24,11
	out 0x18,R24
	.dbline 50
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 51
	ldi R24,13
	out 0x18,R24
	.dbline 52
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 53
	ldi R24,14
	out 0x18,R24
	.dbline 54
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 55
	ldi R24,15
	out 0x18,R24
	.dbline 56
	ldi R24,7
	out 0x15,R24
	.dbline 57
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 58
	ldi R24,11
	out 0x15,R24
	.dbline 59
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 60
	ldi R24,13
	out 0x15,R24
	.dbline 61
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 62
	ldi R24,14
	out 0x15,R24
	.dbline 63
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 64
	ldi R24,10
	out 0x15,R24
	.dbline 65
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 66
	ldi R24,5
	out 0x15,R24
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
	clr R2
	out 0x15,R2
	.dbline 71
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 72
	ldi R24,15
	out 0x15,R24
	.dbline 73
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 74
	ldi R24,10
	out 0x18,R24
	.dbline 75
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 76
	ldi R24,5
	out 0x18,R24
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
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 82
	ldi R24,15
	out 0x18,R24
	.dbline 83
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 84
	clr R2
	out 0x18,R2
	.dbline 85
	out 0x15,R2
	.dbline 86
	lds R16,_x
	lds R17,_x+1
	rcall _delay
	.dbline 87
	ldi R24,15
	out 0x18,R24
	.dbline 88
	out 0x15,R24
	.dbline 89
L13:
	.dbline 42
	rjmp L12
X1:
	.dbline -2
L11:
	.dbline 0 ; func end
	ret
	.dbend
