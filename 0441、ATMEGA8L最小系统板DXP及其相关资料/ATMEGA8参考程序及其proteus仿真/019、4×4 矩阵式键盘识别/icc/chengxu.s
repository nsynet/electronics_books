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
	.byte 136,131
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 198,161
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 134,142
	.area data(ram, con, rel)
	.dbfile D:\整理\个人总结的M8程序\020、4~1\icc\chengxu.c
	.dbsym e Table _Table A[16:16]c
	.area text(rom, con, rel)
	.dbfile D:\整理\个人总结的M8程序\020、4~1\icc\chengxu.c
	.dbfunc e DelayMS _DelayMS fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMS::
	xcall push_gset1
	.dbline -1
	.dbline 16
; #include <iom8v.h>
; /********************************************************************
;                 数据类型定义
; *********************************************************************/
; #define uchar unsigned char 
; #define uint unsigned int
; /********************************************************************
;                 数码管段码定义0123456789
; *********************************************************************/
; uchar Table[16]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0x88,0x83,0xc6,0xa1,0x86,0x8e };	 //所需的段的位码
; uchar k;           
; /**********************************************************************
; 				  MS级延时函数程序，参数i 延时时间					   	
; **********************************************************************/
; void DelayMS(uint i)
; {
	.dbline 18
; uint j;
; for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 19
; {
	.dbline 20
	ldi R20,800
	ldi R21,3
	xjmp L9
L6:
	.dbline 20
L7:
	.dbline 20
	subi R20,1
	sbci R21,0
L9:
	.dbline 20
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 21
L3:
	.dbline 18
	subi R16,1
	sbci R17,0
L5:
	.dbline 18
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
	.dbfunc e Getch _Getch fV
;              Z -> R20
;              Y -> R20
;              X -> R22
	.even
_Getch::
	xcall push_gset2
	.dbline -1
	.dbline 27
; for(j=800;j!=0;j--);
; }
; }
; /**********************************************************************
;                 矩阵键盘函数
; *********************************************************************/  
; void Getch ( )
; { 
	.dbline 29
; unsigned char X,Y,Z;
; DDRD=0xF0;
	ldi R24,240
	out 0x11,R24
	.dbline 30
; PORTD=0x0F;
	ldi R24,15
	out 0x12,R24
	.dbline 31
; if(PIND!=0x0F) //判断是否有键按下
	in R24,0x10
	cpi R24,15
	brne X3
	xjmp L11
X3:
	.dbline 32
; {
	.dbline 33
; DelayMS(1); //延时,软件去干扰
	ldi R16,1
	ldi R17,0
	xcall _DelayMS
	.dbline 34
; if(PIND!=0x0F) //确认按键按下
	in R24,0x10
	cpi R24,15
	brne X4
	xjmp L13
X4:
	.dbline 35
; {
	.dbline 36
; X=PIND|0xF0;
	in R22,0x10
	ori R22,240
	.dbline 37
; DelayMS(1);
	ldi R16,1
	ldi R17,0
	xcall _DelayMS
	.dbline 38
; DDRD=0x0f;
	ldi R24,15
	out 0x11,R24
	.dbline 39
; PORTD=0xf0;
	ldi R24,240
	out 0x12,R24
	.dbline 40
; if(PIND!=0xf0) //判断是否有键按下
	in R24,0x10
	cpi R24,240
	brne X5
	xjmp L15
X5:
	.dbline 41
; {
	.dbline 42
; DelayMS(1); //延时,软件去干扰
	ldi R16,1
	ldi R17,0
	xcall _DelayMS
	.dbline 43
; if(PIND!=0xf0) //确认按键按下
	in R24,0x10
	cpi R24,240
	brne X6
	xjmp L17
X6:
	.dbline 44
; {
	.dbline 45
; Y=PIND|0x0F;
	in R20,0x10
	ori R20,15
	.dbline 46
; Z=X&Y; //取出键值
	mov R2,R22
	and R2,R20
	mov R20,R2
	.dbline 47
; switch ( Z ) //判断键值（那一个键按下）
	clr R21
	cpi R20,183
	ldi R30,0
	cpc R21,R30
	brne X7
	xjmp L36
X7:
	cpi R20,187
	ldi R30,0
	cpc R21,R30
	brne X8
	xjmp L32
X8:
	cpi R20,189
	ldi R30,0
	cpc R21,R30
	brne X9
	xjmp L28
X9:
	cpi R20,190
	ldi R30,0
	cpc R21,R30
	brne X10
	xjmp L24
X10:
	ldi R24,190
	ldi R25,0
	cp R24,R20
	cpc R25,R21
	brlt L39
L38:
	cpi R20,119
	ldi R30,0
	cpc R21,R30
	brne X11
	xjmp L37
X11:
	cpi R20,123
	ldi R30,0
	cpc R21,R30
	brne X12
	xjmp L33
X12:
	cpi R20,125
	ldi R30,0
	cpc R21,R30
	brne X13
	xjmp L29
X13:
	cpi R20,126
	ldi R30,0
	cpc R21,R30
	brne X14
	xjmp L25
X14:
	xjmp L19
L39:
	cpi R20,215
	ldi R30,0
	cpc R21,R30
	brne X15
	xjmp L35
X15:
	cpi R20,219
	ldi R30,0
	cpc R21,R30
	brne X16
	xjmp L31
X16:
	cpi R20,221
	ldi R30,0
	cpc R21,R30
	breq L27
	cpi R20,222
	ldi R30,0
	cpc R21,R30
	breq L23
	cpi R20,215
	ldi R30,0
	cpc R21,R30
	brge X17
	xjmp L19
X17:
L40:
	cpi R20,231
	ldi R30,0
	cpc R21,R30
	brne X18
	xjmp L34
X18:
	cpi R20,235
	ldi R30,0
	cpc R21,R30
	breq L30
	cpi R20,237
	ldi R30,0
	cpc R21,R30
	breq L26
	cpi R20,238
	ldi R30,0
	cpc R21,R30
	breq L22
	xjmp L19
X2:
	.dbline 48
; {
L22:
	.dbline 49
; case 0xee: k=0; break; //对键值赋值
	clr R2
	sts _k,R2
	.dbline 49
	xjmp L20
L23:
	.dbline 50
; case 0xde: k=1; break;
	ldi R24,1
	sts _k,R24
	.dbline 50
	xjmp L20
L24:
	.dbline 51
; case 0xbe: k=2; break;
	ldi R24,2
	sts _k,R24
	.dbline 51
	xjmp L20
L25:
	.dbline 52
; case 0x7e: k=3; break;
	ldi R24,3
	sts _k,R24
	.dbline 52
	xjmp L20
L26:
	.dbline 53
; case 0xed: k=4; break;
	ldi R24,4
	sts _k,R24
	.dbline 53
	xjmp L20
L27:
	.dbline 54
; case 0xdd: k=5; break;
	ldi R24,5
	sts _k,R24
	.dbline 54
	xjmp L20
L28:
	.dbline 55
; case 0xbd: k=6; break;
	ldi R24,6
	sts _k,R24
	.dbline 55
	xjmp L20
L29:
	.dbline 56
; case 0x7d: k=7; break;
	ldi R24,7
	sts _k,R24
	.dbline 56
	xjmp L20
L30:
	.dbline 57
; case 0xeb: k=8; break;
	ldi R24,8
	sts _k,R24
	.dbline 57
	xjmp L20
L31:
	.dbline 58
; case 0xdb: k=9; break;
	ldi R24,9
	sts _k,R24
	.dbline 58
	xjmp L20
L32:
	.dbline 59
; case 0xbb: k=10;break;
	ldi R24,10
	sts _k,R24
	.dbline 59
	xjmp L20
L33:
	.dbline 60
; case 0x7b: k=11;break;
	ldi R24,11
	sts _k,R24
	.dbline 60
	xjmp L20
L34:
	.dbline 61
; case 0xe7: k=12;break;
	ldi R24,12
	sts _k,R24
	.dbline 61
	xjmp L20
L35:
	.dbline 62
; case 0xd7: k=13;break;
	ldi R24,13
	sts _k,R24
	.dbline 62
	xjmp L20
L36:
	.dbline 63
; case 0xb7: k=14;break;
	ldi R24,14
	sts _k,R24
	.dbline 63
	xjmp L20
L37:
	.dbline 64
; case 0x77: k=15;break;
	ldi R24,15
	sts _k,R24
	.dbline 64
L19:
L20:
	.dbline 65
L17:
	.dbline 65
L15:
	.dbline 65
L13:
	.dbline 65
L11:
	.dbline -2
L10:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r Z 20 c
	.dbsym r Y 20 c
	.dbsym r X 22 c
	.dbend
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 68
; } } } }}} //请注意写程序时的格式规范，此处是为了节省纸张  
; //////////////////////////////初始化////////////////////////////////////
; void Init_IO(void)//初始化I/O
; {
	.dbline 70
; //设置B口为输出
; DDRB=0xFF;
	ldi R24,255
	out 0x17,R24
	.dbline 71
; PORTB=0xFF;
	out 0x18,R24
	.dbline 73
; //设置C口为输出
; DDRC=0xFF;
	out 0x14,R24
	.dbline 74
; PORTC=0xFF;
	out 0x15,R24
	.dbline 76
; //设置D口为输入
; DDRD=0x00;
	clr R2
	out 0x11,R2
	.dbline 77
; PORTD=0xff;
	out 0x12,R24
	.dbline -2
L41:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 85
; 
; }
; 
; /**********************************************************************
; 				           主函数						  	
; **********************************************************************/
; void main(void)
; {
	.dbline 86
; Init_IO();  //初始化I/O
	xcall _Init_IO
	xjmp L44
L43:
	.dbline 88
	.dbline 89
	xcall _Getch
	.dbline 90
	ldi R24,<_Table
	ldi R25,>_Table
	lds R30,_k
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 91
	ldi R24,15
	out 0x15,R24
	.dbline 93
L44:
	.dbline 87
	xjmp L43
X19:
	.dbline -2
L42:
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile D:\整理\个人总结的M8程序\020、4~1\icc\chengxu.c
_k::
	.blkb 1
	.dbsym e k _k c
