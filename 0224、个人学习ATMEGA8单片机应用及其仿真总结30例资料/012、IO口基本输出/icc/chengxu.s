	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile D:\整理\个人总结的M8程序\022、IO口基本输出\icc\chengxu.c
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 6
; #include <iom8v.h>
; #define uchar unsigned char 
; #define uint unsigned int
; //////////////////////////////初始化////////////////////////////////////
; void Init_IO(void)//初始化I/O
; {
	.dbline 8
; //设置B口为输出
; DDRB=0xFF;
	ldi R24,255
	out 0x17,R24
	.dbline 9
; PORTB=0xFF;
	out 0x18,R24
	.dbline 11
; //设置C口为输出
; DDRC=0xFF;
	out 0x14,R24
	.dbline 12
; PORTC=0xFF;
	out 0x15,R24
	.dbline 14
; //设置D口为输入
; DDRD=0X00;
	clr R2
	out 0x11,R2
	.dbline 15
; PORTD=0xFF;
	out 0x12,R24
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 19
; }
; /////////////////////////////主函数/////////////////////////////////////
; void main(void)
; {
	.dbline 20
; Init_IO();  //初始化I/O
	rcall _Init_IO
	rjmp L4
L3:
	.dbline 22
; while(1)
; {
	.dbline 24
; 
; if((PIND&0X01)==0)//按键加计数标志
	sbic 0x10,0
	rjmp L6
	.dbline 25
; {PORTB=0xfe;}
	.dbline 25
	ldi R24,254
	out 0x18,R24
	.dbline 25
L6:
	.dbline 26
; if((PIND&0X02)==0)//按键加计数标志
	sbic 0x10,1
	rjmp L8
	.dbline 27
; {PORTB=0xfd;}
	.dbline 27
	ldi R24,253
	out 0x18,R24
	.dbline 27
L8:
	.dbline 28
; if((PIND&0X04)==0)//按键加计数标志
	sbic 0x10,2
	rjmp L10
	.dbline 29
; {PORTB=0xfb;}
	.dbline 29
	ldi R24,251
	out 0x18,R24
	.dbline 29
L10:
	.dbline 30
; if((PIND&0X08)==0)//按键加计数标志
	sbic 0x10,3
	rjmp L12
	.dbline 31
; {PORTB=0xf7;}
	.dbline 31
	ldi R24,247
	out 0x18,R24
	.dbline 31
L12:
	.dbline 32
; if((PIND&0X10)==0)//按键加计数标志
	sbic 0x10,4
	rjmp L14
	.dbline 33
; {PORTC=0xfe;}
	.dbline 33
	ldi R24,254
	out 0x15,R24
	.dbline 33
L14:
	.dbline 34
; if((PIND&0X20)==0)//按键加计数标志
	sbic 0x10,5
	rjmp L16
	.dbline 35
; {PORTC=0xfd;}
	.dbline 35
	ldi R24,253
	out 0x15,R24
	.dbline 35
L16:
	.dbline 36
; if((PIND&0X40)==0)//按键加计数标志
	sbic 0x10,6
	rjmp L18
	.dbline 37
; {PORTC=0xfb;}
	.dbline 37
	ldi R24,251
	out 0x15,R24
	.dbline 37
L18:
	.dbline 38
; if((PIND&0X80)==0)//按键加计数标志
	sbic 0x10,7
	rjmp L20
	.dbline 39
; {PORTC=0xf7;}
	.dbline 39
	ldi R24,247
	out 0x15,R24
	.dbline 39
L20:
	.dbline 40
L4:
	.dbline 21
	rjmp L3
X0:
	.dbline -2
L2:
	.dbline 0 ; func end
	ret
	.dbend
