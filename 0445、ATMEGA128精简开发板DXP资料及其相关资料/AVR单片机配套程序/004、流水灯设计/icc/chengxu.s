	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile F:\NEW光~1\MEGA12~1\AVR单片机配套程序\004、流水灯设计\icc\chengxu.c
	.dbfunc e DelayMS _DelayMS fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMS::
	xcall push_gset1
	.dbline -1
	.dbline 11
; #include <iom128.h>
; /**********************************************************************
; 				  函数数据类型说明							   	
; **********************************************************************/
; #define uchar unsigned char 
; #define uint unsigned int
; /**********************************************************************
; 				  MS级延时函数程序，参数i 延时时间								   	
; **********************************************************************/
; void DelayMS(uint i)
; {
	.dbline 13
; uint j;
; for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 14
; {
	.dbline 15
	ldi R20,8000
	ldi R21,31
	xjmp L9
L6:
	.dbline 15
L7:
	.dbline 15
	subi R20,1
	sbci R21,0
L9:
	.dbline 15
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 16
L3:
	.dbline 13
	subi R16,1
	sbci R17,0
L5:
	.dbline 13
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
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 22
; for(j=8000;j!=0;j--);
; }
; }
; /**********************************************************************
; 				   主函数						   	
; **********************************************************************/
; void main(void)
; {
	.dbline 23
; DDRD=0XFF;//端口设置，PA口设置为推挽1输出
	ldi R24,255
	out 0x11,R24
	.dbline 24
; PORTD=0XFF;
	out 0x12,R24
	.dbline 25
; PORTD=0XFF;//PORTD初始化为1,灭掉所有的LED
	out 0x12,R24
	xjmp L12
L11:
	.dbline 28
	.dbline 30
	ldi R24,254
	out 0x12,R24
	.dbline 31
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 32
	ldi R24,253
	out 0x12,R24
	.dbline 33
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 34
	ldi R24,251
	out 0x12,R24
	.dbline 35
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 36
	ldi R24,247
	out 0x12,R24
	.dbline 37
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 38
	ldi R24,239
	out 0x12,R24
	.dbline 39
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 40
	ldi R24,223
	out 0x12,R24
	.dbline 41
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 42
	ldi R24,191
	out 0x12,R24
	.dbline 43
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 44
	ldi R24,-129
	ldi R25,-1
	out 0x12,R24
	.dbline 45
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 46
L12:
	.dbline 27
	xjmp L11
X2:
	.dbline -2
L10:
	.dbline 0 ; func end
	ret
	.dbend
