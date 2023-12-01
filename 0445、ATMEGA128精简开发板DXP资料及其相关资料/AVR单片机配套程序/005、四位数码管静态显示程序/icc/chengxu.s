	.module chengxu.c
	.area data(ram, con, rel)
_Table::
	.blkb 2
	.area idata
	.byte 192,249
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 164,176
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 153,146
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 130,248
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 128,144
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 8,3
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 198,161
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 6,14
	.area data(ram, con, rel)
	.dbfile F:\NEW光~1\MEGA12~1\AVR单片机配套程序\005、四位数码管静态显示程序\icc\chengxu.c
	.dbsym e Table _Table A[16:16]c
	.area text(rom, con, rel)
	.dbfile F:\NEW光~1\MEGA12~1\AVR单片机配套程序\005、四位数码管静态显示程序\icc\chengxu.c
	.dbfunc e DelayMS _DelayMS fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMS::
	xcall push_gset1
	.dbline -1
	.dbline 15
; #include <iom128.h>
; /********************************************************************
;                 数据类型定义
; *********************************************************************/
; #define uchar unsigned char 
; #define uint unsigned int
; /********************************************************************
;                 数码管段码定义0123456789ABCDEF
; *********************************************************************/
; uchar Table[16]={0xc0,0Xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0X08,0x03,0xC6,0xA1,0x06,0x0E};	 //所需的段的位码
; /**********************************************************************
; 				  MS级延时函数程序，参数i 延时时间								   	
; **********************************************************************/
; void DelayMS(uint i)
; {
	.dbline 17
; uint j;
; for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 18
; {
	.dbline 19
	ldi R20,8000
	ldi R21,31
	xjmp L9
L6:
	.dbline 19
L7:
	.dbline 19
	subi R20,1
	sbci R21,0
L9:
	.dbline 19
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 20
L3:
	.dbline 17
	subi R16,1
	sbci R17,0
L5:
	.dbline 17
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
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 24
; for(j=8000;j!=0;j--);
; }
; }
; //////////////////////////////初始化////////////////////////////////////
; void Init_IO(void)//初始化I/O
; {
	.dbline 26
; //设置D口为输出
; DDRD=0xFF;
	ldi R24,255
	out 0x11,R24
	.dbline 27
; PORTD=0xFF;
	out 0x12,R24
	.dbline 29
; //设置C口为输出
; DDRE=0xFF;
	out 0x2,R24
	.dbline 30
; PORTE=0xFF;
	out 0x3,R24
	.dbline -2
L10:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 36
; }
; /**********************************************************************
; 				           主函数						   	
; **********************************************************************/
; void main(void)
; {
	.dbline 37
; Init_IO();  //初始化I/O
	xcall _Init_IO
	xjmp L13
L12:
	.dbline 40
	.dbline 41
	lds R2,_Table
	out 0x12,R2
	.dbline 42
	ldi R24,15
	out 0x3,R24
	.dbline 43
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 44
	lds R2,_Table+1
	out 0x12,R2
	.dbline 45
	ldi R24,15
	out 0x3,R24
	.dbline 46
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 47
	lds R2,_Table+2
	out 0x12,R2
	.dbline 48
	ldi R24,15
	out 0x3,R24
	.dbline 49
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 50
	lds R2,_Table+3
	out 0x12,R2
	.dbline 51
	ldi R24,15
	out 0x3,R24
	.dbline 52
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 53
	lds R2,_Table+4
	out 0x12,R2
	.dbline 54
	ldi R24,15
	out 0x3,R24
	.dbline 55
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 56
	lds R2,_Table+5
	out 0x12,R2
	.dbline 57
	ldi R24,15
	out 0x3,R24
	.dbline 58
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 59
	lds R2,_Table+6
	out 0x12,R2
	.dbline 60
	ldi R24,15
	out 0x3,R24
	.dbline 61
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 62
	lds R2,_Table+7
	out 0x12,R2
	.dbline 63
	ldi R24,15
	out 0x3,R24
	.dbline 64
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 65
	lds R2,_Table+8
	out 0x12,R2
	.dbline 66
	ldi R24,15
	out 0x3,R24
	.dbline 67
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 68
	lds R2,_Table+9
	out 0x12,R2
	.dbline 69
	ldi R24,15
	out 0x3,R24
	.dbline 70
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 71
	lds R2,_Table+10
	out 0x12,R2
	.dbline 72
	ldi R24,15
	out 0x3,R24
	.dbline 73
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 74
	lds R2,_Table+11
	out 0x12,R2
	.dbline 75
	ldi R24,15
	out 0x3,R24
	.dbline 76
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 77
	lds R2,_Table+12
	out 0x12,R2
	.dbline 78
	ldi R24,15
	out 0x3,R24
	.dbline 79
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 80
	lds R2,_Table+13
	out 0x12,R2
	.dbline 81
	ldi R24,15
	out 0x3,R24
	.dbline 82
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 83
	lds R2,_Table+14
	out 0x12,R2
	.dbline 84
	ldi R24,15
	out 0x3,R24
	.dbline 85
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 86
	lds R2,_Table+15
	out 0x12,R2
	.dbline 87
	ldi R24,15
	out 0x3,R24
	.dbline 88
	ldi R16,100
	ldi R17,0
	xcall _DelayMS
	.dbline 89
L13:
	.dbline 39
	xjmp L12
X2:
	.dbline -2
L11:
	.dbline 0 ; func end
	ret
	.dbend
